-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2024 at 07:47 PM
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
-- Database: `sam_cricket`
--

-- --------------------------------------------------------

--
-- Table structure for table `coaches`
--

CREATE TABLE `coaches` (
  `CoachID` int(15) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Age` int(3) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `JoinDate` date NOT NULL,
  `Grade` enum('A','B','C') NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coaches`
--

INSERT INTO `coaches` (`CoachID`, `Name`, `Age`, `Gender`, `DateOfBirth`, `JoinDate`, `Grade`, `Email`, `Phone`) VALUES
(2024101, 'Faruq Ahmed', 39, 'Male', '1978-04-02', '2024-05-09', 'A', 'faruq12@gmail.com', 1982387284),
(2024103, 'Nazmul Hossain Papon', 58, 'Male', '1966-04-02', '2024-05-09', 'B', 'papon@gmail.com', 1876543234),
(2024105, 'MS Dhoni', 43, 'Male', '1981-03-07', '2024-05-09', 'C', 'dhoni@gmail.com', 1512345432),
(2024202, 'Jahanara Alam', 42, 'Female', '1982-05-11', '2024-05-09', 'A', 'jahanara@gmail.com', 1723255678),
(2024204, 'Fatema Rahman', 39, 'Female', '1985-12-11', '2024-05-09', 'B', 'fatema@gmail.com', 1612349876),
(2024206, 'Ritu Moni', 35, 'Female', '1992-04-12', '2024-05-09', 'C', 'ritu@yahoo.com', 1798766789);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `PlayerID` int(15) NOT NULL,
  `CoachID` int(15) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Age` int(3) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Father` varchar(50) NOT NULL,
  `Mother` varchar(50) NOT NULL,
  `PresentAddress` varchar(100) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `JoinDate` date NOT NULL,
  `Role` varchar(25) NOT NULL,
  `Batting` varchar(25) NOT NULL,
  `Bowling` varchar(25) DEFAULT NULL,
  `Grade` enum('A','B','C') NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`PlayerID`, `CoachID`, `Name`, `Age`, `Gender`, `Father`, `Mother`, `PresentAddress`, `DateOfBirth`, `JoinDate`, `Role`, `Batting`, `Bowling`, `Grade`, `Email`, `Phone`) VALUES
