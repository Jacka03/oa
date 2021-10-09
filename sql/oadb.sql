  /*
  Navicat Premium Data Transfer

  Source Server         : aliyun
  Source Server Type    : MySQL
  Source Server Version : 50735
  Source Host           : localhost:3306
  Source Schema         : oadb

  Target Server Type    : MySQL
  Target Server Version : 50735
  File Encoding         : 65001

  Date: 09/10/2021 16:12:45
  */

  SET NAMES utf8mb4;
  SET FOREIGN_KEY_CHECKS = 0;

  -- ----------------------------
  -- Table structure for announcement_inf
  -- ----------------------------
  DROP TABLE IF EXISTS `announcement_inf`;
  CREATE TABLE `announcement_inf`  (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    `uid` int(11) NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `uid`(`uid`) USING BTREE,
    CONSTRAINT `announcement_inf` FOREIGN KEY (`uid`) REFERENCES `user_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
  ) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

  -- ----------------------------
  -- Records of announcement_inf
  -- ----------------------------
  BEGIN;
  INSERT INTO `announcement_inf` VALUES (1, '居民住宅停电通知', '2021-06-03到06-05停电', '2021-06-09 09:17:50', 1), (2, '缴纳社保金', '缴纳2020年的社保金', '2021-06-03 15:19:38', 1), (4, '停水', '明后天停水通知', '2021-06-03 16:52:39', 1), (6, '公告', '测试公告', '2021-06-10 09:13:25', 1), (8, 'test', 'test', '2021-06-10 14:56:52', 1);
  COMMIT;

  -- ----------------------------
  -- Table structure for dept_inf
  -- ----------------------------
  DROP TABLE IF EXISTS `dept_inf`;
  CREATE TABLE `dept_inf`  (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

  -- ----------------------------
  -- Records of dept_inf
  -- ----------------------------
  BEGIN;
  INSERT INTO `dept_inf` VALUES (1, '技术', '技术部不搞技术'), (2, '运营部', '运营部'), (3, '财务部', '财务部'), (5, '总公办', '总公办'), (6, '市场部', '市场部'), (7, '教研部', '教学研发'), (9, '销售部', '商品销售'), (11, '会员部', '会员部'), (12, '会员部', '会员');
  COMMIT;

  -- ----------------------------
  -- Table structure for document_inf
  -- ----------------------------
  DROP TABLE IF EXISTS `document_inf`;
  CREATE TABLE `document_inf`  (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `filename` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `uploader` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `FK_DOCUMENT_USER`(`uploader`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

  -- ----------------------------
  -- Records of document_inf
  -- ----------------------------
  BEGIN;
  COMMIT;

  -- ----------------------------
  -- Table structure for employee_inf
  -- ----------------------------
  DROP TABLE IF EXISTS `employee_inf`;
  CREATE TABLE `employee_inf`  (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `dept_id` int(11) NOT NULL,
    `job_id` int(11) NOT NULL,
    `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `card_id` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `sex` int(11) NOT NULL DEFAULT 1,
    `party` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `race` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `education` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `imgname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `FK_EMP_DEPT`(`dept_id`) USING BTREE,
    INDEX `FK_EMP_JOB`(`job_id`) USING BTREE,
    CONSTRAINT `FK_EMP_DEPT` FOREIGN KEY (`dept_id`) REFERENCES `dept_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `FK_EMP_JOB` FOREIGN KEY (`job_id`) REFERENCES `job_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
  ) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

  -- ----------------------------
  -- Records of employee_inf
  -- ----------------------------
  BEGIN;
  INSERT INTO `employee_inf` VALUES (1, '1100', 2, 5, '爱丽丝0', '1100', '1100', '425887@qq.com0', 2, '团员0', '汉0', '博士0', '2016-03-14 11:35:18', ''), (2, '1234', 2, 1, '杰克', '22623', '4247242', '251425887@qq.com', 2, '团员', '苗', '专科', '2016-03-14 11:35:18', NULL), (3, '123456', 1, 2, 'bb', '432801197711251038', '13907351532', '36750064@qq.com', 1, '党员', '汉', '本科', '2016-07-14 09:54:52', NULL), (6, '123', 6, 7, '123', '123', '123', '132', 2, NULL, NULL, NULL, '2021-10-09 14:19:43', 'へちま.jpg'), (8, '1341', 9, 8, '134', '1341', '134', '134', 2, '134', '134', '134', '2021-10-09 14:23:36', '');
  COMMIT;

  -- ----------------------------
  -- Table structure for job_inf
  -- ----------------------------
  DROP TABLE IF EXISTS `job_inf`;
  CREATE TABLE `job_inf`  (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

  -- ----------------------------
  -- Records of job_inf
  -- ----------------------------
  BEGIN;
  INSERT INTO `job_inf` VALUES (1, 'c++', '正规职员'), (2, 'Java开发工程师', 'Java开发工程师'), (3, 'Java中级开发工程师', 'Java中级开发工程师'), (4, 'Java高级开发工程师', 'Java高级开发工程师'), (5, '系统管理员', '系统管理员'), (6, '架构师', '架构师'), (7, '主管', '主管'), (8, '经理', '经理'), (9, '总经理', '总经理'), (10, 'c++', 'C++');
  COMMIT;

  -- ----------------------------
  -- Table structure for user_inf
  -- ----------------------------
  DROP TABLE IF EXISTS `user_inf`;
  CREATE TABLE `user_inf`  (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `loginname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `status` int(11) NOT NULL DEFAULT 1,
    `create_date` timestamp(8) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `imgname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

  -- ----------------------------
  -- Records of user_inf
  -- ----------------------------
  BEGIN;
  INSERT INTO `user_inf` VALUES (1, 'admin', '123456', 1, '2016-03-12 09:34:28', '超级管理', 'ui-sherman.jpg'), (2, 'gec', '123456', 1, '2018-04-09 07:04:03', 'admin', 'photo.jpg'), (3, 'dfdssd', '123', 1, '2018-12-09 07:09:20', 'sdfdsf', 'ui-zac.jpg'), (4, 'tom', '123', 1, '2020-11-06 11:09:55', 'Tomcat', 'ui-zac.jpg'), (5, 'jin', '123', 0, '2021-05-13 11:25:29', 'jin', 'ui-zac.jpg'), (6, 'jerry', '123', 0, '2021-05-17 17:10:35', 'jerry', 'ui-sherman.jpg'), (7, 'gong', '123', 1, '2021-06-02 08:25:37', 'gong', 'ui-sherman.jpg'), (8, 'test', '123', 0, '2021-06-02 14:41:22', 'test', '0065WLNEly1gquc84qksuj31jk26k4pa.jpg'), (15, 'sdfsdf', 'sdfdsf', 1, '2021-06-15 09:07:59', 'sdfds', 'product.png'), (17, 'q', 'q', 1, '2021-10-07 21:22:23', 'q', 'photo_2021-08-04_18-16-27.jpg'), (18, 'jacka', 'jacka', 1, '2021-10-07 21:57:25', 'jacka', 'photo_2021-08-04_18-16-04.jpg');
  COMMIT;

  SET FOREIGN_KEY_CHECKS = 1;
