/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : lolly

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-24 13:09:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `loly_goods`
-- ----------------------------
DROP TABLE IF EXISTS `loly_goods`;
CREATE TABLE `loly_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL DEFAULT '0',
  `c_id` int(11) NOT NULL DEFAULT '0',
  `d_sn` varchar(50) NOT NULL,
  `d_name` varchar(255) NOT NULL DEFAULT '',
  `d_fname` varchar(255) DEFAULT NULL,
  `d_ifpicture` tinyint(1) NOT NULL DEFAULT '0',
  `d_picture` varchar(255) DEFAULT NULL,
  `d_parent` int(11) NOT NULL,
  `d_rec` tinyint(1) NOT NULL DEFAULT '0',
  `d_hot` tinyint(1) NOT NULL DEFAULT '0',
  `d_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `d_max` int(5) NOT NULL DEFAULT '2',
  `d_ifslideshow` tinyint(1) NOT NULL DEFAULT '0',
  `d_slideshow` varchar(2000) DEFAULT NULL,
  `d_content` longtext,
  `d_scontent` longtext,
  `d_code` longtext,
  `d_seoname` varchar(255) DEFAULT NULL,
  `d_keywords` varchar(255) DEFAULT NULL,
  `d_description` varchar(255) DEFAULT NULL,
  `d_link` varchar(255) DEFAULT NULL,
  `d_order` int(11) NOT NULL DEFAULT '100',
  `d_source` varchar(255) DEFAULT NULL,
  `d_author` varchar(255) DEFAULT NULL,
  `d_hits` int(11) DEFAULT '0',
  `d_ifvideo` tinyint(1) NOT NULL DEFAULT '0',
  `d_video` longtext,
  `d_ifattachment` tinyint(1) NOT NULL DEFAULT '0',
  `d_attachment` varchar(255) DEFAULT NULL,
  `d_point` int(11) NOT NULL DEFAULT '0',
  `d_tag` varchar(320) NOT NULL DEFAULT '',
  `d_state` tinyint(1) NOT NULL DEFAULT '0',
  `d_date` int(10) DEFAULT NULL,
  `d_edate` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`,`d_parent`,`c_id`,`u_id`,`d_sn`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loly_goods
-- ----------------------------
INSERT INTO `loly_goods` VALUES ('97', '3', '0', '', 'kenroll可柔', '', '1', '/uploadfile/image/20171020/20171020084936_39847.jpg', '3', '0', '0', '69.00', '0', '1', '/uploadfile/image/20171020/20171020084936_39847.jpg|/uploadfile/image/20171020/20171020084936_92350.jpg|/uploadfile/image/20171020/20171020084936_47142.jpg|/uploadfile/image/20171020/20171020084937_93323.jpg|/uploadfile/image/20171020/20171020084937_65747.jpg', '<p>测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下，测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下，测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下测试的详细信息内容如下。</p><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2986429393/TB2VccUXHSGJuJjSZFqXXXo2pXa_!!2986429393.jpg\" class=\"img-lazyload\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2986429393/TB2Q6kUXSuFJuJjSZJiXXXC4XXa_!!2986429393.jpg\" class=\"img-lazyload\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2986429393/TB2amwSXJ1HJuJjSZFkXXcC1XXa_!!2986429393.jpg\" class=\"img-lazyload\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2986429393/TB2RahKaMCYW1JjSZFCXXcxLVXa_!!2986429393.jpg\" class=\"img-lazyload\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2986429393/TB2wo_8aoMgYeJjSZFGXXXsMXXa_!!2986429393.jpg\" class=\"img-lazyload\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2986429393/TB20.IZXSGFJuJjSZFwXXa.iFXa_!!2986429393.jpg\" class=\"img-lazyload\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2986429393/TB2hlsRXFmIJuJjSZPcXXa0yFXa_!!2986429393.jpg\" class=\"img-lazyload\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2986429393/TB25AZUXNWGJuJjSZFMXXauRFXa_!!2986429393.jpg\" class=\"img-lazyload\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2986429393/TB2qpcUXNOGJuJjSZFhXXav4VXa_!!2986429393.jpg\" class=\"img-lazyload\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2986429393/TB2AHD0XsaCJuJjy1zkXXbelVXa_!!2986429393.jpg\" class=\"img-lazyload\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2986429393/TB2X53VXT5GJuJjSZFoXXXqfVXa_!!2986429393.jpg\" class=\"img-lazyload\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2986429393/TB28lxPXDaVJKJjy1zdXXcIGpXa_!!2986429393.jpg\" class=\"img-lazyload\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2986429393/TB2ZX3ZXn_WJKJjy0FnXXXwwFXa_!!2986429393.jpg\" class=\"img-lazyload\" /><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2986429393/TB23mD3XBGBJuJjSszhXXbQDpXa_!!2986429393.jpg\" class=\"img-lazyload\" />', '<p>名称:【包邮】KENROLL科柔防滑保暖儿童棉拖鞋/浴室凉拖 秋冬在家时间长 一穿一整天的拖鞋 选安全防滑的</p><p>编号:506858</p><p>分类:鞋 拖鞋</p>', '耐克Nike毛毛虫 防滑跑鞋', '', '', '', '', '100', '', '', '1', '0', '', '0', '', '0', '2人团,拼团立省￥10元', '6', '1508688000', '1518101882');

-- ----------------------------
-- Table structure for `loly_goods_attr`
-- ----------------------------
DROP TABLE IF EXISTS `loly_goods_attr`;
CREATE TABLE `loly_goods_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL DEFAULT '0',
  `g_id` int(11) NOT NULL DEFAULT '0',
  `a_name` varchar(255) NOT NULL,
  `a_type` int(10) DEFAULT NULL,
  `a_order` int(11) NOT NULL DEFAULT '100',
  `a_isext` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`c_id`,`g_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loly_goods_attr
-- ----------------------------
INSERT INTO `loly_goods_attr` VALUES ('1', '0', '97', '颜色', null, '100', '0');
INSERT INTO `loly_goods_attr` VALUES ('2', '0', '97', '套餐', null, '100', '0');
INSERT INTO `loly_goods_attr` VALUES ('3', '0', '97', '存储', null, '100', '0');
INSERT INTO `loly_goods_attr` VALUES ('4', '0', '97', '版本', null, '100', '0');

-- ----------------------------
-- Table structure for `loly_goods_attr_relation`
-- ----------------------------
DROP TABLE IF EXISTS `loly_goods_attr_relation`;
CREATE TABLE `loly_goods_attr_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_id` int(11) NOT NULL,
  `a_ids` varchar(255) DEFAULT NULL,
  `a_name` varchar(255) DEFAULT NULL,
  `av_ids` varchar(255) NOT NULL,
  `av_name` varchar(255) DEFAULT NULL,
  `ar_quantity` int(11) DEFAULT '0',
  `ar_price` decimal(10,2) DEFAULT '0.00',
  `ar_date` int(10) DEFAULT NULL,
  `ar_state` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`,`g_id`,`av_ids`)
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loly_goods_attr_relation
-- ----------------------------
INSERT INTO `loly_goods_attr_relation` VALUES ('1', '97', '1,2,3,4', null, '1,5,11,8', null, '0', '0.10', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('2', '97', '1,2,3,4', null, '1,5,11,9', null, '0', '0.20', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('3', '97', '1,2,3,4', null, '1,5,11,10', null, '0', '0.30', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('4', '97', '1,2,3,4', null, '1,5,12,8', null, '0', '0.40', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('5', '97', '1,2,3,4', null, '1,5,12,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('6', '97', '1,2,3,4', null, '1,5,12,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('7', '97', '1,2,3,4', null, '1,5,13,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('8', '97', '1,2,3,4', null, '1,5,13,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('9', '97', '1,2,3,4', null, '1,5,13,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('10', '97', '1,2,3,4', null, '1,6,11,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('11', '97', '1,2,3,4', null, '1,6,11,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('12', '97', '1,2,3,4', null, '1,6,11,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('13', '97', '1,2,3,4', null, '1,6,12,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('14', '97', '1,2,3,4', null, '1,6,12,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('15', '97', '1,2,3,4', null, '1,6,12,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('16', '97', '1,2,3,4', null, '1,6,13,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('17', '97', '1,2,3,4', null, '1,6,13,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('18', '97', '1,2,3,4', null, '1,6,13,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('19', '97', '1,2,3,4', null, '1,7,11,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('20', '97', '1,2,3,4', null, '1,7,11,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('21', '97', '1,2,3,4', null, '1,7,11,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('22', '97', '1,2,3,4', null, '1,7,12,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('23', '97', '1,2,3,4', null, '1,7,12,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('24', '97', '1,2,3,4', null, '1,7,12,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('25', '97', '1,2,3,4', null, '1,7,13,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('26', '97', '1,2,3,4', null, '1,7,13,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('27', '97', '1,2,3,4', null, '1,7,13,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('28', '97', '1,2,3,4', null, '2,5,11,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('29', '97', '1,2,3,4', null, '2,5,11,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('30', '97', '1,2,3,4', null, '2,5,11,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('31', '97', '1,2,3,4', null, '2,5,12,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('32', '97', '1,2,3,4', null, '2,5,12,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('33', '97', '1,2,3,4', null, '2,5,12,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('34', '97', '1,2,3,4', null, '2,5,13,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('35', '97', '1,2,3,4', null, '2,5,13,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('36', '97', '1,2,3,4', null, '2,5,13,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('37', '97', '1,2,3,4', null, '2,6,11,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('38', '97', '1,2,3,4', null, '2,6,11,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('39', '97', '1,2,3,4', null, '2,6,11,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('40', '97', '1,2,3,4', null, '2,6,12,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('41', '97', '1,2,3,4', null, '2,6,12,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('42', '97', '1,2,3,4', null, '2,6,12,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('43', '97', '1,2,3,4', null, '2,6,13,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('44', '97', '1,2,3,4', null, '2,6,13,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('45', '97', '1,2,3,4', null, '2,6,13,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('46', '97', '1,2,3,4', null, '2,7,11,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('47', '97', '1,2,3,4', null, '2,7,11,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('48', '97', '1,2,3,4', null, '2,7,11,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('49', '97', '1,2,3,4', null, '2,7,12,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('50', '97', '1,2,3,4', null, '2,7,12,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('51', '97', '1,2,3,4', null, '2,7,12,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('52', '97', '1,2,3,4', null, '2,7,13,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('53', '97', '1,2,3,4', null, '2,7,13,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('54', '97', '1,2,3,4', null, '2,7,13,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('55', '97', '1,2,3,4', null, '3,5,11,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('56', '97', '1,2,3,4', null, '3,5,11,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('57', '97', '1,2,3,4', null, '3,5,11,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('58', '97', '1,2,3,4', null, '3,5,12,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('59', '97', '1,2,3,4', null, '3,5,12,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('60', '97', '1,2,3,4', null, '3,5,12,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('61', '97', '1,2,3,4', null, '3,5,13,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('62', '97', '1,2,3,4', null, '3,5,13,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('63', '97', '1,2,3,4', null, '3,5,13,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('64', '97', '1,2,3,4', null, '3,6,11,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('65', '97', '1,2,3,4', null, '3,6,11,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('66', '97', '1,2,3,4', null, '3,6,11,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('67', '97', '1,2,3,4', null, '3,6,12,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('68', '97', '1,2,3,4', null, '3,6,12,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('69', '97', '1,2,3,4', null, '3,6,12,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('70', '97', '1,2,3,4', null, '3,6,13,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('71', '97', '1,2,3,4', null, '3,6,13,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('72', '97', '1,2,3,4', null, '3,6,13,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('73', '97', '1,2,3,4', null, '3,7,11,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('74', '97', '1,2,3,4', null, '3,7,11,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('75', '97', '1,2,3,4', null, '3,7,11,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('76', '97', '1,2,3,4', null, '3,7,12,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('77', '97', '1,2,3,4', null, '3,7,12,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('78', '97', '1,2,3,4', null, '3,7,12,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('79', '97', '1,2,3,4', null, '3,7,13,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('80', '97', '1,2,3,4', null, '3,7,13,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('81', '97', '1,2,3,4', null, '3,7,13,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('82', '97', '1,2,3,4', null, '4,5,11,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('83', '97', '1,2,3,4', null, '4,5,11,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('84', '97', '1,2,3,4', null, '4,5,11,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('85', '97', '1,2,3,4', null, '4,5,12,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('86', '97', '1,2,3,4', null, '4,5,12,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('87', '97', '1,2,3,4', null, '4,5,12,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('88', '97', '1,2,3,4', null, '4,5,13,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('89', '97', '1,2,3,4', null, '4,5,13,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('90', '97', '1,2,3,4', null, '4,5,13,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('91', '97', '1,2,3,4', null, '4,6,11,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('92', '97', '1,2,3,4', null, '4,6,11,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('93', '97', '1,2,3,4', null, '4,6,11,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('94', '97', '1,2,3,4', null, '4,6,12,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('95', '97', '1,2,3,4', null, '4,6,12,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('96', '97', '1,2,3,4', null, '4,6,12,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('97', '97', '1,2,3,4', null, '4,6,13,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('98', '97', '1,2,3,4', null, '4,6,13,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('99', '97', '1,2,3,4', null, '4,6,13,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('100', '97', '1,2,3,4', null, '4,7,11,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('101', '97', '1,2,3,4', null, '4,7,11,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('102', '97', '1,2,3,4', null, '4,7,11,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('103', '97', '1,2,3,4', null, '4,7,12,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('104', '97', '1,2,3,4', null, '4,7,12,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('105', '97', '1,2,3,4', null, '4,7,12,10', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('106', '97', '1,2,3,4', null, '4,7,13,8', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('107', '97', '1,2,3,4', null, '4,7,13,9', null, '0', '0.00', null, null);
INSERT INTO `loly_goods_attr_relation` VALUES ('108', '97', '1,2,3,4', null, '4,7,13,10', null, '0', '0.00', null, null);

-- ----------------------------
-- Table structure for `loly_goods_attr_template`
-- ----------------------------
DROP TABLE IF EXISTS `loly_goods_attr_template`;
CREATE TABLE `loly_goods_attr_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL DEFAULT '0',
  `at_name` varchar(255) DEFAULT NULL,
  `a_ids` varchar(255) DEFAULT NULL,
  `av_ids` varchar(255) DEFAULT NULL,
  `at_date` int(10) DEFAULT NULL,
  `at_state` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`,`u_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loly_goods_attr_template
-- ----------------------------
INSERT INTO `loly_goods_attr_template` VALUES ('6', '1', '手机', '1,2,3,4', '1,2,3,4,5,6,7,8,9,10,11,12,13', null, null);

-- ----------------------------
-- Table structure for `loly_goods_attr_value`
-- ----------------------------
DROP TABLE IF EXISTS `loly_goods_attr_value`;
CREATE TABLE `loly_goods_attr_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a_id` int(11) NOT NULL,
  `av_name` varchar(1000) NOT NULL,
  `av_date` int(10) NOT NULL DEFAULT '0',
  `av_state` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`,`a_id`),
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loly_goods_attr_value
-- ----------------------------
INSERT INTO `loly_goods_attr_value` VALUES ('1', '1', '星空灰', '0', null);
INSERT INTO `loly_goods_attr_value` VALUES ('2', '1', '银白', '0', null);
INSERT INTO `loly_goods_attr_value` VALUES ('3', '1', '玫瑰金', '0', null);
INSERT INTO `loly_goods_attr_value` VALUES ('4', '1', '土豪金', '0', null);
INSERT INTO `loly_goods_attr_value` VALUES ('5', '2', '官方标配', '0', null);
INSERT INTO `loly_goods_attr_value` VALUES ('6', '2', '套餐1', '0', null);
INSERT INTO `loly_goods_attr_value` VALUES ('7', '2', '套餐2', '0', null);
INSERT INTO `loly_goods_attr_value` VALUES ('8', '4', '港版', '0', null);
INSERT INTO `loly_goods_attr_value` VALUES ('9', '4', '美版', '0', null);
INSERT INTO `loly_goods_attr_value` VALUES ('10', '4', '大陆', '0', null);
INSERT INTO `loly_goods_attr_value` VALUES ('11', '3', '16GB', '0', null);
INSERT INTO `loly_goods_attr_value` VALUES ('12', '3', '64GB', '0', null);
INSERT INTO `loly_goods_attr_value` VALUES ('13', '3', '128GB', '0', null);

-- ----------------------------
-- Table structure for `loly_goods_category`
-- ----------------------------
DROP TABLE IF EXISTS `loly_goods_category`;
CREATE TABLE `loly_goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `parent_path` varchar(128) DEFAULT NULL,
  `c_level` tinyint(1) DEFAULT NULL,
  `c_name` varchar(255) DEFAULT NULL,
  `c_picture` varchar(500) DEFAULT NULL,
  `c_order` int(11) DEFAULT '100',
  `c_date` int(10) DEFAULT NULL,
  `c_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`,`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=844 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loly_goods_category
-- ----------------------------
INSERT INTO `loly_goods_category` VALUES ('1', '0', '0_1', '1', '数码产品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('2', '0', '0_2', '1', '家用电器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('3', '0', '0_3', '1', '电脑', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('4', '0', '0_4', '1', '家具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('5', '0', '0_5', '1', '服装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('6', '0', '0_6', '1', '个人化妆', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('7', '0', '0_7', '1', '箱包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('8', '0', '0_8', '1', '运动户外', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('9', '0', '0_9', '1', '汽车用品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('10', '0', '0_10', '1', '母婴用品、儿童玩具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('11', '0', '0_11', '1', '图书、音像、电子书', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('12', '1', '0_1_12', '2', '手机配件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('13', '1', '0_1_13', '2', '摄影摄像', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('14', '1', '0_1_14', '2', '运营商', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('15', '1', '0_1_15', '2', '数码配件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('16', '1', '0_1_16', '2', '娱乐影视', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('17', '1', '0_1_17', '2', '电子教育', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('18', '1', '0_1_18', '2', '手机通讯', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('19', '2', '0_2_19', '2', '生活电器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('20', '2', '0_2_20', '2', '大家电', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('21', '2', '0_2_21', '2', '厨房电器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('22', '2', '0_2_22', '2', '个护健康', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('23', '2', '0_2_23', '2', '五金交电', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('24', '3', '0_3_24', '2', '网络产品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('25', '3', '0_3_25', '2', '办公设备', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('26', '3', '0_3_26', '2', '文具耗材', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('27', '3', '0_3_27', '2', '电脑整机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('28', '3', '0_3_28', '2', '电脑配件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('29', '3', '0_3_29', '2', '外设产品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('30', '3', '0_3_30', '2', '游戏设备', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('31', '4', '0_4_31', '2', '生活日用', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('32', '4', '0_4_32', '2', '家装软饰', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('33', '4', '0_4_33', '2', '宠物生活', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('34', '4', '0_4_34', '2', '厨具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('35', '4', '0_4_35', '2', '家装建材', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('36', '4', '0_4_36', '2', '家纺', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('37', '4', '0_4_37', '2', '家具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('38', '4', '0_4_38', '2', '灯具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('39', '5', '0_5_39', '2', '女装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('40', '5', '0_5_40', '2', '男装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('41', '5', '0_5_41', '2', '内衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('42', '6', '0_6_42', '2', '身体护肤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('43', '6', '0_6_43', '2', '口腔护理', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('44', '6', '0_6_44', '2', '女性护理', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('45', '6', '0_6_45', '2', '香水彩妆', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('46', '6', '0_6_46', '2', '清洁用品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('47', '6', '0_6_47', '2', '面部护肤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('48', '6', '0_6_48', '2', '洗发护发', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('49', '7', '0_7_49', '2', '精品男包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('50', '7', '0_7_50', '2', '功能箱包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('51', '7', '0_7_51', '2', '珠宝', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('52', '7', '0_7_52', '2', '钟表', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('53', '7', '0_7_53', '2', '时尚女鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('54', '7', '0_7_54', '2', '流行男鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('55', '7', '0_7_55', '2', '潮流女包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('56', '8', '0_8_56', '2', '体育用品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('57', '8', '0_8_57', '2', '户外鞋服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('58', '8', '0_8_58', '2', '户外装备', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('59', '8', '0_8_59', '2', '垂钓用品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('60', '8', '0_8_60', '2', '运动鞋包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('61', '8', '0_8_61', '2', '游泳用品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('62', '8', '0_8_62', '2', '运动服饰', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('63', '8', '0_8_63', '2', '健身训练', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('64', '8', '0_8_64', '2', '骑行运动', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('65', '9', '0_9_65', '2', '车载电器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('66', '9', '0_9_66', '2', '美容清洗', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('67', '9', '0_9_67', '2', '汽车装饰', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('68', '9', '0_9_68', '2', '安全自驾', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('69', '9', '0_9_69', '2', '线下服务', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('70', '9', '0_9_70', '2', '汽车车型', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('71', '9', '0_9_71', '2', '汽车品牌', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('72', '9', '0_9_72', '2', '维修保养', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('73', '10', '0_10_73', '2', '洗护用品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('74', '10', '0_10_74', '2', '喂养用品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('75', '10', '0_10_75', '2', '童车童床', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('76', '10', '0_10_76', '2', '安全座椅', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('77', '10', '0_10_77', '2', '寝居服饰', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('78', '10', '0_10_78', '2', '奶粉', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('79', '10', '0_10_79', '2', '妈妈专区', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('80', '10', '0_10_80', '2', '营养辅食', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('81', '10', '0_10_81', '2', '童装童鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('82', '10', '0_10_82', '2', '尿裤湿巾', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('83', '10', '0_10_83', '2', '玩具乐器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('84', '11', '0_11_84', '2', '音像', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('85', '11', '0_11_85', '2', '刊/原版', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('86', '11', '0_11_86', '2', '少儿', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('87', '11', '0_11_87', '2', '电子书', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('88', '11', '0_11_88', '2', '教育', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('89', '11', '0_11_89', '2', '数字音乐', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('90', '11', '0_11_90', '2', '文艺', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('91', '11', '0_11_91', '2', '经管励志', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('92', '11', '0_11_92', '2', '人文社科', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('93', '11', '0_11_93', '2', '生活', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('94', '11', '0_11_94', '2', '科技', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('95', '46', '0_6_46_95', '3', '纸品湿巾', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('96', '46', '0_6_46_96', '3', '衣物清洁', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('97', '46', '0_6_46_97', '3', '家庭清洁', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('98', '46', '0_6_46_98', '3', '一次性用品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('99', '46', '0_6_46_99', '3', '驱虫用品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('100', '12', '0_1_12_100', '3', '电池 电源 充电器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('101', '12', '0_1_12_101', '3', '数据线,耳机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('102', '12', '0_1_12_102', '3', '贴膜,保护套', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('103', '13', '0_1_13_103', '3', '数码相机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('104', '13', '0_1_13_104', '3', '单反相机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('105', '13', '0_1_13_105', '3', '摄像机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('106', '13', '0_1_13_106', '3', '镜头', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('107', '13', '0_1_13_107', '3', '数码相框', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('108', '14', '0_1_14_108', '3', '选号码', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('109', '14', '0_1_14_109', '3', '办套餐', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('110', '14', '0_1_14_110', '3', '合约机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('111', '14', '0_1_14_111', '3', '中国移动', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('112', '15', '0_1_15_112', '3', '充值卡', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('113', '15', '0_1_15_113', '3', '读卡器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('114', '15', '0_1_15_114', '3', '支架', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('115', '15', '0_1_15_115', '3', '滤镜', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('116', '16', '0_1_16_116', '3', '音响麦克风', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('117', '16', '0_1_16_117', '3', '耳机/耳麦', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('118', '17', '0_1_17_118', '3', '学生平板', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('119', '17', '0_1_17_119', '3', '点读机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('120', '17', '0_1_17_120', '3', '电纸书', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('121', '17', '0_1_17_121', '3', '电子词典', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('122', '17', '0_1_17_122', '3', '复读机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('123', '1', '0_1_123', '2', '手机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('124', '18', '0_1_18_124', '3', '对讲机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('125', '19', '0_2_19_125', '3', '录音机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('126', '19', '0_2_19_126', '3', '饮水机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('127', '19', '0_2_19_127', '3', '烫衣机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('128', '19', '0_2_19_128', '3', '电风扇', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('129', '19', '0_2_19_129', '3', '电话机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('130', '20', '0_2_20_130', '3', '电视', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('131', '20', '0_2_20_131', '3', '冰箱', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('132', '20', '0_2_20_132', '3', '空调', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('133', '20', '0_2_20_133', '3', '洗衣机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('134', '20', '0_2_20_134', '3', '热水器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('135', '21', '0_2_21_135', '3', '料理/榨汁机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('136', '21', '0_2_21_136', '3', '电饭锅', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('137', '21', '0_2_21_137', '3', '微波炉', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('138', '21', '0_2_21_138', '3', '豆浆机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('139', '22', '0_2_22_139', '3', '剃须刀', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('140', '22', '0_2_22_140', '3', '吹风机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('141', '22', '0_2_22_141', '3', '按摩器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('142', '22', '0_2_22_142', '3', '足浴盆', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('143', '22', '0_2_22_143', '3', '血压计', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('144', '23', '0_2_23_144', '3', '厨卫五金', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('145', '23', '0_2_23_145', '3', '门铃门锁', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('146', '23', '0_2_23_146', '3', '开关插座', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('147', '23', '0_2_23_147', '3', '电动工具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('148', '23', '0_2_23_148', '3', '监控安防', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('149', '23', '0_2_23_149', '3', '仪表仪器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('150', '23', '0_2_23_150', '3', '电线线缆', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('151', '23', '0_2_23_151', '3', '浴霸/排气扇', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('152', '23', '0_2_23_152', '3', '灯具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('153', '23', '0_2_23_153', '3', '水龙头', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('154', '24', '0_3_24_154', '3', '网络配件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('155', '24', '0_3_24_155', '3', '路由器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('156', '24', '0_3_24_156', '3', '网卡', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('157', '24', '0_3_24_157', '3', '交换机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('158', '24', '0_3_24_158', '3', '网络存储', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('159', '24', '0_3_24_159', '3', '3G/4G/5G上网', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('160', '24', '0_3_24_160', '3', '网络盒子', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('161', '25', '0_3_25_161', '3', '复合机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('162', '25', '0_3_25_162', '3', '办公家具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('163', '25', '0_3_25_163', '3', '摄影机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('164', '25', '0_3_25_164', '3', '碎纸机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('165', '25', '0_3_25_165', '3', '白板', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('166', '25', '0_3_25_166', '3', '投影配件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('167', '25', '0_3_25_167', '3', '考勤机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('168', '25', '0_3_25_168', '3', '多功能一体机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('169', '25', '0_3_25_169', '3', '收款/POS机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('170', '25', '0_3_25_170', '3', '打印机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('171', '25', '0_3_25_171', '3', '会员视频音频', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('172', '25', '0_3_25_172', '3', '传真设备', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('173', '25', '0_3_25_173', '3', '保险柜', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('174', '25', '0_3_25_174', '3', '验钞/点钞机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('175', '25', '0_3_25_175', '3', '装订/封装机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('176', '25', '0_3_25_176', '3', '扫描设备', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('177', '25', '0_3_25_177', '3', '安防监控', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('178', '26', '0_3_26_178', '3', '文具管理', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('179', '26', '0_3_26_179', '3', '本册便签', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('180', '26', '0_3_26_180', '3', '硒鼓/墨粉', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('181', '26', '0_3_26_181', '3', '计算器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('182', '26', '0_3_26_182', '3', '墨盒', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('183', '26', '0_3_26_183', '3', '笔类', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('184', '26', '0_3_26_184', '3', '色带', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('185', '26', '0_3_26_185', '3', '画具画材', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('186', '26', '0_3_26_186', '3', '纸类', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('187', '26', '0_3_26_187', '3', '财会用品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('188', '26', '0_3_26_188', '3', '办公文具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('189', '26', '0_3_26_189', '3', '刻录碟片', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('190', '26', '0_3_26_190', '3', '学生文具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('191', '27', '0_3_27_191', '3', '平板电脑', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('192', '27', '0_3_27_192', '3', '台式机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('193', '27', '0_3_27_193', '3', '一体机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('194', '27', '0_3_27_194', '3', '笔记本', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('195', '27', '0_3_27_195', '3', '超极本', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('196', '28', '0_3_28_196', '3', '内存', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('197', '28', '0_3_28_197', '3', '组装电脑', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('198', '28', '0_3_28_198', '3', '机箱', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('199', '28', '0_3_28_199', '3', '电源', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('200', '28', '0_3_28_200', '3', 'CPU', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('201', '28', '0_3_28_201', '3', '显示器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('202', '28', '0_3_28_202', '3', '主板', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('203', '28', '0_3_28_203', '3', '刻录机/光驱', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('204', '28', '0_3_28_204', '3', '显卡', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('205', '28', '0_3_28_205', '3', '声卡/扩展卡', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('206', '28', '0_3_28_206', '3', '硬盘', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('207', '28', '0_3_28_207', '3', '散热器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('208', '28', '0_3_28_208', '3', '固态硬盘', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('209', '28', '0_3_28_209', '3', '装机配件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('210', '29', '0_3_29_210', '3', '线缆', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('211', '29', '0_3_29_211', '3', '鼠标', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('212', '29', '0_3_29_212', '3', '手写板', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('213', '29', '0_3_29_213', '3', '键盘', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('214', '29', '0_3_29_214', '3', '电脑工具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('215', '29', '0_3_29_215', '3', '网络仪表仪器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('216', '29', '0_3_29_216', '3', 'UPS', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('217', '29', '0_3_29_217', '3', 'U盘', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('218', '29', '0_3_29_218', '3', '插座', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('219', '29', '0_3_29_219', '3', '移动硬盘', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('220', '29', '0_3_29_220', '3', '鼠标垫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('221', '29', '0_3_29_221', '3', '摄像头', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('222', '30', '0_3_30_222', '3', '游戏软件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('223', '30', '0_3_30_223', '3', '游戏周边', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('224', '30', '0_3_30_224', '3', '游戏机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('225', '30', '0_3_30_225', '3', '游戏耳机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('226', '30', '0_3_30_226', '3', '手柄方向盘', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('227', '31', '0_4_31_227', '3', '清洁工具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('228', '31', '0_4_31_228', '3', '收纳用品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('229', '31', '0_4_31_229', '3', '雨伞雨具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('230', '31', '0_4_31_230', '3', '浴室用品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('231', '31', '0_4_31_231', '3', '缝纫/针织用品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('232', '31', '0_4_31_232', '3', '洗晒/熨烫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('233', '31', '0_4_31_233', '3', '净化除味', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('234', '32', '0_4_32_234', '3', '节庆饰品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('235', '32', '0_4_32_235', '3', '手工/十字绣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('236', '32', '0_4_32_236', '3', '桌布/罩件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('237', '32', '0_4_32_237', '3', '钟饰', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('238', '32', '0_4_32_238', '3', '地毯地垫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('239', '32', '0_4_32_239', '3', '装饰摆件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('240', '32', '0_4_32_240', '3', '沙发垫套/椅垫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('241', '32', '0_4_32_241', '3', '花瓶花艺', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('242', '32', '0_4_32_242', '3', '帘艺隔断', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('243', '32', '0_4_32_243', '3', '创意家居', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('244', '32', '0_4_32_244', '3', '相框/照片墙', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('245', '32', '0_4_32_245', '3', '保暖防护', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('246', '32', '0_4_32_246', '3', '装饰字画', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('247', '32', '0_4_32_247', '3', '香薰蜡烛', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('248', '32', '0_4_32_248', '3', '墙贴/装饰贴', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('249', '33', '0_4_33_249', '3', '水族用品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('250', '33', '0_4_33_250', '3', '宠物玩具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('251', '33', '0_4_33_251', '3', '宠物主粮', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('252', '33', '0_4_33_252', '3', '宠物牵引', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('253', '33', '0_4_33_253', '3', '宠物零食', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('254', '33', '0_4_33_254', '3', '宠物驱虫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('255', '33', '0_4_33_255', '3', '猫砂/尿布', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('256', '33', '0_4_33_256', '3', '洗护美容', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('257', '33', '0_4_33_257', '3', '家居日用', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('258', '33', '0_4_33_258', '3', '医疗保健', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('259', '33', '0_4_33_259', '3', '出行装备', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('260', '34', '0_4_34_260', '3', '剪刀菜饭', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('261', '34', '0_4_34_261', '3', '厨房配件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('262', '34', '0_4_34_262', '3', '水具酒具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('263', '34', '0_4_34_263', '3', '餐具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('264', '34', '0_4_34_264', '3', '茶具/咖啡具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('265', '34', '0_4_34_265', '3', '烹饪锅具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('266', '35', '0_4_35_266', '3', '电工电料', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('267', '35', '0_4_35_267', '3', '墙地材料', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('268', '35', '0_4_35_268', '3', '装饰材料', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('269', '35', '0_4_35_269', '3', '装修服务', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('270', '35', '0_4_35_270', '3', '沐浴花洒', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('271', '35', '0_4_35_271', '3', '灯饰照明', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('272', '35', '0_4_35_272', '3', '开关插座', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('273', '35', '0_4_35_273', '3', '厨房卫浴', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('274', '35', '0_4_35_274', '3', '油漆涂料', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('275', '35', '0_4_35_275', '3', '五金工具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('276', '35', '0_4_35_276', '3', '龙头', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('277', '36', '0_4_36_277', '3', '床品套件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('278', '36', '0_4_36_278', '3', '抱枕靠垫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('279', '36', '0_4_36_279', '3', '被子', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('280', '36', '0_4_36_280', '3', '布艺软饰', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('281', '36', '0_4_36_281', '3', '被芯', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('282', '36', '0_4_36_282', '3', '窗帘窗纱', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('283', '36', '0_4_36_283', '3', '床单被罩', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('284', '36', '0_4_36_284', '3', '蚊帐', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('285', '36', '0_4_36_285', '3', '床垫床褥', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('286', '36', '0_4_36_286', '3', '凉席', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('287', '36', '0_4_36_287', '3', '电地毯', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('288', '36', '0_4_36_288', '3', '毯子', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('289', '36', '0_4_36_289', '3', '毛巾浴巾', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('290', '37', '0_4_37_290', '3', '餐厅家具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('291', '37', '0_4_37_291', '3', '电脑椅', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('292', '37', '0_4_37_292', '3', '书房家具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('293', '37', '0_4_37_293', '3', '衣柜', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('294', '37', '0_4_37_294', '3', '储物家具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('295', '37', '0_4_37_295', '3', '茶几', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('296', '37', '0_4_37_296', '3', '阳台/户外', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('297', '37', '0_4_37_297', '3', '电视柜', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('298', '37', '0_4_37_298', '3', '商业办公', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('299', '37', '0_4_37_299', '3', '餐桌', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('300', '37', '0_4_37_300', '3', '卧室家具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('301', '37', '0_4_37_301', '3', '床', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('302', '37', '0_4_37_302', '3', '电脑桌', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('303', '37', '0_4_37_303', '3', '客厅家具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('304', '37', '0_4_37_304', '3', '床垫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('305', '37', '0_4_37_305', '3', '鞋架/衣帽架', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('306', '37', '0_4_37_306', '3', '客厅家具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('307', '37', '0_4_37_307', '3', '沙发', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('308', '38', '0_4_38_308', '3', '吸顶灯', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('309', '38', '0_4_38_309', '3', '吊灯', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('310', '38', '0_4_38_310', '3', '筒灯射灯', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('311', '38', '0_4_38_311', '3', '氛围照明', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('312', '38', '0_4_38_312', '3', 'LED灯', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('313', '38', '0_4_38_313', '3', '节能灯', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('314', '38', '0_4_38_314', '3', '落地灯', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('315', '38', '0_4_38_315', '3', '五金电器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('316', '38', '0_4_38_316', '3', '应急灯/手电', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('317', '38', '0_4_38_317', '3', '台灯', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('318', '38', '0_4_38_318', '3', '装饰灯', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('319', '39', '0_5_39_319', '3', '短外套', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('320', '39', '0_5_39_320', '3', '羊毛衫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('321', '39', '0_5_39_321', '3', '雪纺衫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('322', '39', '0_5_39_322', '3', '礼服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('323', '39', '0_5_39_323', '3', '风衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('324', '39', '0_5_39_324', '3', '羊绒衫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('325', '39', '0_5_39_325', '3', '牛仔裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('326', '39', '0_5_39_326', '3', '马甲', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('327', '39', '0_5_39_327', '3', '衬衫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('328', '39', '0_5_39_328', '3', '半身裙', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('329', '39', '0_5_39_329', '3', '休闲裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('330', '39', '0_5_39_330', '3', '吊带/背心', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('331', '39', '0_5_39_331', '3', '羽绒服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('332', '39', '0_5_39_332', '3', 'T恤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('333', '39', '0_5_39_333', '3', '大码女装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('334', '39', '0_5_39_334', '3', '正装裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('335', '39', '0_5_39_335', '3', '设计师/潮牌', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('336', '39', '0_5_39_336', '3', '毛呢大衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('337', '39', '0_5_39_337', '3', '小西装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('338', '39', '0_5_39_338', '3', '中老年女装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('339', '39', '0_5_39_339', '3', '加绒裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('340', '39', '0_5_39_340', '3', '棉服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('341', '39', '0_5_39_341', '3', '打底衫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('342', '39', '0_5_39_342', '3', '皮草', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('343', '39', '0_5_39_343', '3', '短裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('344', '39', '0_5_39_344', '3', '连衣裙', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('345', '39', '0_5_39_345', '3', '打底裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('346', '39', '0_5_39_346', '3', '真皮皮衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('347', '39', '0_5_39_347', '3', '婚纱', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('348', '39', '0_5_39_348', '3', '卫衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('349', '39', '0_5_39_349', '3', '针织衫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('350', '39', '0_5_39_350', '3', '仿皮皮衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('351', '39', '0_5_39_351', '3', '旗袍/唐装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('352', '40', '0_5_40_352', '3', '羊毛衫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('353', '40', '0_5_40_353', '3', '休闲裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('354', '40', '0_5_40_354', '3', 'POLO衫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('355', '40', '0_5_40_355', '3', '加绒裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('356', '40', '0_5_40_356', '3', '衬衫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('357', '40', '0_5_40_357', '3', '短裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('358', '40', '0_5_40_358', '3', '真皮皮衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('359', '40', '0_5_40_359', '3', '毛呢大衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('360', '40', '0_5_40_360', '3', '中老年男装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('361', '40', '0_5_40_361', '3', '卫衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('362', '40', '0_5_40_362', '3', '风衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('363', '40', '0_5_40_363', '3', '大码男装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('364', '40', '0_5_40_364', '3', '羽绒服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('365', '40', '0_5_40_365', '3', 'T恤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('366', '40', '0_5_40_366', '3', '仿皮皮衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('367', '40', '0_5_40_367', '3', '羊绒衫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('368', '40', '0_5_40_368', '3', '棉服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('369', '40', '0_5_40_369', '3', '马甲/背心', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('370', '40', '0_5_40_370', '3', '西服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('371', '40', '0_5_40_371', '3', '设计师/潮牌', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('372', '40', '0_5_40_372', '3', '针织衫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('373', '40', '0_5_40_373', '3', '西服套装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('374', '40', '0_5_40_374', '3', '西裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('375', '40', '0_5_40_375', '3', '工装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('376', '40', '0_5_40_376', '3', '夹克', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('377', '40', '0_5_40_377', '3', '牛仔裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('378', '40', '0_5_40_378', '3', '卫裤/运动裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('379', '40', '0_5_40_379', '3', '唐装/中山装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('380', '41', '0_5_41_380', '3', '保暖内衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('381', '41', '0_5_41_381', '3', '大码内衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('382', '41', '0_5_41_382', '3', '吊带/背心', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('383', '41', '0_5_41_383', '3', '秋衣秋裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('384', '41', '0_5_41_384', '3', '文胸', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('385', '41', '0_5_41_385', '3', '内衣配件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('386', '41', '0_5_41_386', '3', '睡衣/家居服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('387', '41', '0_5_41_387', '3', '男式内裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('388', '41', '0_5_41_388', '3', '泳衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('389', '41', '0_5_41_389', '3', '打底裤袜', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('390', '41', '0_5_41_390', '3', '女式内裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('391', '41', '0_5_41_391', '3', '塑身美体', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('392', '41', '0_5_41_392', '3', '休闲棉袜', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('393', '41', '0_5_41_393', '3', '连裤袜/丝袜', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('394', '41', '0_5_41_394', '3', '美腿袜', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('395', '41', '0_5_41_395', '3', '商务男袜', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('396', '41', '0_5_41_396', '3', '打底衫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('397', '41', '0_5_41_397', '3', '情趣内衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('398', '41', '0_5_41_398', '3', '情侣睡衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('399', '41', '0_5_41_399', '3', '少女文胸', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('400', '41', '0_5_41_400', '3', '文胸套装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('401', '41', '0_5_41_401', '3', '抹胸', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('402', '42', '0_6_42_402', '3', '沐浴', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('403', '42', '0_6_42_403', '3', '润肤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('404', '42', '0_6_42_404', '3', '颈部', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('405', '42', '0_6_42_405', '3', '手足', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('406', '42', '0_6_42_406', '3', '纤体塑形', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('407', '42', '0_6_42_407', '3', '美胸', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('408', '42', '0_6_42_408', '3', '套装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('409', '43', '0_6_43_409', '3', '牙膏/牙粉', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('410', '43', '0_6_43_410', '3', '牙刷/牙线', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('411', '43', '0_6_43_411', '3', '漱口水', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('412', '43', '0_6_43_412', '3', '套装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('413', '44', '0_6_44_413', '3', '卫生巾', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('414', '44', '0_6_44_414', '3', '卫生护垫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('415', '44', '0_6_44_415', '3', '私密护理', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('416', '44', '0_6_44_416', '3', '脱毛膏', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('417', '45', '0_6_45_417', '3', '唇部', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('418', '45', '0_6_45_418', '3', '美甲', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('419', '45', '0_6_45_419', '3', '美容工具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('420', '45', '0_6_45_420', '3', '套装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('421', '45', '0_6_45_421', '3', '香水', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('422', '45', '0_6_45_422', '3', '底妆', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('423', '45', '0_6_45_423', '3', '腮红', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('424', '45', '0_6_45_424', '3', '眼部', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('425', '47', '0_6_47_425', '3', '面膜', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('426', '47', '0_6_47_426', '3', '剃须', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('427', '47', '0_6_47_427', '3', '套装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('428', '47', '0_6_47_428', '3', '清洁', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('429', '47', '0_6_47_429', '3', '护肤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('430', '48', '0_6_48_430', '3', '套装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('431', '48', '0_6_48_431', '3', '洗发', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('432', '48', '0_6_48_432', '3', '护发', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('433', '48', '0_6_48_433', '3', '染发', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('434', '48', '0_6_48_434', '3', '造型', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('435', '48', '0_6_48_435', '3', '假发', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('436', '49', '0_7_49_436', '3', '商务公文包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('437', '49', '0_7_49_437', '3', '单肩/斜挎包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('438', '49', '0_7_49_438', '3', '男士手包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('439', '49', '0_7_49_439', '3', '双肩包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('440', '49', '0_7_49_440', '3', '钱包/卡包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('441', '49', '0_7_49_441', '3', '钥匙包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('442', '50', '0_7_50_442', '3', '旅行包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('443', '50', '0_7_50_443', '3', '妈咪包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('444', '50', '0_7_50_444', '3', '电脑包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('445', '50', '0_7_50_445', '3', '休闲运动包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('446', '50', '0_7_50_446', '3', '相机包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('447', '50', '0_7_50_447', '3', '腰包/胸包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('448', '50', '0_7_50_448', '3', '登山包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('449', '50', '0_7_50_449', '3', '旅行配件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('450', '50', '0_7_50_450', '3', '拉杆箱/拉杆包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('451', '50', '0_7_50_451', '3', '书包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('452', '51', '0_7_51_452', '3', '彩宝', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('453', '51', '0_7_51_453', '3', '时尚饰品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('454', '51', '0_7_51_454', '3', '铂金', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('455', '51', '0_7_51_455', '3', '钻石', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('456', '51', '0_7_51_456', '3', '天然木饰', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('457', '51', '0_7_51_457', '3', '翡翠玉石', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('458', '51', '0_7_51_458', '3', '珍珠', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('459', '51', '0_7_51_459', '3', '纯金K金饰品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('460', '51', '0_7_51_460', '3', '金银投资', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('461', '51', '0_7_51_461', '3', '银饰', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('462', '51', '0_7_51_462', '3', '水晶玛瑙', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('463', '52', '0_7_52_463', '3', '座钟挂钟', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('464', '52', '0_7_52_464', '3', '男表', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('465', '52', '0_7_52_465', '3', '女表', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('466', '52', '0_7_52_466', '3', '儿童表', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('467', '52', '0_7_52_467', '3', '智能手表', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('468', '53', '0_7_53_468', '3', '女靴', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('469', '53', '0_7_53_469', '3', '布鞋/绣花鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('470', '53', '0_7_53_470', '3', '鱼嘴鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('471', '53', '0_7_53_471', '3', '雪地靴', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('472', '53', '0_7_53_472', '3', '凉鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('473', '53', '0_7_53_473', '3', '雨鞋/雨靴', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('474', '53', '0_7_53_474', '3', '单鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('475', '53', '0_7_53_475', '3', '拖鞋/人字拖', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('476', '53', '0_7_53_476', '3', '鞋配件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('477', '53', '0_7_53_477', '3', '高跟鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('478', '53', '0_7_53_478', '3', '马丁靴', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('479', '53', '0_7_53_479', '3', '帆布鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('480', '53', '0_7_53_480', '3', '休闲鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('481', '53', '0_7_53_481', '3', '妈妈鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('482', '53', '0_7_53_482', '3', '踝靴', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('483', '53', '0_7_53_483', '3', '防水台', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('484', '53', '0_7_53_484', '3', '内增高', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('485', '53', '0_7_53_485', '3', '松糕鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('486', '53', '0_7_53_486', '3', '坡跟鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('487', '54', '0_7_54_487', '3', '增高鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('488', '54', '0_7_54_488', '3', '鞋配件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('489', '54', '0_7_54_489', '3', '拖鞋/人字拖', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('490', '54', '0_7_54_490', '3', '凉鞋/沙滩鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('491', '54', '0_7_54_491', '3', '休闲鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('492', '54', '0_7_54_492', '3', '雨鞋/雨靴', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('493', '54', '0_7_54_493', '3', '商务休闲鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('494', '54', '0_7_54_494', '3', '定制鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('495', '54', '0_7_54_495', '3', '正装鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('496', '54', '0_7_54_496', '3', '男靴', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('497', '54', '0_7_54_497', '3', '帆布鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('498', '54', '0_7_54_498', '3', '传统布鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('499', '54', '0_7_54_499', '3', '工装鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('500', '54', '0_7_54_500', '3', '功能鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('501', '55', '0_7_55_501', '3', '钥匙包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('502', '55', '0_7_55_502', '3', '单肩包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('503', '55', '0_7_55_503', '3', '手提包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('504', '55', '0_7_55_504', '3', '斜挎包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('505', '55', '0_7_55_505', '3', '双肩包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('506', '55', '0_7_55_506', '3', '钱包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('507', '55', '0_7_55_507', '3', '手拿包/晚宴包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('508', '55', '0_7_55_508', '3', '卡包/零钱包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('509', '56', '0_8_56_509', '3', '轮滑滑板', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('510', '56', '0_8_56_510', '3', '网球', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('511', '56', '0_8_56_511', '3', '高尔夫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('512', '56', '0_8_56_512', '3', '台球', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('513', '56', '0_8_56_513', '3', '乒乓球', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('514', '56', '0_8_56_514', '3', '排球', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('515', '56', '0_8_56_515', '3', '羽毛球', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('516', '56', '0_8_56_516', '3', '棋牌麻将', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('517', '56', '0_8_56_517', '3', '篮球', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('518', '56', '0_8_56_518', '3', '其它', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('519', '56', '0_8_56_519', '3', '足球', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('520', '57', '0_8_57_520', '3', '速干衣裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('521', '57', '0_8_57_521', '3', '功能内衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('522', '57', '0_8_57_522', '3', '溯溪鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('523', '57', '0_8_57_523', '3', '滑雪服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('524', '57', '0_8_57_524', '3', '军迷服饰', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('525', '57', '0_8_57_525', '3', '沙滩/凉拖', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('526', '57', '0_8_57_526', '3', '羽绒服/棉服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('527', '57', '0_8_57_527', '3', '登山鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('528', '57', '0_8_57_528', '3', '户外袜', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('529', '57', '0_8_57_529', '3', '休闲衣裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('530', '57', '0_8_57_530', '3', '徒步鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('531', '57', '0_8_57_531', '3', '抓绒衣裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('532', '57', '0_8_57_532', '3', '越野跑鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('533', '57', '0_8_57_533', '3', '软壳衣裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('534', '57', '0_8_57_534', '3', '休闲鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('535', '57', '0_8_57_535', '3', 'T恤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('536', '57', '0_8_57_536', '3', '雪地靴', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('537', '57', '0_8_57_537', '3', '冲锋衣裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('538', '57', '0_8_57_538', '3', '户外风衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('539', '57', '0_8_57_539', '3', '工装鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('540', '58', '0_8_58_540', '3', '野餐烧烤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('541', '58', '0_8_58_541', '3', '滑雪装备', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('542', '58', '0_8_58_542', '3', '便携桌椅床', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('543', '58', '0_8_58_543', '3', '极限户外', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('544', '58', '0_8_58_544', '3', '户外工具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('545', '58', '0_8_58_545', '3', '冲浪潜水', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('546', '58', '0_8_58_546', '3', '背包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('547', '58', '0_8_58_547', '3', '望远镜', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('548', '58', '0_8_58_548', '3', '户外配饰', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('549', '58', '0_8_58_549', '3', '帐篷/垫子', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('550', '58', '0_8_58_550', '3', '户外仪表', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('551', '58', '0_8_58_551', '3', '睡袋/吊床', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('552', '58', '0_8_58_552', '3', '旅游用品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('553', '58', '0_8_58_553', '3', '登山攀岩', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('554', '58', '0_8_58_554', '3', '军迷用品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('555', '58', '0_8_58_555', '3', '户外照明', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('556', '58', '0_8_58_556', '3', '救援装备', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('557', '59', '0_8_59_557', '3', '钓箱鱼包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('558', '59', '0_8_59_558', '3', '其它', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('559', '59', '0_8_59_559', '3', '鱼竿鱼线', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('560', '59', '0_8_59_560', '3', '浮漂鱼饵', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('561', '59', '0_8_59_561', '3', '钓鱼桌椅', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('562', '59', '0_8_59_562', '3', '钓鱼配件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('563', '60', '0_8_60_563', '3', '帆布鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('564', '60', '0_8_60_564', '3', '乒羽网鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('565', '60', '0_8_60_565', '3', '跑步鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('566', '60', '0_8_60_566', '3', '训练鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('567', '60', '0_8_60_567', '3', '休闲鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('568', '60', '0_8_60_568', '3', '专项运动鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('569', '60', '0_8_60_569', '3', '篮球鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('570', '60', '0_8_60_570', '3', '拖鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('571', '60', '0_8_60_571', '3', '板鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('572', '60', '0_8_60_572', '3', '运动包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('573', '60', '0_8_60_573', '3', '足球鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('574', '61', '0_8_61_574', '3', '其它', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('575', '61', '0_8_61_575', '3', '泳镜', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('576', '61', '0_8_61_576', '3', '泳帽', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('577', '61', '0_8_61_577', '3', '游泳包防水包', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('578', '61', '0_8_61_578', '3', '男士泳衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('579', '61', '0_8_61_579', '3', '女士泳衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('580', '61', '0_8_61_580', '3', '比基尼', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('581', '62', '0_8_62_581', '3', 'T恤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('582', '62', '0_8_62_582', '3', '棉服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('583', '62', '0_8_62_583', '3', '运动裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('584', '62', '0_8_62_584', '3', '夹克/风衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('585', '62', '0_8_62_585', '3', '运动配饰', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('586', '62', '0_8_62_586', '3', '运动背心', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('587', '62', '0_8_62_587', '3', '乒羽网服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('588', '62', '0_8_62_588', '3', '运动套装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('589', '62', '0_8_62_589', '3', '训练服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('590', '62', '0_8_62_590', '3', '羽绒服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('591', '62', '0_8_62_591', '3', '毛衫/线衫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('592', '62', '0_8_62_592', '3', '卫衣/套头衫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('593', '63', '0_8_63_593', '3', '瑜伽舞蹈', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('594', '63', '0_8_63_594', '3', '跑步机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('595', '63', '0_8_63_595', '3', '武术搏击', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('596', '63', '0_8_63_596', '3', '健身车/动感单车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('597', '63', '0_8_63_597', '3', '综合训练器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('598', '63', '0_8_63_598', '3', '哑铃', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('599', '63', '0_8_63_599', '3', '其他大型器械', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('600', '63', '0_8_63_600', '3', '仰卧板/收腹机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('601', '63', '0_8_63_601', '3', '其他中小型器材', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('602', '63', '0_8_63_602', '3', '甩脂机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('603', '63', '0_8_63_603', '3', '踏步机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('604', '63', '0_8_63_604', '3', '运动护具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('605', '64', '0_8_64_605', '3', '平衡车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('606', '64', '0_8_64_606', '3', '其他整车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('607', '64', '0_8_64_607', '3', '骑行装备', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('608', '64', '0_8_64_608', '3', '骑行服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('609', '64', '0_8_64_609', '3', '山地车/公路车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('610', '64', '0_8_64_610', '3', '折叠车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('611', '64', '0_8_64_611', '3', '电动车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('612', '65', '0_9_65_612', '3', '电源', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('613', '65', '0_9_65_613', '3', '导航仪', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('614', '65', '0_9_65_614', '3', '智能驾驶', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('615', '65', '0_9_65_615', '3', '安全预警仪', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('616', '65', '0_9_65_616', '3', '车载电台', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('617', '65', '0_9_65_617', '3', '行车记录仪', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('618', '65', '0_9_65_618', '3', '吸尘器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('619', '65', '0_9_65_619', '3', '倒车雷达', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('620', '65', '0_9_65_620', '3', '冰箱', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('621', '65', '0_9_65_621', '3', '蓝牙设备', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('622', '65', '0_9_65_622', '3', '时尚影音', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('623', '65', '0_9_65_623', '3', '净化器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('624', '66', '0_9_66_624', '3', '清洁剂', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('625', '66', '0_9_66_625', '3', '洗车工具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('626', '66', '0_9_66_626', '3', '洗车配件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('627', '66', '0_9_66_627', '3', '车蜡', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('628', '66', '0_9_66_628', '3', '补漆笔', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('629', '66', '0_9_66_629', '3', '玻璃水', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('630', '67', '0_9_67_630', '3', '香水', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('631', '67', '0_9_67_631', '3', '空气净化', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('632', '67', '0_9_67_632', '3', '车内饰品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('633', '67', '0_9_67_633', '3', '脚垫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('634', '67', '0_9_67_634', '3', '功能小件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('635', '67', '0_9_67_635', '3', '座垫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('636', '67', '0_9_67_636', '3', '车身装饰件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('637', '67', '0_9_67_637', '3', '座套', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('638', '67', '0_9_67_638', '3', '车衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('639', '67', '0_9_67_639', '3', '后备箱垫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('640', '67', '0_9_67_640', '3', '头枕腰靠', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('641', '68', '0_9_68_641', '3', '充气泵', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('642', '68', '0_9_68_642', '3', '防盗设备', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('643', '68', '0_9_68_643', '3', '应急救援', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('644', '68', '0_9_68_644', '3', '保温箱', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('645', '68', '0_9_68_645', '3', '储物箱', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('646', '68', '0_9_68_646', '3', '自驾野营', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('647', '68', '0_9_68_647', '3', '安全座椅', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('648', '68', '0_9_68_648', '3', '摩托车装备', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('649', '68', '0_9_68_649', '3', '胎压监测', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('650', '69', '0_9_69_650', '3', '功能升级服务', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('651', '69', '0_9_69_651', '3', '保养维修服务', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('652', '69', '0_9_69_652', '3', '清洗美容服务', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('653', '70', '0_9_70_653', '3', '跑车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('654', '70', '0_9_70_654', '3', '微型车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('655', '70', '0_9_70_655', '3', '小型车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('656', '70', '0_9_70_656', '3', '紧凑型车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('657', '70', '0_9_70_657', '3', '中型车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('658', '70', '0_9_70_658', '3', '中大型车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('659', '70', '0_9_70_659', '3', '豪华车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('660', '70', '0_9_70_660', '3', 'MPV', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('661', '70', '0_9_70_661', '3', 'SUV', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('662', '71', '0_9_71_662', '3', '上海大众', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('663', '71', '0_9_71_663', '3', '斯柯达', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('664', '71', '0_9_71_664', '3', '东风雪铁龙', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('665', '71', '0_9_71_665', '3', '一汽奔腾', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('666', '71', '0_9_71_666', '3', '北汽新能源', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('667', '71', '0_9_71_667', '3', '陆风', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('668', '71', '0_9_71_668', '3', '海马', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('669', '72', '0_9_72_669', '3', '润滑油', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('670', '72', '0_9_72_670', '3', '轮胎', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('671', '72', '0_9_72_671', '3', '改装配件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('672', '72', '0_9_72_672', '3', '添加剂', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('673', '72', '0_9_72_673', '3', '轮毂', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('674', '72', '0_9_72_674', '3', '防冻液', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('675', '72', '0_9_72_675', '3', '刹车片/盘', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('676', '72', '0_9_72_676', '3', '滤清器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('677', '72', '0_9_72_677', '3', '维修配件', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('678', '72', '0_9_72_678', '3', '火花塞', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('679', '72', '0_9_72_679', '3', '蓄电池', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('680', '72', '0_9_72_680', '3', '雨刷', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('681', '72', '0_9_72_681', '3', '底盘装甲/护板', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('682', '72', '0_9_72_682', '3', '车灯', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('683', '72', '0_9_72_683', '3', '贴膜', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('684', '72', '0_9_72_684', '3', '后视镜', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('685', '72', '0_9_72_685', '3', '汽修工具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('686', '73', '0_10_73_686', '3', '宝宝护肤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('687', '73', '0_10_73_687', '3', '宝宝洗浴', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('688', '73', '0_10_73_688', '3', '理发器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('689', '73', '0_10_73_689', '3', '洗衣液/皂', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('690', '73', '0_10_73_690', '3', '奶瓶清洗', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('691', '73', '0_10_73_691', '3', '日常护理', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('692', '73', '0_10_73_692', '3', '座便器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('693', '73', '0_10_73_693', '3', '驱蚊防蚊', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('694', '74', '0_10_74_694', '3', '奶瓶奶嘴', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('695', '74', '0_10_74_695', '3', '吸奶器', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('696', '74', '0_10_74_696', '3', '牙胶安抚', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('697', '74', '0_10_74_697', '3', '暖奶消毒', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('698', '74', '0_10_74_698', '3', '辅食料理机', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('699', '74', '0_10_74_699', '3', '碗盘叉勺', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('700', '74', '0_10_74_700', '3', '水壶/水杯', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('701', '75', '0_10_75_701', '3', '婴儿推车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('702', '75', '0_10_75_702', '3', '餐椅摇椅', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('703', '75', '0_10_75_703', '3', '学步车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('704', '75', '0_10_75_704', '3', '三轮车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('705', '75', '0_10_75_705', '3', '自行车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('706', '75', '0_10_75_706', '3', '扭扭车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('707', '75', '0_10_75_707', '3', '滑板车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('708', '75', '0_10_75_708', '3', '婴儿床', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('709', '75', '0_10_75_709', '3', '电动车', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('710', '76', '0_10_76_710', '3', '提篮式', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('711', '76', '0_10_76_711', '3', '安全座椅', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('712', '76', '0_10_76_712', '3', '增高垫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('713', '77', '0_10_77_713', '3', '安全防护', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('714', '77', '0_10_77_714', '3', '婴儿外出服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('715', '77', '0_10_77_715', '3', '婴儿内衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('716', '77', '0_10_77_716', '3', '婴儿礼盒', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('717', '77', '0_10_77_717', '3', '婴儿鞋帽袜', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('718', '77', '0_10_77_718', '3', '家居床品', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('719', '78', '0_10_78_719', '3', '婴幼奶粉', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('720', '78', '0_10_78_720', '3', '成人奶粉', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('721', '79', '0_10_79_721', '3', '待产/新生', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('722', '79', '0_10_79_722', '3', '孕妇装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('723', '79', '0_10_79_723', '3', '孕期营养', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('724', '79', '0_10_79_724', '3', '防辐射服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('725', '79', '0_10_79_725', '3', '妈咪包/背婴带', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('726', '79', '0_10_79_726', '3', '产后塑身', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('727', '79', '0_10_79_727', '3', '孕妈美容', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('728', '79', '0_10_79_728', '3', '文胸/内裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('729', '79', '0_10_79_729', '3', '月子装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('730', '80', '0_10_80_730', '3', '米粉/菜粉', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('731', '80', '0_10_80_731', '3', '果泥/果汁', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('732', '80', '0_10_80_732', '3', '面条/粥', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('733', '80', '0_10_80_733', '3', '宝宝零食', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('734', '80', '0_10_80_734', '3', 'DHA', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('735', '80', '0_10_80_735', '3', '钙铁锌/维生素', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('736', '80', '0_10_80_736', '3', '益生菌/初乳', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('737', '80', '0_10_80_737', '3', '清火/开胃', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('738', '81', '0_10_81_738', '3', '配饰', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('739', '81', '0_10_81_739', '3', '亲子装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('740', '81', '0_10_81_740', '3', '羽绒服/棉服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('741', '81', '0_10_81_741', '3', '套装', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('742', '81', '0_10_81_742', '3', '运动服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('743', '81', '0_10_81_743', '3', '上衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('744', '81', '0_10_81_744', '3', '靴子', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('745', '81', '0_10_81_745', '3', '运动鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('746', '81', '0_10_81_746', '3', '演出服', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('747', '81', '0_10_81_747', '3', '裙子', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('748', '81', '0_10_81_748', '3', '裤子', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('749', '81', '0_10_81_749', '3', '功能鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('750', '81', '0_10_81_750', '3', '内衣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('751', '81', '0_10_81_751', '3', '凉鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('752', '81', '0_10_81_752', '3', '皮鞋/帆布鞋', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('753', '82', '0_10_82_753', '3', '婴儿尿裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('754', '82', '0_10_82_754', '3', '拉拉裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('755', '82', '0_10_82_755', '3', '成人尿裤', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('756', '82', '0_10_82_756', '3', '湿巾', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('757', '83', '0_10_83_757', '3', '健身玩具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('758', '83', '0_10_83_758', '3', '适用年龄', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('759', '83', '0_10_83_759', '3', '娃娃玩具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('760', '83', '0_10_83_760', '3', '遥控/电动', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('761', '83', '0_10_83_761', '3', 'DIY玩具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('762', '83', '0_10_83_762', '3', '益智玩具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('763', '83', '0_10_83_763', '3', '创意减压', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('764', '83', '0_10_83_764', '3', '积木拼插', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('765', '83', '0_10_83_765', '3', '乐器相关', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('766', '83', '0_10_83_766', '3', '动漫玩具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('767', '83', '0_10_83_767', '3', '毛绒布艺', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('768', '83', '0_10_83_768', '3', '模型玩具', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('769', '84', '0_11_84_769', '3', '游戏', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('770', '84', '0_11_84_770', '3', '影视/动漫周边', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('771', '84', '0_11_84_771', '3', '音乐', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('772', '84', '0_11_84_772', '3', '影视', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('773', '84', '0_11_84_773', '3', '教育音像', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('774', '85', '0_11_85_774', '3', '港台图书', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('775', '85', '0_11_85_775', '3', '杂志/期刊', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('776', '85', '0_11_85_776', '3', '英文原版书', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('777', '86', '0_11_86_777', '3', '科普', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('778', '86', '0_11_86_778', '3', '幼儿启蒙', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('779', '86', '0_11_86_779', '3', '0-2岁', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('780', '86', '0_11_86_780', '3', '手工游戏', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('781', '86', '0_11_86_781', '3', '3-6岁', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('782', '86', '0_11_86_782', '3', '智力开发', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('783', '86', '0_11_86_783', '3', '7-10岁', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('784', '86', '0_11_86_784', '3', '11-14岁', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('785', '86', '0_11_86_785', '3', '儿童文学', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('786', '86', '0_11_86_786', '3', '绘本', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('787', '87', '0_11_87_787', '3', '外文原版', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('788', '87', '0_11_87_788', '3', '畅读VIP', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('789', '87', '0_11_87_789', '3', '免费', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('790', '87', '0_11_87_790', '3', '小说', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('791', '87', '0_11_87_791', '3', '励志与成功', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('792', '87', '0_11_87_792', '3', '经济金融', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('793', '87', '0_11_87_793', '3', '文学', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('794', '87', '0_11_87_794', '3', '社科', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('795', '87', '0_11_87_795', '3', '婚恋两性', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('796', '88', '0_11_88_796', '3', '字典词典', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('797', '88', '0_11_88_797', '3', '教材', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('798', '88', '0_11_88_798', '3', '中小学教辅', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('799', '88', '0_11_88_799', '3', '考试', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('800', '88', '0_11_88_800', '3', '外语学习', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('801', '89', '0_11_89_801', '3', '通俗流行', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('802', '89', '0_11_89_802', '3', '古典音乐', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('803', '89', '0_11_89_803', '3', '摇滚说唱', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('804', '89', '0_11_89_804', '3', '爵士蓝调', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('805', '89', '0_11_89_805', '3', '乡村民谣', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('806', '89', '0_11_89_806', '3', '有声读物', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('807', '90', '0_11_90_807', '3', '小说', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('808', '90', '0_11_90_808', '3', '文学', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('809', '90', '0_11_90_809', '3', '青春文学', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('810', '90', '0_11_90_810', '3', '传记', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('811', '90', '0_11_90_811', '3', '动漫', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('812', '90', '0_11_90_812', '3', '艺术', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('813', '90', '0_11_90_813', '3', '摄影', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('814', '91', '0_11_91_814', '3', '管理', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('815', '91', '0_11_91_815', '3', '金融与投资', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('816', '91', '0_11_91_816', '3', '经济', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('817', '91', '0_11_91_817', '3', '励志与成功', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('818', '92', '0_11_92_818', '3', '哲学/宗教', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('819', '92', '0_11_92_819', '3', '社会科学', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('820', '92', '0_11_92_820', '3', '法律', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('821', '92', '0_11_92_821', '3', '文化', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('822', '92', '0_11_92_822', '3', '历史', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('823', '92', '0_11_92_823', '3', '心理学', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('824', '92', '0_11_92_824', '3', '政治/军事', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('825', '92', '0_11_92_825', '3', '国学/古籍', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('826', '93', '0_11_93_826', '3', '美食', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('827', '93', '0_11_93_827', '3', '时尚美妆', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('828', '93', '0_11_93_828', '3', '家居', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('829', '93', '0_11_93_829', '3', '手工DIY', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('830', '93', '0_11_93_830', '3', '家教与育儿', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('831', '93', '0_11_93_831', '3', '两性', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('832', '93', '0_11_93_832', '3', '孕产', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('833', '93', '0_11_93_833', '3', '体育', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('834', '93', '0_11_93_834', '3', '健身保健', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('835', '93', '0_11_93_835', '3', '旅游/地图', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('836', '94', '0_11_94_836', '3', '建筑', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('837', '94', '0_11_94_837', '3', '工业技术', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('838', '94', '0_11_94_838', '3', '电子/通信', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('839', '94', '0_11_94_839', '3', '医学', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('840', '94', '0_11_94_840', '3', '科学与自然', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('841', '94', '0_11_94_841', '3', '农林', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('842', '94', '0_11_94_842', '3', '计算机与互联网', null, '100', null, '1');
INSERT INTO `loly_goods_category` VALUES ('843', '94', '0_11_94_843', '3', '科普', null, '100', null, '1');

-- ----------------------------
-- Table structure for `loly_user`
-- ----------------------------
DROP TABLE IF EXISTS `loly_user`;
CREATE TABLE `loly_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_rid` int(10) NOT NULL DEFAULT '0',
  `u_openid` varchar(50) NOT NULL,
  `u_enable` tinyint(1) DEFAULT '0',
  `u_name` varchar(255) NOT NULL,
  `u_psw` varchar(255) DEFAULT NULL,
  `u_picture` varchar(300) DEFAULT '',
  `u_cash` int(11) DEFAULT '0',
  `u_point` int(11) DEFAULT '0',
  `u_level` int(11) NOT NULL DEFAULT '1',
  `u_tname` varchar(255) DEFAULT NULL,
  `u_email` varchar(255) DEFAULT NULL,
  `u_mobile` varchar(11) NOT NULL,
  `u_question` varchar(255) DEFAULT NULL,
  `u_answer` varchar(255) DEFAULT NULL,
  `u_date` int(10) DEFAULT NULL,
  `u_code` varchar(255) DEFAULT '',
  `last_login` int(10) DEFAULT NULL,
  `u_isadmin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`u_name`,`u_level`,`u_isadmin`,`u_mobile`,`u_rid`,`u_openid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loly_user
-- ----------------------------
INSERT INTO `loly_user` VALUES ('1', '1', '', '1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '0', '0', '0', 'admin', '', '123456789', '', '', '0', '', '0', '1');
INSERT INTO `loly_user` VALUES ('3', '0', 'o9m4B0b3kgTiEMeOoO-5cOltfYoQ', '0', '石榴木', null, '', '0', '0', '1', '石榴木', null, '13783901186', null, null, null, '', null, '0');

-- ----------------------------
-- Table structure for `loly_user_address`
-- ----------------------------
DROP TABLE IF EXISTS `loly_user_address`;
CREATE TABLE `loly_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `ua_active` tinyint(1) DEFAULT '0',
  `ua_location` varchar(500) DEFAULT NULL,
  `ua_province` varchar(255) DEFAULT NULL,
  `ua_city` varchar(255) DEFAULT NULL,
  `ua_district` varchar(255) DEFAULT NULL,
  `ua_addr` varchar(500) DEFAULT NULL,
  `ua_post` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`u_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loly_user_address
-- ----------------------------
INSERT INTO `loly_user_address` VALUES ('7', '1', '0', '河南省开封市宋城路80号B座506', null, null, null, null, null);
INSERT INTO `loly_user_address` VALUES ('8', '3', '0', '河南省开封市宋城路80号长城雅苑B座506', null, null, null, null, null);

-- ----------------------------
-- Table structure for `loly_user_level`
-- ----------------------------
DROP TABLE IF EXISTS `loly_user_level`;
CREATE TABLE `loly_user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ul_name` varchar(255) NOT NULL,
  `ul_content` varchar(255) NOT NULL,
  `ul_point` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loly_user_level
-- ----------------------------
INSERT INTO `loly_user_level` VALUES ('1', '普通会员', '普通会员', '0');
INSERT INTO `loly_user_level` VALUES ('2', '高级会员', '高级会员', '0');
INSERT INTO `loly_user_level` VALUES ('3', '贵宾会员', '贵宾会员', '0');

-- ----------------------------
-- Table structure for `loly_user_session`
-- ----------------------------
DROP TABLE IF EXISTS `loly_user_session`;
CREATE TABLE `loly_user_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(30) NOT NULL,
  `u_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`session_id`,`u_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loly_user_session
-- ----------------------------
INSERT INTO `loly_user_session` VALUES ('1', 'kvpn92dll0r70t8fv4n9akkh74', '1');