(20241102, 2024202, 'Pinak Gosh', 25, 'Male', 'Rahul Gosh', 'Purnata Gosh', 'Mohakhali,Dhaka', '1996-12-22', '2024-05-09', 'Batsman', 'Right', 'None', 'A', 'pinak@yahoo.com', 1987655678),
(20241109, 2024105, 'AI Arnob', 23, 'Male', 'Bikram Kumar', 'Tisha Hawlader', 'Ashlia, Savar', '2001-12-22', '2024-05-09', 'Batsman', 'Left', 'Left', 'C', 'arnob@gmail.com', 1945543276),
(20241203, 2024101, 'Hasan Mahmud', 23, 'Male', 'Shorif Mahmud', 'Salma Mahmud', 'Mirpur, Dhaka', '2001-03-31', '2024-05-09', 'Bowler', 'Right', 'Right', 'A', 'hasan@gmail.com', 1732112345),
(20241206, 2024204, 'Istiaq Ahmed', 28, 'Male', 'Mir Jafor', 'Ghosheti Begum', 'Trisal, Mymenshing', '1996-02-13', '2024-05-09', 'Bowler', 'Left', 'Left', 'B', 'istiaq@gmail.com', 1632123456),
(20241211, 2024105, 'Shoaib Siam', 15, 'Male', 'Alal Uddin', 'Shelina Akter', 'Konabari, Gazipur', '2009-08-08', '2024-05-09', 'Bowler', 'Right', 'Right', 'C', 'siam@gmail.com', 1989765443),
(20241304, 2024202, 'Raisa Islam', 22, 'Female', 'Khairul Islam', 'Razia Islam', 'Uttara, Gazipur', '2002-01-01', '2024-05-09', 'All-Rounder', 'Left', 'Left', 'A', 'raisa@gmail.com', 1823732736),
(20241307, 2024103, 'Aftab Ahmed', 30, 'Male', 'Rashid Ahmed', 'Rubaiya Ahmed', 'Tejgaon, Dhaka', '1994-02-03', '2024-05-09', 'All-Rounder', 'Right', 'Left', 'B', 'aftab@gmail.com', 1812345431),
(20241310, 2024206, 'Atikur Rahman', 14, 'Male', 'Kabir Hossen', 'Happy Begum', 'Mouchak, Gazipur', '2001-09-06', '2024-05-09', 'All-Rounder', 'Left', 'Right', 'C', 'atik@gmail.com', 1840432456),
(20241401, 2024101, 'Abu Sayem', 27, 'Male', 'Maruf Sardar', 'Tara Prodhan', 'Mohammadpur, Dhaka', '1996-08-11', '2024-05-09', 'Wicket-Keeper', 'Right', 'Right', 'A', 'sayem@gmail.com', 1243215678),
(20241412, 2024206, 'Morshedul Islam', 12, 'Male', 'Rezaul Karim', 'Tahmina Akter', 'Uttara, Gazipur', '2011-03-19', '2024-05-09', 'Wicket-Keeper', 'Left', 'Right', 'C', 'maruf@gmail.com', 1623467236),
(20242105, 2024103, 'Shorifa Khatun', 24, 'Female', 'Saiful Haider', 'Disha Haider', 'Joydebpur, Gazipur', '2000-03-30', '2024-05-09', 'Batsman', 'Right', 'None', 'B', 'shorifa@gmail.com', 1523443212),
(20242408, 2024204, 'Jerin Tasnim', 23, 'Female', 'Atik Chowdhury', 'Hasina Begum', 'Fulpur, Magura', '2001-11-23', '2024-05-09', 'Wicket-Keeper', 'Left', 'None', 'B', 'jerin@gmail.com', 1454312345);

-- --------------------------------------------------------

--
-- Table structure for table `player_20241102_odi`
--

CREATE TABLE `player_20241102_odi` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241102_odi`
--

INSERT INTO `player_20241102_odi` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-01-31', 1, 55, 33, 'No', 'No', 'Yes', 3, 3, 166.67, 0, 0, 0, 0.00, '0', '0'),
(2, '2024-03-05', 2, 23, 11, 'No', 'No', 'No', 1, 3, 209.09, 0, 0, 0, 0.00, '0', '0'),
(3, '2024-03-06', 3, 101, 35, 'No', 'Yes', 'No', 12, 5, 288.57, 0, 0, 0, 0.00, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241102_t20`
--

CREATE TABLE `player_20241102_t20` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241102_t20`
--

INSERT INTO `player_20241102_t20` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2023-12-05', 1, 50, 22, 'No', 'No', 'Yes', 5, 4, 227.27, 0, 0, 0, 0.00, '0', '0'),
(2, '2023-02-07', 2, 0, 1, 'No', 'No', 'No', 0, 0, 0.00, 0, 0, 0, 0.00, '0', '0'),
(3, '2023-10-05', 3, 66, 40, 'No', 'No', 'Yes', 3, 5, 165.00, 0, 0, 0, 0.00, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241109_odi`
--

CREATE TABLE `player_20241109_odi` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241109_odi`
--

INSERT INTO `player_20241109_odi` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2023-11-08', 1, 200, 150, 'Yes', 'No', 'No', 17, 12, 133.33, 0, 0, 0, 0.00, '0', '0'),
(2, '2024-02-08', 2, 40, 55, 'No', 'No', 'No', 0, 6, 72.73, 0, 0, 0, 0.00, '0', '0'),
(3, '2024-04-09', 3, 76, 77, 'No', 'No', 'Yes', 3, 5, 98.70, 0, 0, 0, 0.00, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241109_t20`
--

