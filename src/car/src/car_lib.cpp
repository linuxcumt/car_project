#include "car/car_lib.h"

using namespace std;

namespace car
{

  void printPoses(const Pose2D &realPos, const Pose2D &curPos, const Pose2D &odomPos, const std::vector<Pose2D> &landmarks )
  {
    std::cout <<  "\033[32m" << "Ground Truth Pose: x = " << realPos.x << ", y = " << realPos.y
              << ", psi = " << realPos.psi << "\n";
    std::cout << "Localized Pose: x = " << curPos.x << ", y = " << curPos.y
              << ", psi = " << curPos.psi << "\n";
    std::cout << "Odometry Pose: x = " << odomPos.x << ", y = " << odomPos.y
              << ", psi = " << odomPos.psi << "\n";

    myfile.open(filename, std::fstream::in | std::fstream::out | std::fstream::app);
    myfile << std::setprecision(precision) << realPos.x << "," << realPos.y << "," << realPos.psi
              << "," << curPos.x << "," << curPos.y << "," << curPos.psi
                 << "," << odomPos.x << "," << odomPos.y << "," << odomPos.psi;
    myfile << "\n";
    myfile.close();

    myfile.open(filename_lm, std::fstream::in | std::fstream::out | std::fstream::app);
    if (!initialized)
    {
      for (uint i = 0; i < lmMap.size(); i++)
      {
          myfile << std::setprecision(precision) << lmMap.at(i).x << ",";
      }
      myfile << "\n";
      for (uint i = 0; i < lmMap.size(); i++)
      {
          myfile << std::setprecision(precision) << lmMap.at(i).y << ",";
      }
      myfile << "\n";
    }
    for (uint i = 0; i < landmarks.size(); i++)
    {
        myfile << std::setprecision(precision) << landmarks.at(i).x << ",";
    }
    myfile << "\n";
    for (uint i = 0; i < landmarks.size(); i++)
    {
        myfile << std::setprecision(precision) << landmarks.at(i).y << ",";
    }
    myfile << "\n";
    myfile.close();
  }

  void loadMap()
  {
    std::fstream input(filename_map, std::ios::in);
    std::string csvLine;
    Pose2D lm;
    // read every line from the stream
    while (std::getline(input, csvLine))
    {
      std::istringstream csvStream(csvLine);
      std::string csvElement;
      // read every element from the line that is seperated by commas
      bool check = true;
      while (std::getline(csvStream, csvElement, ','))
      {
        if (check)
          lm.x = std::atof(csvElement.c_str());
        else
          lm.y = std::atof(csvElement.c_str());
        check = false;
      }
      lmMap.push_back(lm);
    }
  }

  void normalizeAngles(double& psi)
  {
    if (psi < -M_PI)
      psi += 2 * M_PI;
    else if (psi > M_PI)
      psi -= 2 * M_PI;
  }

  double getPsiDifference(const double &psi1, const double &psi2)
  {
      double a = std::abs(psi1-psi2);
      double b = 2* M_PI - std::abs(psi1-psi2);
      return std::min(a,b);
  }

  void incrementOdometry(Odom odom_com, Pose2D &Pos, const bool &withNoise, Pose2D &increment)
  {
    // compute increments
    double d_t;
    if(initialized && (odom_com.stamp - t_last) <= 1)
      d_t = odom_com.stamp - t_last;
    else
      d_t = 0.1;
    double angle = Pos.psi;

    // add noise if necessary
    if (withNoise == true)
    {
      std::random_device rd;
      std::mt19937 gen(rd());
      std::normal_distribution<double> dx(0,odom_com.noise_x);
      std::normal_distribution<double> dy(0,odom_com.noise_y);
      std::normal_distribution<double> dpsi(0,odom_com.noise_psi); // maybe generate psi uniformly between 0 and 2pi
      odom_com.v_x += dx(gen); odom_com.v_y += dy(gen); odom_com.v_psi += dpsi(gen);
      odometryNoise = noiseModel::Diagonal::Sigmas(Vector3(odom_com.noise_x*d_t,
                                                           odom_com.noise_y*d_t, odom_com.noise_psi*d_t));
    }

    // compute increments
    double d_x =
        (d_t * (odom_com.v_x * std::cos(angle) - odom_com.v_y * std::sin(angle)));
    double d_y =
        (d_t * (odom_com.v_x * std::sin(angle) + odom_com.v_y * std::cos(angle)));
    double d_psi = odom_com.v_psi * d_t;
    // accumulate odometry command and stamp
    Pos.x += d_x;
    Pos.y += d_y;
    Pos.psi += d_psi;
    Pos.stamp = odom_com.stamp;
    // save increments
    increment.x = d_x; increment.y = d_y; increment.psi = d_psi;
    // normalize angles
    normalizeAngles(Pos.psi);
  }

