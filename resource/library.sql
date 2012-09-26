/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50513
Source Host           : localhost:3306
Source Database       : library

Target Server Type    : MYSQL
Target Server Version : 50513
File Encoding         : 65001

Date: 2012-02-10 19:41:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL DEFAULT '0',
  `adminName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('0', 'harris', '221226');

-- ----------------------------
-- Table structure for `books`
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booksName` varchar(20) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  `keyWords` varchar(40) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('13', 'Thinking in Java', 'IT', 'Java', '一本好书');
INSERT INTO `books` VALUES ('14', 'Thinking in Java', 'IT', 'Java', '一本好书');
INSERT INTO `books` VALUES ('15', 'Core　Java', 'IT', 'Java', '好书');
INSERT INTO `books` VALUES ('16', 'Core　Java', 'IT', 'Java', '好书');
INSERT INTO `books` VALUES ('22', 'MySQL技术手册', 'IT', 'MYSQL', 'mysql');
INSERT INTO `books` VALUES ('23', '世界通史', '历史', '世界通史', '世界历史');
INSERT INTO `books` VALUES ('24', '中国历史', '历史', '中国历史', '中国历史');

-- ----------------------------
-- Table structure for `borrowreturn`
-- ----------------------------
DROP TABLE IF EXISTS `borrowreturn`;
CREATE TABLE `borrowreturn` (
  `booksId` int(11) NOT NULL DEFAULT '0',
  `readersId` int(11) NOT NULL DEFAULT '0',
  `borrowDate` date DEFAULT NULL,
  `shouldReturnDate` date DEFAULT NULL,
  `returnDate` date DEFAULT NULL,
  `pay` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`booksId`),
  KEY `readersId` (`readersId`),
  CONSTRAINT `booksId` FOREIGN KEY (`booksId`) REFERENCES `books` (`id`),
  CONSTRAINT `readersId` FOREIGN KEY (`readersId`) REFERENCES `readers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrowreturn
-- ----------------------------
INSERT INTO `borrowreturn` VALUES ('13', '6', '2012-01-09', '2012-03-09', null, null);
INSERT INTO `borrowreturn` VALUES ('15', '6', '2012-01-09', '2012-03-09', null, null);

-- ----------------------------
-- Table structure for `readercategory`
-- ----------------------------
DROP TABLE IF EXISTS `readercategory`;
CREATE TABLE `readercategory` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(20) DEFAULT NULL,
  `borrowDays` int(11) DEFAULT NULL,
  `borrowNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of readercategory
-- ----------------------------
INSERT INTO `readercategory` VALUES ('1', '本科生', '60', '8');
INSERT INTO `readercategory` VALUES ('2', '研究生', '90', '10');

-- ----------------------------
-- Table structure for `readers`
-- ----------------------------
DROP TABLE IF EXISTS `readers`;
CREATE TABLE `readers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) DEFAULT NULL,
  `readersName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `sex` char(255) DEFAULT NULL,
  `borrowNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of readers
-- ----------------------------
INSERT INTO `readers` VALUES ('3', '1', '张三', '221226', 'M', null);
INSERT INTO `readers` VALUES ('5', '2', '东华', '221226', 'M', null);
INSERT INTO `readers` VALUES ('6', '1', '王恒', '221226', 'M', null);
INSERT INTO `readers` VALUES ('7', '2', '王恒好好', '221226', 'M', null);
