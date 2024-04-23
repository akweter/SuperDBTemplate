-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2024 at 10:31 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `daddylee_photography`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `BookingID` int(11) NOT NULL,
  `CustomerID` varchar(10) NOT NULL,
  `EventID` int(11) NOT NULL,
  `PackageID` int(11) NOT NULL,
  `EventDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BookingID`, `CustomerID`, `EventID`, `PackageID`, `EventDate`) VALUES
(1, 'C1', 1, 2, '2025-01-17'),
(2, 'C2', 1, 1, '2025-12-01'),
(3, 'C3', 4, 1, '2024-06-12');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` varchar(10) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `fname`, `lname`, `email`) VALUES
('C1', 'Keziah', 'Elemawusi', 'kelemawusi@email.com'),
('C2', 'McAnthony', 'Alayi', 'malayi@email.com'),
('C3', 'Jessica', 'Aikins', 'jaikins@email.com'),
('C4', 'Favour', 'Godson', 'fgodson@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DeptID` int(11) NOT NULL,
  `DeptName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DeptID`, `DeptName`) VALUES
(1, 'Photography'),
(2, 'Videography'),
(3, 'Editing');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `empID` varchar(5) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `SupervisorID` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empID`, `fname`, `lname`, `email`, `phoneNumber`, `SupervisorID`) VALUES
('E1', 'Ernest', 'Akoto', 'eakoto@email.com', '0244444444', 'E3'),
('E2', 'Jemin', 'Opoku', 'jopoku@email.com', '0233333333', 'E3'),
('E3', 'Etornam', 'Ligih', 'eligih@email.com', '0243545454', 'E4'),
('E4', 'Fidelia', 'Deh', 'fdeh@email.com', '0202332233', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_dept`
--

CREATE TABLE `employee_dept` (
  `Emp_Dept_ID` int(11) NOT NULL,
  `empID` varchar(5) NOT NULL,
  `DeptID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_dept`
--

INSERT INTO `employee_dept` (`Emp_Dept_ID`, `empID`, `DeptID`) VALUES
(1, 'E1', 1),
(2, 'E1', 3),
(3, 'E2', 2),
(4, 'E3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `emp_assigned_booking`
--

CREATE TABLE `emp_assigned_booking` (
  `Emp_assigned_BookingID` int(11) NOT NULL,
  `empID` varchar(5) NOT NULL,
  `bookingID` int(11) NOT NULL,
  `DeptID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emp_assigned_booking`
--

INSERT INTO `emp_assigned_booking` (`Emp_assigned_BookingID`, `empID`, `bookingID`, `DeptID`) VALUES
(1, 'E1', 1, 1),
(2, 'E4', 2, 2),
(3, 'E2', 2, 3),
(4, 'E3', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `eventID` int(11) NOT NULL,
  `eventName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`eventID`, `eventName`) VALUES
(1, 'Wedding'),
(2, 'Naming Ceremony'),
(3, 'Engagement'),
(4, 'Graduation');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `packageID` int(11) NOT NULL,
  `packageName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`packageID`, `packageName`) VALUES
(1, 'Gold'),
(2, 'Diamond'),
(3, 'Silver'),
(4, 'Bronze');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentID` int(11) NOT NULL,
  `bookingID` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paymentDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentID`, `bookingID`, `amount`, `paymentDate`) VALUES
(1, 1, 200.00, '2023-06-12'),
(2, 1, 500.50, '2023-07-30'),
(3, 2, 100.00, '2023-08-30'),
(4, 3, 300.00, '2023-09-02');

-- --------------------------------------------------------

--
-- Table structure for table `phone_number`
--

CREATE TABLE `phone_number` (
  `phoneID` int(11) NOT NULL,
  `customerID` varchar(10) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phone_number`
--

INSERT INTO `phone_number` (`phoneID`, `customerID`, `phoneNumber`) VALUES
(1, 'C1', '0201224455'),
(2, 'C1', '0244334455'),
(3, 'C2', '0233898999'),
(4, 'C4', '0244788990');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `EventID` (`EventID`),
  ADD KEY `PackageID` (`PackageID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DeptID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empID`),
  ADD KEY `SupervisorID` (`SupervisorID`);

--
-- Indexes for table `employee_dept`
--
ALTER TABLE `employee_dept`
  ADD PRIMARY KEY (`Emp_Dept_ID`),
  ADD KEY `empID` (`empID`),
  ADD KEY `DeptID` (`DeptID`);

--
-- Indexes for table `emp_assigned_booking`
--
ALTER TABLE `emp_assigned_booking`
  ADD PRIMARY KEY (`Emp_assigned_BookingID`),
  ADD KEY `empID` (`empID`),
  ADD KEY `bookingID` (`bookingID`),
  ADD KEY `DeptID` (`DeptID`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`eventID`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`packageID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentID`),
  ADD KEY `bookingID` (`bookingID`);

--
-- Indexes for table `phone_number`
--
ALTER TABLE `phone_number`
  ADD PRIMARY KEY (`phoneID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`EventID`) REFERENCES `event` (`eventID`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`PackageID`) REFERENCES `package` (`packageID`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`SupervisorID`) REFERENCES `employee` (`empID`);

--
-- Constraints for table `employee_dept`
--
ALTER TABLE `employee_dept`
  ADD CONSTRAINT `employee_dept_ibfk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`),
  ADD CONSTRAINT `employee_dept_ibfk_2` FOREIGN KEY (`DeptID`) REFERENCES `department` (`DeptID`);

--
-- Constraints for table `emp_assigned_booking`
--
ALTER TABLE `emp_assigned_booking`
  ADD CONSTRAINT `emp_assigned_booking_ibfk_1` FOREIGN KEY (`empID`) REFERENCES `employee` (`empID`),
  ADD CONSTRAINT `emp_assigned_booking_ibfk_2` FOREIGN KEY (`bookingID`) REFERENCES `booking` (`BookingID`),
  ADD CONSTRAINT `emp_assigned_booking_ibfk_3` FOREIGN KEY (`DeptID`) REFERENCES `department` (`DeptID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`bookingID`) REFERENCES `booking` (`BookingID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
