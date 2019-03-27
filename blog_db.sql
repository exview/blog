/*
Navicat MySQL Data Transfer

Source Server         : Silverspoon
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : blog_db

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-03-27 18:44:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(64) NOT NULL,
  `birth_date` date NOT NULL,
  `nickname` varchar(16) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `github` varchar(64) DEFAULT NULL,
  `qq` varchar(64) DEFAULT NULL,
  `wechat` varchar(64) DEFAULT NULL,
  `avatar` varchar(64) DEFAULT NULL COMMENT '头像url',
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gtmt_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hobby` varchar(64) DEFAULT NULL,
  `motto` varchar(64) DEFAULT NULL,
  `md_info` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'leave', 'bd0f925dc2d043d5c1601f20a38563d0', '2019-01-10', 'silverspoon', 'masiroonen@gmail.com', null, null, null, null, '2019-02-05 13:16:30', '2019-02-05 17:16:57', null, null, null);

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `tagId` int(11) unsigned NOT NULL,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `introduction` varchar(256) DEFAULT NULL,
  `mdFile` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('5', 'Test', '1', '2019-02-06 20:18:50', '2019-02-06 20:18:50', 'this is a test.', '1549455396438_1.md');
INSERT INTO `article` VALUES ('6', 'Test2', '2', '2019-02-06 20:46:08', '2019-02-13 15:29:00', 'this is a test.', '1549457167852_1.md');

-- ----------------------------
-- Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', 'IT', '2019-02-06 20:00:33', '2019-02-06 20:00:33');
INSERT INTO `tag` VALUES ('2', '杂谈', '2019-02-07 10:24:22', '2019-02-07 10:24:22');
INSERT INTO `tag` VALUES ('4', 'Java', '2019-02-07 10:57:26', '2019-02-07 10:57:26');
INSERT INTO `tag` VALUES ('5', 'C++', '2019-02-07 10:58:14', '2019-02-07 10:58:14');
INSERT INTO `tag` VALUES ('6', 'Tomcat', '2019-02-07 11:00:55', '2019-02-07 11:00:55');
INSERT INTO `tag` VALUES ('7', '', '2019-02-08 21:22:19', '2019-02-08 21:22:19');

-- ----------------------------
-- Table structure for `tag_article`
-- ----------------------------
DROP TABLE IF EXISTS `tag_article`;
CREATE TABLE `tag_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag_article
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `brith_date` date NOT NULL,
  `nickname` varchar(64) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `github` varchar(64) DEFAULT NULL,
  `qq` varchar(64) DEFAULT NULL,
  `wechat` varchar(64) DEFAULT NULL,
  `avatar` varchar(64) DEFAULT NULL,
  `status` enum('1','0') NOT NULL,
  `level` int(11) NOT NULL,
  `gmt_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hobby` varchar(64) DEFAULT NULL,
  `motto` varchar(64) DEFAULT NULL,
  `md_info` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
