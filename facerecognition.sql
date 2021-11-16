-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/

-- Host: localhost:3306
-- Generation Time: Feb 17, 2020 at 09:41 PM
-- Server version: 5.7.28-0ubuntu0.18.04.4
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone =  "+08:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `facerecognition`
--

DROP DATABASE IF EXISTS `facerecognition`;
CREATE DATABASE `facerecognition`;
USE `facerecognition`;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--
# Create TABLE 'Customer'
DROP TABLE IF EXISTS `Customer`;

CREATE TABLE `Customer` (
  `customer_id` int NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `password` char(56) NOT NULL,
  `login_date` date NOT NULL,
  `login_time` time NOT NULL,
  PRIMARY KEY (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 auto_increment=1;

set foreign_key_checks=0;
truncate table Customer;
set foreign_key_checks=1;

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (null, 'Chenjiakai', SHA2('a123c', 224), '2016-09-01','10:11');
INSERT INTO `Customer` VALUES (null, 'Wuqingyi', SHA2('b458d', 224), '2017-03-01','12:00');
INSERT INTO `Customer` VALUES (null, 'Wanqianyong', SHA2('df123456', 224), '2018-01-14','15:30');
INSERT INTO `Customer` VALUES (null, 'Longkehan', SHA2('gsd786', 224), '2015-01-02','14:30');
INSERT INTO `Customer` VALUES (null, 'Chankwanyi', SHA2('dsaf123', 224), '2015-01-01','9:00');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;


# Create TABLE 'Account'

set foreign_key_checks=0;
DROP TABLE IF EXISTS `Account`;
set foreign_key_checks=1;

CREATE TABLE `Account` (
  `account_id` int NOT NULL auto_increment,
  `customer_id` int NOT NULL,
  `type` varchar(50) NOT NULL,
  `currency` varchar(50) NOT NULL,
  `create_date` date NOT NULL,
  PRIMARY KEY (account_id),
  FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 auto_increment=1;

set foreign_key_checks=0;
truncate table Account;
set foreign_key_checks=1;

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (null, 1,'Saving','HKD','2019-09-21');
INSERT INTO `Account` VALUES (null, 1,'Current','HKD','2017-09-02');
INSERT INTO `Account` VALUES (null, 1,'Current','USD','2019-09-03');
INSERT INTO `Account` VALUES (null, 2,'Saving','USD','2017-03-05');
INSERT INTO `Account` VALUES (null, 2,'Saving','HKD','2018-03-01');
INSERT INTO `Account` VALUES (null, 2,'Credit','HKD','2019-08-01');
INSERT INTO `Account` VALUES (null, 2,'Current','HKD','2018-03-01');
INSERT INTO `Account` VALUES (null, 3,'Current','HKD','2021-01-30');
INSERT INTO `Account` VALUES (null, 3,'Credit','HKD','2021-01-20');
INSERT INTO `Account` VALUES (null, 4,'Current','HKD','2020-11-01');
INSERT INTO `Account` VALUES (null, 4,'Saving','HKD','2016-10-15');
INSERT INTO `Account` VALUES (null, 4,'Credit','HKD', '2017-10-08');
INSERT INTO `Account` VALUES (null, 5,'Saving','HKD','2015-07-11');
INSERT INTO `Account` VALUES (null, 5,'Saving','USD','2015-10-15');
INSERT INTO `Account` VALUES (null, 5,'Saving','HKD','2016-12-30');
INSERT INTO `Account` VALUES (null, 5,'Credit','USD','2016-11-01');
INSERT INTO `Account` VALUES (null, 5,'Credit','HKD','2017-11-01');
INSERT INTO `Account` VALUES (null, 5,'Current','HKD','2015-12-30');
INSERT INTO `Account` VALUES (null, 5,'Current','USD','2016-01-01');
INSERT INTO `Account` VALUES (null, 5,'Current','HKD','2017-01-01');

/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;


# create TABLE Current
DROP TABLE IF EXISTS `Current`;

CREATE TABLE `Current` (
  `account_id` int NOT NULL,
  `balance` float NOT NULL,
  PRIMARY KEY (account_id),
  FOREIGN KEY(account_id) REFERENCES Account(account_id)
) ;

LOCK TABLES `Current` WRITE;
/*!40000 ALTER TABLE `Current` DISABLE KEYS */;
INSERT INTO `Current` VALUES (2,2900);
INSERT INTO `Current` VALUES (3,5000);
INSERT INTO `Current` VALUES (7,8400);
INSERT INTO `Current` VALUES (8,3500);
INSERT INTO `Current` VALUES (10,5000);
INSERT INTO `Current` VALUES (18,22000);
INSERT INTO `Current` VALUES (19,5000);
INSERT INTO `Current` VALUES (20,19100);
/*!40000 ALTER TABLE `Current` ENABLE KEYS */;
UNLOCK TABLES;


# create TABLE Saving
DROP TABLE IF EXISTS `Saving`;

CREATE TABLE `Saving` (
  `account_id` int(11) NOT NULL,
  `balance` float NOT NULL,
  `interest_rate` float NOT NULL,
  `maturity_date` date NOT NULL,
  `value_date` date NOT NULL,
  `saving_id` int(11) NOT NULL,
  PRIMARY KEY (account_id, saving_id),
  FOREIGN KEY(account_id) REFERENCES Account(account_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `Saving` WRITE;
/*!40000 ALTER TABLE `Saving` DISABLE KEYS */;
INSERT INTO `Saving` VALUES (1, 20000, 8, '2025-09-21', '2020-09-21', 1);
INSERT INTO `Saving` VALUES (1, 20000, 7, '2022-03-11', '2021-03-11', 2);
INSERT INTO `Saving` VALUES (4, 1000, 3, '2021-11-19', '2021-11-01', 1);
INSERT INTO `Saving` VALUES (4, 2000, 3, '2021-11-20', '2021-11-03', 2);
INSERT INTO `Saving` VALUES (5, 5000, 5, '2021-11-20', '2021-11-03', 1);
INSERT INTO `Saving` VALUES (11, 3000, 6, '2030-03-05', '2020-03-05', 1);
INSERT INTO `Saving` VALUES (13, 3000, 7.5, '2030-03-05', '2020-03-05', 1);
INSERT INTO `Saving` VALUES (13, 1000, 3, '2021-11-30', '2016-11-30', 2);
INSERT INTO `Saving` VALUES (14, 1000, 3, '2021-11-10', '2016-11-01', 3);
INSERT INTO `Saving` VALUES (14, 100000, 8.5, '2040-10-15', '2020-10-15', 4);
INSERT INTO `Saving` VALUES (15, 10000, 6, '2030-12-30', '2020-12-30', 5);

/*!40000 ALTER TABLE `Saving` ENABLE KEYS */;
UNLOCK TABLES;


#create table credit
DROP TABLE IF EXISTS `Credit`;

CREATE TABLE `Credit` (
  `account_id` int NOT NULL,
  `month` int NOT NULL,
  `bill` float NOT NULL,
  `due_date` date NOT NULL,
  `repay_date` date DEFAULT NULL,
  PRIMARY KEY (account_id, month),
  FOREIGN KEY(account_id) REFERENCES Account(account_id)
) ;

LOCK TABLES `Credit` WRITE;
/*!40000 ALTER TABLE `Credit` DISABLE KEYS */;
INSERT INTO `Credit` VALUES (6, 202106, 10030,'2021-07-20','2021-07-19');
INSERT INTO `Credit` VALUES (9, 202107, 2345,'2021-08-20','2021-08-15');
INSERT INTO `Credit` VALUES (9, 202108, 3200, '2021-09-23', '2021-09-15');
INSERT INTO `Credit` VALUES (12, 202109, 50000, '2021-10-23', '2021-10-20');
INSERT INTO `Credit` VALUES (12, 202110, 2536, '2021-11-23', NULL);
INSERT INTO `Credit` VALUES (16, 202103, 100000, '2021-09-20', '2021-10-10');
INSERT INTO `Credit` VALUES (16, 202104, 2000, '2022-10-20','2021-10-14');
INSERT INTO `Credit` VALUES (16, 202105, 2000, '2022-10-20','2021-10-14');
INSERT INTO `Credit` VALUES (16, 202106, 2000, '2022-10-20','2021-10-14');
INSERT INTO `Credit` VALUES (17, 202108, 500,'2021-11-20',NULL);
INSERT INTO `Credit` VALUES (17, 202109, 30000, '2021-11-25', NULL);
INSERT INTO `Credit` VALUES (17, 202110, 500,'2021-11-20',NULL);

/*!40000 ALTER TABLE `Credit` ENABLE KEYS */;
UNLOCK TABLES;


# Create TABLE 'Transaction'
DROP TABLE IF EXISTS `Transaction`;


CREATE TABLE `Transaction` (
  `transaction_id` int(11) NOT NULL auto_increment,
  `from_account` int(11) NOT NULL,
  `to_account` int(11) NOT NULL,
  `amount` float NOT NULL,
  `transac_datetime` datetime NOT NULL,
  `from_balance` float NOT NULL,
  `to_balance` float NOT NULL,
  `message` varchar(50) NOT NULL,
  PRIMARY KEY (transaction_id),
  FOREIGN KEY(from_account) REFERENCES Account(account_id),
  FOREIGN KEY(to_account) REFERENCES Account(account_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

set foreign_key_checks=0;
truncate table Transaction;
set foreign_key_checks=1;

LOCK TABLES `Transaction` WRITE;
/*!40000 ALTER TABLE `Transaction` DISABLE KEYS */;
INSERT INTO `Transaction` VALUES(null, 8, 2, 500, '2021-03-28 11:53:56', 3000, 2500, 'test');
INSERT INTO `Transaction` VALUES(null, 7, 8, 1000, '2021-03-30 10:45:23', 1000, 4000, '3278bravo');
INSERT INTO `Transaction` VALUES(null, 7, 2, 500, '2021-04-01 13:24:26', 500, 3000, 'good');
INSERT INTO `Transaction` VALUES(null, 2, 10, 100, '2021-04-18 11:23:54', 2900, 10000, 'group project nice');
INSERT INTO `Transaction` VALUES(null, 18, 7, 8000, '2021-04-19 18:23:11', 16000, 8500, 'hello');
INSERT INTO `Transaction` VALUES(null, 2, 18, 1000,'2021-05-02 12:33:12', 1900, 17000, 'love mySQL');
INSERT INTO `Transaction` VALUES(null, 8, 18, 500, '2021-06-05 17:03:27', 3500, 22000, 'Dr.Luo is awesome');
INSERT INTO `Transaction` VALUES(null, 10, 20, 5000, '2021-07-09 20:11:04', 5000, 20000, 'brilliant tutors');
INSERT INTO `Transaction` VALUES(null, 7, 20, 100, '2021-10-10 20:11:04', 8400, 20100, 'nice group project');
INSERT INTO `Transaction` VALUES(null, 20, 2, 1000, '2021-11-13 20:11:04', 19100, 2900, 'fight for final');
/*!40000 ALTER TABLE `Transaction` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

