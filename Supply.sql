/*
 Navicat Premium Data Transfer

 Source Server         : universitydb
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : Supply

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 13/07/2020 16:57:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `good_id` varchar(20) NOT NULL,
  `good_name` varchar(10) NOT NULL,
  `good_type` varchar(10) NOT NULL,
  PRIMARY KEY (`good_id`),
  KEY `good_id` (`good_id`,`good_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for Order
-- ----------------------------
DROP TABLE IF EXISTS `Order`;
CREATE TABLE `Order` (
  `sup_id` varchar(20) NOT NULL,
  `sup_name` varchar(10) NOT NULL,
  `User_mail` varchar(20) NOT NULL,
  `User_name` varchar(10) DEFAULT NULL,
  `good_id` varchar(20) NOT NULL,
  `good_name` varchar(10) NOT NULL,
  PRIMARY KEY (`good_id`,`User_mail`),
  KEY `in_sup` (`sup_id`,`sup_name`),
  KEY `in_user` (`User_mail`,`User_name`),
  KEY `in_good` (`good_id`,`good_name`),
  CONSTRAINT `in_good` FOREIGN KEY (`good_id`, `good_name`) REFERENCES `goods` (`good_id`, `good_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `in_sup` FOREIGN KEY (`sup_id`, `sup_name`) REFERENCES `supplier` (`sup_id`, `sup_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `in_user` FOREIGN KEY (`User_mail`, `User_name`) REFERENCES `user` (`User_mail`, `User_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for Own
-- ----------------------------
DROP TABLE IF EXISTS `Own`;
CREATE TABLE `Own` (
  `sup_id` varchar(20) NOT NULL,
  `sup_name` varchar(10) NOT NULL,
  `User_mail` varchar(20) NOT NULL,
  `User_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`User_mail`,`sup_id`),
  KEY `in_Users` (`User_mail`,`User_name`),
  KEY `in_Sups` (`sup_id`,`sup_name`),
  CONSTRAINT `in_Sups` FOREIGN KEY (`sup_id`, `sup_name`) REFERENCES `supplier` (`sup_id`, `sup_name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `in_Users` FOREIGN KEY (`User_mail`, `User_name`) REFERENCES `user` (`User_mail`, `User_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `sup_id` varchar(20) NOT NULL,
  `sup_name` varchar(10) NOT NULL,
  `sup_address` varchar(10) NOT NULL,
  `sup_type` varchar(10) NOT NULL,
  PRIMARY KEY (`sup_id`),
  KEY `sup_id` (`sup_id`,`sup_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `User_mail` varchar(20) NOT NULL,
  `User_pwd` varchar(20) DEFAULT NULL,
  `User_name` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `cookie` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`User_mail`),
  KEY `User_mail` (`User_mail`,`User_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;
