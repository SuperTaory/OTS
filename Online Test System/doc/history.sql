/*
Navicat MySQL Data Transfer

Source Server         : cc
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-07-30 10:03:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `eid` int(11) NOT NULL,
  `hscore` int(11) DEFAULT NULL,
  `ename` varchar(100) DEFAULT NULL,
  `analysis` varchar(100) DEFAULT NULL,
  `testtime` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('42', 'new', '45', '10', '东方闪电', 'sdfg如果被', '2017-07-29 11:26:32.000000');
INSERT INTO `history` VALUES ('43', 'new', '45', '10', '东方闪电', 'sdfg如果被', '2017-07-29 11:27:53.000000');
INSERT INTO `history` VALUES ('47', 'new', '49', '4', 'vwe十大发的', '不然根本怪不得', '2017-07-29 14:04:12.000000');
INSERT INTO `history` VALUES ('49', 'sdf', '52', '0', '不太热', '女哦司法v搜索的', '2017-07-29 20:27:42.000000');
INSERT INTO `history` VALUES ('50', '345', '45', '10', '东方闪电', 'sdfg如果被', '2017-07-29 20:38:57.000000');
INSERT INTO `history` VALUES ('51', '345', '58', '0', 'j哦i地方', '更换', '2017-07-29 20:40:51.000000');
INSERT INTO `history` VALUES ('52', '345', '54', '4', '那天', '人谈话内容', '2017-07-29 20:41:30.000000');
INSERT INTO `history` VALUES ('53', '345', '52', '0', '不太热', '女哦司法v搜索的', '2017-07-29 20:50:33.000000');
INSERT INTO `history` VALUES ('54', '345', '50', '5', 'fvwev', ' 人根本不 e', '2017-07-29 20:52:16.000000');
INSERT INTO `history` VALUES ('55', 'new', '58', '0', 'j哦i地方', '更换', '2017-07-29 21:00:00.000000');
INSERT INTO `history` VALUES ('56', 'new', '56', '0', '莫', '规划局', '2017-07-29 21:01:47.000000');
INSERT INTO `history` VALUES ('57', 'new', '61', '4', '发v哦是', '是不是yio', '2017-07-29 21:03:08.000000');
INSERT INTO `history` VALUES ('59', '345', '58', '7', 'j哦i地方', 'try内容提要', '2017-07-29 21:51:05.000000');
INSERT INTO `history` VALUES ('61', 'as', '59', '0', 'gfn', '十大城市', '2017-07-30 08:46:54.000000');
INSERT INTO `history` VALUES ('62', 'as', '58', '0', 'j哦i地方', '更换', '2017-07-30 08:58:26.000000');
