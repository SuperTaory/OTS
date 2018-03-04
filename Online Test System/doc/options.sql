/*
Navicat MySQL Data Transfer

Source Server         : cc
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-07-30 10:03:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `aword` varchar(100) DEFAULT NULL,
  `apic` varchar(45) DEFAULT NULL,
  `bword` varchar(100) DEFAULT NULL,
  `bpic` varchar(45) DEFAULT NULL,
  `cword` varchar(100) DEFAULT NULL,
  `cpic` varchar(45) DEFAULT NULL,
  `dword` varchar(100) DEFAULT NULL,
  `dpic` varchar(45) DEFAULT NULL,
  `ascore` int(11) DEFAULT NULL,
  `bscore` int(11) DEFAULT NULL,
  `cscore` int(11) DEFAULT NULL,
  `dscore` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES ('34', '52', '50', '地方', null, '日坛北', null, '儿童版', null, '额', null, null, null, null, null);
INSERT INTO `options` VALUES ('35', '53', '50', '根本', null, '而不', null, '本题', null, '儿童版', null, null, null, null, null);
INSERT INTO `options` VALUES ('43', '61', '52', '覆盖发', null, '让他和', null, '人体内', null, '恶霸 ', null, null, null, null, null);
INSERT INTO `options` VALUES ('44', '62', '53', '根本大法', null, 'berg', null, '而不', null, '被', null, null, null, null, null);
INSERT INTO `options` VALUES ('45', '63', '54', ' 若与', null, '柔滑凝乳', null, '你让他和你', null, '谈话内容', null, null, null, null, null);
INSERT INTO `options` VALUES ('46', '64', '53', '哦对粉丝vhi', null, 'v哦多少积分v', null, '更好的风格', null, '是豆腐干士大夫', null, null, null, null, null);
INSERT INTO `options` VALUES ('47', '65', '56', '更换', null, '就明天', null, '郭敬明', null, '环境', null, null, null, null, null);
INSERT INTO `options` VALUES ('48', '66', '56', '法国队', null, '梵蒂冈', null, '发给对方 ', null, '法国队', null, null, null, null, null);
INSERT INTO `options` VALUES ('50', '68', '58', '更换', null, '还给你', null, '规范化', null, '风格化', null, null, null, null, null);
INSERT INTO `options` VALUES ('51', '69', '58', '规范化', null, '风格化', null, '烦恼', null, '你让他', null, null, null, null, null);
INSERT INTO `options` VALUES ('52', '70', '59', '干活呢', null, '凤凰男', null, '风格化', null, '免费', null, null, null, null, null);
INSERT INTO `options` VALUES ('58', '76', '62', '豆腐干', null, '豆腐干豆腐干', null, '的风格不符的根本', null, '对方', null, null, null, null, null);
INSERT INTO `options` VALUES ('59', '77', '62', '对方根本', '25d494d6-0d00-453b-af76-97fe9a665eea.jpg', '怪不得', 'e0015202-cf6f-42fd-8575-824c899ba07e.jpg', '豆腐干', '19d6bcd2-4532-4134-9bfe-dcf68a1f99fd.jpg', '豆腐干 ', 'cadd2c72-0149-4b31-a7c5-9896a20a984e.jpg', null, null, null, null);
INSERT INTO `options` VALUES ('60', '78', '62', '干活呢', 'c3daba86-d518-4f6b-b0bd-62f92b845c35.jpg', '6好几个', 'ff58638f-7177-4d24-9211-cbda191c6e3d.jpg', '规划局个', 'dc6034ec-07a5-48e9-833b-e27b1a6fc199.jpg', '规划局', '24f74cf3-bb9c-48b2-8b45-458f19f06389.jpg', null, null, null, null);
INSERT INTO `options` VALUES ('61', '79', '62', '得分', null, '是', null, '发山东', null, '是的', null, null, null, null, null);
INSERT INTO `options` VALUES ('62', '80', '63', '放荡', null, '怪不得', null, '对方根本', null, '的', null, null, null, null, null);
INSERT INTO `options` VALUES ('63', '81', '63', '就看过', '69688a1e-68eb-43f5-b17e-567f5574640f.jpg', '就的', 'c7505096-453a-41b6-89e5-529759ada44f.jpg', '丰田预计', 'f42d4df3-9f50-4a7c-8d4e-d1a148449138.jpg', '还能', 'ccb34b03-4acd-4393-98c8-a06941d02f1b.jpg', null, null, null, null);
INSERT INTO `options` VALUES ('67', '85', '59', '更方便的', null, '豆腐干', null, '覆盖', null, '覆盖', null, null, null, null, null);
INSERT INTO `options` VALUES ('68', '86', '64', '股东股份', '4b3f382c-100f-4c86-9235-7242283a4b35.jpg', '梵蒂冈', 'd8f23d33-33c5-4a7a-80dc-709c66216701.jpg', '对方根本', 'a2655740-0e2b-4d45-be98-9434af7d5f3a.jpg', '怪不得', '97b418d3-f698-4696-9c7e-0f731ca20d56.jpg', null, null, null, null);
INSERT INTO `options` VALUES ('69', '87', '64', '发个广告', null, '嘎嘎嘎f', null, 'f\'f方法', null, '烦烦烦', null, null, null, null, null);
INSERT INTO `options` VALUES ('70', '88', '64', '看看到了', null, '的酒店家具', null, '发的地方', null, '的方法对付的', null, null, null, null, null);
INSERT INTO `options` VALUES ('71', '89', '65', '蛇', null, '大树', null, '狮子', null, '老虎', null, null, null, null, null);
INSERT INTO `options` VALUES ('72', '90', '65', '娱乐', null, '阅读', null, '学文化', null, '解除疲劳', null, null, null, null, null);
INSERT INTO `options` VALUES ('73', '91', '65', '人类', null, '问题', null, '社会', null, '社会学', null, null, null, null, null);
INSERT INTO `options` VALUES ('74', '92', '65', '.给多的大衣', null, '时髦的大衣 ', null, '大衣', null, '昂贵的大衣', null, null, null, null, null);
INSERT INTO `options` VALUES ('75', '93', '65', '西北', null, '东北', null, '西南', null, '东南', null, null, null, null, null);
INSERT INTO `options` VALUES ('76', '94', '65', '铁锅', null, '小勺', null, '米饭', null, '碟子', null, null, null, null, null);
INSERT INTO `options` VALUES ('77', '95', '65', 'XXO', null, 'OOX', null, 'XOX', null, 'OXO', null, null, null, null, null);
INSERT INTO `options` VALUES ('78', '96', '65', '地板', null, '壁橱', null, '窗户', null, '窗帘', null, null, null, null, null);
INSERT INTO `options` VALUES ('79', '97', '65', 'sodium', 'dff110ba-7cc7-411d-851d-acf8c8f5dd9c.jpg', 'sdf', '0d215a7e-ae87-438e-b7e0-c29499d1e875.jpg', 'fgdsdf', '922aa84f-b7ce-4726-b759-995d398b7661.jpg', 'sdfv', '257ec38c-6ea2-44b8-a392-4d3feec5349d.jpg', null, null, null, null);
INSERT INTO `options` VALUES ('80', '98', '65', '电风扇', null, '是的覅', null, '是的覅', null, '是的覅', null, null, null, null, null);
INSERT INTO `options` VALUES ('81', '99', '66', 'sdffsd', null, 'sdf', null, 'sdfdfg', null, 'sdfg', null, null, null, null, null);
INSERT INTO `options` VALUES ('82', '100', '66', '山东覅是', null, '山东分公司', null, '山东分公司', null, '士大夫敢死队', null, null, null, null, null);
