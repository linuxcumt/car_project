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
  /**
   * The ros::init() function needs to see argc and argv so that it can perform
   * any ROS arguments and name remapping that were provided at the command line.
   * For programmatic remappings you can use a different version of init() which takes
   * remappings directly, but for most command-line programs, passing argc and argv is
   * the easiest way to do it.  The third argument to init() is the name of the node.
   *
   * You must call one of the versions of ros::init() before using any other
   * part of the ROS system.
   */
  ros::init(argc, argv, "controller_node");

  /**
   * NodeHandle is the main access point to communications with the ROS system.
   * The first NodeHandle constructed will fully initialize this node, and the last
   * NodeHandle destructed will close down the node.
   */
  ros::NodeHandle n;

  /**
   * The advertise() function is how you tell ROS that you want to
   * publish on a given topic name. This invokes a call to the ROS
   * master node, which keeps a registry of who is publishing and who
   * is subscribing. After this advertise() call is made, the master
   * node will notify anyone who is trying to subscribe to this topic name,
   * and they will in turn negotiate a peer-to-peer connection with this
   * node.  advertise() returns a Publisher object which allows you to
   * publish messages on that topic through a call to publish().  Once
   * all copies of the returned Publisher object are destroyed, the topic
   * will be automatically unadvertised.
   *
   * The second parameter to advertise() is the size of the message queue
   * used for publishing messages.  If messages are published more quickly
   * than we can send them, the number here specifies how many messages to
   * buffer up before throwing some away.
   */
  ros::Publisher odom_pub = n.advertise<controller::OdomVelocities>("odom_commands", 1000);

  ros::Rate loop_rate(10);

  /**
   * A count of how many messages we have sent. This is used to create
   * a unique string for each message.
   */
  int count = 0;

  controller::OdomVelocities coms;
  coms.v_x = 10;
  coms.v_y = 0;
  coms.noise_x = coms.noise_y = 0.8;
  coms.noise_psi = M_PI/50;


  while (ros::ok())
  {
    coms.header.stamp = ros::Time::now();
    if(count<4) {
      coms.v_psi = 0;
    }
    else {
      coms.v_psi = M_PI/5;
    }
    /**
     * This is a message object. You stuff it with data, and then publish it.
     */

    std::cout << std::setprecision(16) << "Published odom command at count = " << count
              << ", t = " << coms.header.stamp.toSec() <<  "\n";

    /**
     * The publish() function is how you send messages. The parameter
     * is the message object. The type of this object must agree with the type
     * given as a template parameter to the advertise<>() call, as was done
     * in the constructor above.
     */
    odom_pub.publish(coms);

    ros::spinOnce();

    loop_rate.sleep();
    ++count;
  }


  return 0;
}




//#include "ros/ros.h"
//#include "std_msgs/String.h"
//#include <sstream>

///**
// * This tutorial demonstrates simple sending of messages over the ROS system.
// */
//int main(int argc, char **argv)
//{
//  /**
//   * The ros::init() function needs to see argc and argv so that it can perform
//   * any ROS arguments and name remapping that were provided at the command line.
//   * For programmatic remappings you can use a different version of init() which takes
//   * remappings directly, but for most command-line programs, passing argc and argv is
//   * the easiest way to do it.  The third argument to init() is the name of the node.
//   *
//   * You must call one of the versions of ros::init() before using any other
//   * part of the ROS system.
//   */
//  ros::init(argc, argv, "talker");

//  /**
//   * NodeHandle is the main access point to communications with the ROS system.
//   * The first NodeHandle constructed will fully initialize this node, and the last
//   * NodeHandle destructed will close down the node.
//   */
//  ros::NodeHandle n;

//  /**
//   * The advertise() function is how you tell ROS that you want to
//   * publish on a given topic name. This invokes a call to the ROS
//   * master node, which keeps a registry of who is publishing and who
//   * is subscribing. After this advertise() call is made, the master
//   * node will notify anyone who is trying to subscribe to this topic name,
//   * and they will in turn negotiate a peer-to-peer connection with this
//   * node.  advertise() returns a Publisher object which allows you to
//   * publish messages on that topic through a call to publish().  Once
//   * all copies of the returned Publisher object are destroyed, the topic
//   * will be automatically unadvertised.
//   *
//   * The second parameter to advertise() is the size of the message queue
//   * used for publishing messages.  If messages are published more quickly
//   * than we can send them, the number here specifies how many messages to
//   * buffer up before throwing some away.
//   */
//  ros::Publisher chatter_pub = n.advertise<std_msgs::String>("chatter", 1000);

//  ros::Rate loop_rate(10);

//  /**
//   * A count of how many messages we have sent. This is used to create
//   * a unique string for each message.
//   */
//  int count = 0;
//  while (ros::ok())
//  {
//    /**
//     * This is a message object. You stuff it with data, and then publish it.
//     */
//    std_msgs::String msg;

//    std::stringstream ss;
//    ss << "hello world " << count;
//    msg.data = ss.str();

//    ROS_INFO("%s", msg.data.c_str());

//    /**
//     * The publish() function is how you send messages. The parameter
//     * is the message object. The type of this object must agree with the type
//     * given as a template parameter to the advertise<>() call, as was done
//     * in the constructor above.
//     */
//    chatter_pub.publish(msg);

//    ros::spinOnce();

//    loop_rate.sleep();
//    ++count;
//  }


//  return 0;
//}
