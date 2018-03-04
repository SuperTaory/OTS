/*
Navicat MySQL Data Transfer

Source Server         : cc
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-07-30 09:58:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `userpasswd` varchar(45) NOT NULL,
  `userage` int(11) DEFAULT NULL,
  `usersex` varchar(10) DEFAULT NULL,
  `role` varchar(45) DEFAULT 'normal',
  `level` int(11) DEFAULT '0',
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('37', 'manager', '123', '22', 'male', 'manager', '0', '123456@qq.com');
INSERT INTO `user` VALUES ('38', 'sd', '123', '252', 'female', 'issuer', '0', '1242356@qq.com');
INSERT INTO `user` VALUES ('39', 'new', '123', '25', 'female', 'normal', '0', '123456@qq.com');
INSERT INTO `user` VALUES ('40', 'sdf', '123', '33', 'female', 'issuer', '0', '145@qq.com');
INSERT INTO `user` VALUES ('41', '345', '123', '21', 'male', 'vip', '2', '123@qq.com');
INSERT INTO `user` VALUES ('44', 'aa', '123', '23', 'female', 'normal', '0', '1234@qq.com');
INSERT INTO `user` VALUES ('45', 'as', '123', '32', 'male', 'normal', '0', '123@qq.com');
