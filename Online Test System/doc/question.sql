/*
Navicat MySQL Data Transfer

Source Server         : cc
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-07-30 10:03:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `tword` varchar(100) DEFAULT NULL,
  `tpic` varchar(45) DEFAULT NULL,
  `tvideo` varchar(45) DEFAULT NULL,
  `taudio` varchar(45) DEFAULT NULL,
  `tflag` int(11) DEFAULT NULL,
  `tanswer` varchar(10) DEFAULT NULL,
  `tscore` int(11) DEFAULT NULL,
  `eid` int(11) NOT NULL,
  PRIMARY KEY (`qid`),
  KEY `frk_e_q_idx` (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('52', '个人', null, null, null, null, 'B', '4', '50');
INSERT INTO `question` VALUES ('53', '日本', null, null, null, null, 'B', '5', '50');
INSERT INTO `question` VALUES ('61', '对方根本', null, null, null, null, 'C', '4', '52');
INSERT INTO `question` VALUES ('62', '士大夫VS风格的', null, null, null, null, 'C', '4', '53');
INSERT INTO `question` VALUES ('63', '让他和你', null, null, null, null, 'B', '4', '54');
INSERT INTO `question` VALUES ('64', '买到第三方公司', null, null, null, null, 'C', '5', '53');
INSERT INTO `question` VALUES ('65', '是的', '9b482c2e-bfc5-48d6-801d-c8529ef8f087.jpg', null, null, null, 'B', '4', '56');
INSERT INTO `question` VALUES ('66', '到仿宋地方', null, null, null, null, 'B', '4', '56');
INSERT INTO `question` VALUES ('68', '地方规模较大', 'b18b0072-cb3f-4b21-afd0-83ae00067e36.jpg', null, null, null, 'B', '7', '58');
INSERT INTO `question` VALUES ('69', '风格化', '7006aafe-4921-4b2f-893e-777c88e78ffb.jpg', null, null, null, 'C', '5', '58');
INSERT INTO `question` VALUES ('70', '放假吗', null, null, null, null, 'D', '5', '59');
INSERT INTO `question` VALUES ('76', '付款', null, 'd4f1071b-642f-4dcb-b20f-a7b8f3b673a4.mp4', null, null, 'C', '5', '62');
INSERT INTO `question` VALUES ('77', '风格不对', 'a4763414-5da6-4691-9205-0245d686e053.jpg', null, null, null, 'B', '4', '62');
INSERT INTO `question` VALUES ('78', '都发给你的', '7ace05ac-8c21-45a6-8e8a-bb1b11acf3ba.jpg', null, null, null, 'C', '7', '62');
INSERT INTO `question` VALUES ('79', '哒哒哒', null, null, null, null, 'B', '5', '62');
INSERT INTO `question` VALUES ('80', '得分公司', '1191f3d2-9115-412d-b3e3-88a401501f3b.jpg', '7b8cd0f0-26d1-45f1-90ca-1ff72d2a5459.mp4', null, null, 'A', '4', '63');
INSERT INTO `question` VALUES ('81', '还给你', null, '4ec51d2c-f189-45d4-8cf2-d0e699336b2d.mp4', null, null, 'C', '5', '63');
INSERT INTO `question` VALUES ('85', '59卷-题', '4503d99e-d5b6-4fe2-9765-5cdbeb820208.jpg', null, null, null, 'C', '5', '59');
INSERT INTO `question` VALUES ('86', '快速', '4841c50b-b712-432c-8ae3-491a33c2cc51.jpg', null, null, null, 'B', '5', '64');
INSERT INTO `question` VALUES ('87', '啦啦啦啦啦', null, 'c2c9d364-c63e-4601-991b-925f326442a2.mp4', null, null, 'D', '5', '64');
INSERT INTO `question` VALUES ('88', '没打扫', null, null, '6a7ab488-4eac-4260-bf33-e613bdcb9e88.mp3', null, 'B', '5', '64');
INSERT INTO `question` VALUES ('89', '选出不同类的一项:', null, null, null, null, 'B', '5', '65');
INSERT INTO `question` VALUES ('90', '如果笔相对于写字,那么书相对于', null, null, null, null, 'A', '5', '65');
INSERT INTO `question` VALUES ('91', ' 动物学家与社会学家对应,正如动物与_____相对', null, null, null, null, 'B', '5', '65');
INSERT INTO `question` VALUES ('92', '如果所有的妇女都有大衣,那么漂亮的妇女会有:', null, null, null, null, 'B', '5', '65');
INSERT INTO `question` VALUES ('93', '南之于西北,正如西之于： ', null, null, null, null, 'C', '5', '65');
INSERT INTO `question` VALUES ('94', '找出不同类的一项:', null, null, null, null, 'B', '5', '65');
INSERT INTO `question` VALUES ('95', '选项A.B.C.D.中,哪项该填在 \"XOOOOXXOOOXXX\" 后面', null, null, null, null, 'A', '5', '65');
INSERT INTO `question` VALUES ('96', '.选出不同类的一项:', null, null, '43c015c9-b153-4bd5-8ee7-1f1761e2b46d.mp3', null, 'B', '5', '65');
INSERT INTO `question` VALUES ('97', '找出不同类图片', null, null, null, null, 'B', '5', '65');
INSERT INTO `question` VALUES ('98', '看个视频', null, '61d05e2a-9984-456b-8ff1-f26f8c804910.mp4', null, null, 'D', '5', '65');
INSERT INTO `question` VALUES ('99', 'kdkhs', null, '1e314130-3fa8-4b06-b3e5-bf4de0bfc7d9.mp4', null, null, 'C', '5', '66');
INSERT INTO `question` VALUES ('100', '陌生地方', null, null, null, null, 'B', '5', '66');