CREATE TABLE `player_20241109_t20` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241109_t20`
--

INSERT INTO `player_20241109_t20` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-01-02', 1, 20, 4, 'No', 'No', 'No', 2, 2, 500.00, 0, 0, 0, 0.00, '0', '0'),
(2, '2024-02-28', 2, 99, 55, 'No', 'No', 'Yes', 7, 5, 180.00, 0, 0, 0, 0.00, '0', '0'),
(3, '2024-01-09', 3, 0, 2, 'No', 'No', 'No', 0, 0, 0.00, 0, 0, 0, 0.00, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241203_odi`
--

CREATE TABLE `player_20241203_odi` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241203_odi`
--

INSERT INTO `player_20241203_odi` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2023-08-30', 0, 0, 0, '0', '0', '0', 0, 0, 0.00, 10, 4, 55, 5.50, 'No', 'No'),
(2, '2023-12-06', 0, 0, 0, '0', '0', '0', 0, 0, 0.00, 10, 3, 70, 7.00, 'No', 'No'),
(3, '2023-07-11', 0, 0, 0, '0', '0', '0', 0, 0, 0.00, 8, 5, 36, 4.50, 'No', 'Yes'),
(4, '2023-03-07', 1, 12, 20, 'No', 'No', 'No', 0, 1, 60.00, 9, 7, 20, 2.22, 'No', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241203_t20`
--

CREATE TABLE `player_20241203_t20` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241203_t20`
--

INSERT INTO `player_20241203_t20` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2023-09-06', 0, 0, 0, '0', '0', '0', 0, 0, 0.00, 4, 2, 35, 8.75, 'No', 'No'),
(2, '2023-12-09', 0, 0, 0, '0', '0', '0', 0, 0, 0.00, 4, 3, 29, 7.25, 'No', 'No'),
(3, '2023-06-09', 0, 0, 0, '0', '0', '0', 0, 0, 0.00, 4, 5, 23, 5.75, 'No', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241206_odi`
--

CREATE TABLE `player_20241206_odi` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241206_odi`
--

INSERT INTO `player_20241206_odi` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2023-12-07', 0, 0, 0, '0', '0', '0', 0, 0, 0.00, 4, 1, 34, 8.50, 'No', 'No'),
(2, '2024-05-09', 0, 0, 0, '0', '0', '0', 0, 0, 0.00, 10, 4, 43, 4.30, 'Yes', 'No'),
(3, '2024-08-09', 0, 0, 0, '0', '0', '0', 0, 0, 0.00, 8, 6, 32, 4.00, 'No', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241206_t20`
--

CREATE TABLE `player_20241206_t20` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241206_t20`
--

INSERT INTO `player_20241206_t20` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-12-09', 0, 0, 0, '0', '0', '0', 0, 0, 0.00, 4, 2, 29, 7.25, 'No', 'No'),
(2, '2024-02-03', 1, 12, 7, 'No', 'No', 'No', 1, 0, 171.43, 4, 2, 32, 8.00, 'No', 'No'),
(3, '2024-09-11', 0, 0, 0, '0', '0', '0', 0, 0, 0.00, 3, 1, 34, 11.33, 'No', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241211_odi`
--

CREATE TABLE `player_20241211_odi` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241211_odi`
--

INSERT INTO `player_20241211_odi` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-05-09', 1, 55, 23, 'No', 'No', 'Yes', 6, 3, 239.13, 4, 1, 45, 11.25, 'No', 'No'),
(2, '2024-12-09', 0, 0, 0, '0', '0', '0', 0, 0, 0.00, 10, 4, 41, 4.10, 'No', 'No'),
(3, '2024-12-09', 0, 0, 0, '0', '0', '0', 0, 0, 0.00, 7, 9, 12, 1.71, 'No', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241211_t20`
--

CREATE TABLE `player_20241211_t20` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241211_t20`
--

INSERT INTO `player_20241211_t20` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-06-09', 0, 0, 0, '0', '0', '0', 0, 0, 0.00, 4, 3, 43, 10.75, 'No', 'No'),
(2, '2024-08-11', 0, 0, 0, '0', '0', '0', 0, 0, 0.00, 4, 5, 23, 5.75, 'No', 'Yes'),
(3, '2024-05-11', 1, 45, 22, 'No', 'No', '', 5, 2, 204.55, 4, 2, 23, 5.75, 'No', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241304_odi`
--

