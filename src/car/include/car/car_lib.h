#ifndef CAR_LIB_H
#define CAR_LIB_H


#include <ros/ros.h>
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <visualization_msgs/Marker.h>
#include <nav_msgs/Path.h>
#include <limits>

// GTSAM headers
// We will use Pose2 variables (x, y, theta) to represent the robot positions
#include <gtsam/geometry/Pose2.h>
// We will use simple integer Keys to refer to the robot poses.
#include <gtsam/inference/Key.h>
// As in OdometryExample.cpp, we use a BetweenFactor to model odometry measurements.
#include <gtsam/slam/BetweenFactor.h>
#include <gtsam/slam/PriorFactor.h>
// We add all facors to a Nonlinear Factor Graph, as our factors are nonlinear.
#include <gtsam/nonlinear/NonlinearFactorGraph.h>
// The nonlinear solvers within GTSAM are iterative solvers, meaning they linearize the
// nonlinear functions around an initial linearization point, then solve the linear system
// to update the linearization point. This happens repeatedly until the solver converges
// to a consistent set of variable values. This requires us to specify an initial guess
// for each variable, held in a Values container.
#include <gtsam/nonlinear/Values.h>
// Finally, once all of the factors have been added to our factor graph, we will want to
// solve/optimize to graph to find the best (Maximum A Posteriori) set of variable values.
// GTSAM includes several nonlinear optimizers to perform this step. Here we will use the
// standard Levenberg-Marquardt solver
#include <gtsam/nonlinear/LevenbergMarquardtOptimizer.h>
// Once the optimized values have been calculated, we can also calculate the marginal covariance
// of desired variables
#include <gtsam/nonlinear/Marginals.h>
// Before we begin the example, we must create a custom unary factor to implement a
// "GPS-like" functionality. Because standard GPS measurements provide information
// only on the position, and not on the orientation, we cannot use a simple prior to
// properly model this measurement.
//
// The factor will be a unary factor, affect only a single system variable. It will
// also use a standard Gaussian noise model. Hence, we will derive our new factor from
// the NoiseModelFactor1.
#include <gtsam/nonlinear/NonlinearFactor.h>


using namespace gtsam;

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
    double noise_x = 0.0;
    double noise_y = 0.0;
    double noise_psi = 0.0;
  };

  // container
  Pose2D realPos;
  Pose2D curPos;
  Pose2D inc;
  Pose2D odomPos;
  std::vector<Pose2D> lmMap;
  uint k_time = 1;

  // gtsam
  NonlinearFactorGraph graph;
  uint maxGraphSize = 20;
  std::vector<int> numFactors;
  Values initialEstimate;
  double d_landmark_thresh = 30;
  double det_accuracy_sensor_std_dev = 25;
  double measurementnoise_xy = 0.01;
  double measurementnoise_psi = 0.001;
  noiseModel::Diagonal::shared_ptr priorNoise = noiseModel::Diagonal::Sigmas(Vector3(0, 0, 0));
  noiseModel::Diagonal::shared_ptr odometryNoise = noiseModel::Diagonal::Sigmas(Vector3(0.2, 0.2, 0.01));
  // -> only default, real value will be read from the controller
