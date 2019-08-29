/*
Navicat MySQL Data Transfer

Source Server         : local_yinhan
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : tn_yinhan

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-08-29 17:17:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_button`
-- ----------------------------
DROP TABLE IF EXISTS `sys_button`;
CREATE TABLE `sys_button` (
  `button_id` int(5) NOT NULL DEFAULT '10001' COMMENT '按钮ID',
  `button_name` varchar(10) NOT NULL DEFAULT '' COMMENT '按钮名字',
  `button_desc` varchar(50) DEFAULT '' COMMENT '按钮描述',
  PRIMARY KEY (`button_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单按钮表';

-- ----------------------------
-- Records of sys_button
-- ----------------------------
INSERT INTO `sys_button` VALUES ('1', '查询', '查询按钮');
INSERT INTO `sys_button` VALUES ('2', '新增', '新增按钮');
INSERT INTO `sys_button` VALUES ('3', '修改', '修改按钮');
INSERT INTO `sys_button` VALUES ('4', '删除', '删除按钮');
INSERT INTO `sys_button` VALUES ('5', '审核', '审核按钮');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '菜单ID（自增主键）',
  `menu_name` varchar(30) NOT NULL DEFAULT '' COMMENT '菜单名字',
  `menu_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '菜单级别(1-一级菜单，2-二级菜单)',
  `parent_id` int(5) NOT NULL DEFAULT '0' COMMENT '父级菜单ID（0-无父级，其他-父级菜单）',
  `menu_url` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单路径',
  `menu_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单状态（0-未生效，1-生效）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `uni_menu_name` (`menu_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20003 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('10000', '系统管理', '1', '0', '', '0', '2019-07-19 09:44:11', '0000-00-00 00:00:00');
INSERT INTO `sys_menu` VALUES ('10001', '用户管理', '2', '10000', '/user/queryUserPageList', '0', '2019-07-19 09:48:50', '0000-00-00 00:00:00');
INSERT INTO `sys_menu` VALUES ('10002', '菜单管理', '2', '10000', '/menu/queryPageList', '0', '2019-07-19 09:48:45', '0000-00-00 00:00:00');
INSERT INTO `sys_menu` VALUES ('10003', '角色管理', '2', '10000', '/role/queryPageList', '0', '2019-07-19 09:47:25', '0000-00-00 00:00:00');
INSERT INTO `sys_menu` VALUES ('20000', '客户管理', '1', '0', '', '0', '2019-07-19 09:44:56', '0000-00-00 00:00:00');
INSERT INTO `sys_menu` VALUES ('20001', '黑名单管理', '2', '20000', '', '0', '2019-07-19 09:46:41', '0000-00-00 00:00:00');
INSERT INTO `sys_menu` VALUES ('20002', '白名单管理', '2', '20000', '', '0', '2019-07-19 09:46:02', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_desc` varchar(100) NOT NULL DEFAULT '' COMMENT '角色描述',
  `role_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '角色状态（0-未生效，1-生效）',
  `role_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '角色类型（0-系统角色，1-用户角色）',
  `create_user` varchar(30) NOT NULL DEFAULT '' COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_user` varchar(30) NOT NULL DEFAULT '' COMMENT '修改人',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `uni_role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('101', '管理员', '系统管理员', '0', '0', '', '0000-00-00 00:00:00', '', '2019-08-28 16:51:39');
INSERT INTO `sys_role` VALUES ('102', '普通用户', '系统普通用户', '0', '0', '', '0000-00-00 00:00:00', '', '2019-08-28 16:37:55');
INSERT INTO `sys_role` VALUES ('106', '123', '435', '0', '1', 'yh', '2019-08-28 17:06:02', 'yh', '2019-08-28 17:06:02');

-- ----------------------------
-- Table structure for `sys_role_detail`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_detail`;
CREATE TABLE `sys_role_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `first_menu_id` int(10) NOT NULL COMMENT '一级菜单ID',
  `first_menu_name` varchar(20) NOT NULL COMMENT '一级菜单名字',
  `sceond_menu_id` int(10) NOT NULL COMMENT '二级菜单',
  `sceond_menu_name` varchar(20) NOT NULL COMMENT '二级菜单名字',
  `button_id` int(10) NOT NULL COMMENT '按钮ID',
  `button_name` varchar(20) NOT NULL COMMENT '按钮名字',
  `button_alias` varchar(30) NOT NULL COMMENT '按钮别名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_button_alias` (`button_alias`) USING BTREE,
  KEY `first_menu_id` (`first_menu_id`) USING BTREE,
  KEY `sceond_menu_id` (`sceond_menu_id`) USING BTREE,
  KEY `button_id` (`button_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='角色详情模板表';

-- ----------------------------
-- Records of sys_role_detail
-- ----------------------------
INSERT INTO `sys_role_detail` VALUES ('1', '10000', '系统管理', '10001', '用户管理', '1', '查询', '10000-10001-1');
INSERT INTO `sys_role_detail` VALUES ('2', '10000', '系统管理', '10001', '用户管理', '2', '新增', '10000-10001-2');
INSERT INTO `sys_role_detail` VALUES ('3', '10000', '系统管理', '10001', '用户管理', '3', '修改', '10000-10001-3');
INSERT INTO `sys_role_detail` VALUES ('4', '10000', '系统管理', '10001', '用户管理', '4', '删除', '10000-10001-4');
INSERT INTO `sys_role_detail` VALUES ('5', '10000', '系统管理', '10002', '菜单管理', '1', '查询', '10000-10002-1');
INSERT INTO `sys_role_detail` VALUES ('6', '10000', '系统管理', '10002', '菜单管理', '2', '新增', '10000-10002-2');
INSERT INTO `sys_role_detail` VALUES ('7', '10000', '系统管理', '10002', '菜单管理', '3', '修改', '10000-10002-3');
INSERT INTO `sys_role_detail` VALUES ('8', '10000', '系统管理', '10002', '菜单管理', '4', '删除', '10000-10002-4');
INSERT INTO `sys_role_detail` VALUES ('9', '10000', '系统管理', '10003', '角色管理', '1', '查询', '10000-10003-1');
INSERT INTO `sys_role_detail` VALUES ('10', '10000', '系统管理', '10003', '角色管理', '2', '新增', '10000-10003-2');
INSERT INTO `sys_role_detail` VALUES ('11', '10000', '系统管理', '10003', '角色管理', '3', '维护', '10000-10003-3');
INSERT INTO `sys_role_detail` VALUES ('12', '10000', '系统管理', '10003', '角色管理', '4', '删除', '10000-10003-4');
INSERT INTO `sys_role_detail` VALUES ('13', '20000', '客户管理', '20001', '黑名单管理', '1', '查询', '20000-20001-1');
INSERT INTO `sys_role_detail` VALUES ('14', '20000', '客户管理', '20001', '黑名单管理', '2', '新增', '20000-20001-2');
INSERT INTO `sys_role_detail` VALUES ('15', '20000', '客户管理', '20001', '黑名单管理', '3', '修改', '20000-20001-3');
INSERT INTO `sys_role_detail` VALUES ('16', '20000', '客户管理', '20001', '黑名单管理', '4', '删除', '20000-20001-4');
INSERT INTO `sys_role_detail` VALUES ('17', '20000', '客户管理', '20002', '白名单管理', '1', '查询', '20000-20002-1');
INSERT INTO `sys_role_detail` VALUES ('18', '20000', '客户管理', '20002', '白名单管理', '2', '新增', '20000-20002-2');
INSERT INTO `sys_role_detail` VALUES ('22', '20000', '客户管理', '20002', '白名单管理', '3', '修改', '20000-20002-3');
INSERT INTO `sys_role_detail` VALUES ('23', '20000', '客户管理', '20002', '白名单管理', '5', '审核', '20000-20002-5');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(5) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `menu_id` int(5) NOT NULL DEFAULT '0' COMMENT '菜单ID',
  `button_id` int(5) NOT NULL DEFAULT '0' COMMENT '页面按钮ID',
  PRIMARY KEY (`role_id`,`menu_id`,`button_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('101', '10001', '1');
INSERT INTO `sys_role_menu` VALUES ('101', '10001', '2');
INSERT INTO `sys_role_menu` VALUES ('101', '10001', '3');
INSERT INTO `sys_role_menu` VALUES ('101', '10001', '4');
INSERT INTO `sys_role_menu` VALUES ('101', '10002', '1');
INSERT INTO `sys_role_menu` VALUES ('101', '10002', '2');
INSERT INTO `sys_role_menu` VALUES ('101', '10002', '3');
INSERT INTO `sys_role_menu` VALUES ('101', '10002', '4');
INSERT INTO `sys_role_menu` VALUES ('101', '10003', '1');
INSERT INTO `sys_role_menu` VALUES ('101', '10003', '2');
INSERT INTO `sys_role_menu` VALUES ('101', '10003', '3');
INSERT INTO `sys_role_menu` VALUES ('101', '10003', '4');
INSERT INTO `sys_role_menu` VALUES ('101', '20001', '1');
INSERT INTO `sys_role_menu` VALUES ('101', '20002', '1');
INSERT INTO `sys_role_menu` VALUES ('101', '20002', '2');
INSERT INTO `sys_role_menu` VALUES ('101', '20002', '3');
INSERT INTO `sys_role_menu` VALUES ('101', '20002', '5');
INSERT INTO `sys_role_menu` VALUES ('102', '10001', '1');
INSERT INTO `sys_role_menu` VALUES ('102', '10001', '2');
INSERT INTO `sys_role_menu` VALUES ('102', '10002', '1');
INSERT INTO `sys_role_menu` VALUES ('102', '10002', '2');
INSERT INTO `sys_role_menu` VALUES ('102', '10003', '1');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` char(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '主键（UUID）',
  `username` varchar(100) NOT NULL COMMENT '用户名（唯一）',
  `password` varchar(50) NOT NULL DEFAULT '123456' COMMENT '密码',
  `sex` tinyint(1) DEFAULT '0' COMMENT '性别（0-男，1-女）',
  `age` int(3) DEFAULT '0' COMMENT '年龄',
  `phone` char(11) DEFAULT '' COMMENT '电话',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `address` varchar(100) DEFAULT '' COMMENT '地址',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `last_login_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一次登录时间',
  `login_num` int(1) DEFAULT '0' COMMENT '本次尝试登录次数',
  `is_lock` tinyint(1) DEFAULT '0' COMMENT '是否锁定（0-未锁定，1-锁定）',
  `user_status` tinyint(1) DEFAULT '0' COMMENT '是否生效（0-未生效，1-生效）',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uni_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'yh123', '123456', '0', '0', '', '', '', '2019-05-08 13:49:07', '0000-00-00 00:00:00', '2019-08-28 17:27:27', '0', '0', '0');
INSERT INTO `sys_user` VALUES ('2', 'yh', '123456', '0', '0', '', '', '', '2019-05-08 13:51:00', '0000-00-00 00:00:00', '2019-08-28 17:18:46', '0', '0', '0');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户Id',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色Id',
  `create_user` varchar(255) DEFAULT '' COMMENT '创建人',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_user` varchar(255) DEFAULT '' COMMENT '修改人',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '102', '', null, '', null);
INSERT INTO `sys_user_role` VALUES ('2', '101', '', null, '', null);