CREATE TABLE `player_20241304_odi` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241304_odi`
--

INSERT INTO `player_20241304_odi` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-05-09', 0, 0, 0, '0', '0', '0', 0, 0, 0.00, 10, 3, 23, 2.30, 'No', 'No'),
(2, '2024-05-10', 0, 0, 0, '0', '0', '0', 0, 0, 0.00, 8, 1, 34, 4.25, 'No', 'No'),
(3, '2024-11-09', 1, 32, 58, 'No', 'No', 'No', 2, 1, 55.17, 6, 1, 34, 5.67, 'No', 'No'),
(4, '2024-12-09', 2, 23, 45, 'No', 'No', 'No', 0, 2, 51.11, 8, 2, 43, 5.38, 'No', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241304_t20`
--

CREATE TABLE `player_20241304_t20` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241304_t20`
--

INSERT INTO `player_20241304_t20` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-12-10', 1, 45, 65, 'No', 'No', 'No', 2, 1, 69.23, 4, 2, 34, 8.50, 'No', 'No'),
(2, '2024-12-09', 2, 34, 23, 'No', 'No', 'No', 3, 2, 147.83, 4, 3, 32, 8.00, 'No', 'No'),
(3, '2024-05-12', 3, 23, 23, 'No', 'No', 'No', 2, 1, 100.00, 4, 3, 23, 5.75, 'No', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241307_odi`
--

CREATE TABLE `player_20241307_odi` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241307_odi`
--

INSERT INTO `player_20241307_odi` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-05-09', 1, 67, 43, 'No', 'No', 'Yes', 3, 2, 155.81, 8, 2, 43, 5.38, 'No', ''),
(2, '2024-07-09', 2, 34, 23, 'No', 'No', '', 3, 2, 147.83, 8, 2, 45, 5.63, 'No', 'No'),
(3, '2024-09-08', 3, 108, 67, 'No', 'Yes', '', 7, 4, 161.19, 9, 4, 45, 5.00, 'No', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241307_t20`
--

CREATE TABLE `player_20241307_t20` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241307_t20`
--

INSERT INTO `player_20241307_t20` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-09-09', 1, 34, 16, 'No', 'No', 'No', 4, 1, 212.50, 4, 3, 34, 8.50, 'No', 'No'),
(2, '2024-05-10', 2, 4, 3, 'No', 'No', 'No', 1, 0, 133.33, 4, 2, 23, 5.75, 'No', 'No'),
(3, '2024-09-10', 3, 8, 12, 'No', 'No', 'No', 1, 0, 66.67, 4, 5, 22, 5.50, 'No', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241310_odi`
--

CREATE TABLE `player_20241310_odi` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241310_odi`
--

INSERT INTO `player_20241310_odi` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-05-09', 1, 110, 56, 'No', 'Yes', 'No', 8, 6, 196.43, 9, 7, 22, 2.44, 'No', 'Yes'),
(2, '2024-05-10', 2, 0, 10, 'No', 'No', 'No', 0, 0, 0.00, 10, 1, 90, 9.00, 'No', 'No'),
(3, '2024-05-11', 3, 270, 165, 'Yes', 'No', 'No', 21, 11, 163.64, 8, 2, 123, 15.38, 'No', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241310_t20`
--

CREATE TABLE `player_20241310_t20` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241310_t20`
--

INSERT INTO `player_20241310_t20` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-09-09', 1, 12, 6, 'No', 'No', 'No', 2, 0, 200.00, 4, 1, 13, 3.25, 'No', 'No'),
(2, '2024-05-10', 2, 0, 1, 'No', 'No', 'No', 0, 0, 0.00, 4, 6, 8, 2.00, 'No', 'Yes'),
(3, '2024-05-11', 0, 0, 0, '0', '0', '0', 0, 0, 0.00, 4, 1, 34, 8.50, 'No', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241401_odi`
--

