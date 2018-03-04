/*
Navicat MySQL Data Transfer

Source Server         : cc
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-07-30 10:03:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for analysis
-- ----------------------------
DROP TABLE IF EXISTS `analysis`;
CREATE TABLE `analysis` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NOT NULL,
  `acontent1` varchar(100) DEFAULT NULL,
  `acontent2` varchar(100) DEFAULT NULL,
  `acontent3` varchar(100) DEFAULT NULL,
  `acontent4` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of analysis
-- ----------------------------
INSERT INTO `analysis` VALUES ('10', '50', '日本人怪不得', 'berg不e', ' 人根本不 e', '而被人');
INSERT INTO `analysis` VALUES ('12', '52', '女哦司法v搜索的', '呢士大夫VS付款VS', '上岛咖啡v斯蒂夫VS', '索尼单反v斯蒂芬不是');
INSERT INTO `analysis` VALUES ('13', '53', 'b如果被', '额度', '怪不得', '的风格不对');
INSERT INTO `analysis` VALUES ('14', '54', ' 如何让他', ' 让他', '让他和你', '人谈话内容');
INSERT INTO `analysis` VALUES ('15', '56', '规划局', '复合弓', '风格化', '返回');
INSERT INTO `analysis` VALUES ('16', '58', '更换', '刚好符合名人堂', 'try内容提要', '让她已经人');
INSERT INTO `analysis` VALUES ('19', '62', '就会发动的fog不', '是覅不是比', '觉得奴工', '的覅u避风港好吧');
INSERT INTO `analysis` VALUES ('20', '63', '豆腐干', ' 豆腐干', '法国队', ' 豆腐干');
INSERT INTO `analysis` VALUES ('22', '59', '十大城市', '是v的 ', '山东覅是', '似懂非懂');
INSERT INTO `analysis` VALUES ('23', '64', '。。。打开快点快点快点快点', '流量代理端口打开附件附件发', '大家都觉得减肥减肥', '等等看看打开大开打开');
INSERT INTO `analysis` VALUES ('24', '65', '智力非常优秀', '智力优秀', '智力中上', '弱智');
INSERT INTO `analysis` VALUES ('25', '66', '佛VS地方vi', '史蒂夫VS的', '法定税率hi士大夫', '是的覅哦VS的');
