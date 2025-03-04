-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2025 at 01:07 PM
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
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', 'admin@12345', '15-11-2024 05:14:24 PM');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `doctorSpecialization` varchar(255) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `consultancyFees` int(11) DEFAULT NULL,
  `appointmentDate` varchar(255) DEFAULT NULL,
  `appointmentTime` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `userStatus` int(11) DEFAULT NULL,
  `doctorStatus` int(11) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `priority` int(11) DEFAULT 3,
  `disease` text DEFAULT NULL,
  `prescription` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `doctorSpecialization`, `doctorId`, `userId`, `consultancyFees`, `appointmentDate`, `appointmentTime`, `postingDate`, `userStatus`, `doctorStatus`, `updationDate`, `priority`, `disease`, `prescription`) VALUES
(3, 'ENT', 8, 3, 700, '2024-11-30', '1:45 PM', '2024-11-15 12:51:28', 1, 1, '2025-01-13 07:34:58', 2, 'demo', 'demo'),
(4, 'Dental Care', 13, 4, 900, '2024-11-16', '1:00 PM', '2024-11-15 16:23:41', 1, 1, '2025-01-13 08:27:59', 1, 'Cavity', 'Regular brush your tooth'),
(5, 'Orthopedics', 10, 3, 1500, '2025-01-31', '2:00 AM', '2025-01-10 07:25:18', 0, 1, '2025-01-10 07:26:04', 2, NULL, NULL),
(7, 'ENT', 9, 3, 500, '2025-01-17', '4:45 PM', '2025-01-11 09:59:13', 1, 1, NULL, 1, NULL, NULL),
(8, 'General Surgery', 14, 7, 1500, '2025-01-17', '2:00 PM', '2025-01-11 13:56:12', 1, 1, '2025-01-13 09:55:01', 3, 'Leg fracture', 'Need stiches '),
(9, 'ENT', 8, 3, 700, '2025-01-13', '8:15 PM', '2025-01-13 14:23:09', 1, 0, '2025-01-13 14:36:41', 3, NULL, NULL),
(10, 'Radiology', 11, 6, 1000, '2025-01-13', '2:00 PM', '2025-01-16 05:52:04', 1, 1, NULL, 2, NULL, NULL),
(11, 'Internal Medicine', 15, 6, 900, '2025-01-13', '4:00 PM', '2025-01-16 05:53:06', 1, 1, NULL, 3, NULL, NULL),
(12, 'Internal Medicine', 15, 4, 900, '2025-01-13', '12:45 PM', '2025-01-16 05:54:32', 1, 1, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `specilization` varchar(255) DEFAULT NULL,
  `doctorName` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `docFees` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `docEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `specilization`, `doctorName`, `address`, `docFees`, `contactno`, `docEmail`, `password`, `creationDate`, `updationDate`) VALUES
(8, 'ENT', 'Lok Ram Verma', 'Nepalgunj Medical College', '700', 9812345678, 'lok123@gmail.com', 'dd03324a84dd549ad4ed21c3fc743c65', '2024-11-09 09:50:26', NULL),
(9, 'ENT', 'Ajay Vaishya', 'Bheri Zonal Hospital, Nepal', '500', 123456789, 'ajay123@gmail.com', '0fe90ff7501094dbbd19de2855384add', '2024-11-15 12:35:25', NULL),
(10, 'Orthopedics', 'Tirthendra Khadka', 'Mama medical, Baskota market, Nepalgunj', '1500', 11111, 'tirthendra@gmail.com', '0f7c1fa9f4cdbae6dc1cfc1ea8af5bcc', '2024-11-15 13:32:47', NULL),
(11, 'Radiology', 'Gopal Shrestha', 'Panas Pharmaceuticals Pvt. Ltd., Nepal', '1000', 1111122222, 'gopal123@gmail.com', 'adf094199668a24130b81dec564db41e', '2024-11-15 13:46:37', NULL),
(12, 'Obstetrics and Gynecology', 'Binod Kumar Mahaseth', 'Nepalgunj Medical College', '600', 2222233333, 'binod123@gmail.com', '07b99970fe052986b4b5b0f48f9de717', '2024-11-15 14:00:16', NULL),
(13, 'Dental Care', 'Ram Krishna Lamichhane', 'Bir Dental Clinic, Sadarline, Nepalgunj', '900', 81532375, 'ram123@gmail.com', '6a557ed1005dddd940595b8fc6ed47b2', '2024-11-15 14:31:28', NULL),
(14, 'General Surgery', 'Praveen Gupta', 'Kripa Hospital, Adarsh Nagar-10, Nepalgunj', '1500', 3333344444, 'praveen123@gmail.com', '015e09fda27aee6e76a6067ad2839d43', '2024-11-15 14:42:33', NULL),
(15, 'Internal Medicine', 'Tanveer Ahmed Khan', ' Nepalgunj Medical Collage ', '900', 1111122222, 'tanver123@gmail.com', 'a0168a4189526d126c9999799b2d2508', '2025-01-11 14:31:00', NULL),
(16, 'Dermatology', 'Kritipal Subedi', 'Charbahini Road, Nepalgunj', '1500', 1111111111, 'kritipal123@gmail.com', '7df55fa652441cc0557caa625d68bc85', '2025-01-11 14:35:27', NULL),
(17, 'Pediatrics', 'Vinayak Regmi', 'Nepalgunj', '800', 2222222222, 'vinayak123@gmail.com', '332f87a9e3aadda67b0214d83e2d6b6b', '2025-01-11 14:38:55', NULL),
(18, 'Ophthalmology', 'Binod Thapa', 'Vision Eye Hospital, Bp chowk, npj', '1400', 33333333333, 'binod@gmail.com', 'fcf1b585f20b25f91f08024162c45492', '2025-01-11 14:46:14', '2025-01-12 08:44:17'),
(19, 'Anesthesia', 'Kalpana Thapa', 'Western Hospital, Charbahini Road10 , Npj', '2000', 444444444444, 'kalpana123@gmail.com', 'bb2b7dd7c48d58052e01245cadaafc20', '2025-01-11 14:49:55', NULL),
(20, 'Endocrinologists', 'Dipendra Khadka', 'Liver Care, Ratna Rajmarg, Nepalgunj', '3000', 55555555555, 'dipendra@gmail.com', '77e77489db963d98e5ae26c1662e00b8', '2025-01-11 14:55:38', NULL),
(21, 'Neurologists', 'Tanveer Ahmed Khan', 'Dr. Tanveer Ahmed Khan Clinic, npj', '2500', 1111122222, 'tanver@gmail.com', 'a0168a4189526d126c9999799b2d2508', '2025-01-11 15:00:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctorslog`
--

CREATE TABLE `doctorslog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctorslog`
--

INSERT INTO `doctorslog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(9, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2024-11-15 12:43:06', NULL, 1),
(10, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2024-11-15 12:52:49', NULL, 1),
(11, 13, 'ram123@gmail.com', 0x3a3a3100000000000000000000000000, '2024-11-15 16:28:20', NULL, 1),
(12, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2024-11-15 16:33:18', NULL, 1),
(13, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2024-12-02 12:20:44', NULL, 1),
(14, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-09 15:24:52', NULL, 1),
(15, 13, 'ram123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-09 17:21:46', NULL, 1),
(16, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-09 17:24:13', NULL, 1),
(17, 13, 'ram123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-10 07:21:15', '10-01-2025 12:52:17 PM', 1),
(18, 13, 'ram123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-10 10:25:00', NULL, 1),
(19, 13, 'ram123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-10 10:54:46', NULL, 1),
(20, 13, 'ram123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-10 11:17:10', NULL, 1),
(21, 13, 'ram123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-11 09:11:18', NULL, 1),
(22, 13, 'ram123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-11 09:56:28', NULL, 1),
(23, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-11 10:03:22', NULL, 1),
(24, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-11 12:14:28', '11-01-2025 06:51:30 PM', 1),
(25, 13, 'ram123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 06:47:45', NULL, 1),
(26, 9, 'ajay123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 07:59:05', NULL, 1),
(27, NULL, 'trithendra@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 08:08:27', NULL, 0),
(28, 10, 'tirthendra@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 08:09:00', NULL, 1),
(29, 11, 'gopal123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 08:11:47', NULL, 1),
(30, 14, 'praveen123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 08:15:33', NULL, 1),
(31, 12, 'binod123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 08:19:34', NULL, 1),
(32, 15, 'tanver123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 08:22:41', NULL, 1),
(33, 16, 'kritipal123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 08:25:40', NULL, 1),
(34, 17, 'vinayak123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 08:28:43', NULL, 1),
(35, 19, 'kalpana123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 08:33:59', NULL, 1),
(36, NULL, 'dipendra@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 08:37:17', NULL, 0),
(37, 20, 'dipendra@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 08:37:41', NULL, 1),
(38, 21, 'tanver@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 08:39:51', NULL, 1),
(39, NULL, 'binodthapa@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 08:44:46', NULL, 0),
(40, 18, 'binod@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 08:45:26', NULL, 1),
(41, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 10:37:48', NULL, 1),
(42, 13, 'ram123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 10:39:41', '12-01-2025 04:37:59 PM', 1),
(43, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 11:09:59', NULL, 1),
(44, 13, 'ram123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 11:40:06', NULL, 1),
(45, 20, 'dipendra@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 13:20:48', NULL, 1),
(46, 13, 'ram123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 16:28:21', NULL, 1),
(47, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 17:09:18', NULL, 1),
(48, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 05:41:30', NULL, 1),
(49, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 08:17:17', NULL, 1),
(50, 13, 'ram123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 08:26:34', NULL, 1),
(51, 13, 'ram123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 09:18:12', NULL, 1),
(52, 13, 'ram123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 09:30:18', NULL, 1),
(53, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 09:34:32', NULL, 1),
(54, 14, 'praveen123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 09:54:13', NULL, 1),
(55, 14, 'praveen123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 10:04:20', NULL, 1),
(56, 14, 'praveen123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 11:12:33', NULL, 1),
(57, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 11:13:54', NULL, 1),
(58, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 11:22:21', NULL, 1),
(59, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 11:40:45', NULL, 1),
(60, 14, 'praveen123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 14:29:43', '13-01-2025 08:02:01 PM', 1),
(61, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 14:34:15', '13-01-2025 09:01:01 PM', 1),
(62, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 16:39:20', NULL, 1),
(63, 13, 'ram123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 17:06:07', NULL, 1),
(64, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 17:22:33', NULL, 1),
(65, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-14 05:55:37', NULL, 1),
(66, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-14 07:10:19', NULL, 1),
(67, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-14 08:31:06', NULL, 1),
(68, NULL, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-16 05:47:09', NULL, 0),
(69, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-16 05:47:21', NULL, 1),
(70, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-16 05:49:44', NULL, 1),
(71, 15, 'tanver123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-16 06:02:04', NULL, 1),
(72, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-16 06:06:53', NULL, 1),
(73, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-21 07:28:18', NULL, 1),
(74, 13, 'ram123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-21 09:42:02', NULL, 1),
(75, 8, 'lok123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-22 10:52:54', '22-01-2025 04:23:16 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctorspecilization`
--

CREATE TABLE `doctorspecilization` (
  `id` int(11) NOT NULL,
  `specilization` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctorspecilization`
--

INSERT INTO `doctorspecilization` (`id`, `specilization`, `creationDate`, `updationDate`) VALUES
(1, 'Orthopedics', '2024-10-01 18:09:46', '2024-11-15 14:05:09'),
(2, 'Internal Medicine', '2024-10-08 18:09:46', '2024-11-01 09:26:56'),
(3, 'Obstetrics and Gynecology', '2024-10-10 18:09:46', '2024-11-02 09:26:56'),
(4, 'Dermatology', '2024-10-10 18:09:46', '2024-11-02 09:26:56'),
(5, 'Pediatrics', '2024-10-10 18:09:46', '2024-11-02 09:26:56'),
(6, 'Radiology', '2024-10-10 18:09:46', '2024-11-02 09:26:56'),
(7, 'General Surgery', '2024-10-10 18:09:46', '2024-11-02 09:26:56'),
(8, 'Ophthalmology', '2024-10-10 18:09:46', '2024-11-02 09:26:56'),
(9, 'Anesthesia', '2024-10-10 18:09:46', '2024-11-02 09:26:56'),
(11, 'ENT', '2024-10-10 18:09:46', '2024-11-02 09:26:56'),
(12, 'Dental Care', '2024-10-10 18:09:46', '2024-11-02 09:26:56'),
(14, 'Endocrinologists', '2024-10-10 18:09:46', '2024-11-02 09:26:56'),
(15, 'Neurologists', '2024-10-10 18:09:46', '2024-11-02 09:26:56');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactus`
--

CREATE TABLE `tblcontactus` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(12) DEFAULT NULL,
  `message` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `AdminRemark` mediumtext DEFAULT NULL,
  `LastupdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IsRead` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcontactus`
--

INSERT INTO `tblcontactus` (`id`, `fullname`, `email`, `contactno`, `message`, `PostingDate`, `AdminRemark`, `LastupdationDate`, `IsRead`) VALUES
(3, 'Nibodika Chaudhary', 'me.nibodika07@gmail.com', 9812441557, 'Your service is helpful to me', '2024-11-15 12:22:41', 'Thank you for your feedback', '2024-11-15 12:25:52', 1),
(4, 'Ram Krishna Lamichhane', 'ram@gmail.com', 1234567890, 'Please inform patient for timely checkup', '2025-01-10 07:28:08', 'xyz', '2025-01-11 09:51:16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblmedicalhistory`
--

CREATE TABLE `tblmedicalhistory` (
  `ID` int(10) NOT NULL,
  `PatientID` int(10) DEFAULT NULL,
  `BloodPressure` varchar(200) DEFAULT NULL,
  `BloodSugar` varchar(200) NOT NULL,
  `Weight` varchar(100) DEFAULT NULL,
  `Temperature` varchar(200) DEFAULT NULL,
  `MedicalPres` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblmedicalhistory`
--

INSERT INTO `tblmedicalhistory` (`ID`, `PatientID`, `BloodPressure`, `BloodSugar`, `Weight`, `Temperature`, `MedicalPres`, `CreationDate`) VALUES
(2, 3, '90/60 mmHg', '75 mg/dL', '44', '100.4 F', 'Acetaminophen', '2024-11-15 16:42:18'),
(3, 4, '90/60 mmHg', '70 mg/dL', '30', '98.4 F', 'Brush daily', '2025-01-13 17:08:49'),
(4, 5, '91/60 mmHg', '80 mg/dL', '50', '98.4 F', '1 dose of paracitamol', '2025-01-14 07:12:15');

-- --------------------------------------------------------

--
-- Table structure for table `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` varchar(200) DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT current_timestamp(),
  `OpenningTime` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`, `OpenningTime`) VALUES
(1, 'aboutus', 'About Us', '<ul style=\"padding: 10px; margin: 0; font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 1.6em; text-align: justify; background-color: #FFFFFF; color: #000000;\">\r\n    <li style=\"margin-bottom: 1em;\">\r\n        The Hospital Management System (HMS) is designed to replace the existing manual, paper-based system of any hospital. It efficiently manages key information such as patient details, room availability, staff schedules, and operating room usage. This digital solution aims to reduce time and resources, providing an efficient, cost-effective approach to hospital administration.\r\n    </li>\r\n    <li>\r\n        A significant part of any hospital\'s operations involves the acquisition, management, and timely retrieval of large volumes of information. This information includes patient personal information and medical history, staff details, room and ward scheduling, staff duty rosters, operating theater schedules, and various waiting lists. HMS automates these tasks, making the hospital’s operations more streamlined and error-free. It standardizes data, consolidates information, ensures data integrity, and minimizes inconsistencies for effective resource utilization.\r\n    </li>\r\n</ul>\r\n', NULL, NULL, '2020-05-20 07:21:52', NULL),
(2, 'contactus', 'Contact Details', 'Nepalgunj-12, banke, Nepal', 'nibodika@gmail.com', 9212456789, '2020-05-20 07:24:07', '9 am to 8 pm');

-- --------------------------------------------------------

--
-- Table structure for table `tblpatient`
--

CREATE TABLE `tblpatient` (
  `ID` int(10) NOT NULL,
  `Docid` int(10) DEFAULT NULL,
  `PatientName` varchar(200) DEFAULT NULL,
  `PatientContno` bigint(10) DEFAULT NULL,
  `PatientEmail` varchar(200) DEFAULT NULL,
  `PatientGender` varchar(50) DEFAULT NULL,
  `PatientAdd` mediumtext DEFAULT NULL,
  `PatientAge` int(10) DEFAULT NULL,
  `PatientMedhis` mediumtext DEFAULT NULL,
  `disease` text NOT NULL,
  `prescription` text NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpatient`
--

INSERT INTO `tblpatient` (`ID`, `Docid`, `PatientName`, `PatientContno`, `PatientEmail`, `PatientGender`, `PatientAdd`, `PatientAge`, `PatientMedhis`, `disease`, `prescription`, `CreationDate`, `UpdationDate`) VALUES
(3, 8, 'Nibodika Chaudhary', 9812441557, 'me.nibodika07@gmail.com', 'Female', 'Nepalgunj', 22, 'I\'m having a high fever', 'fever', 'aspirine', '2024-11-15 12:47:49', '2025-01-13 16:15:20'),
(4, 13, 'Arsiya Chaudhary', 9812441557, 'arsiya123@gmail.com', 'female', 'Lamahi, Dang', 8, 'Cavity', '', '', '2024-11-15 16:31:17', NULL),
(5, 8, 'Samir', 1234567890, 'samir123@gmail.com', 'male', 'Nepalgunj', 11, 'common cold', '', '', '2025-01-11 10:09:53', NULL),
(6, 9, 'Amit ', 9999999999, 'amit123@gmail.com', 'male', 'Belashpur, Nepalgunj', 23, 'Ear pain', '', '', '2025-01-12 08:00:13', NULL),
(7, 10, 'Manish Gurung', 1000000000, 'manish@gmail.com', 'male', 'Butwal', 22, 'Knee disjoin', '', '', '2025-01-12 08:10:49', NULL),
(8, 11, 'Naresh Singh Thakuri', 2000000000, 'naresh@gmail.com', 'male', 'Surkhet', 23, 'Shoulder pain', '', '', '2025-01-12 08:14:18', NULL),
(9, 14, 'Hemant Ale Magar', 3000000000, 'hemantale@gmail.com', 'male', 'Kohalpur', 22, 'Did leg surgery', '', '', '2025-01-12 08:18:06', NULL),
(10, 12, 'Alisha Thapa', 4000000000, 'alisha@gmail.com', 'female', 'Chitwan', 17, 'Mensuration pain', '', '', '2025-01-12 08:21:29', NULL),
(11, 15, 'Shova Bhulon', 5000000000, 'shova@gmail.com', 'female', 'Nepalgunj', 22, 'Gastritis', '', '', '2025-01-12 08:25:00', NULL),
(12, 16, 'Supriya Shrestha', 6000000000, 'supriya@gmail.com', 'female', 'Ithari', 20, 'Darkspot ', '', '', '2025-01-12 08:28:10', NULL),
(13, 17, 'Abinash Sharma', 7000000000, 'abinash@gmail.com', 'male', 'Janakpur', 6, 'Diarrhoea', '', '', '2025-01-12 08:31:20', NULL),
(14, 19, 'Sita Kc', 8000000000, 'sita@gmail.com', 'female', 'Ramnagar, Kohalpur', 15, 'Breathing problem', '', '', '2025-01-12 08:36:49', NULL),
(15, 20, 'Shyam Khadka', 9000000000, 'shyam@gmail.com', 'male', 'Charbahini, Nepalgunj', 18, 'Diabetes', '', '', '2025-01-12 08:39:23', NULL),
(16, 21, 'Gita Gurung', 4500000000, 'gita@gmail.com', 'female', 'Surkhet', 27, ' Spinal cord injury', '', '', '2025-01-12 08:42:34', NULL),
(17, 18, 'Sabita Tamang', 7777777777, 'sabita@gmail.com', 'female', 'Pokhara', 30, ' Eye surgery', '', '', '2025-01-12 08:48:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(4, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2024-11-09 09:41:49', NULL, 1),
(5, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2024-11-15 12:49:30', NULL, 1),
(6, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2024-11-15 12:59:23', NULL, 1),
(12, 4, 'arsiya123@gmail.com', 0x3a3a3100000000000000000000000000, '2024-11-15 16:22:10', NULL, 1),
(13, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2024-11-17 08:32:03', NULL, 1),
(14, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2024-12-02 12:36:42', NULL, 1),
(15, NULL, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2024-12-26 10:26:52', NULL, 0),
(16, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2024-12-26 10:27:12', NULL, 1),
(17, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-09 16:28:50', NULL, 1),
(18, 4, 'arsiya123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-09 16:56:10', NULL, 1),
(19, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-09 17:46:53', NULL, 1),
(20, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-09 17:49:07', '09-01-2025 11:35:37 PM', 1),
(21, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-10 07:23:34', NULL, 1),
(22, 6, 'janaki123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-10 11:15:06', NULL, 1),
(23, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-10 11:22:47', NULL, 1),
(24, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-11 09:58:11', NULL, 1),
(25, 7, 'rabithapa@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-11 13:53:48', NULL, 1),
(26, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 06:48:35', '12-01-2025 12:53:36 PM', 1),
(27, 7, 'rabithapa@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 07:23:50', NULL, 1),
(28, 4, 'arsiya123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 08:05:51', NULL, 1),
(29, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-12 16:44:02', NULL, 1),
(30, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 08:43:55', NULL, 1),
(31, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 09:33:14', NULL, 1),
(32, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 10:03:33', NULL, 1),
(33, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 11:13:09', NULL, 1),
(34, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 13:41:24', NULL, 1),
(35, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 15:32:43', NULL, 1),
(36, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 16:14:27', NULL, 1),
(37, NULL, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 16:45:43', NULL, 0),
(38, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 16:45:54', NULL, 1),
(39, 4, 'arsiya123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-13 17:13:05', NULL, 1),
(40, 4, 'arsiya123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-14 05:56:14', NULL, 1),
(41, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-14 08:30:15', NULL, 1),
(42, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-16 05:48:48', NULL, 1),
(43, 6, 'janaki123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-16 05:50:45', NULL, 1),
(44, 4, 'arsiya123@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-16 05:53:43', NULL, 1),
(45, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-16 05:59:21', NULL, 1),
(46, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-21 07:27:57', NULL, 1),
(47, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-21 09:40:04', NULL, 1),
(48, 3, 'me.nibodika07@gmail.com', 0x3a3a3100000000000000000000000000, '2025-01-22 10:52:04', '22-01-2025 04:22:41 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `address`, `city`, `gender`, `email`, `password`, `regDate`, `updationDate`) VALUES
(3, 'Nibodika Chaudhary', 'Nepal', 'Nepalgunj', 'female', 'me.nibodika07@gmail.com', 'bd6ec969a236b969635d96babe867e2f', '2024-11-09 09:40:55', NULL),
(4, 'Arsiya Chaudhary', 'Dang', 'Lamahi', 'female', 'arsiya123@gmail.com', '88da55abade25534e603d3e6ba0479f7', '2024-11-15 16:21:33', NULL),
(6, 'Janaki', 'Kohalpur', 'Nepalgunj', 'female', 'janaki123@gmail.com', 'f6dee9b07c672b5e2ad8f439d24b0536', '2025-01-10 11:14:31', NULL),
(7, 'Rabi Thapa', 'Nepal', 'Nepalgunj', 'male', 'rabithapa@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '2025-01-11 13:53:13', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctorslog`
--
ALTER TABLE `doctorslog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctorspecilization`
--
ALTER TABLE `doctorspecilization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactus`
--
ALTER TABLE `tblcontactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblmedicalhistory`
--
ALTER TABLE `tblmedicalhistory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpage`
--
ALTER TABLE `tblpage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpatient`
--
ALTER TABLE `tblpatient`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `doctorslog`
--
ALTER TABLE `doctorslog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `doctorspecilization`
--
ALTER TABLE `doctorspecilization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblcontactus`
--
ALTER TABLE `tblcontactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblmedicalhistory`
--
ALTER TABLE `tblmedicalhistory`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblpage`
--
ALTER TABLE `tblpage`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblpatient`
--
ALTER TABLE `tblpatient`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