CREATE TABLE `player_20241401_odi` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241401_odi`
--

INSERT INTO `player_20241401_odi` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-05-09', 1, 23, 21, 'No', 'No', 'No', 1, 1, 109.52, 0, 0, 0, 0.00, '0', '0'),
(2, '2024-05-10', 2, 78, 46, 'No', 'No', 'No', 4, 5, 169.57, 0, 0, 0, 0.00, '0', '0'),
(3, '2024-05-12', 3, 87, 77, 'No', 'No', 'No', 7, 4, 112.99, 0, 0, 0, 0.00, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241401_t20`
--

CREATE TABLE `player_20241401_t20` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241401_t20`
--

INSERT INTO `player_20241401_t20` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-05-10', 1, 45, 23, 'No', 'No', 'No', 3, 6, 195.65, 0, 0, 0, 0.00, '0', '0'),
(2, '2024-05-10', 2, 12, 9, 'No', 'No', 'No', 2, 0, 133.33, 0, 0, 0, 0.00, '0', '0'),
(3, '2024-09-11', 3, 8, 5, 'No', 'No', '', 1, 0, 160.00, 0, 0, 0, 0.00, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241412_odi`
--

CREATE TABLE `player_20241412_odi` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241412_odi`
--

INSERT INTO `player_20241412_odi` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-05-10', 1, 77, 37, 'No', 'No', 'Yes', 7, 7, 208.11, 7, 7, 49, 7.00, 'No', 'Yes'),
(2, '2024-05-10', 2, 7, 7, 'No', 'No', 'No', 0, 0, 100.00, 0, 0, 0, 0.00, '0', '0'),
(3, '2024-05-12', 3, 107, 47, 'No', 'Yes', 'No', 7, 7, 227.66, 0, 0, 0, 0.00, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `player_20241412_t20`
--

CREATE TABLE `player_20241412_t20` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20241412_t20`
--

