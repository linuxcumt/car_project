#ifndef CAR_LIB_H
#define CAR_LIB_H

#include <ros/ros.h>
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>

namespace car {
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

  // other functions
  void loadMap();

  // loop functions
  void drive(const Odom &odom_com){}
  void sense(const Pose2D &realPos, std::vector<Pose2D> &landmarks){}
  void localize(const Pose2D &realPos, const Pose2D &currentPos, const std::vector<Pose2D> &landmarks){}
}

#endif // CAR_LIB_H