  void incrementOdometry(Odom odom_com, Pose2D &Pos, const bool &withNoise)
  {
    Pose2D increment;
    incrementOdometry(odom_com,Pos,withNoise,increment);
  }

  double sensorModel(const double &d)
  {
    return std::exp(-std::pow(d/det_accuracy_sensor_std_dev,2));
  }

  void drive(const Odom &odom_com, Pose2D &curPos, Pose2D &realPos, Pose2D &odomPos)
  {
    incrementOdometry(odom_com, realPos, false, inc);
    incrementOdometry(odom_com, odomPos, true);
    incrementOdometry(odom_com, curPos, true);
  }

  void sense(const Pose2D& pos, const std::vector<Pose2D>& lmMap, std::vector<Pose2D>& landmarks)
  {
    double d;
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<double> drawer(0.0,1.0);
    // TODO: provide accuracy model which decays the further away the landmarks are
    // landmarks that are within the sensor range around the provided pos are written into the vector
    for (uint i = 0; i<lmMap.size(); i++)
    {
      d = std::sqrt(std::pow(lmMap.at(i).x-pos.x,2)+std::pow(lmMap.at(i).y-pos.y,2));
      if (d<d_landmark_thresh)
      {
        double prob = sensorModel(d); // probability to see current landmark
        double draw = drawer(gen);
        //std::cout << "d = " << d << ", prob = " << prob << ", draw = " << draw << "\n";
        if (draw < prob)
          landmarks.push_back(lmMap.at(i));
      }
    }

//    // test function
//    for (uint i = 0; i<landmarks.size(); i++)
//    {
//      std::cout << "found lm at x = " << landmarks.at(i).x << ", and y = " << landmarks.at(i).y << "\n";
//    }
  }

