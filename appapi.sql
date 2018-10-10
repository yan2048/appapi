/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : appapi

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-10-10 08:25:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ent_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `ent_admin_user`;
CREATE TABLE `ent_admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '',
  `last_login_ip` varchar(30) NOT NULL DEFAULT '',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` int(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `delete_time` int(10) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_2` (`username`),
  KEY `username` (`username`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_admin_user
-- ----------------------------
INSERT INTO `ent_admin_user` VALUES ('1', 'admin', '96a8293e19bc4981e9903e67e7f752a1', '127.0.0.1', '1539095594', '0', '1', '0', '1539095594', null);
INSERT INTO `ent_admin_user` VALUES ('2', 'singwa', 'b7f39367b5d8d0f65c8e2002dae7a07a', '', '0', '0', '1', '0', '0', null);
INSERT INTO `ent_admin_user` VALUES ('7', 'admin122', 'f5957f2d94df1be5d82fede6fcd9dc29', '', '0', '0', '1', '1501151220', '1501151220', null);
INSERT INTO `ent_admin_user` VALUES ('9', 'admin3444', 'b64974feb747678f4d443bd75b0b47c6', '', '0', '0', '1', '1501151278', '1501151278', null);
INSERT INTO `ent_admin_user` VALUES ('10', 'test', '96a8293e19bc4981e9903e67e7f752a1', '', '0', '0', '1', '0', '0', '1538925296');
INSERT INTO `ent_admin_user` VALUES ('12', 'admin12', '96a8293e19bc4981e9903e67e7f752a1', '', '0', '0', '0', '1538925296', '1538925296', null);
INSERT INTO `ent_admin_user` VALUES ('14', 'test2', '96a8293e19bc4981e9903e67e7f752a1', '', '0', '0', '1', '1538926921', '1538926921', null);

-- ----------------------------
-- Table structure for ent_app_active
-- ----------------------------
DROP TABLE IF EXISTS `ent_app_active`;
CREATE TABLE `ent_app_active` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(8) unsigned NOT NULL DEFAULT '0',
  `app_type` varchar(20) NOT NULL DEFAULT '',
  `version_code` varchar(10) NOT NULL DEFAULT '',
  `did` varchar(100) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_app_active
-- ----------------------------
INSERT INTO `ent_app_active` VALUES ('1', '1', 'android', '', '12345dg', '1503338102', '1503338102');
INSERT INTO `ent_app_active` VALUES ('2', '1', 'android', '', '12345dg', '1503338116', '1503338116');
INSERT INTO `ent_app_active` VALUES ('3', '1', 'android', '', '12345dg', '1503943731', '1503943731');

-- ----------------------------
-- Table structure for ent_comment
-- ----------------------------
DROP TABLE IF EXISTS `ent_comment`;
CREATE TABLE `ent_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `news_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `content` varchar(500) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '评论的内容',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论目标用户id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父类id',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `news_id` (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_comment
-- ----------------------------

-- ----------------------------
-- Table structure for ent_news
-- ----------------------------
DROP TABLE IF EXISTS `ent_news`;
CREATE TABLE `ent_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `small_title` varchar(20) NOT NULL DEFAULT '',
  `catid` int(8) unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `description` varchar(200) NOT NULL,
  `is_position` tinyint(1) NOT NULL DEFAULT '0',
  `is_head_figure` tinyint(1) NOT NULL DEFAULT '0',
  `is_allowcomments` tinyint(1) NOT NULL DEFAULT '0',
  `listorder` int(8) NOT NULL,
  `source_type` tinyint(1) DEFAULT '0',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `read_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读数',
  `upvote_count` int(10) unsigned NOT NULL DEFAULT '0',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_news
-- ----------------------------
INSERT INTO `ent_news` VALUES ('1', 'ttst', 'ttt', '1', '', '<p>ttttttt</p>', 'ttt', '1', '0', '0', '0', '0', '1501439513', '1501634869', '-1', '0', '0', '0');
INSERT INTO `ent_news` VALUES ('2', 'tttt', 'sst', '1', '', '<p>tt</p>', 'tt', '0', '0', '0', '0', '0', '1501439814', '1501634848', '-1', '0', '0', '0');
INSERT INTO `ent_news` VALUES ('3', 'ttt', 'ttt', '1', 'http://otwueljs0.bkt.clouddn.com/2017/07/a055e20170731023719851.jpg', '<p>ttt</p>', 't', '0', '0', '0', '0', '0', '1501439846', '1501439846', '1', '0', '0', '0');
INSERT INTO `ent_news` VALUES ('4', 'tttt', 'tt', '3', 'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg', '<p>ttttttt&#39;</p><p>gsdg</p>', 't', '0', '1', '1', '0', '0', '1501441709', '1501441709', '1', '0', '0', '0');
INSERT INTO `ent_news` VALUES ('5', '刘德华', 'tt', '3', 'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg', '<p>ttttttt&#39;</p><p>gsdg</p>', 't', '0', '1', '1', '0', '0', '1501441709', '1501441709', '1', '2', '0', '0');
INSERT INTO `ent_news` VALUES ('6', '吴奇隆', 'tt', '3', 'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg', '<p>ttttttt&#39;</p><p>gsdg</p>', 't', '0', '1', '1', '0', '0', '1501441709', '1501441709', '1', '0', '0', '0');
INSERT INTO `ent_news` VALUES ('7', 'singwa', 'tt', '3', 'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg', '<p>ttttttt&#39;</p><p>gsdg</p>', 't', '0', '1', '1', '0', '0', '1501441709', '1501441709', '1', '0', '0', '0');
INSERT INTO `ent_news` VALUES ('8', '一个人的生活', 'tt', '3', 'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg', '<p>ttttttt&#39;</p><p>gsdg</p>', 't', '0', '1', '1', '0', '0', '1501441709', '1501441709', '1', '0', '0', '0');
INSERT INTO `ent_news` VALUES ('9', '两个人的世界', 'tt', '3', 'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg', '<p>ttttttt&#39;</p><p>gsdg</p>', 't', '1', '1', '1', '0', '0', '1501441709', '1502972250', '1', '0', '0', '0');
INSERT INTO `ent_news` VALUES ('10', 'singwa又出新课程了', 'tt', '3', 'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg', '<p>ttttttt&#39;</p><p>gsdg</p>', 't', '1', '1', '1', '0', '0', '1501441709', '1502972232', '1', '0', '0', '0');
INSERT INTO `ent_news` VALUES ('11', 'singwa出席江西农业大学第三届大学生就业讲座', 'tt', '3', 'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg', '<p>ttttttt&#39;</p><p>gsdg</p>', 't', '1', '1', '1', '0', '0', '1501441709', '1504460156', '-1', '0', '0', '0');

-- ----------------------------
-- Table structure for ent_user
-- ----------------------------
DROP TABLE IF EXISTS `ent_user`;
CREATE TABLE `ent_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `phone` varchar(11) NOT NULL DEFAULT '',
  `token` varchar(100) NOT NULL DEFAULT '',
  `time_out` int(10) unsigned NOT NULL DEFAULT '0',
  `image` varchar(200) NOT NULL DEFAULT '',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别0男 1女',
  `signature` varchar(200) NOT NULL DEFAULT '' COMMENT '个性签名',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `phone` (`phone`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_user
-- ----------------------------

-- ----------------------------
-- Table structure for ent_user_news
-- ----------------------------
DROP TABLE IF EXISTS `ent_user_news`;
CREATE TABLE `ent_user_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `news_id` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_user_news
-- ----------------------------

-- ----------------------------
-- Table structure for ent_version
-- ----------------------------
DROP TABLE IF EXISTS `ent_version`;
CREATE TABLE `ent_version` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'app类型 比如 ios android',
  `version` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '内部版本号',
  `version_code` varchar(20) NOT NULL DEFAULT '' COMMENT '外部版本号比如1.2.3',
  `is_force` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否强制更新0不，1强制更新',
  `apk_url` varchar(255) NOT NULL DEFAULT '' COMMENT 'apk最新地址',
  `upgrade_point` varchar(500) NOT NULL DEFAULT '' COMMENT '升级提示',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ent_version
-- ----------------------------
INSERT INTO `ent_version` VALUES ('1', 'android', '2', '1.2', '0', 'x.com/1/3.html', '1、优化了网络数据\r\n2、增加新闻内容', '1', '0', '0');
INSERT INTO `ent_version` VALUES ('2', 'android', '3', '2.1', '0', 'b.com/1/3.html', '1、优化了网络数据\r\n', '1', '0', '0');
