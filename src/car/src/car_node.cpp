#include "ros/ros.h"
#include "std_msgs/String.h"
#include "car/car_lib.h"
#include "car/OdomVelocities.h"

using namespace car;

void odomCallback(const car::OdomVelocities &odom_msg)
{
    ROS_INFO("entering odomCallback callback");
    srand((int)time(NULL));

    // save odom msg
    Odom com;
    com.stamp = odom_msg.header.stamp.toSec();
    com.v_x = odom_msg.v_x; com.v_y = odom_msg.v_y; com.v_psi = odom_msg.v_psi;
    com.noise_x = odom_msg.noise_x; com.noise_y= odom_msg.noise_y; com.noise_psi = odom_msg.noise_psi;

    // simulate vehicle driving
    drive(com,curPos,realPos,odomPos);
    // sense landmarks in environment, simulated from the real car position
    std::vector<Pose2D> landmarks;
    sense(realPos,lmMap,landmarks);
    // localize based on information found from landmarks
    localize(realPos,curPos,landmarks);
    // print
    if (printInfo) printPoses(realPos,curPos,odomPos,landmarks);
    // visualize
    visualize(realPos,curPos,landmarks);
    // initialized
    initialized = true;
    t_last = odom_msg.header.stamp.toSec();
    k_time++;
}

int main(int argc, char **argv)
{
    ROS_INFO("car_node running...");

    ros::init(argc, argv, "car_node");
    ros::NodeHandle nh;

    ros::Subscriber sub = nh.subscribe("odom_commands",1000, &odomCallback);
    marker_pub = nh.advertise<visualization_msgs::Marker>("car_markers", 10);
    rpath_pub = nh.advertise<nav_msgs::Path>("car_realpath", 10);
    cpath_pub = nh.advertise<nav_msgs::Path>("car_curpath", 10);
    opath_pub = nh.advertise<nav_msgs::Path>("car_odompath", 10);

    // order is important! first map, then markers, as the markers from the landmarks are created!
    loadMap();
    setupMarker();

    if (printInfo)
    {
        std::remove(filename.c_str());
        std::remove(filename_lm.c_str());
    }
    //std::cout << lmMap.at(0).x << " " << lmMap.at(11).y << "\n";
    ros::spin();
    return 0;
}