//  noiseModel::Diagonal::shared_ptr unaryNoise = noiseModel::Diagonal::Sigmas(Vector2(0.03, 0.03));
//  noiseModel::Diagonal::shared_ptr infiniteNoise = noiseModel::Diagonal::Sigmas(
//        Vector2(std::numeric_limits<double>::max(), std::numeric_limits<double>::max()));
  noiseModel::Diagonal::shared_ptr unaryNoise3D = noiseModel::Diagonal::Sigmas(Vector3(0.03, 0.03, 0.003));
  noiseModel::Diagonal::shared_ptr infiniteNoise3D = noiseModel::Diagonal::Sigmas(
        Vector3(std::numeric_limits<double>::max(), std::numeric_limits<double>::max(), std::numeric_limits<double>::max())); //

  // visualization
  ros::Publisher marker_pub;
  ros::Publisher rpath_pub, cpath_pub, opath_pub;
  visualization_msgs::Marker points, line_strip, car, loc_lms, glob_lms;
  nav_msgs::Path realPath, curPath, odomPath;
  void setupMarker();

  // flags
  bool initialized = false;
  double t_last = 0.0;
  // variables

  // utility functions
  void loadMap();
  void normalizeAngles(double& psi);
  double getPsiDifference(const double &psi1, const double &psi2);
  void incrementOdometry(Odom odom_com, Pose2D &curPos, const bool &withNoise);
  void incrementOdometry(Odom odom_com, Pose2D &Pos, const bool &withNoise);
  double sensorModel(const double &d);

  // loop functions
  void drive(const Odom &odom_com, Pose2D &curPos, Pose2D &realPos, Pose2D &odomPos);
  void sense(const Pose2D& pos, const std::vector<Pose2D> &lmMap, std::vector<Pose2D>& landmarks);
  void localize(const Pose2D &realPos, Pose2D &curPos,
                const std::vector<Pose2D>& landmarks);
  void visualize(const Pose2D &realPos, const Pose2D &curPos, const std::vector<Pose2D> &landmarks);

  // gtsam implementation classes
  class UnaryFactor: public NoiseModelFactor1<Pose2> {

    // The factor will hold a measurement consisting of an (X,Y) location
    // We could this with a Point2 but here we just use two doubles
    double mx_, my_;

  public:
    /// shorthand for a smart pointer to a factor
    typedef boost::shared_ptr<UnaryFactor> shared_ptr;

    // The constructor requires the variable key, the (X, Y) measurement value, and the noise model
    UnaryFactor(Key j, double x, double y, const SharedNoiseModel& model):
      NoiseModelFactor1<Pose2>(model, j), mx_(x), my_(y) {}

    virtual ~UnaryFactor() {}

    // Using the NoiseModelFactor1 base class there are two functions that must be overridden.
    // The first is the 'evaluateError' function. This function implements the desired measurement
    // function, returning a vector of errors when evaluated at the provided variable value. It
    // must also calculate the Jacobians for this measurement function, if requested.
    Vector evaluateError(const Pose2& q, boost::optional<Matrix&> H = boost::none) const
    {
      // The measurement function for a GPS-like measurement is simple:
      // error_x = pose.x - measurement.x
      // error_y = pose.y - measurement.y
      // Consequently, the Jacobians are:
      // [ derror_x/dx  derror_x/dy  derror_x/dtheta ] = [1 0 0]
      // [ derror_y/dx  derror_y/dy  derror_y/dtheta ] = [0 1 0]
      if (H) (*H) = (Matrix(2,3) << 1.0,0.0,0.0, 0.0,1.0,0.0).finished();
      return (Vector(2) << q.x() - mx_, q.y() - my_).finished();
    }

    // The second is a 'clone' function that allows the factor to be copied. Under most
    // circumstances, the following code that employs the default copy constructor should
    // work fine.
    virtual gtsam::NonlinearFactor::shared_ptr clone() const {
      return boost::static_pointer_cast<gtsam::NonlinearFactor>(
          gtsam::NonlinearFactor::shared_ptr(new UnaryFactor(*this))); }

    // Additionally, we encourage you the use of unit testing your custom factors,
    // (as all GTSAM factors are), in which you would need an equals and print, to satisfy the
    // GTSAM_CONCEPT_TESTABLE_INST(T) defined in Testable.h, but these are not needed below.

  }; // UnaryFactor

  class UnaryFactor3D: public NoiseModelFactor1<Pose2> {

    double mx_, my_ , mtheta_;

  public:
    /// shorthand for a smart pointer to a factor
    typedef boost::shared_ptr<UnaryFactor3D> shared_ptr;

    UnaryFactor3D(Key j, double x, double y, double theta, const SharedNoiseModel& model):
      NoiseModelFactor1<Pose2>(model, j), mx_(x), my_(y), mtheta_(theta) {}

    virtual ~UnaryFactor3D() {}

    Vector evaluateError(const Pose2& q, boost::optional<Matrix&> H = boost::none) const
    {
      if (H) (*H) = (Matrix(3,3) << 1.0,0.0,0.0, 0.0,1.0,0.0, 0.0,0.0,1.0).finished();
      double helper = getPsiDifference(q.theta(), mtheta_);
     // std::cout << "helper = " << helper << "\n";
//      std::cout << "q.x() = " << q.x() << ", q.y() = " << q.y() << ", q.theta() = " << q.theta() << "\n";
//      std::cout << "mx_ = " << mx_ << ", my_ = " << my_ << ", mtheta_ = " << mtheta_ << "\n";
      return (Vector(3) << q.x() - mx_, q.y() - my_, helper).finished();
    }

    virtual gtsam::NonlinearFactor::shared_ptr clone() const {
      return boost::static_pointer_cast<gtsam::NonlinearFactor>(
          gtsam::NonlinearFactor::shared_ptr(new UnaryFactor3D(*this))); }

  }; // UnaryFactor3D
}

#endif // CAR_LIB_H