  void localize(const Pose2D& realPos, Pose2D& curPos,
                const std::vector<Pose2D>& landmarks)
  {
    int counterFactors = 0;
    // add first pose
    if (initialized == false)
    {
      Pose2 priorMean(0.0, 0.0, 0.0);
      graph.emplace_shared<PriorFactor<Pose2> >(k_time, priorMean, priorNoise);
    }
    // Create odometry (Between) factors between consecutive poses
    graph.emplace_shared<BetweenFactor<Pose2> >(k_time, k_time+1, Pose2(inc.x, inc.y, inc.psi), odometryNoise);
    // create GPS measurements, over 3 landmarks allow for x,y,psi estimate through map matching (assumed)
    if (landmarks.size() > 2)
    {
      Pose2D measPos;
      std::random_device rd;
      std::mt19937 gen(rd());
      std::normal_distribution<double> noise_xy(0.0,measurementnoise_xy);
      std::normal_distribution<double> noise_psi(0.0,measurementnoise_psi);
      measPos.x = realPos.x + noise_xy(gen);
      measPos.y = realPos.y + noise_xy(gen);
      measPos.psi = realPos.psi + noise_psi(gen);
      graph.emplace_shared<UnaryFactor3D>(k_time+1, measPos.x, measPos.y, measPos.psi, unaryNoise3D);
      counterFactors++;
//      // for every lm calc the pos (optimally realPos) and add noise to simulate the noisy "gps-like" meas
//      for (uint i = 0; i<landmarks.size(); i++)
//      {
//        // Add "GPS-like" measurements
//        // We will use our custom UnaryFactor for this.
//        //graph.emplace_shared<UnaryFactor>(k_time+1, measPos.x, measPos.y, unaryNoise);
//        graph.emplace_shared<UnaryFactor3D>(k_time+1, measPos.x, measPos.y, measPos.psi, unaryNoise3D);
//        counterFactors++;
//      }
    }
    else
    {
//      std::cout << "UNARY - realPos.x = " << realPos.x << ", realPos.y = " << realPos.y
//                << ", realPos.psi = " << realPos.psi << "\n";
//      //graph.emplace_shared<UnaryFactor>(k_time+1, realPos.x, realPos.y, infiniteNoise);
//      graph.emplace_shared<UnaryFactor3D>(k_time+1, realPos.x, realPos.y, realPos.psi, infiniteNoise3D);
//      counterFactors++;
    }
    // 3. Create the data structure to hold the initialEstimate estimate to the solution
    // For illustrative purposes, these have been deliberately set to incorrect values
    if (initialized == false)
    {
      initialEstimate.insert(k_time, Pose2(0, 0, 0));
    }
    initialEstimate.insert(k_time+1, Pose2(realPos.x, realPos.y, realPos.psi));


    // remove first poses if graph too big
    if(initialEstimate.size() > maxGraphSize)
    {
      // if
      if(k_time-maxGraphSize==1)
      {
        graph.erase(graph.begin(),graph.begin()+2);
      }
      else
      {
        graph.erase(graph.begin(),graph.begin()+numFactors.at(0)+1);
        numFactors.erase(numFactors.begin());
      }
      initialEstimate.erase(initialEstimate.begin()->key);
    }

    std::cout << "k_time = " << k_time << "\n";
    // print
    //graph.print("\nFactor Graph:\n");
    //initialEstimate.print("\nInitial Estimate:\n");

    // 4. Optimize using Levenberg-Marquardt optimization. The optimizer
    // accepts an optional set of configuration parameters, controlling
    // things like convergence criteria, the type of linear system solver
    // to use, and the amount of information displayed during optimization.
    // Here we will use the default set of parameters.  See the
    // documentation for the full set of parameters.
    LevenbergMarquardtOptimizer optimizer(graph, initialEstimate);
    Values result = optimizer.optimize();
    //result.print("Final Result:\n");

    Pose2 res = result.at<Pose2>(k_time+1);
    if(counterFactors > 0) // needed as optimizer somehow cant deal with theta values from Between Factor
    {
      curPos.x = res.x(); curPos.y = res.y(); curPos.psi = res.theta();
    }
    numFactors.push_back(counterFactors);

//    // 5. Calculate and print marginal covariances for all variables
//    Marginals marginals(graph, result);
//    std::cout << "x1 covariance:\n" << marginals.marginalCovariance(1) << std::endl;
//    std::cout << "x2 covariance:\n" << marginals.marginalCovariance(2) << std::endl;
//    std::cout << "x3 covariance:\n" << marginals.marginalCovariance(3) << std::endl;
  }

  void setupMarker()
  {
    points.header.frame_id = line_strip.header.frame_id = car.header.frame_id
        = loc_lms.header.frame_id = glob_lms.header.frame_id = realPath.header.frame_id
        = curPath.header.frame_id = odomPath.header.frame_id = "/my_frame";
    points.ns = line_strip.ns = "poses";
    car.ns = "car";
    loc_lms.ns = "local_landmarks";
    glob_lms.ns = "global_landmarks";

    //realPath.Type = "car_paths";
    points.action = line_strip.action = car.action = loc_lms.action
        = glob_lms.action = visualization_msgs::Marker::ADD;
    points.pose.orientation.w = line_strip.pose.orientation.w = 1.0;

    points.id = 0;
    line_strip.id = 1;
    car.id = 2;
    loc_lms.id = 3;
    glob_lms.id = 4;

    points.type = visualization_msgs::Marker::POINTS;
    line_strip.type = visualization_msgs::Marker::LINE_STRIP;
    car.type = visualization_msgs::Marker::CUBE;
    loc_lms.type = visualization_msgs::Marker::SPHERE_LIST;
    glob_lms.type = visualization_msgs::Marker::SPHERE_LIST;

    // POINTS markers use x and y scale for width/height respectively
    points.scale.x = 0.2;
    points.scale.y = 0.2;

    // LINE_STRIP/LINE_LIST markers use only the x component of scale, for the line width
    line_strip.scale.x = 0.1;

    // Points are blue
    points.color.b = 1.0;
    points.color.a = 1.0;

    // Line strip is blue
    line_strip.color.b = 1.0;
    line_strip.color.a = 1.0;

    // car color is red
    car.color.r = 1.0;
    car.color.a = 1.0;

    // Set the scale of the marker -- 1x1x1 here means 1m on a side
    car.scale.x = 0.8;
    car.scale.y = 0.4;
    car.scale.z = 0.4;

    //local landmarks
    loc_lms.scale.x = 1;
    loc_lms.scale.y = 1;
    loc_lms.scale.z = 0;
    loc_lms.color.a = 1.0; // Don't forget to set the alpha!
    loc_lms.color.r = 1.0;

    //global landmarks
    glob_lms.scale.x = 0.6;
    glob_lms.scale.y = 0.6;
    glob_lms.scale.z = 0;
    glob_lms.color.a = 1.0; // Don't forget to set the alpha!
    glob_lms.color.g = 1.0;
    geometry_msgs::Point p;
    p.z = 0;
    for (uint i = 0; i<lmMap.size(); i++)
    {
      p.x = lmMap.at(i).x;
      p.y = lmMap.at(i).y;
      glob_lms.points.push_back(p);
    }
  }

