/*
Navicat MySQL Data Transfer

Source Server         : cc
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-07-30 10:03:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for examption
-- ----------------------------
DROP TABLE IF EXISTS `examption`;
CREATE TABLE `examption` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `ekind` varchar(45) DEFAULT NULL,
  `elevel` int(11) DEFAULT NULL,
  `qnumbers` int(11) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of examption
-- ----------------------------
INSERT INTO `examption` VALUES ('50', 'fvwev', 'sd', '性格', '3', '2');
INSERT INTO `examption` VALUES ('52', '不太热', 'sd', '智商', '1', '1');
INSERT INTO `examption` VALUES ('53', 'VS送到', 'sd', '智商', '1', '2');
INSERT INTO `examption` VALUES ('54', '那天', 'sd', '性格', '3', '1');
INSERT INTO `examption` VALUES ('56', '莫', 'sd', '性格', '1', '2');
INSERT INTO `examption` VALUES ('58', 'j哦i地方', 'sd', '性格', '2', '2');
INSERT INTO `examption` VALUES ('59', 'gfn', 'sd', '性格', '2', '2');
INSERT INTO `examption` VALUES ('62', '副书记', 'sdf', '智商', '1', '4');
INSERT INTO `examption` VALUES ('63', '搜索', 'sdf', '性格', '1', '2');
INSERT INTO `examption` VALUES ('64', '坎坎坷坷', 'sdf', '性格', '3', '3');
INSERT INTO `examption` VALUES ('65', '智力测试', 'sdf', '智商', '1', '10');
INSERT INTO `examption` VALUES ('66', 'kkk', 'sd', '性格', '3', '2');