INSERT INTO `player_20241412_t20` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-05-09', 1, 99, 33, 'No', 'No', 'Yes', 7, 7, 300.00, 0, 0, 0, 0.00, '0', '0'),
(2, '0002-05-31', 2, 45, 24, 'No', 'No', 'No', 4, 3, 187.50, 0, 0, 0, 0.00, '0', '0'),
(3, '2024-09-09', 3, 0, 0, 'No', 'No', 'No', 0, 0, 0.00, 0, 0, 0, 0.00, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `player_20242105_odi`
--

CREATE TABLE `player_20242105_odi` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20242105_odi`
--

INSERT INTO `player_20242105_odi` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-05-09', 1, 34, 44, 'No', 'No', 'No', 2, 1, 77.27, 0, 0, 0, 0.00, '0', '0'),
(2, '2024-05-09', 2, 72, 88, 'No', 'No', 'Yes', 4, 3, 81.82, 0, 0, 0, 0.00, '0', '0'),
(3, '2024-05-09', 3, 23, 43, 'No', 'No', 'No', 1, 1, 53.49, 0, 0, 0, 0.00, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `player_20242105_t20`
--

CREATE TABLE `player_20242105_t20` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20242105_t20`
--

INSERT INTO `player_20242105_t20` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-05-09', 1, 52, 45, 'No', 'No', 'Yes', 4, 3, 115.56, 0, 0, 0, 0.00, '0', '0'),
(2, '2024-05-09', 2, 23, 23, 'No', 'No', 'No', 0, 2, 100.00, 0, 0, 0, 0.00, '0', '0'),
(3, '2024-05-09', 3, 87, 56, 'No', 'No', 'Yes', 7, 4, 155.36, 0, 0, 0, 0.00, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `player_20242408_odi`
--

CREATE TABLE `player_20242408_odi` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20242408_odi`
--

INSERT INTO `player_20242408_odi` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-03-09', 1, 45, 60, 'No', 'No', 'No', 2, 1, 75.00, 0, 0, 0, 0.00, '0', '0'),
(2, '2024-05-09', 2, 65, 70, 'No', 'No', 'No', 3, 2, 92.86, 0, 0, 0, 0.00, '0', '0'),
(3, '2024-05-09', 3, 150, 139, 'No', 'Yes', 'No', 9, 4, 107.91, 0, 0, 0, 0.00, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `player_20242408_t20`
--

CREATE TABLE `player_20242408_t20` (
  `MatchNo` int(10) NOT NULL,
  `MatchDate` date NOT NULL,
  `Innings` int(10) NOT NULL DEFAULT 0,
  `Runs` int(10) NOT NULL DEFAULT 0,
  `Balls` int(3) NOT NULL DEFAULT 0,
  `200s` varchar(4) NOT NULL DEFAULT '0',
  `100s` varchar(4) NOT NULL DEFAULT '0',
  `50s` varchar(4) NOT NULL DEFAULT '0',
  `6s` int(10) NOT NULL DEFAULT 0,
  `4s` int(10) NOT NULL DEFAULT 0,
  `SR` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Overs` int(3) NOT NULL DEFAULT 0,
  `Wickets` int(10) NOT NULL DEFAULT 0,
  `RunsGiven` int(10) NOT NULL DEFAULT 0,
  `ER` decimal(5,2) NOT NULL DEFAULT 0.00,
  `10w` varchar(4) NOT NULL DEFAULT '0',
  `5w` varchar(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_20242408_t20`
--

INSERT INTO `player_20242408_t20` (`MatchNo`, `MatchDate`, `Innings`, `Runs`, `Balls`, `200s`, `100s`, `50s`, `6s`, `4s`, `SR`, `Overs`, `Wickets`, `RunsGiven`, `ER`, `10w`, `5w`) VALUES
(1, '2024-05-09', 1, 87, 29, 'No', 'No', 'Yes', 5, 2, 300.00, 0, 0, 0, 0.00, '0', '0'),
(2, '2024-05-09', 2, 0, 1, 'No', 'No', 'No', 0, 0, 0.00, 0, 0, 0, 0.00, '0', '0'),
(3, '2024-05-09', 3, 85, 55, 'No', 'No', 'Yes', 6, 4, 154.55, 0, 0, 0, 0.00, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `fullname` varchar(15) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `username`, `fullname`, `password`) VALUES
('siamhossain240@gmail.com', 'siam', 'siam', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coaches`
--
ALTER TABLE `coaches`
  ADD PRIMARY KEY (`CoachID`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`PlayerID`),
  ADD KEY `CoachID` (`CoachID`);

--
-- Indexes for table `player_20241102_odi`
--
ALTER TABLE `player_20241102_odi`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241102_t20`
--
ALTER TABLE `player_20241102_t20`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241109_odi`
--
ALTER TABLE `player_20241109_odi`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241109_t20`
--
ALTER TABLE `player_20241109_t20`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241203_odi`
--
ALTER TABLE `player_20241203_odi`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241203_t20`
--
ALTER TABLE `player_20241203_t20`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241206_odi`
--
ALTER TABLE `player_20241206_odi`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241206_t20`
--
ALTER TABLE `player_20241206_t20`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241211_odi`
--
ALTER TABLE `player_20241211_odi`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241211_t20`
--
ALTER TABLE `player_20241211_t20`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241304_odi`
--
ALTER TABLE `player_20241304_odi`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241304_t20`
--
ALTER TABLE `player_20241304_t20`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241307_odi`
--
ALTER TABLE `player_20241307_odi`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241307_t20`
--
ALTER TABLE `player_20241307_t20`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241310_odi`
--
ALTER TABLE `player_20241310_odi`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241310_t20`
--
ALTER TABLE `player_20241310_t20`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241401_odi`
--
ALTER TABLE `player_20241401_odi`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241401_t20`
--
ALTER TABLE `player_20241401_t20`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241412_odi`
--
ALTER TABLE `player_20241412_odi`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20241412_t20`
--
ALTER TABLE `player_20241412_t20`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20242105_odi`
--
ALTER TABLE `player_20242105_odi`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20242105_t20`
--
ALTER TABLE `player_20242105_t20`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20242408_odi`
--
ALTER TABLE `player_20242408_odi`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `player_20242408_t20`
--
ALTER TABLE `player_20242408_t20`
  ADD PRIMARY KEY (`MatchNo`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`CoachID`) REFERENCES `coaches` (`CoachID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
