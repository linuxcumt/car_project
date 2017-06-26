#include "ros/ros.h"
#include "std_msgs/String.h"
#include "controller/controller_lib.h"
#include "controller/OdomVelocities.h"
#include <sstream>
#include <math.h>

/**
 * This tutorial demonstrates simple sending of messages over the ROS system.
 */
int main(int argc, char **argv)
{

  ros::init(argc, argv, "controller_node");
  ros::NodeHandle n;

  ros::Publisher odom_pub = n.advertise<controller::OdomVelocities>("odom_commands", 1000);

  ros::Rate loop_rate(10);

  int count = 0;

  controller::OdomVelocities coms;
  coms.v_x = 10;
  coms.v_y = 0;
  coms.noise_x = coms.noise_y = 0.8;
  coms.noise_psi = 0.1;


  while (ros::ok())
  {
    coms.header.stamp = ros::Time::now();
    if(count<4) {
      coms.v_psi = 0;
    }
    else {
      coms.v_psi = M_PI/5;
    }

    std::cout << std::setprecision(16) << "Published odom command at count = " << count
              << ", t = " << coms.header.stamp.toSec() <<  "\n";

    odom_pub.publish(coms);

    ros::spinOnce();

    loop_rate.sleep();
    ++count;
  }


  return 0;
}
