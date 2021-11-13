-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/

-- Host: localhost:3306
-- Generation Time: Feb 17, 2020 at 09:41 PM
-- Server version: 5.7.28-0ubuntu0.18.04.4
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+08:00";


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
INSERT INTO `Customer` VALUES (null, 'Chenjiakai', SHA2('a123c', 224), '2021-09-01','23:11');
INSERT INTO `Customer` VALUES (null, 'Wuqingyi', SHA2('b458d', 224), '2020-03-01','00:12');
INSERT INTO `Customer` VALUES (null, 'Wanqianyong', SHA2('df123456', 224), '2021-01-14','15:30');
INSERT INTO `Customer` VALUES (null, 'Chankwanyi', SHA2('gsd786', 224), '2021-10-07','19:30');
INSERT INTO `Customer` VALUES (null, 'Longkehan', SHA2('dsaf123', 224), '2020-12-30','9:00');
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
INSERT INTO `Account` VALUES (null, 1,'Saving','HKD','2021-09-21');
INSERT INTO `Account` VALUES (null, 1,'Current','HKD','2021-09-02');
INSERT INTO `Account` VALUES (null, 1,'Current','USD','2021-09-03');
INSERT INTO `Account` VALUES (null, 2,'Saving','USD','2020-03-05');
INSERT INTO `Account` VALUES (null, 2,'Saving','HKD','2020-03-01');
INSERT INTO `Account` VALUES (null, 2,'Credit','HKD','2021-08-01');
INSERT INTO `Account` VALUES (null, 2,'Current','HKD','2021-03-01');
INSERT INTO `Account` VALUES (null, 3,'Current','HKD','2021-01-15');
INSERT INTO `Account` VALUES (null, 3,'Credit','HKD','2021-01-20');
INSERT INTO `Account` VALUES (null, 4,'Saving','HKD','2021-10-15');
INSERT INTO `Account` VALUES (null, 4,'Current','HKD','2021-11-01');
INSERT INTO `Account` VALUES (null, 4,'Current','USD','2020-12-30');
INSERT INTO `Account` VALUES (null, 5,'Credit','HKD','2021-01-01');
INSERT INTO `Account` VALUES (null, 5,'Saving','HKD','2020-12-30');
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
INSERT INTO `Current` VALUES (2,10000.23);
INSERT INTO `Current` VALUES (3,5000);
INSERT INTO `Current` VALUES (7,10000.23);
INSERT INTO `Current` VALUES (8,1000);
INSERT INTO `Current` VALUES (11,100000);
INSERT INTO `Current` VALUES (12,500);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `Saving` WRITE;
/*!40000 ALTER TABLE `Saving` DISABLE KEYS */;
INSERT INTO `Saving` VALUES (1, 20000, 8, '2025-09-21', '2015-09-21', 1);
INSERT INTO `Saving` VALUES (1, 20000, 7, '2022-03-11', '2021-03-11', 2);
INSERT INTO `Saving` VALUES (1, 1000, 3, '2021-11-19', '2021-11-01', 3);
INSERT INTO `Saving` VALUES (1, 2000, 3, '2021-11-20', '2021-11-03', 4);
INSERT INTO `Saving` VALUES (1, 5000, 5, '2021-11-20', '2021-11-03', 5);
INSERT INTO `Saving` VALUES (4, 3000, 6, '2030-03-05', '2020-03-05', 1);
INSERT INTO `Saving` VALUES (5, 3000, 7.5, '2030-03-05', '2020-03-05', 1);
INSERT INTO `Saving` VALUES (5, 1000, 3, '2021-11-19', '2021-11-09', 2);
INSERT INTO `Saving` VALUES (5, 1000, 3, '2021-11-18', '2021-11-01', 3);
INSERT INTO `Saving` VALUES (10, 100000, 8.5, '2040-10-15', '2020-10-15', 1);
INSERT INTO `Saving` VALUES (14, 10000, 6, '2030-12-30', '2020-12-30', 1);

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
INSERT INTO `Credit` VALUES (6, 202107, 2345,'2021-08-20','2021-08-15');
INSERT INTO `Credit` VALUES (6, 202108, 3200, '2021-09-23', '2021-09-15');
INSERT INTO `Credit` VALUES (6, 202109, 50000, '2021-10-23', '2021-10-20');
INSERT INTO `Credit` VALUES (6, 202110, 2536, '2021-11-23', NULL);
INSERT INTO `Credit` VALUES (9, 202108, 100000, '2021-09-20', '2021-10-10');
INSERT INTO `Credit` VALUES (9, 202109, 2000, '2022-10-20','2021-10-14');
INSERT INTO `Credit` VALUES (9, 202110, 500,'2021-11-20',NULL);
INSERT INTO `Credit` VALUES (13, 202110, 30000, '2021-11-25', NULL);

/*!40000 ALTER TABLE `Credit` ENABLE KEYS */;
UNLOCK TABLES;


# Create TABLE 'Transaction'
DROP TABLE IF EXISTS `Transaction`;


CREATE TABLE `Transaction` (
  `transaction_id` int(11) NOT NULL auto_increment,
  `from_account` int(11) NOT NULL,
  `to_account` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `transac_datetime` datetime NOT NULL,
  `from_balance` float NOT NULL,
  `to_balance` float NOT NULL,
  `message` varchar(50) NOT NULL,
  PRIMARY KEY (transaction_id),
  FOREIGN KEY(from_account) REFERENCES Account(account_id),
  FOREIGN KEY(to_account) REFERENCES Account(account_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

set foreign_key_checks=0;
truncate table Transaction;
set foreign_key_checks=1;

LOCK TABLES `Transaction` WRITE;
/*!40000 ALTER TABLE `Transaction` DISABLE KEYS */;
INSERT INTO `Transaction` VALUES(null, 8, 2, '500', '2021-08-28 11:53:56', 3000, 23900, 'test');
INSERT INTO `Transaction` VALUES(null, 7, 8, '1000', '2021-09-15 10:45:23', 600, 4000, '3278bravo');
INSERT INTO `Transaction` VALUES(null, 7, 2, '100', '2021-09-26 13:24:26', 500, 24000, '');
INSERT INTO `Transaction` VALUES(null, 2, 7, '5000', '2021-10-18 11:23:54', 19000, 5500, 'group project nice');
INSERT INTO `Transaction` VALUES(null, 2, 7, '3000', '2021-10-28 18:23:11', 16000, 8500, 'hello');
INSERT INTO `Transaction` VALUES(null, 2, 8, '1000','2021-11-02 12:33:12', 15000, 5000, 'love mySQL');
INSERT INTO `Transaction` VALUES(null, 8, 7, '500', '2021-11-05 17:03:27', 4500, 9000, 'Dr.Luo is awesome');
INSERT INTO `Transaction` VALUES(null, 7, 2, '800', '2021-11-09 20:11:04', 8200, 15800, 'brilliant tutors');
INSERT INTO `Transaction` VALUES(null, 11, 2, '100', '2021-11-10 20:11:04', 500, 15900, 'brilliant tutors');
INSERT INTO `Transaction` VALUES(null, 2, 12, '1000', '2021-11-13 20:11:04', 14900, 11000, '');
/*!40000 ALTER TABLE `Transaction` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