  void visualize(const Pose2D &realPos, const Pose2D &curPos, const std::vector<Pose2D> &landmarks)
  {
    // TIME NOT SAME AS POSE
    points.header.stamp = line_strip.header.stamp = car.header.stamp
        = loc_lms.header.stamp = glob_lms.header.stamp = ros::Time::now();
    // Create the vertices for the points and lines
    geometry_msgs::Point p;
    p.x = realPos.x; p.y = realPos.y; p.z = 0.0;
    points.points.push_back(p);
    line_strip.points.push_back(p);
    geometry_msgs::PoseStamped r_pos, c_pos, o_pos;
    r_pos.pose.position.x = realPos.x; r_pos.pose.position.y = realPos.y; r_pos.pose.position.z = 0;
    r_pos.pose.orientation.w = realPos.psi;
    c_pos.pose.position.x = curPos.x; c_pos.pose.position.y = curPos.y; c_pos.pose.position.z = 0;
    c_pos.pose.orientation.w = curPos.psi;
    o_pos.pose.position.x = odomPos.x; o_pos.pose.position.y = odomPos.y; o_pos.pose.position.z = 0;
    o_pos.pose.orientation.w = odomPos.psi;
    realPath.poses.push_back(r_pos);
    curPath.poses.push_back(c_pos);
    odomPath.poses.push_back(o_pos);
    if (points.points.size() > 80)
    {
      points.points.erase(points.points.begin(),points.points.begin()+1);
      line_strip.points.erase(line_strip.points.begin(),line_strip.points.begin()+1);
      realPath.poses.erase(realPath.poses.begin(),realPath.poses.begin()+1);
      curPath.poses.erase(curPath.poses.begin(),curPath.poses.begin()+1);
      odomPath.poses.erase(odomPath.poses.begin(),odomPath.poses.begin()+1);
    }
    // Set the pose of the marker.  This is a full 6DOF pose relative to the frame/time specified in the header
    car.pose.position.x = realPos.x;
    car.pose.position.y = realPos.y;
    car.pose.position.z = 0;
    car.pose.orientation.x = car.pose.orientation.y = 0.0;
    car.pose.orientation.z = realPos.psi;
    car.pose.orientation.w = 1.0; // 1.0 default

    // load local landmarks
    geometry_msgs::Point pl;
    pl.z = 0;
    loc_lms.points.clear();
    for (uint i = 0; i<landmarks.size(); i++)
    {
      pl.x = landmarks.at(i).x;
      pl.y = landmarks.at(i).y;
      loc_lms.points.push_back(pl);
    }
    // publish
//    marker_pub.publish(points);
//    marker_pub.publish(line_strip);
    marker_pub.publish(car);
    marker_pub.publish(glob_lms);
    marker_pub.publish(loc_lms);
    rpath_pub.publish(realPath);
    cpath_pub.publish(curPath);
    opath_pub.publish(odomPath);
  }
}
