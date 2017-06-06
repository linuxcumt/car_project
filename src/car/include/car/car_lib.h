#ifndef CAR_LIB_H
#define CAR_LIB_H

#include <ros/ros.h>
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>

// gtsam stuff
#include "gtsam/3rdparty/Eigen/Eigen/Dense"

namespace car
{
  struct Pose2D
  {
    double x = 0.0;
    double y = 0.0;
    double psi = 0.0;
    double stamp = 0.0;
  };

  struct Odom
  {
    double v_x = 0.0;
    double v_y = 0.0;
    double v_psi = 0.0;
    double stamp = 0.0;
  };

  // container
  Pose2D realPos;
  Pose2D curPos;
  std::vector<Pose2D> lmMap;

  // variables
  bool initialized = false;
  double t_last = 0.0;

  // utility functions
  void loadMap();
  void normalizeAngles(double& psi);
  void incrementOdometry(const Odom &odom_com, Pose2D &curPos);

  // loop functions
  void drive(const Odom &odom_com, Pose2D &curPos, Pose2D &realPos);
  void sense(const Pose2D& realPos, std::vector<Pose2D>& landmarks) {}
  void localize(const Pose2D& realPos, const Pose2D& currentPos,
                const std::vector<Pose2D>& landmarks)
  {
  }

  // implementation

  void loadMap()
  {
    std::fstream input("/home/marc/catkin_ws/data/lm_map.csv", std::ios::in);
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

  void incrementOdometry(const Odom &odom_com, Pose2D &Pos)
  {
    // compute increments
    double d_t;
    if(initialized)
      d_t = odom_com.stamp - t_last;
    else
      d_t = 0.1;
    double angle = Pos.psi;
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
    // normalize angles
    normalizeAngles(Pos.psi);
  }

  void drive(const Odom &odom_com, Pose2D &curPos, Pose2D &realPos)
  {
    // TODO: add noise model before incrementing curPos
    incrementOdometry(odom_com, realPos);
    incrementOdometry(odom_com, curPos);
    std::cout << "curPos.x = " << curPos.x << ", curPos.y = " << curPos.x
              << ", curPos.psi = " << curPos.psi << "\n";
  }
}

#endif // CAR_LIB_H
