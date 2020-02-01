-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 11, 2020 at 09:17 PM
-- Server version: 10.3.17-MariaDB-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anwesha_2019`
--

-- --------------------------------------------------------

--
-- Table structure for table `accommodation`
--

CREATE TABLE `accommodation` (
  `id` int(11) NOT NULL,
  `anweshaid` varchar(7) NOT NULL,
  `names` varchar(109) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `amount_paid` float NOT NULL DEFAULT 0,
  `gender` varchar(1) NOT NULL,
  `booking_date` varchar(100) NOT NULL,
  `checkin_checkout` longtext DEFAULT NULL,
  `no_of_days` int(11) NOT NULL,
  `day1` tinyint(1) NOT NULL DEFAULT 0,
  `day2` tinyint(1) NOT NULL DEFAULT 0,
  `day3` tinyint(1) NOT NULL DEFAULT 0,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `permit` int(11) NOT NULL DEFAULT 1,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `second_name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '21b8acfc474802e2e0bd25a85f5e924e',
  `access_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `permit`, `email`, `first_name`, `second_name`, `position`, `phone`, `password`, `access_token`) VALUES
(5, 4, 'event@atm1504.in', 'Amartya', 'Mondal', 'Event Organisers', '8967570983', '21b8acfc474802e2e0bd25a85f5e924e', 'bf4059d977e15f7628d7dbb106944ec1'),
(6, 5, 'hospi@atm1504.in', 'Hospitality', 'Committee', 'Organisers', '1234567890', '21b8acfc474802e2e0bd25a85f5e924e', 'bf4059d977e15f7628d7dbb106944ec1'),
(1, 0, 'me@atm1504.in', 'Atreyee', 'Mukherjee', 'Super Admin', '8967570983', '21b8acfc474802e2e0bd25a85f5e924e', 'bf4059d977e15f7628d7dbb106944ec1'),
(4, 3, 'mpr@atm1504.in', 'MPR', 'People', 'MPR', '8967570983', 'a840e1b4c3ca50df067f4ec672272077', 'bf4059d977e15f7628d7dbb106944ec1'),
(3, 2, 'reg@atm1504.in', 'Amartya', 'Mondal', 'Registration Coordinator', '8967570983', '21b8acfc474802e2e0bd25a85f5e924e', 'bf4059d977e15f7628d7dbb106944ec1'),
(2, 1, 'reg_sub_cord@atm1504.in', 'Amartya', 'Mondal', 'Registration-Sub Coordinator', '8967570983', '21b8acfc474802e2e0bd25a85f5e924e', 'bf4059d977e15f7628d7dbb106944ec1');

-- --------------------------------------------------------

--
-- Table structure for table `ca_users`
--

CREATE TABLE `ca_users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `validation_code` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `phone` varchar(15) NOT NULL,
  `college` varchar(100) NOT NULL,
  `anweshaid` varchar(7) NOT NULL,
  `qrcode` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `gender` varchar(1) NOT NULL,
  `score` bigint(20) NOT NULL DEFAULT 0,
  `candidates` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ca_users`
--

INSERT INTO `ca_users` (`id`, `email`, `first_name`, `last_name`, `validation_code`, `active`, `phone`, `college`, `anweshaid`, `qrcode`, `date`, `gender`, `score`, `candidates`) VALUES
(5, 'dscappsocietyiitp@gmail.com', 'Amartya', 'Mondal', '0', 1, '8967571983', 'IIT Patna', 'ANW2002', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2002.png', '2019-11-05 22:12:36', 'm', 0, NULL),
(7, 'ashwingoyal805@gmail.com', 'Ashwin', 'Goyal', '0', 1, '9468968124', 'Indian Institute Of Technology Patna', 'ANW2004', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2004.png', '2019-11-07 17:52:25', 'm', 0, NULL),
(8, 'adarshrohit217@gmail.com', 'Adarsh', 'Chaudhary', '0', 1, '8827275145', 'Indian Institute of Technology, Patna', 'ANW2005', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2005.png', '2019-11-07 17:59:07', 'm', 0, NULL),
(9, 'vatsal.singhal.vs@gmail.com', 'Vatsal', 'Singhal', '0', 1, '8585992062', 'IIT Patna', 'ANW2006', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2006.png', '2019-11-07 18:12:06', 'm', 0, NULL),
(11, 'pranaykgupta21@gmail.com', 'Pranay', 'Gupta', '0', 1, '9354008441', 'IIT Patna', 'ANW2008', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2008.png', '2019-11-07 18:57:00', 'm', 0, NULL),
(15, 'nadnaksdnawkl@gmail.com', 'Rahul', 'Kumar', 'e25815f46c73481f4e2ed5d7741363bc', 0, '8169154128', 'BCE', 'ANW2012', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2012.png', '2019-11-07 19:52:31', 'm', 0, NULL),
(17, 'kartiksingh145@gmail.com', 'kartik', 'singh', '0', 1, '8077516207', 'IIT Patna', 'ANW2014', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2014.png', '2019-11-10 19:34:14', 'm', 0, NULL),
(18, 'snehilchhabra@gmail.com', 'Gurneet', 'Chhabra', '0', 1, '9801028877', 'Babu Banarsi Das University', 'ANW2015', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2015.png', '2019-11-11 20:46:11', 'm', 100, NULL),
(19, 'narayankr09072000@gmail.com', 'NARAYAN', 'KUMAR', '0', 1, '8809553224', 'BAKHATIYARPUR COLLEGE OF ENGINEERING', 'ANW2016', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2016.png', '2019-11-12 11:01:40', 'm', 100, NULL),
(20, 'natusvincereclothings@gmail.com', 'Natus', 'Vincere', '0', 1, '9304136122', 'ITUS', 'ANW2017', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2017.png', '2019-11-12 12:05:36', 'm', 100, NULL),
(21, 'himgupta134@gmail.com', 'Himanshu', 'Gupta', '0', 1, '9521205729', 'IIT Patna', 'ANW2018', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2018.png', '2019-11-12 12:51:56', 'm', 0, NULL),
(22, 'ansarimiraz584@gmail.com', 'MOHAMMED', 'MIRAZUDDIN ANSARI ', '0', 1, '7318155096', 'NIT RAIPUR ', 'ANW2019', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2019.png', '2019-11-12 12:55:05', 'm', 100, NULL),
(23, 'shekhar420friend@gmail.com', 'Shekhar', 'Kumar', '0', 1, '7903933705', 'Birla Institute Of Technology , Mesra, Off Campus Patna', 'ANW2020', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2020.png', '2019-11-12 13:09:49', 'm', 100, NULL),
(24, 'aliasgarbadri5352@gmail.com', 'Aliasgar', 'Badri', '0', 1, '7265905821', 'Government Engineering College Gandhinagar', 'ANW2021', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2021.png', '2019-11-12 13:21:39', 'm', 270, NULL),
(25, 'souravinuk@gmail.com', 'Sourav', 'Bhatta', '0', 1, '8299878406', 'Kanpur University', 'ANW2022', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2022.png', '2019-11-12 13:22:47', 'm', 120, NULL),
(26, 'arunshankarpandey2001@gmail.com', 'Arun', 'Pandey', '0', 1, '8200375959', 'GEC daman', 'ANW2023', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2023.png', '2019-11-12 13:23:04', 'm', 100, NULL),
(27, 'triinsiagle@gmail.com', 'Susanka', 'Majumder', '0', 1, '7005060846', 'JADAVPUR UNIVERSITY', 'ANW2024', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2024.png', '2019-11-12 13:32:02', 'm', 160, NULL),
(28, 'mrityunjaykr2040@gmail.com', 'MRITYUNJAY', 'KUMAR', '0', 1, '7250051121', 'NALANDA COLLEGE OF ENGINEERING CHANDI NALANDA', 'ANW2025', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2025.png', '2019-11-12 13:34:59', 'm', 100, NULL),
(29, 'jays5267@gmail.com', 'JAY', 'PRAKASH', '0', 1, '6202031640', 'A.N.College, patna', 'ANW2026', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2026.png', '2019-11-12 14:00:02', 'm', 100, NULL),
(30, 'yadavsaurav1102@gmail.com', 'Saurav', 'Yadav', '0', 1, '6204168075', 'BIT PATNA', 'ANW2027', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2027.png', '2019-11-12 14:20:04', 'm', 100, NULL),
(31, 'alokspmuz143@gmail.com', 'ALOK', 'KUMAR', '0', 1, '8427063168', 'Sitamarhi Institute Of Technology, Gosainpur,Dumra', 'ANW2028', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2028.png', '2019-11-12 14:46:12', 'm', 100, NULL),
(32, 'rahuldubey.manit@gmail.com', 'Rahul', 'dubey', '0', 1, '9340386377', 'MANIT BHOPAL', 'ANW2029', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2029.png', '2019-11-12 14:51:53', 'm', 100, NULL),
(33, 'priyanshuyadav611@gmail.com', 'Priyanshu', 'Yadav', '444bb5bd47df7d63d6fde4d5d51db352', 0, '7089471149', 'Nit bhopal', 'ANW2030', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2030.png', '2019-11-12 14:52:50', 'm', 0, NULL),
(34, 'shivpreetshrm@gmail.com', 'Shivpreet', 'Sharma', '0', 1, '8269502154', 'RD engineering', 'ANW2031', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2031.png', '2019-11-12 15:01:37', 'm', 100, NULL),
(35, 'ritikbond07@gmail.com', 'Ritik', 'Rochlani', '0', 1, '8077182747', 'Manit Bhopal', 'ANW2032', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2032.png', '2019-11-12 15:03:11', 'm', 100, NULL),
(36, 'lahariya.pankaj.785@gmail.com', 'Pankaj lahariya', 'lahariya', '42a0210de7e962f80ca4245c81bb0d42', 0, '9584423225', 'Manit bhopal', 'ANW2033', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2033.png', '2019-11-12 15:06:04', 'm', 0, NULL),
(37, 'aryansprince49@gmail.com', 'Aryan', ' S Prince', '0', 1, '8448201417', 'K k group of institutions', 'ANW2034', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2034.png', '2019-11-12 15:08:32', 'm', 100, NULL),
(38, 'sk15848@gmail.com', 'Shubham', 'Kumar', '0', 1, '7277418728', 'LNMI, PATNA', 'ANW2035', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2035.png', '2019-11-12 15:13:02', 'm', 100, NULL),
(39, 'ry9824776731@gmail.com', 'Ritesh', 'Yadav', '0', 1, '7820927305', 'Nit goa', 'ANW2036', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2036.png', '2019-11-12 15:15:02', 'm', 100, NULL),
(40, 'prithviraj.tiwari226@gmail.com', 'Prithviraj', 'Tiwari', '0', 1, '8982698878', 'Shaheed Bhagat Singh College, Delhi University', 'ANW2037', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2037.png', '2019-11-12 15:47:08', 'm', 1100, NULL),
(41, 'sk9220449@gmail.com', 'Shivam', 'Kumar', '0', 1, '8987268454', 'Manit, Bhopal', 'ANW2038', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2038.png', '2019-11-12 16:18:17', 'm', 100, NULL),
(42, 'saurabhsingh8604@gmail.com', 'Saurabh', 'Singh', '0', 1, '9369171910', 'NIT BHOPAL', 'ANW2039', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2039.png', '2019-11-12 16:24:54', 'm', 100, NULL),
(43, 'aditya.mishra6752@gmail.com', 'Aditya', 'Niranjan Mishra', '0', 1, '8824893907', 'Maulana Azad national institute of technology bhopal', 'ANW2040', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2040.png', '2019-11-12 16:35:57', 'm', 100, NULL),
(44, 'shubhamfozdar21032000@gmail.com', 'Shubham', 'Fozdar', '0', 1, '7600768367', 'Government Engineering College , Daman', 'ANW2041', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2041.png', '2019-11-12 16:42:39', 'm', 100, NULL),
(45, 'divyanshu.kr10@gmail.com', 'Divyanshu', 'Kumar', '0', 1, '7368063643', 'Birla Institute of Technology, Patna', 'ANW2042', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2042.png', '2019-11-12 18:15:00', 'm', 100, NULL),
(46, 'vinishbhaskar321@gmail.com', 'Vinish', 'Bhaskar', '0', 1, '9097053628', 'Government Engineering college, Vaishali', 'ANW2043', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2043.png', '2019-11-12 18:16:37', 'm', 100, NULL),
(47, 'ankitpatil12345.ap@gmail.com', 'ANKIT', 'PATIL', '0', 1, '6261111249', 'SHAHEED BHAGAT SINGH EVENING COLLEGE', 'ANW2044', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2044.png', '2019-11-13 00:59:52', 'm', 100, NULL),
(48, 'mdarshadkhan9504@gmail.com', 'Arshad', 'Khan', '0', 1, '9504895514', 'Nielit', 'ANW2045', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2045.png', '2019-11-13 03:10:46', 'm', 100, NULL),
(49, 'alok972516@gmail.com', 'ALOK', 'RAJ', '0', 1, '7033342231', 'Galgotias university', 'ANW2046', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2046.png', '2019-11-13 05:32:49', 'm', 100, NULL),
(50, 'shamsshahrukh20@gmail.com', 'Md shams', 'Shahrukh', '0', 1, '9955448877', 'NIELIT college', 'ANW2047', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2047.png', '2019-11-13 06:19:47', 'm', 100, NULL),
(51, 'agrawal_aman.ghrcecs@raisoni.net', 'Aman', 'Agarawal', '03ed6b4d70a736b191974cb8349f7008', 0, '7769877704', 'G.H. Raisoni College of engineering, nagpur', 'ANW2048', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2048.png', '2019-11-13 07:11:31', 'm', 0, NULL),
(52, 'priyasingh27m@gmail.com', 'Anjali', 'Singh', '0', 1, '8303808110', 'Shambhunath Institute of Engineering and Technology', 'ANW2049', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2049.png', '2019-11-13 07:28:36', 'f', 100, NULL),
(53, 'amalsharma500@gmail.com', 'Amal', 'Sharma', '0', 1, '7355661642', 'CSJMU, Kanpur', 'ANW2050', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2050.png', '2019-11-13 08:58:31', 'm', 100, NULL),
(54, 'vikramkumarsanchor@gmail.com', 'Vikram ', 'Kumar ', '24e6ba05507d69e8ebc2515c96f15805', 1, '7665598936', 'Chartered institute of technology Abu Road', 'ANW2051', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2051.png', '2019-11-13 10:51:18', 'm', 380, NULL),
(55, 'hkushwaha051@gmail.com', 'Himanshu', 'Kushwaha', '0', 1, '8299846972', 'Narina group of instituion', 'ANW2052', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2052.png', '2019-11-13 11:25:30', 'm', 100, NULL),
(56, '12rajkishan2001@gmail.com', 'Raj', 'Kishan', '0', 1, '6299164046', 'Indian Institute of Petroleum and Energy', 'ANW2053', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2053.png', '2019-11-13 12:15:26', 'm', 100, NULL),
(57, 'sahilrajind@gmail.com', 'SAHIL', 'RAJ', '0', 1, '9060585312', 'Bakhtiyarpur college of engineering', 'ANW2054', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2054.png', '2019-11-13 16:20:58', 'm', 850, NULL),
(58, 'namanraj4094@gmail.com', 'Naman ', 'Raj', '0', 1, '6200532158', 'Darbhanga College of engineering, darbhanga', 'ANW2055', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2055.png', '2019-11-13 16:53:59', 'm', 100, NULL),
(59, 'yasharth@outlook.com', 'Yasharth', 'Kumar Srivastava', '0', 1, '8840351307', 'Sampurnanand Sanskrit University', 'ANW2056', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2056.png', '2019-11-14 00:33:36', 'm', 280, NULL),
(60, 'sk4830812@gmail.com', 'Sachin', 'Kumar', '0', 1, '6205165352', 'Bakhtiyarpur college of engineering ', 'ANW2057', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2057.png', '2019-11-14 13:29:47', 'm', 100, NULL),
(61, 'vikram.veer162@gmail.com', 'Veer', 'Vikram', '0', 1, '9875706822', 'Bce patna', 'ANW2058', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2058.png', '2019-11-14 13:34:23', 'm', 100, NULL),
(62, 'shailendra3112choudhary@gmail.com', 'SHAILENDRA', 'CHOUDHARY', '0', 1, '9165811748', 'Maulana Azad National Institute of Technology', 'ANW2059', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2059.png', '2019-11-14 13:45:12', 'm', 100, NULL),
(63, 'anshikakhanijou0120@gmail.com', 'Anshika', 'Khanijou', '0', 1, '9306778443', 'MCM DAV COLLEGE SEC 36A CHD', 'ANW2060', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2060.png', '2019-11-14 19:57:52', 'f', 100, NULL),
(64, 'alokk9286@gmail.com', 'Alok', 'Kumar', '0', 1, '7562970971', 'NSIT', 'ANW2061', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2061.png', '2019-11-15 03:16:39', 'm', 290, NULL),
(65, 'meenuharinandansingh@gmail.com', 'Meenu Singh', 'Harinandan Singh', '0', 1, '9049103332', 'BCE Bakhtiyarpur', 'ANW2062', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2062.png', '2019-11-15 12:36:55', 'f', 100, NULL),
(66, 'himanshubhushan21@gmail.com', 'Himanshu ', 'Bhushan', '0', 1, '9199103848', 'Heritage Institute Of Technology', 'ANW2063', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2063.png', '2019-11-28 17:56:34', 'm', 100, NULL),
(67, 'adi.aditisinha29@gmail.com', 'ADITI', 'SINHA', '0', 1, '6299552549', 'BIT Patna', 'ANW2064', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2064.png', '2019-12-01 16:55:05', 'f', 100, NULL),
(68, 'shubham04jan@gmail.com', 'Shubham', 'Kumar', '0', 1, '9110035665', 'Stcet', 'ANW2065', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2065.png', '2019-12-09 22:22:34', 'm', 100, NULL),
(69, 'sauravparmar121@gmail.com', 'Saurav', 'Kumar', '0', 1, '7870104681', 'Muzaffarpur institute of Technology, Muzaffarpur', 'ANW2066', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2066.png', '2019-12-10 17:33:06', 'm', 100, NULL),
(70, 'ofamanjha@gmail.com', 'Aman', 'Jha', '0', 1, '7367957409', 'BCE Patna ', 'ANW2067', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2067.png', '2019-12-10 18:13:34', 'm', 1500, NULL),
(71, 'amritsaurabh2000@gmail.com', 'Saurabh', 'Amrit', '0', 1, '9308106489', 'BCE Patna', 'ANW2068', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2068.png', '2019-12-11 01:08:59', 'm', 100, NULL),
(72, 'nikspotter1@gmail.com', 'NIKHILESH', 'PRAJAPATI', '0', 1, '7379476278', 'BHU', 'ANW2069', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2069.png', '2019-12-11 08:58:45', 'm', 920, NULL),
(73, 'abhimanyuroy335@gmail.com', 'Abhimanyu', 'Roy', '0', 1, '8847839775', 'C.V.Raman College of Engineering', 'ANW2070', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2070.png', '2019-12-14 22:38:47', 'm', 100, NULL),
(74, 'rsambhari@gmail.com', 'Riecha', 'Sambhari', '0', 1, '9304661947', 'Magadh Mahila College , Patna University', 'ANW2071', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2071.png', '2019-12-15 14:48:16', 'f', 100, NULL),
(75, 'akanshjain139@gmail.com', 'Akansh', 'Jain', '0', 1, '8458892652', 'Hidayatullah National law University, Naya Raipur', 'ANW2072', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2072.png', '2019-12-16 08:55:53', 'm', 100, NULL),
(76, 'pushpajkumarpushpam@gmail.com', 'Pushpaj', 'Kumar', '0', 1, '9151170970', 'Gaya college gaya ', 'ANW2073', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2073.png', '2019-12-16 19:20:42', 'm', 100, NULL),
(77, 'rishav.raj179@gmail.com', 'Rishabh', 'Raj', '0', 1, '7004925331', 'B.I.T Mesra, Patna campus', 'ANW2074', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2074.png', '2019-12-17 06:09:58', 'm', 100, NULL),
(78, 'mratyunjay5897@gmail.com', 'Mratyunjay ', 'Bhardwaj ', '0', 1, '8707058283', 'BBD NIIT', 'ANW2075', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2075.png', '2019-12-26 09:01:00', 'm', 300, NULL),
(79, 'ak9504496@gmail.com', 'Abhishek ', 'Kumar', '0', 1, '8210370389', 'NSIT, BIHTA, PATNA', 'ANW2076', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2076.png', '2019-12-26 10:08:30', 'm', 100, NULL),
(80, 'shrivastava74795@gmail.com', 'pankaj', 'kishor', '0', 1, '7479530699', 'Anugrah narayan college patna', 'ANW2077', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2077.png', '2019-12-28 11:21:11', 'm', 180, NULL),
(81, 'rahulkumar16rarkr@gmail.com', 'ADITYA ', 'KUMAR GUPTA ', '9443b5921ed872d0bfa2bb3443a932ce', 0, '8540938944', 'BIRLA INSTITUTE OF TECHNOLOGY, PATNA', 'ANW2078', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2078.png', '2019-12-28 18:11:37', 'm', 0, NULL),
(82, 'rahulkumar16rakr@gmail.com', 'Aditya ', 'Kumar Gupta', '0', 1, '8450938944', 'Birla Institute of Technology Mesra,Patna', 'ANW2079', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2079.png', '2019-12-28 18:33:21', 'm', 100, NULL),
(83, 'mananjain262@gmail.com', 'Manan', 'Jain', '0', 1, '9058309857', 'Hansraj College, Delhi University', 'ANW2080', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2080.png', '2019-12-29 18:28:53', 'm', 630, NULL),
(84, 'hayyoulistentome@gmail.com', 'Amartya', 'Mondal', '0', 1, '8967570983', 'IIT Patna', 'ANW2081', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2081.png', '2019-12-30 06:32:13', 'm', 0, NULL),
(85, 'sahilmasoom971@gmail.com', 'Sahil', 'Masoom', '9263d94777176d0829fbb7f41931290d', 0, '8229025562', 'IIT PATNA', 'ANW2082', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2082.png', '2019-12-30 07:20:50', 'm', 0, NULL),
(86, 'pikuthecutest@gmail.com', 'Shreya', 'Kumari', '0', 1, '9599357387', 'IGIMS Patna ', 'ANW2083', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2083.png', '2019-12-30 07:21:52', 'f', 100, NULL),
(87, 'riyalal23@gmail.com', 'Riya', 'Lal', '0', 1, '6205583459', 'Nift, Patna', 'ANW2084', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2084.png', '2019-12-30 08:19:29', 'f', 100, NULL),
(88, 'akaris827@gmail.com', 'Akash', 'Singh', '0', 1, '7903811445', 'NIFT PATNA', 'ANW2085', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2085.png', '2019-12-30 13:45:03', 'm', 100, NULL),
(89, 'anuragrpsmdb@gmail.com', 'Anurag', 'Kumar', 'f5d7adcac958baaf72bae827beaae030', 0, '7903959980', 'Muzaffarpur institute of technology', 'ANW2086', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2086.png', '2020-01-03 14:59:28', 'm', 0, NULL),
(90, 'noorinriyaaiimsp16@gmail.com', 'NOORIN', 'RIYA', '0', 1, '9400987659', 'AIIMS PATNA', 'ANW2087', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2087.png', '2020-01-03 15:22:23', 'f', 100, NULL),
(91, 'kartik.me17@iitp.ac.in', 'hero', 'nuka', '48a7f370c9a9bae01fe4e7b0a79a2e3d', 0, '1234567890', 'school', 'ANW2088', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2088.png', '2020-01-09 08:56:39', 'o', 0, NULL),
(92, '1801me14@iitp.ac.in', 'Amartya', 'Mondal', 'e43b8de0d93b38eec3c9a700824b9477', 1, '1234567823', 'IIT Patna', 'ANW2089', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2089.png', '2020-01-09 16:57:22', 'm', 0, NULL),
(93, 'vsubhang4@gmail.com', 'Subhang', 'Vasireddy', '0', 1, '8978880947', 'IIT Patna', 'ANW2090', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2090.png', '2020-01-09 18:13:52', 'm', 100, NULL),
(94, 'iitpatnaanwesha@gmail.com', 'Fake ', 'entry', '0', 1, '1234567892', 'IITP', 'ANW2091', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2091.png', '2020-01-09 18:21:38', 'm', 100, NULL),
(95, 'tkartik340@gmail.com', 'kannu', 'singh', '0', 1, '1425412551', 'iitp', 'ANW2092', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2092.png', '2020-01-09 18:48:30', 'm', 100, NULL),
(96, 'intekhab085@gmail.com', 'Md Intekhab', 'Alam', '0', 1, '8002889586', 'Bakhtiyarpur College Of Engineering', 'ANW2093', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2093.png', '2020-01-10 16:09:51', 'm', 100, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `ev_id` varchar(7) NOT NULL,
  `ev_category` varchar(252) NOT NULL,
  `ev_name` varchar(255) NOT NULL,
  `ev_description` text NOT NULL,
  `ev_organiser` varchar(255) NOT NULL,
  `ev_club` varchar(252) NOT NULL,
  `ev_org_phone` varchar(100) NOT NULL,
  `ev_poster_url` varchar(255) NOT NULL,
  `ev_rule_book_url` varchar(255) NOT NULL,
  `register_url` varchar(255) NOT NULL,
  `ev_date` varchar(50) NOT NULL,
  `ev_start_time` varchar(100) NOT NULL,
  `ev_end_time` varchar(100) NOT NULL,
  `ev_registrations` longtext DEFAULT NULL,
  `ev_participations` longtext DEFAULT NULL,
  `ev_amount` float NOT NULL DEFAULT 0,
  `ev_prize` varchar(100) DEFAULT NULL,
  `ev_venue` varchar(252) DEFAULT NULL,
  `map_url` varchar(255) DEFAULT NULL,
  `is_team_event` tinyint(1) NOT NULL DEFAULT 0,
  `team_members` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `validation_code` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `registration_desk` tinyint(1) NOT NULL DEFAULT 0,
  `phone` varchar(15) NOT NULL,
  `college` varchar(255) NOT NULL,
  `anweshaid` varchar(7) NOT NULL,
  `qrcode` varchar(255) NOT NULL,
  `added_by` varchar(255) NOT NULL DEFAULT 'admin',
  `ca_referral` varchar(8) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `events_registered` longtext DEFAULT NULL,
  `events_participated` longtext DEFAULT NULL,
  `gender` varchar(1) NOT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `registration_charge` float NOT NULL DEFAULT 0,
  `tshirt_charge` float NOT NULL DEFAULT 0,
  `events_charge` float NOT NULL DEFAULT 0,
  `accommodation_charge` float NOT NULL DEFAULT 0,
  `total_charge` float NOT NULL DEFAULT 0,
  `amount_paid` float NOT NULL DEFAULT 0,
  `checkin_checkout` longtext DEFAULT NULL,
  `iit_patna` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `validation_code`, `active`, `registration_desk`, `phone`, `college`, `anweshaid`, `qrcode`, `added_by`, `ca_referral`, `date`, `events_registered`, `events_participated`, `gender`, `access_token`, `registration_charge`, `tshirt_charge`, `events_charge`, `accommodation_charge`, `total_charge`, `amount_paid`, `checkin_checkout`, `iit_patna`) VALUES
(156, 'Amartya', 'Mondal', 'hayyoulistentome54@gmail.com', 'fc1d758f115a09819cf2da05ca0d1ffc', '1d4e032b1e0419631e967e0567a6e380', 0, 0, '8967570993', 'IIT Patna', 'ANW2000', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2000.png', 'admin', 'ANW1504', '2019-11-05 22:07:24', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(157, 'Amartya', 'Mondal', 'hayyoulistentome01@gmail.com', 'fc1d758f115a09819cf2da05ca0d1ffc', '408b1f3b27879d36d9ffec5440fdc4cf', 0, 0, '8967570989', 'IIT Patna', 'ANW2001', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2001.png', 'admin', 'ANW1504', '2019-11-05 22:08:29', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(160, 'Ashwin', 'Goyal', 'ashwingoyal805@gmail.com', '7814fe7da1df981e45333f7f0115453d', '0', 1, 0, '9468968124', 'Indian Institute Of Technology Patna', 'ANW2004', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2004.png', 'admin', NULL, '2019-11-07 17:52:25', NULL, NULL, 'm', '906f8c62dc411b481f2102dd11096132', 0, 0, 0, 0, 0, 0, NULL, 0),
(161, 'Adarsh', 'Chaudhary', 'adarshrohit217@gmail.com', '6fa77ae3904ad4663ae3250ef638c6f5', '0', 1, 0, '8827275145', 'Indian Institute of Technology, Patna', 'ANW2005', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2005.png', 'admin', NULL, '2019-11-07 17:59:06', NULL, NULL, 'm', '4ac70d6a48d1b1de5a74038968225db7', 0, 0, 0, 0, 0, 0, NULL, 0),
(162, 'Vatsal', 'Singhal', 'vatsal.singhal.vs@gmail.com', '24ec93b7233a323167345bcb5244921f', '0', 1, 0, '8585992062', 'IIT Patna', 'ANW2006', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2006.png', 'admin', NULL, '2019-11-07 18:12:06', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(163, 'Amartya', 'Mondal', 'hayyoulistentome1@gmail.com', 'fc1d758f115a09819cf2da05ca0d1ffc', '0', 1, 0, '4967570983', 'IIT Patna', 'ANW2007', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2007.png', 'admin', NULL, '2019-11-07 18:29:17', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(164, 'Pranay', 'Gupta', 'pranaykgupta21@gmail.com', 'cc19a7620a2f457c81509f15191ecca1', '0', 1, 0, '9354008441', 'IIT Patna', 'ANW2008', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2008.png', 'admin', NULL, '2019-11-07 18:57:00', NULL, NULL, 'm', 'd694872c11cb80f9adaa91b2ad02c00d', 0, 0, 0, 0, 0, 0, NULL, 0),
(165, 'Vatsal', 'Singhal', 'gamelemonizer@gmail.com', 'b22b0d1b5b1bfad0571ae9196f1561b0', '0', 1, 0, '9891252533', 'IIT Patna', 'ANW2009', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2009.png', 'admin', NULL, '2019-11-07 19:29:20', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(166, 'Amartya', 'Mondal', 'atm1504.in@gmail.com', 'fc1d758f115a09819cf2da05ca0d1ffc', '0', 1, 0, '7897570983', 'IIT Patna', 'ANW2010', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2010.png', 'admin', NULL, '2019-11-07 19:33:13', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(167, 'Vatsal', 'Singhal', 'kshitij898911@gmail.com', '5ab0fcbb5f62fad1292843121060a62a', '2fe7e1a18cb171f8adf348e428c964df', 1, 0, '9898985252', 'IIT Patna', 'ANW2011', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2011.png', 'admin', NULL, '2019-11-07 19:38:59', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(168, 'Rahul', 'Kumar', 'nadnaksdnawkl@gmail.com', 'afdd0b4ad2ec172c586e2150770fbf9e', 'e25815f46c73481f4e2ed5d7741363bc', 0, 0, '8169154128', 'BCE', 'ANW2012', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2012.png', 'admin', NULL, '2019-11-07 19:52:30', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(169, 'Fake ', 'entry', 'crackedgamers101@gmail.com', '9a9aee1450bad99dc0a7eda49ba8ea8c', '0', 1, 0, '7845478548', 'IITP', 'ANW2013', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2013.png', 'admin', NULL, '2019-11-10 14:55:24', NULL, NULL, 'm', 'b8c6562dfcc767a2c9e70d6c1954741c', 0, 0, 0, 0, 0, 0, NULL, 0),
(170, 'kartik', 'singh', 'kartiksingh145@gmail.com', '1a4a6ce43481ac2bff8433141d593134', '0', 1, 0, '8077516207', 'IIT Patna', 'ANW2014', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2014.png', 'admin', NULL, '2019-11-10 19:34:14', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(171, 'Gurneet', 'Chhabra', 'snehilchhabra@gmail.com', 'a1d76eadd99227abc714922a9308f1e6', '0', 1, 0, '9801028877', 'Babu Banarsi Das University', 'ANW2015', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2015.png', 'admin', NULL, '2019-11-11 20:46:11', NULL, NULL, 'm', '319b245a442a1785df4a43566fddea12', 0, 0, 0, 0, 0, 0, NULL, 0),
(172, 'NARAYAN', 'KUMAR', 'narayankr09072000@gmail.com', 'c032d45a36d05c5b98a088be8c98076e', '0', 1, 0, '8809553224', 'BAKHATIYARPUR COLLEGE OF ENGINEERING', 'ANW2016', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2016.png', 'admin', NULL, '2019-11-12 11:01:40', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(173, 'Natus', 'Vincere', 'natusvincereclothings@gmail.com', 'bc44f0f8c350d18180c938a5680d1b3c', '0', 1, 0, '9304136122', 'ITUS', 'ANW2017', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2017.png', 'admin', NULL, '2019-11-12 12:05:36', NULL, NULL, 'm', 'a6ea55dc976439d76cab3369795fdbe5', 0, 0, 0, 0, 0, 0, NULL, 0),
(174, 'Himanshu', 'Gupta', 'himgupta134@gmail.com', '2599424a80e525797770391e80b55a26', '0', 1, 0, '9521205729', 'IIT Patna', 'ANW2018', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2018.png', 'admin', NULL, '2019-11-12 12:51:56', NULL, NULL, 'm', '000316cb05654145c281e7e95f1cac25', 0, 0, 0, 0, 0, 0, NULL, 0),
(175, 'MOHAMMED', 'MIRAZUDDIN ANSARI ', 'ansarimiraz584@gmail.com', '4026d785fe6e56d5909b7987abfad4ef', '0', 1, 0, '7318155096', 'NIT RAIPUR ', 'ANW2019', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2019.png', 'admin', NULL, '2019-11-12 12:55:05', NULL, NULL, 'm', 'dc9f9f752f31a9dbf41248fb22c86ba3', 0, 0, 0, 0, 0, 0, NULL, 0),
(176, 'Shekhar', 'Kumar', 'shekhar420friend@gmail.com', '201349bafc9b3e7f076d506d3bb295cc', '0', 1, 0, '7903933705', 'Birla Institute Of Technology , Mesra, Off Campus Patna', 'ANW2020', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2020.png', 'admin', NULL, '2019-11-12 13:09:49', NULL, NULL, 'm', 'a9c72cffd078ae4e7a347d51b3a3891f', 0, 0, 0, 0, 0, 0, NULL, 0),
(177, 'Aliasgar', 'Badri', 'aliasgarbadri5352@gmail.com', '1a4fe3fe9233d990d04e816cd591d56e', '0', 1, 0, '7265905821', 'Government Engineering College Gandhinagar', 'ANW2021', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2021.png', 'admin', NULL, '2019-11-12 13:21:39', NULL, NULL, 'm', '46b81366adc65ae469b615c3ef5d669e', 0, 0, 0, 0, 0, 0, NULL, 0),
(178, 'Sourav', 'Bhatta', 'souravinuk@gmail.com', 'a5571be6db3b722a64ca6d9501eaa39a', '0', 1, 0, '8299878406', 'Kanpur University', 'ANW2022', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2022.png', 'admin', NULL, '2019-11-12 13:22:47', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(179, 'Arun', 'Pandey', 'arunshankarpandey2001@gmail.com', 'efcb23dab2fb213d58e96018c54bd67e', '0', 1, 0, '8200375959', 'GEC daman', 'ANW2023', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2023.png', 'admin', NULL, '2019-11-12 13:23:04', NULL, NULL, 'm', 'ae3856b2ac3952d0cde24e4610b159e2', 0, 0, 0, 0, 0, 0, NULL, 0),
(180, 'Susanka', 'Majumder', 'triinsiagle@gmail.com', 'e7c3afe98cc3af103c1b9e5650aa11c8', '0', 1, 0, '7005060846', 'JADAVPUR UNIVERSITY', 'ANW2024', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2024.png', 'admin', NULL, '2019-11-12 13:32:02', NULL, NULL, 'm', '05d766d7798c4e4f6ed1fc00fb1ee999', 0, 0, 0, 0, 0, 0, NULL, 0),
(181, 'MRITYUNJAY', 'KUMAR', 'mrityunjaykr2040@gmail.com', '52fce1c78e5e4216dd9636da0e9ba377', '0', 1, 0, '7250051121', 'NALANDA COLLEGE OF ENGINEERING CHANDI NALANDA', 'ANW2025', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2025.png', 'admin', NULL, '2019-11-12 13:34:59', NULL, NULL, 'm', '8701dcc5324794091b60bddaf24ff2a2', 0, 0, 0, 0, 0, 0, NULL, 0),
(182, 'JAY', 'PRAKASH', 'jays5267@gmail.com', 'c35c7d8afb7a14fe84366fac3d3728c3', '0', 1, 0, '6202031640', 'A.N.College, patna', 'ANW2026', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2026.png', 'admin', NULL, '2019-11-12 14:00:02', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(183, 'Saurav', 'Yadav', 'yadavsaurav1102@gmail.com', '2364a1bf533f2319c4bb55ec5c79a036', '0', 1, 0, '6204168075', 'BIT PATNA', 'ANW2027', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2027.png', 'admin', NULL, '2019-11-12 14:20:04', NULL, NULL, 'm', '75f5b3d487de31044ac8c0bd88f31fd1', 0, 0, 0, 0, 0, 0, NULL, 0),
(184, 'ALOK', 'KUMAR', 'alokspmuz143@gmail.com', 'e2c86e912c3e0c31180ba94feb77a270', '0', 1, 0, '8427063168', 'Sitamarhi Institute Of Technology, Gosainpur,Dumra', 'ANW2028', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2028.png', 'admin', NULL, '2019-11-12 14:46:12', NULL, NULL, 'm', '3cca97aba863a9312df582f1dd79e687', 0, 0, 0, 0, 0, 0, NULL, 0),
(185, 'Rahul', 'dubey', 'rahuldubey.manit@gmail.com', 'aba33d4cc5da87581c66d6040c650dac', '0', 1, 0, '9340386377', 'MANIT BHOPAL', 'ANW2029', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2029.png', 'admin', NULL, '2019-11-12 14:51:53', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(186, 'Priyanshu', 'Yadav', 'priyanshuyadav611@gmail.com', 'f9c149ae8f7197e8def03b754984ec0d', '444bb5bd47df7d63d6fde4d5d51db352', 0, 0, '7089471149', 'Nit bhopal', 'ANW2030', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2030.png', 'admin', NULL, '2019-11-12 14:52:50', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(187, 'Shivpreet', 'Sharma', 'shivpreetshrm@gmail.com', '0fff89ad74acd781906d2a1043e91e57', '0', 1, 0, '8269502154', 'RD engineering', 'ANW2031', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2031.png', 'admin', NULL, '2019-11-12 15:01:37', NULL, NULL, 'm', 'c95de7a0d1bdda29cd90a7588336be79', 0, 0, 0, 0, 0, 0, NULL, 0),
(188, 'Ritik', 'Rochlani', 'ritikbond07@gmail.com', '5f62e9913ea20dde0e23028f99ea1722', '0', 1, 0, '8077182747', 'Manit Bhopal', 'ANW2032', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2032.png', 'admin', NULL, '2019-11-12 15:03:11', NULL, NULL, 'm', '72ef3bfa20dbb7f780fe653fa45bc17b', 0, 0, 0, 0, 0, 0, NULL, 0),
(189, 'Pankaj lahariya', 'lahariya', 'lahariya.pankaj.785@gmail.com', '89770dfe7d2436f8a300c7d85db10d38', '42a0210de7e962f80ca4245c81bb0d42', 0, 0, '9584423225', 'Manit bhopal', 'ANW2033', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2033.png', 'admin', NULL, '2019-11-12 15:06:04', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(190, 'Aryan', ' S Prince', 'aryansprince49@gmail.com', 'b4695d99d1151d3c095cd6589b3ac8ae', '0', 1, 0, '8448201417', 'K k group of institutions', 'ANW2034', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2034.png', 'admin', NULL, '2019-11-12 15:08:32', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(191, 'Shubham', 'Kumar', 'sk15848@gmail.com', '5559e198d7a24841cae9cf5bf1f1d89e', '0', 1, 0, '7277418728', 'LNMI, PATNA', 'ANW2035', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2035.png', 'admin', NULL, '2019-11-12 15:13:02', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(192, 'Ritesh', 'Yadav', 'ry9824776731@gmail.com', '2ab7e4e8a6384a74d8e89b12d20a7336', '0', 1, 0, '7820927305', 'Nit goa', 'ANW2036', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2036.png', 'admin', NULL, '2019-11-12 15:15:02', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(193, 'Prithviraj', 'Tiwari', 'prithviraj.tiwari226@gmail.com', 'db64dfeffb27c017bde58b8c7c922956', '0', 1, 0, '8982698878', 'Shaheed Bhagat Singh College, Delhi University', 'ANW2037', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2037.png', 'admin', NULL, '2019-11-12 15:47:08', NULL, NULL, 'm', 'f58622afe51291e91fdcfb72bf35124c', 0, 0, 0, 0, 0, 0, NULL, 0),
(194, 'Shivam', 'Kumar', 'sk9220449@gmail.com', '180b4ca864454faa0690d72c107301b8', '0', 1, 0, '8987268454', 'Manit, Bhopal', 'ANW2038', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2038.png', 'admin', NULL, '2019-11-12 16:18:17', NULL, NULL, 'm', 'ea9183c531a7a5851fd6c53fe4f3a48e', 0, 0, 0, 0, 0, 0, NULL, 0),
(195, 'Saurabh', 'Singh', 'saurabhsingh8604@gmail.com', '27871c221805e51a5a9f98c7903eb7fc', '0', 1, 0, '9369171910', 'NIT BHOPAL', 'ANW2039', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2039.png', 'admin', NULL, '2019-11-12 16:24:54', NULL, NULL, 'm', '31ea0d367c87900388d9db97d2d080ab', 0, 0, 0, 0, 0, 0, NULL, 0),
(196, 'Aditya', 'Niranjan Mishra', 'aditya.mishra6752@gmail.com', 'fb5135f753fa2f552456616088e85a18', '0', 1, 0, '8824893907', 'Maulana Azad national institute of technology bhopal', 'ANW2040', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2040.png', 'admin', NULL, '2019-11-12 16:35:57', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(197, 'Shubham', 'Fozdar', 'shubhamfozdar21032000@gmail.com', '413d7efe8d134f35cb0ad7a19c74f276', '0', 1, 0, '7600768367', 'Government Engineering College , Daman', 'ANW2041', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2041.png', 'admin', NULL, '2019-11-12 16:42:39', NULL, NULL, 'm', 'b7972184cb926d80d0428beca144e3c4', 0, 0, 0, 0, 0, 0, NULL, 0),
(198, 'Divyanshu', 'Kumar', 'divyanshu.kr10@gmail.com', '9cb08dbf9864fea47a6bb0a444265ee4', '0', 1, 0, '7368063643', 'Birla Institute of Technology, Patna', 'ANW2042', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2042.png', 'admin', NULL, '2019-11-12 18:15:00', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(199, 'Vinish', 'Bhaskar', 'vinishbhaskar321@gmail.com', '639ad74d3832cb016249f9c7a22fdb85', '0', 1, 0, '9097053628', 'Government Engineering college, Vaishali', 'ANW2043', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2043.png', 'admin', NULL, '2019-11-12 18:16:37', NULL, NULL, 'm', '851ad198e1837be1b821ebc6899c99ff', 0, 0, 0, 0, 0, 0, NULL, 0),
(200, 'ANKIT', 'PATIL', 'ankitpatil12345.ap@gmail.com', 'f4ffc4c18401eb9cbaab69cb6019f5ef', '0', 1, 0, '6261111249', 'SHAHEED BHAGAT SINGH EVENING COLLEGE', 'ANW2044', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2044.png', 'admin', NULL, '2019-11-13 00:59:52', NULL, NULL, 'm', 'f6306164b43cc533a35d7630f6a8c5d5', 0, 0, 0, 0, 0, 0, NULL, 0),
(201, 'Arshad', 'Khan', 'mdarshadkhan9504@gmail.com', '7b60a70695debf296d41cfe2da56070c', '0', 1, 0, '9504895514', 'Nielit', 'ANW2045', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2045.png', 'admin', NULL, '2019-11-13 03:10:46', NULL, NULL, 'm', 'fbc5e2b4e886f052b3e5abcb1c511f64', 0, 0, 0, 0, 0, 0, NULL, 0),
(202, 'ALOK', 'RAJ', 'alok972516@gmail.com', '8469a8eb616f1bce4c7241a467d5d0be', '0', 1, 0, '7033342231', 'Galgotias university', 'ANW2046', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2046.png', 'admin', NULL, '2019-11-13 05:32:49', NULL, NULL, 'm', '7e2b430b12c96d9f189a8890eafec747', 0, 0, 0, 0, 0, 0, NULL, 0),
(203, 'Md shams', 'Shahrukh', 'shamsshahrukh20@gmail.com', '261428097167296af32d6613ff67e9c2', '0', 1, 0, '9955448877', 'NIELIT college', 'ANW2047', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2047.png', 'admin', NULL, '2019-11-13 06:19:47', NULL, NULL, 'm', 'e602757fd05bee06ead4109919fc7a03', 0, 0, 0, 0, 0, 0, NULL, 0),
(204, 'Aman', 'Agarawal', 'agrawal_aman.ghrcecs@raisoni.net', '802691b9837e5be0101aa992d5e3a064', '03ed6b4d70a736b191974cb8349f7008', 0, 0, '7769877704', 'G.H. Raisoni College of engineering, nagpur', 'ANW2048', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2048.png', 'admin', NULL, '2019-11-13 07:11:31', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(205, 'Anjali', 'Singh', 'priyasingh27m@gmail.com', '455dc58b3e35a277843c769c088876b1', '0', 1, 0, '8303808110', 'Shambhunath Institute of Engineering and Technology', 'ANW2049', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2049.png', 'admin', NULL, '2019-11-13 07:28:36', NULL, NULL, 'f', 'bbe146ab70ca79edc77a8951d4ff8c59', 0, 0, 0, 0, 0, 0, NULL, 0),
(206, 'Amal', 'Sharma', 'amalsharma500@gmail.com', '4ed9fdaaf5414641b462bf8fdbccc812', '0', 1, 0, '7355661642', 'CSJMU, Kanpur', 'ANW2050', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2050.png', 'admin', NULL, '2019-11-13 08:58:31', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(207, 'Vikram ', 'Kumar ', 'vikramkumarsanchor@gmail.com', '4909c58a3ecc6c42d85158745afe50ab', '24e6ba05507d69e8ebc2515c96f15805', 1, 0, '7665598936', 'Chartered institute of technology Abu Road', 'ANW2051', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2051.png', 'admin', NULL, '2019-11-13 10:51:18', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(208, 'Himanshu', 'Kushwaha', 'hkushwaha051@gmail.com', 'ce98bf924e922d5bc6727d7fa3a9e88d', '0', 1, 0, '8299846972', 'Narina group of instituion', 'ANW2052', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2052.png', 'admin', NULL, '2019-11-13 11:25:30', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(209, 'Raj', 'Kishan', '12rajkishan2001@gmail.com', 'a09d9266a31046a00c1c6e392499960e', '0', 1, 0, '6299164046', 'Indian Institute of Petroleum and Energy', 'ANW2053', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2053.png', 'admin', NULL, '2019-11-13 12:15:26', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(210, 'SAHIL', 'RAJ', 'sahilrajind@gmail.com', '795d0cf8b562dbfa9a2f7ed571bf2181', '0', 1, 0, '9060585312', 'Bakhtiyarpur college of engineering', 'ANW2054', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2054.png', 'admin', NULL, '2019-11-13 16:20:58', NULL, NULL, 'm', '1d145f09d7ff5c7bd75e213a28c63e7b', 0, 0, 0, 0, 0, 0, NULL, 0),
(211, 'Naman ', 'Raj', 'namanraj4094@gmail.com', '79356838f5e72d4775b05b03d641b0c1', '0', 1, 0, '6200532158', 'Darbhanga College of engineering, darbhanga', 'ANW2055', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2055.png', 'admin', NULL, '2019-11-13 16:53:59', NULL, NULL, 'm', 'bd9ed2c098d146ae793417e612a0cd75', 0, 0, 0, 0, 0, 0, NULL, 0),
(212, 'Yasharth', 'Kumar Srivastava', 'yasharth@outlook.com', '7ac8e44a2f29188565543a03aac4025e', '0', 1, 0, '8840351307', 'Sampurnanand Sanskrit University', 'ANW2056', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2056.png', 'admin', NULL, '2019-11-14 00:33:36', NULL, NULL, 'm', 'd5d3b54933fa88ed84edfa2465df7293', 0, 0, 0, 0, 0, 0, NULL, 0),
(213, 'Sachin', 'Kumar', 'sk4830812@gmail.com', '3bc516379c57973f6939f50eedbb85cb', '0', 1, 0, '6205165352', 'Bakhtiyarpur college of engineering ', 'ANW2057', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2057.png', 'admin', NULL, '2019-11-14 13:29:47', NULL, NULL, 'm', '35d9d48e7d9d40c69445fca97227a2f3', 0, 0, 0, 0, 0, 0, NULL, 0),
(214, 'Veer', 'Vikram', 'vikram.veer162@gmail.com', 'd6a7de77db7542f118ace40251e7eea8', '0', 1, 0, '9875706822', 'Bce patna', 'ANW2058', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2058.png', 'admin', NULL, '2019-11-14 13:34:23', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(215, 'SHAILENDRA', 'CHOUDHARY', 'shailendra3112choudhary@gmail.com', 'ac5cb9bc3fed7814c09e72c0baf8793d', '0', 1, 0, '9165811748', 'Maulana Azad National Institute of Technology', 'ANW2059', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2059.png', 'admin', NULL, '2019-11-14 13:45:12', NULL, NULL, 'm', '4479b9b657e002de86934c15dc48f1b6', 0, 0, 0, 0, 0, 0, NULL, 0),
(216, 'Anshika', 'Khanijou', 'anshikakhanijou0120@gmail.com', '983c0d2efd7887c2a4b97d105881c390', '0', 1, 0, '9306778443', 'MCM DAV COLLEGE SEC 36A CHD', 'ANW2060', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2060.png', 'admin', NULL, '2019-11-14 19:57:52', NULL, NULL, 'f', '2bc7bfe98477c947775eb7dd47e479da', 0, 0, 0, 0, 0, 0, NULL, 0),
(217, 'Alok', 'Kumar', 'alokk9286@gmail.com', 'd1d7625804aabe26b2af92d8073e5b1d', '0', 1, 0, '7562970971', 'NSIT', 'ANW2061', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2061.png', 'admin', NULL, '2019-11-15 03:16:39', NULL, NULL, 'm', 'bccb5ba439927d596339e501c9f07744', 0, 0, 0, 0, 0, 0, NULL, 0),
(218, 'Meenu Singh', 'Harinandan Singh', 'meenuharinandansingh@gmail.com', '550ba481acb35905ed45692c3fab1ebc', '0', 1, 0, '9049103332', 'BCE Bakhtiyarpur', 'ANW2062', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2062.png', 'admin', NULL, '2019-11-15 12:36:55', NULL, NULL, 'f', '46de4c089b276229b6e81d1e0cf8520b', 0, 0, 0, 0, 0, 0, NULL, 0),
(219, 'Himanshu ', 'Bhushan', 'himanshubhushan21@gmail.com', '134c339025036e124f5b6c41c618ba55', '0', 1, 0, '9199103848', 'Heritage Institute Of Technology', 'ANW2063', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2063.png', 'admin', NULL, '2019-11-28 17:56:34', NULL, NULL, 'm', '7f3382d8ee824b1f34a4455cfd05c788', 0, 0, 0, 0, 0, 0, NULL, 0),
(220, 'ADITI', 'SINHA', 'adi.aditisinha29@gmail.com', '8e3131a3418043346282837b8606a015', '0', 1, 0, '6299552549', 'BIT Patna', 'ANW2064', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2064.png', 'admin', NULL, '2019-12-01 16:55:05', NULL, NULL, 'f', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(221, 'Shubham', 'Kumar', 'shubham04jan@gmail.com', '5120dff7096ec035258580a4f1f57a30', '0', 1, 0, '9110035665', 'Stcet', 'ANW2065', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2065.png', 'admin', NULL, '2019-12-09 22:22:34', NULL, NULL, 'm', '6e3180bd1cbec17c09fa51a4e3b89f14', 0, 0, 0, 0, 0, 0, NULL, 0),
(222, 'Saurav', 'Kumar', 'sauravparmar121@gmail.com', '51e39aaff433ef16e8c367cd58b0d2e9', '0', 1, 0, '7870104681', 'Muzaffarpur institute of Technology, Muzaffarpur', 'ANW2066', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2066.png', 'admin', NULL, '2019-12-10 17:33:06', NULL, NULL, 'm', 'caff2dd1d61c31efa4692d4d2ff82c01', 0, 0, 0, 0, 0, 0, NULL, 0),
(223, 'Aman', 'Jha', 'ofamanjha@gmail.com', '19f78d6ea7a889b90182f32bb4805b3d', '0', 1, 0, '7367957409', 'BCE Patna ', 'ANW2067', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2067.png', 'admin', NULL, '2019-12-10 18:13:34', NULL, NULL, 'm', '61faafe117edd8b67a52048d4726f594', 0, 0, 0, 0, 0, 0, NULL, 0),
(224, 'Saurabh', 'Amrit', 'amritsaurabh2000@gmail.com', '3e1f8c70e6782d01ba5ea63821d55b6c', '0', 1, 0, '9308106489', 'BCE Patna', 'ANW2068', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2068.png', 'admin', NULL, '2019-12-11 01:08:59', NULL, NULL, 'm', 'c1d65ce64d6fcb54fe2bbfbe9026fc15', 0, 0, 0, 0, 0, 0, NULL, 0),
(225, 'NIKHILESH', 'PRAJAPATI', 'nikspotter1@gmail.com', '5de24110a0639038e5ef3125092fc834', '0', 1, 0, '7379476278', 'BHU', 'ANW2069', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2069.png', 'admin', NULL, '2019-12-11 08:58:45', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(226, 'Abhimanyu', 'Roy', 'abhimanyuroy335@gmail.com', '0805b1e1e1d5f0211863c8b2bf33d486', '0', 1, 0, '8847839775', 'C.V.Raman College of Engineering', 'ANW2070', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2070.png', 'admin', NULL, '2019-12-14 22:38:47', NULL, NULL, 'm', '779489be84ffa333bdca644dfa9899ae', 0, 0, 0, 0, 0, 0, NULL, 0),
(227, 'Riecha', 'Sambhari', 'rsambhari@gmail.com', '2487a1b98088c9ced7399a5e70eac821', '0', 1, 0, '9304661947', 'Magadh Mahila College , Patna University', 'ANW2071', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2071.png', 'admin', NULL, '2019-12-15 14:48:16', NULL, NULL, 'f', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(228, 'Akansh', 'Jain', 'akanshjain139@gmail.com', '9a208fe740440982bbb4742b095b2281', '0', 1, 0, '8458892652', 'Hidayatullah National law University, Naya Raipur', 'ANW2072', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2072.png', 'admin', NULL, '2019-12-16 08:55:53', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(229, 'Pushpaj', 'Kumar', 'pushpajkumarpushpam@gmail.com', '0be52be271d4aed6903a8e3297271337', '0', 1, 0, '9151170970', 'Gaya college gaya ', 'ANW2073', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2073.png', 'admin', NULL, '2019-12-16 19:20:42', NULL, NULL, 'm', '5984e167a3a52c6555802290eb1e5d4b', 0, 0, 0, 0, 0, 0, NULL, 0),
(230, 'Rishabh', 'Raj', 'rishav.raj179@gmail.com', '953df7e01f2e2cbaf04f1d5c9e9b5f15', '0', 1, 0, '7004925331', 'B.I.T Mesra, Patna campus', 'ANW2074', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2074.png', 'admin', NULL, '2019-12-17 06:09:58', NULL, NULL, 'm', '66674aba2b922c2d7b2696fe611244ef', 0, 0, 0, 0, 0, 0, NULL, 0),
(231, 'Mratyunjay ', 'Bhardwaj ', 'mratyunjay5897@gmail.com', '6d20fc8abb29fd3187389b6503356eab', '0', 1, 0, '8707058283', 'BBD NIIT', 'ANW2075', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2075.png', 'admin', NULL, '2019-12-26 09:01:00', NULL, NULL, 'm', 'f247dccf2203f1199d83a0ff70a65827', 0, 0, 0, 0, 0, 0, NULL, 0),
(232, 'Abhishek ', 'Kumar', 'ak9504496@gmail.com', '094b384251356f56a9b949dd480842bd', '0', 1, 0, '8210370389', 'NSIT, BIHTA, PATNA', 'ANW2076', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2076.png', 'admin', NULL, '2019-12-26 10:08:30', NULL, NULL, 'm', '8cfa5d54ac32110cc11330c2af734160', 0, 0, 0, 0, 0, 0, NULL, 0),
(233, 'pankaj', 'kishor', 'shrivastava74795@gmail.com', 'd1f0f54695aea524e109242dc2e1d3d9', '0', 1, 0, '7479530699', 'Anugrah narayan college patna', 'ANW2077', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2077.png', 'admin', NULL, '2019-12-28 11:21:11', NULL, NULL, 'm', '571293d781132f8e56b857692f28bd44', 0, 0, 0, 0, 0, 0, NULL, 0),
(234, 'ADITYA ', 'KUMAR GUPTA ', 'rahulkumar16rarkr@gmail.com', '271ca4e5c4f46b201ae1f548e774024f', '9443b5921ed872d0bfa2bb3443a932ce', 0, 0, '8540938944', 'BIRLA INSTITUTE OF TECHNOLOGY, PATNA', 'ANW2078', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2078.png', 'admin', NULL, '2019-12-28 18:11:37', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(235, 'Aditya ', 'Kumar Gupta', 'rahulkumar16rakr@gmail.com', '087b4d8380e052cf1fdd99f7f506347b', '0', 1, 0, '8450938944', 'Birla Institute of Technology Mesra,Patna', 'ANW2079', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2079.png', 'admin', NULL, '2019-12-28 18:33:21', NULL, NULL, 'm', '2c6531a90e8ae028a4f9abd4abd00025', 0, 0, 0, 0, 0, 0, NULL, 0),
(236, 'Manan', 'Jain', 'mananjain262@gmail.com', 'f90d5352c4e6b23e8da7d5e5c057c950', '0', 1, 0, '9058309857', 'Hansraj College, Delhi University', 'ANW2080', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2080.png', 'admin', NULL, '2019-12-29 18:28:53', NULL, NULL, 'm', '11aa0d9c85a1a50fedd9404345e0c064', 0, 0, 0, 0, 0, 0, NULL, 0),
(237, 'Amartya', 'Mondal', 'hayyoulistentome@gmail.com', 'fc1d758f115a09819cf2da05ca0d1ffc', '0', 1, 0, '8967570983', 'IIT Patna', 'ANW2081', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2081.png', 'admin', NULL, '2019-12-30 06:32:13', NULL, NULL, 'm', 'b3a71ee388f91ea499d8e83307672417', 0, 0, 0, 0, 0, 0, NULL, 0),
(238, 'Sahil', 'Masoom', 'sahilmasoom971@gmail.com', '44ffe44097bbce02fbaa42734e92ae04', '9263d94777176d0829fbb7f41931290d', 0, 0, '8229025562', 'IIT PATNA', 'ANW2082', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2082.png', 'admin', NULL, '2019-12-30 07:20:50', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(239, 'Shreya', 'Kumari', 'pikuthecutest@gmail.com', 'd6fdb30632cf28933d7754026009a419', '0', 1, 0, '9599357387', 'IGIMS Patna ', 'ANW2083', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2083.png', 'admin', NULL, '2019-12-30 07:21:52', NULL, NULL, 'f', 'da04bc5b65163fa772be0b9cbd2cc322', 0, 0, 0, 0, 0, 0, NULL, 0),
(240, 'Riya', 'Lal', 'riyalal23@gmail.com', '3f5fc5732a7e604dd75f78e77b917e53', '0', 1, 0, '6205583459', 'Nift, Patna', 'ANW2084', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2084.png', 'admin', NULL, '2019-12-30 08:19:29', NULL, NULL, 'f', 'c2f657b4117eff0a5f704cdd7c5c2a54', 0, 0, 0, 0, 0, 0, NULL, 0),
(241, 'Akash', 'Singh', 'akaris827@gmail.com', '3d912fa2e6506f0778b0a211476772f7', '0', 1, 0, '7903811445', 'NIFT PATNA', 'ANW2085', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2085.png', 'admin', NULL, '2019-12-30 13:45:03', NULL, NULL, 'm', '78ad2aa02d1ea06754a9bae9fcfb1f4c', 0, 0, 0, 0, 0, 0, NULL, 0),
(242, 'Anurag', 'Kumar', 'anuragrpsmdb@gmail.com', 'a979ea225c77592e1bbf262d57264b33', 'f5d7adcac958baaf72bae827beaae030', 0, 0, '7903959980', 'Muzaffarpur institute of technology', 'ANW2086', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2086.png', 'admin', NULL, '2020-01-03 14:59:28', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(243, 'NOORIN', 'RIYA', 'noorinriyaaiimsp16@gmail.com', '277e9f79bffa26a93826e3b0b2cf903b', '0', 1, 0, '9400987659', 'AIIMS PATNA', 'ANW2087', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2087.png', 'admin', NULL, '2020-01-03 15:22:23', NULL, NULL, 'f', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(244, 'hero', 'nuka', 'kartik.me17@iitp.ac.in', '6ccd36e5d866e24c5b0652f290d18e34', '48a7f370c9a9bae01fe4e7b0a79a2e3d', 0, 0, '1234567890', 'school', 'ANW2088', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2088.png', 'admin', NULL, '2020-01-09 08:56:39', NULL, NULL, 'o', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(245, 'Amartya', 'Mondal', '1801me14@iitp.ac.in', '8dd43ae0638e1ce2690e2e3cfa653923', 'e43b8de0d93b38eec3c9a700824b9477', 1, 0, '1234567823', 'IIT Patna', 'ANW2089', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2089.png', 'admin', NULL, '2020-01-09 16:57:22', NULL, NULL, 'm', 'ebbf01cfc4cb55783417865428e678d4', 0, 0, 0, 0, 0, 0, NULL, 0),
(246, 'Subhang', 'Vasireddy', 'vsubhang4@gmail.com', '42f749ade7f9e195bf475f37a44cafcb', '0', 1, 0, '8978880947', 'IIT Patna', 'ANW2090', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2090.png', 'admin', NULL, '2020-01-09 18:13:52', NULL, NULL, 'm', '2ea502f84033ada48a74010f2ee52ac1', 0, 0, 0, 0, 0, 0, NULL, 0),
(247, 'Fake ', 'entry', 'iitpatnaanwesha@gmail.com', '9a9aee1450bad99dc0a7eda49ba8ea8c', '0', 1, 0, '1234567892', 'IITP', 'ANW2091', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2091.png', 'admin', NULL, '2020-01-09 18:21:38', NULL, NULL, 'm', NULL, 0, 0, 0, 0, 0, 0, NULL, 0),
(248, 'kannu', 'singh', 'tkartik340@gmail.com', '2390d62a32a33beb3cbf320ce9290816', '0', 1, 0, '1425412551', 'iitp', 'ANW2092', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2092.png', 'admin', NULL, '2020-01-09 18:48:30', NULL, NULL, 'm', '5369ab5d5b656c40d75494bca1553dbc', 0, 0, 0, 0, 0, 0, NULL, 0),
(249, 'Md Intekhab', 'Alam', 'intekhab085@gmail.com', 'f039b4450571a8f6269066c42ae494a4', '0', 1, 0, '8002889586', 'Bakhtiyarpur College Of Engineering', 'ANW2093', 'https://anwesha.info/backend/user/assets/qrcodes/ANW2093.png', 'admin', NULL, '2020-01-10 16:09:51', NULL, NULL, 'm', 'c27b7d8f06dce4e4ddc13967d2815857', 0, 0, 0, 0, 0, 0, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accommodation`
--
ALTER TABLE `accommodation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `celestaid` (`anweshaid`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`email`,`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `ca_users`
--
ALTER TABLE `ca_users`
  ADD PRIMARY KEY (`id`,`email`),
  ADD UNIQUE KEY `celestaid` (`anweshaid`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ev_id` (`ev_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `id` (`id`,`email`),
  ADD UNIQUE KEY `celestaid` (`anweshaid`),
  ADD UNIQUE KEY `qrcode` (`qrcode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accommodation`
--
ALTER TABLE `accommodation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ca_users`
--
ALTER TABLE `ca_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
