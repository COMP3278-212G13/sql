-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2021 at 08:12 AM
-- Server version: 8.0.18
-- PHP Version: 7.1.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
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
-- Table structure for table `Account`
--

CREATE TABLE `Account` (
  `account_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `currency` varchar(50) NOT NULL,
  `create_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Account`
--

INSERT INTO `Account` (`account_id`, `customer_id`, `type`, `currency`, `create_date`) VALUES
(1, 1, 'Saving', 'HKD', '2021-09-21'),
(2, 1, 'Current', 'HKD', '2021-09-02'),
(3, 1, 'Current', 'USD', '2021-09-03'),
(4, 2, 'Saving', 'USD', '2020-03-05'),
(5, 2, 'Saving', 'HKD', '2020-03-01'),
(6, 2, 'Credit', 'HKD', '2021-08-01'),
(7, 2, 'Current', 'HKD', '2021-03-01'),
(8, 3, 'Current', 'HKD', '2021-01-15'),
(9, 3, 'Credit', 'HKD', '2021-01-20'),
(10, 4, 'Saving', 'HKD', '2021-10-15'),
(11, 4, 'Current', 'HKD', '2021-11-01'),
(12, 4, 'Current', 'USD', '2020-12-30'),
(13, 5, 'Credit', 'HKD', '2021-01-01'),
(14, 5, 'Saving', 'HKD', '2020-12-30');

-- --------------------------------------------------------

--
-- Table structure for table `Credit`
--

CREATE TABLE `Credit` (
  `account_id` int(11) NOT NULL,
  `month` int(6) NOT NULL,
  `bill` float NOT NULL,
  `due_date` date NOT NULL,
  `repay_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Credit`
--

INSERT INTO `Credit` (`account_id`, `month`, `bill`, `due_date`, `repay_date`) VALUES
(6, 202108, 3200, '2021-09-23', '2021-09-15'),
(6, 202109, 50000, '2021-10-23', '2021-10-20'),
(6, 202110, 2536, '2021-11-23', NULL),
(9, 202110, 100000, '2021-11-20', '2021-11-10'),
(13, 202110, 30000, '2021-11-25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Current`
--

CREATE TABLE `Current` (
  `account_id` int(11) NOT NULL,
  `balance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Current`
--

INSERT INTO `Current` (`account_id`, `balance`) VALUES
(2, 10000.2),
(3, 5000),
(7, 10000.2),
(8, 1000),
(11, 100000),
(12, 500);

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` char(56) NOT NULL,
  `login_date` date NOT NULL,
  `login_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`customer_id`, `name`, `password`, `login_date`, `login_time`) VALUES
(1, 'Chenjiakai', '1234', '2021-09-01', '23:11:00'),
(2, 'Wuqingyi', 'a6ac1941d032a9e66e40c79362ec4f0fa46011bb9d482a547370fdd0', '2021-11-12', '16:01:06'),
(3, 'Wanqianyong', '256cd6166415ec13930bf6619efdeddfdec16470c8707f91d2627332', '2021-01-14', '15:30:00'),
(4, 'Chankwanyi', 'a633b06c9383c87421c1b4dc4627f8fc2b18d35b1c7967203a8ec841', '2021-10-07', '19:30:00'),
(5, 'Longkehan', 'f9cdbd8aaf2757530edeb40f604d379daccfaf315141f39d6e32908d', '2020-12-30', '09:00:00'),
(6, 'juliewu', '99fb2f48c6af4761f904fc85f95eb56190e5d40b1f44ec3a9c1fa319', '2021-11-12', '16:04:34');

-- --------------------------------------------------------

--
-- Table structure for table `Saving`
--

CREATE TABLE `Saving` (
  `account_id` int(11) NOT NULL,
  `balance` float NOT NULL,
  `interest_rate` float NOT NULL,
  `maturity_date` date NOT NULL,
  `value_date` date NOT NULL,
  `saving_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Saving`
--

INSERT INTO `Saving` (`account_id`, `balance`, `interest_rate`, `maturity_date`, `value_date`, `saving_id`) VALUES
(1, 20000, 8, '2025-09-21', '2015-09-21', 1),
(1, 20000, 7, '2022-03-11', '2021-03-11', 2),
(1, 1000, 3, '2021-11-19', '2021-11-01', 3),
(4, 3000, 6, '2030-03-05', '2020-03-05', 1),
(5, 3000, 7.5, '2030-03-05', '2020-03-05', 1),
(5, 1000, 3, '2021-11-19', '2021-11-09', 2),
(5, 1000, 3, '2021-11-18', '2021-11-01', 3),
(10, 100000, 8.5, '2040-10-15', '2020-10-15', 1),
(14, 10000, 6, '2030-12-30', '2020-12-30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Transaction`
--

CREATE TABLE `Transaction` (
  `transaction_id` int(11) NOT NULL,
  `from_account` int(11) NOT NULL,
  `to_account` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `transac_datetime` datetime NOT NULL,
  `from_balance` int(11) NOT NULL,
  `to_balance` int(11) NOT NULL,
  `message` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Transaction`
--

INSERT INTO `Transaction` (`transaction_id`, `from_account`, `to_account`, `amount`, `transac_datetime`, `from_balance`, `to_balance`, `message`) VALUES
(1, 2, 7, '3000', '2021-11-09 18:23:11', 21000, 4600, 'hello'),
(2, 7, 2, '100', '2021-11-02 13:24:26', 1600, 24000, ''),
(3, 8, 2, '500', '2021-10-28 11:53:56', 3000, 23900, 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Account`
--
ALTER TABLE `Account`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `Credit`
--
ALTER TABLE `Credit`
  ADD PRIMARY KEY (`account_id`,`month`) USING BTREE;

--
-- Indexes for table `Current`
--
ALTER TABLE `Current`
  ADD PRIMARY KEY (`account_id`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `Saving`
--
ALTER TABLE `Saving`
  ADD PRIMARY KEY (`account_id`,`saving_id`) USING BTREE;

--
-- Indexes for table `Transaction`
--
ALTER TABLE `Transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `from_account` (`from_account`),
  ADD KEY `to_account` (`to_account`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Account`
--
ALTER TABLE `Account`
  MODIFY `account_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Transaction`
--
ALTER TABLE `Transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Account`
--
ALTER TABLE `Account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `Credit`
--
ALTER TABLE `Credit`
  ADD CONSTRAINT `credit_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `Current`
--
ALTER TABLE `Current`
  ADD CONSTRAINT `current_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `Saving`
--
ALTER TABLE `Saving`
  ADD CONSTRAINT `saving_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `Transaction`
--
ALTER TABLE `Transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`from_account`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`to_account`) REFERENCES `account` (`account_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
