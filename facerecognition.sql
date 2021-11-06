-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 17, 2020 at 09:41 PM
-- Server version: 5.7.28-0ubuntu0.18.04.4
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `facerecognition`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--
# Create TABLE 'Customer'
DROP TABLE IF EXISTS `Customer`;

CREATE TABLE `Customer` (
  `customer_id` int NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `login_date` date NOT NULL,
  `login_time` time NOT NULL,
  
  PRIMARY KEY (customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 auto_increment=1;

set foreign_key_checks=0;
truncate table Customer;
set foreign_ket_checks=1;

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (customer_id, "JACK", "123", '2021-09-01','23:11');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;



# Create TABLE 'Account'
DROP TABLE IF EXISTS `Account`;

CREATE TABLE `Account` (
  `account_id` int NOT NULL auto_increment,
  `customer_id` int NOT NULL,
  `type` varchar(50) NOT NULL,
  `currency` varchar(50) NOT NULL,
  PRIMARY KEY (account_id),
  FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 auto_increment=1;

set foreign_key_checks=0;
truncate table Account;
set foreign_ket_checks=1;

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (account_id, 0,'savings','HKD');
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
INSERT INTO `Current` VALUES ();
/*!40000 ALTER TABLE `Current` ENABLE KEYS */;
UNLOCK TABLES;

# create TABLE Saving 
DROP TABLE IF EXISTS `Saving`;

CREATE TABLE `Saving` (
  `account_id` int NOT NULL,
  `balance` float NOT NULL,
  `intersest_rate%` float NOT NULL,
  `maturity_date` date NOT NULL,
  
  PRIMARY KEY (account_id),
  FOREIGN KEY(account_id) REFERENCES Account(account_id)
) ;

LOCK TABLES `Saving` WRITE;
/*!40000 ALTER TABLE `Saving` DISABLE KEYS */;
INSERT INTO `Saving` VALUES ();
/*!40000 ALTER TABLE `Saving` ENABLE KEYS */;
UNLOCK TABLES;

#create table credit 
DROP TABLE IF EXISTS `Credit`;

CREATE TABLE `Credit` (
  `account_id` int NOT NULL,
  `balance` int NOT NULL,
  `due_date` date NOT NULL,
  
  PRIMARY KEY (account_id),
  FOREIGN KEY(account_id) REFERENCES Account(account_id)
) ;
LOCK TABLES `Credit` WRITE;
/*!40000 ALTER TABLE `Credit` DISABLE KEYS */;
INSERT INTO `Credit` VALUES ();
/*!40000 ALTER TABLE `Credit` ENABLE KEYS */;
UNLOCK TABLES;


# Create TABLE 'Transaction'
DROP TABLE IF EXISTS `Transaction`;

CREATE TABLE `Transaction` (
  `transaction_id` int NOT NULL auto_increment,
  `from_account` int NOT NULL,
  `to_account` int NOT NULL,
  `due_date` date NOT NULL,
  `amount` float NOT NULL,
  `transac_date` date NOT NULL,
  `transac_time` time NOT NULL,
  `message` varchar(50) NOT NULL,
  
  PRIMARY KEY (transaction_id),
  FOREIGN KEY(from_account) REFERENCES Account(account_id),
  FOREIGN KEY(to_account) REFERENCES Account(account_id)
  
) ENGINE=InnoDB DEFAULT CHARSET=latin1 auto_increment=1;

set foreign_key_checks=0;
truncate table Transaction;
set foreign_ket_checks=1;

LOCK TABLES `Transaction` WRITE;
/*!40000 ALTER TABLE `Transaction` DISABLE KEYS */;
INSERT INTO `Transaction` VALUES();
/*!40000 ALTER TABLE `Transaction` ENABLE KEYS */;
UNLOCK TABLES;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
