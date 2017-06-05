#include "ros/ros.h"
#include "std_msgs/String.h"
#include "car/car_lib.h"
#include "gtsam/3rdparty/Eigen/Eigen/Dense"
#include "car/OdomVelocities.h"

using namespace car;

void odomCallback(const car::OdomVelocities &odom_msg)
{
    ROS_INFO("entering odomCallback callback");

    // save odom msg
    Odom com;
    com.stamp = odom_msg.header.stamp.toSec();
    com.v_x = odom_msg.v_x;
    com.v_y = odom_msg.v_y;
    com.v_psi = odom_msg.v_psi;

    // simulate vehicle driving
    drive(com);
    // sense landmarks in environment
    std::vector<Pose2D> landmarks;
    sense(realPos,landmarks);
    // localize based on information found from landmarks
    localize(realPos,curPos,landmarks);

    // visualize
}

int main(int argc, char **argv)
{
    ROS_INFO("car_node running...");

    ros::init(argc, argv, "car_node");
    ros::NodeHandle nh;

    ros::Subscriber sub = nh.subscribe("odom_commands",1000, &odomCallback);

    ros::spin();
    return 0;
}
