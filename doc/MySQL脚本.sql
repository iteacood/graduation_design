/*
 Navicat Premium Data Transfer

 Source Server         : 172.16.30.55
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : 172.16.30.55:3306
 Source Schema         : graduation_design

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : 65001

 Date: 25/09/2018 18:27:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_category_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_category_info`;
CREATE TABLE `tb_category_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `code` varchar(2) NOT NULL COMMENT '分类标识',
  `name` varchar(20) NOT NULL COMMENT '分类名称',
  `status` varchar(10) NOT NULL DEFAULT '0' COMMENT '状态：active-有效、inactive-无效',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`,`code`),
  UNIQUE KEY `category_index` (`code`,`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='商品分类信息';

-- ----------------------------
-- Records of tb_category_info
-- ----------------------------
BEGIN;
INSERT INTO `tb_category_info` VALUES (1, '01', '手机', '0', '2018-09-18 16:14:24', '2018-09-18 16:14:28');
INSERT INTO `tb_category_info` VALUES (2, '02', '家用电器', '0', '2018-09-18 16:15:30', '2018-09-18 16:15:34');
INSERT INTO `tb_category_info` VALUES (3, '03', '数码', '0', '2018-09-18 16:16:02', '2018-09-18 16:15:55');
INSERT INTO `tb_category_info` VALUES (4, '04', '家居家装', '0', '2018-09-18 16:16:13', '2018-09-18 16:16:17');
INSERT INTO `tb_category_info` VALUES (5, '05', '电脑办公', '0', '2018-09-18 16:16:35', '2018-09-18 16:16:39');
INSERT INTO `tb_category_info` VALUES (6, '06', '礼品箱包', '0', '2018-09-18 16:17:01', '2018-09-18 16:17:03');
INSERT INTO `tb_category_info` VALUES (7, '07', '食品饮料', '0', '2018-09-18 16:17:23', '2018-09-18 16:17:26');
INSERT INTO `tb_category_info` VALUES (8, '08', '汽车用品', '0', '2018-09-18 16:17:52', '2018-09-18 16:17:56');
INSERT INTO `tb_category_info` VALUES (9, '09', '服装鞋靴', '0', '2018-09-18 16:18:19', '2018-09-18 16:18:24');
INSERT INTO `tb_category_info` VALUES (10, '10', '玩具乐器', '0', '2018-09-18 16:18:43', '2018-09-18 16:18:45');
COMMIT;

-- ----------------------------
-- Table structure for tb_menu_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu_info`;
CREATE TABLE `tb_menu_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `menu_name` varchar(20) NOT NULL COMMENT '菜单名称',
  `icon` varchar(40) NOT NULL COMMENT '图标',
  `url` varchar(50) NOT NULL COMMENT '连接地址',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '状态：0-有效、1-无效',
  `sort` int(2) NOT NULL COMMENT '顺序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_index` (`id`,`menu_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of tb_menu_info
-- ----------------------------
BEGIN;
INSERT INTO `tb_menu_info` VALUES (2, '商品分类', 'layui-icon layui-icon-app', 'category/item', 0, 1, '2018-09-19 15:54:36', '2018-09-19 15:54:40');
INSERT INTO `tb_menu_info` VALUES (3, '商品库存', 'layui-icon layui-icon-template-1', 'goods/stock', 0, 2, '2018-09-19 15:56:26', '2018-09-19 15:56:30');
INSERT INTO `tb_menu_info` VALUES (4, '商品订单', 'layui-icon layui-icon-component', 'goods/sold', 0, 3, '2018-09-19 15:57:17', '2018-09-19 15:57:21');
INSERT INTO `tb_menu_info` VALUES (5, '商品进货', 'layui-icon layui-icon-note', 'goods/purchase', 0, 4, '2018-09-19 15:59:11', '2018-09-19 15:59:15');
INSERT INTO `tb_menu_info` VALUES (6, '销售报表', 'layui-icon layui-icon-chart', 'chart/report', 0, 5, '2018-09-19 15:59:44', '2018-09-19 15:59:48');
INSERT INTO `tb_menu_info` VALUES (7, '基本信息', 'layui-icon layui-icon-username', 'user/info', 0, 6, '2018-09-19 16:00:13', '2018-09-19 16:00:17');
COMMIT;

-- ----------------------------
-- Table structure for tb_order_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_info`;
CREATE TABLE `tb_order_info` (
  `id` int(11) NOT NULL COMMENT '序号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品订单详情';

-- ----------------------------
-- Table structure for tb_purchase_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_purchase_info`;
CREATE TABLE `tb_purchase_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `category` varchar(2) NOT NULL COMMENT '分类标识',
  `name` varchar(20) NOT NULL COMMENT '分类名称',
  `status` varchar(10) NOT NULL DEFAULT '0' COMMENT '状态：active-有效、inactive-无效',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`,`category`),
  UNIQUE KEY `category_index` (`category`,`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='商品进货详情';

-- ----------------------------
-- Table structure for tb_stock_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_stock_info`;
CREATE TABLE `tb_stock_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `category` varchar(2) NOT NULL COMMENT '分类标识',
  `name` varchar(20) NOT NULL COMMENT '分类名称',
  `status` varchar(10) NOT NULL DEFAULT '0' COMMENT '状态：active-有效、inactive-无效',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`,`category`),
  UNIQUE KEY `category_index` (`category`,`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='商品库存信息';

-- ----------------------------
-- Table structure for tb_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_info`;
CREATE TABLE `tb_user_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `account` varchar(10) CHARACTER SET latin1 NOT NULL COMMENT '账号',
  `username` varchar(20) NOT NULL COMMENT '姓名',
  `gender` tinyint(1) NOT NULL COMMENT '性别：0-女、1-男、2-未知性别',
  `birthday` varchar(12) NOT NULL COMMENT '出生日期',
  `telephone` varchar(11) NOT NULL COMMENT '联系电话',
  `email` varchar(30) NOT NULL COMMENT '电子邮箱',
  `address` varchar(50) NOT NULL COMMENT '家庭住址',
  `postcode` varchar(6) NOT NULL COMMENT '邮政编码',
  `password` varchar(20) NOT NULL COMMENT '密码',
  `header` varchar(50) DEFAULT NULL COMMENT '头像地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`,`account`) USING BTREE,
  UNIQUE KEY `account_username_index` (`account`,`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户基本资料';

-- ----------------------------
-- Records of tb_user_info
-- ----------------------------
BEGIN;
INSERT INTO `tb_user_info` VALUES (1, 'admin001', '李伦', 1, '1989-09-09', '13923265421', 'lilun@gmail.com', '四川省康定市', '236236', '123456', NULL, '2018-09-18 15:56:27', '2018-09-18 15:56:32');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
