-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2022 at 08:04 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rto`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `catid` int(11) NOT NULL,
  `catname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`catid`, `catname`) VALUES
(1, 'carrssss'),
(2, 'MotorVehicles'),
(3, 'sss');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_learners`
--

CREATE TABLE `tbl_learners` (
  `lid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `certificate` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_learners`
--

INSERT INTO `tbl_learners` (`lid`, `userid`, `certificate`, `status`) VALUES
(5, 3, 'static/media/th%20(1).jpg', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_license`
--

CREATE TABLE `tbl_license` (
  `license_no` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `expdate` date DEFAULT NULL,
  `bloodgrp` varchar(50) DEFAULT NULL,
  `lice_num` varchar(50) NOT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_license`
--

INSERT INTO `tbl_license` (`license_no`, `user`, `dob`, `expdate`, `bloodgrp`, `lice_num`, `status`) VALUES
(3, 1, '1998-09-10', '2025-10-15', 'O+', 'lickl890098', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `logid` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `usertype` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`logid`, `username`, `password`, `usertype`, `status`) VALUES
(1, 'rto@gmail.com', 'rto', 'rto', '1'),
(5, 'admin@gmail.com', 'admin', 'admin', '1'),
(6, 'ppp@mail.com', '9090909090', 'rto', '1'),
(7, 'ppp@mail.com', '9090909090', 'rto', '1'),
(8, 'ak@mail.com', '9090909090', 'customer', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_renewalreq`
--

CREATE TABLE `tbl_renewalreq` (
  `renewalid` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `license_no` int(11) DEFAULT NULL,
  `rdate` date DEFAULT NULL,
  `status` varbinary(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rto`
--

CREATE TABLE `tbl_rto` (
  `rto_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_rto`
--

INSERT INTO `tbl_rto` (`rto_id`, `name`, `address`, `mobile`, `designation`, `email`) VALUES
(1, 'RTO', 'RTO adrs', '90909090', 'RTO', 'rto@gmail.com'),
(2, 'ppp', 'PPP\r\nAdrs', '9090909090', 'Sub Rto', 'ppp@mail.com'),
(3, 'ppp', 'PPP\r\nAdrs', '9090909090', 'Sub Rto', 'ppp@mail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_userreg`
--

CREATE TABLE `tbl_userreg` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `certificate` varchar(50) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_userreg`
--

INSERT INTO `tbl_userreg` (`user_id`, `name`, `gender`, `address`, `email`, `place`, `dob`, `certificate`, `contact`, `username`, `status`) VALUES
(14, 'vyshnavi', 'female', 'thacheril house, west koratty', 'vyshnavirnair88@gmail.com', 'koratty', '2019-05-07', 'None', '9876543213', 'vyshnavi', '0'),
(15, 'karthika', 'female', 'hgfgvbh', 'karthika@gmail.com', 'chhh', '2019-06-07', 'None', '9898989898', 'karthika', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_veh_preg`
--

CREATE TABLE `tbl_veh_preg` (
  `vehicle_id` int(11) NOT NULL,
  `vehiclename` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `fuel` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `tax` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_veh_preg`
--

INSERT INTO `tbl_veh_preg` (`vehicle_id`, `vehiclename`, `brand`, `capacity`, `fuel`, `model`, `tax`) VALUES
(1, 'FZ', 'Yamaha', 2, '12', 'v3', '1000'),
(2, 'Swift', 'Maruti', 5, '20', 'v3', '10000');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_veh_reg`
--

CREATE TABLE `tbl_veh_reg` (
  `vid` int(11) NOT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `regno` varchar(50) DEFAULT NULL,
  `renewal_date` date DEFAULT NULL,
  `customername` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_veh_reg`
--

INSERT INTO `tbl_veh_reg` (`vid`, `vehicle_id`, `regno`, `renewal_date`, `customername`, `contact`, `email`, `address`) VALUES
(1, 1, 'KL 00 AA 0000', '2026-01-08', 'Akil V', '9090909090', 'ak@mail.com', 'Ak Adrs\r\nVVV');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`catid`);

--
-- Indexes for table `tbl_learners`
--
ALTER TABLE `tbl_learners`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `tbl_license`
--
ALTER TABLE `tbl_license`
  ADD PRIMARY KEY (`license_no`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`logid`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payid`);

--
-- Indexes for table `tbl_renewalreq`
--
ALTER TABLE `tbl_renewalreq`
  ADD PRIMARY KEY (`renewalid`);

--
-- Indexes for table `tbl_rto`
--
ALTER TABLE `tbl_rto`
  ADD PRIMARY KEY (`rto_id`);

--
-- Indexes for table `tbl_userreg`
--
ALTER TABLE `tbl_userreg`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_veh_preg`
--
ALTER TABLE `tbl_veh_preg`
  ADD PRIMARY KEY (`vehicle_id`);

--
-- Indexes for table `tbl_veh_reg`
--
ALTER TABLE `tbl_veh_reg`
  ADD PRIMARY KEY (`vid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `catid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_learners`
--
ALTER TABLE `tbl_learners`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_license`
--
ALTER TABLE `tbl_license`
  MODIFY `license_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `logid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_renewalreq`
--
ALTER TABLE `tbl_renewalreq`
  MODIFY `renewalid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_rto`
--
ALTER TABLE `tbl_rto`
  MODIFY `rto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_userreg`
--
ALTER TABLE `tbl_userreg`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_veh_preg`
--
ALTER TABLE `tbl_veh_preg`
  MODIFY `vehicle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_veh_reg`
--
ALTER TABLE `tbl_veh_reg`
  MODIFY `vid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
