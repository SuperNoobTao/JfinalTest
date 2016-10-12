/*
Navicat MySQL Data Transfer

Source Server         : apptest
Source Server Version : 100113
Source Host           : localhost:3306
Source Database       : jfinal

Target Server Type    : MYSQL
Target Server Version : 100113
File Encoding         : 65001

Date: 2016-10-12 17:18:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_cookie
-- ----------------------------
DROP TABLE IF EXISTS `tb_cookie`;
CREATE TABLE `tb_cookie` (
  `cookie_id` varchar(255) NOT NULL,
  `cookie_userid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cookie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tb_cookie
-- ----------------------------

-- ----------------------------
-- Table structure for tb_project
-- ----------------------------
DROP TABLE IF EXISTS `tb_project`;
CREATE TABLE `tb_project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tb_project
-- ----------------------------
INSERT INTO `tb_project` VALUES ('1', '1');
INSERT INTO `tb_project` VALUES ('2', '2');
INSERT INTO `tb_project` VALUES ('3', '3');
INSERT INTO `tb_project` VALUES ('4', '4');
INSERT INTO `tb_project` VALUES ('5', '5');
INSERT INTO `tb_project` VALUES ('6', '6');
INSERT INTO `tb_project` VALUES ('7', '7');
INSERT INTO `tb_project` VALUES ('8', '8');
INSERT INTO `tb_project` VALUES ('9', '9');
INSERT INTO `tb_project` VALUES ('10', '10');
INSERT INTO `tb_project` VALUES ('11', '11');
INSERT INTO `tb_project` VALUES ('12', '12');
INSERT INTO `tb_project` VALUES ('13', '13');

-- ----------------------------
-- Table structure for tb_staff
-- ----------------------------
DROP TABLE IF EXISTS `tb_staff`;
CREATE TABLE `tb_staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_account` varchar(255) DEFAULT NULL,
  `staff_name` varchar(255) DEFAULT NULL,
  `staff_pwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tb_staff
-- ----------------------------
INSERT INTO `tb_staff` VALUES ('1', '1', '1', '1');
INSERT INTO `tb_staff` VALUES ('2', '2', '2', '2');
INSERT INTO `tb_staff` VALUES ('3', '3', '3', '3');
INSERT INTO `tb_staff` VALUES ('4', '4', '4', '4');
INSERT INTO `tb_staff` VALUES ('5', '5', '5', '5');
INSERT INTO `tb_staff` VALUES ('6', '6', '6', '6');
INSERT INTO `tb_staff` VALUES ('7', '7', '7', '7');
INSERT INTO `tb_staff` VALUES ('8', '8', '8', '8');
INSERT INTO `tb_staff` VALUES ('9', '9', '9', '9');
INSERT INTO `tb_staff` VALUES ('10', '10', '10', '10');
INSERT INTO `tb_staff` VALUES ('11', '11', '11', '11');
INSERT INTO `tb_staff` VALUES ('12', '12', '12', '12');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_account` varchar(255) DEFAULT NULL,
  `user_pwd` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', '1', '1', '1');

-- ----------------------------
-- Table structure for tb_work
-- ----------------------------
DROP TABLE IF EXISTS `tb_work`;
CREATE TABLE `tb_work` (
  `work_id` int(11) NOT NULL AUTO_INCREMENT,
  `work_date` date DEFAULT NULL,
  `work_time` int(11) DEFAULT NULL,
  `work_projectid` int(11) DEFAULT NULL,
  `work_staffid` int(11) DEFAULT NULL,
  PRIMARY KEY (`work_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tb_work
-- ----------------------------
INSERT INTO `tb_work` VALUES ('1', '2016-10-12', '1', '1', '1');
INSERT INTO `tb_work` VALUES ('2', '2016-10-13', '2', '2', '2');
INSERT INTO `tb_work` VALUES ('3', '2016-10-14', '1', '1', '1');
