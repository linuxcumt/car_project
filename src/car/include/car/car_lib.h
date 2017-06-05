#ifndef CAR_LIB_H
#define CAR_LIB_H

#include <ros/ros.h>
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>

//gtsam stuff
#include "gtsam/3rdparty/Eigen/Eigen/Dense"

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


  // implementation

  void loadMap()
  {
    std::fstream input("/home/marc/catkin_ws/data/lm_map.csv", std::ios::in);
    std::string csvLine;
    Pose2D lm;
    // read every line from the stream
    while(std::getline(input, csvLine) )
    {
      std::istringstream csvStream(csvLine);
      std::string csvElement;
      // read every element from the line that is seperated by commas
      bool check = true;
      while(std::getline(csvStream, csvElement, ','))
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
}

#endif // CAR_LIB_H
