-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2025 at 12:23 AM
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
-- Database: `fgdcw_bookbridge`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `book_name` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `book_no` varchar(20) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `available_quantity` int(11) NOT NULL DEFAULT 0,
  `total_quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `book_name`, `author`, `book_no`, `publisher`, `category`, `available_quantity`, `total_quantity`, `created_at`, `updated_at`) VALUES
(151, 'Problem solving with C++ (1)', 'Walter Savitch', '1170-SF', 'Pearson', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(152, 'Problem solving with C++ (2)', 'Walter Savitch', '1170-SF', 'Pearson', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(153, 'Network Management Principles and Practice', 'Mani Subramanian', '1616-SF', 'Pearson', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(154, 'Computer Fundamentals Concepts, Systems & Applications', 'Pradeep K.Sinha, Priti Sinha', '1375-SF', 'Manish Jain BPB publications', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(155, 'Digital Fundamentals', 'Thomas L.Floyd', '1172-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(156, 'Differential equations with boundary-value problems', 'Dennis G.Zill, Michael R.Cullen', '1183-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(157, 'C++ programming: from problem analysis to program design', 'D.S. Malik', '1176-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(158, 'Software Engineering', 'Ian Sommerville', '1588-SF', NULL, 'Information Technology', 2, 2, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(159, 'Software Engineering', 'Ian Sommerville', '1587-SF', NULL, 'Information Technology', 2, 2, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(160, 'Operating System Concepts', 'Abraham Silberschatz, Peter Baer Galvin, Greg Gagne', '1588-SF', NULL, 'Information Technology', 3, 3, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(161, 'Operating System Concepts', 'Abraham Silberschatz, Peter Baer Galvin, Greg Gagne', '1589-SF', NULL, 'Information Technology', 3, 3, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(162, 'Operating System Concepts', 'Abraham Silberschatz, Peter Baer Galvin, Greg Gagne', '1590-SF', NULL, 'Information Technology', 3, 3, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(163, 'Computer Networks', 'Andrew S. Tanenbaum, Nick Feamster, David Wetherall', '1597-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(164, 'Computer security principles and practice', 'William Stallings, Lawrie Brown', '1791-SF', 'Pearson', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(165, 'Developing cloud native applications in azure using .net core', 'Rekha Kodali, Dr. Gopala Krishna Behara, Sankara Narayanan Govindarajulu', '1804-SF', 'BPB publications, India', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(166, 'Beginning java mvc 1.0', 'Peter Spath', '1803-SF', 'Apress', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(167, 'Programming Android', 'Zigurd Medniecks, Laird Dornin, G. Blake Meike, Masumi Nakamura', '1806-SF', 'O\'Reilly', 'Information Technology', 2, 2, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(168, 'Programming Android', 'Zigurd Medniecks, Laird Dornin, G. Blake Meike, Masumi Nakamura', '1859-SF', 'O\'Reilly', 'Information Technology', 2, 2, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(169, 'Pro android 2', 'Sayed Hashimi, Satya Komatineni, Dave Maclean', '1807-SF', 'Apress', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(170, 'Introduction to computer theory', 'Daniel I.A. Cohen', '1391-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(171, 'Applying UML and patterns', 'Craig Larman', '1392-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(172, 'Information technology project management', 'Kathy Schwalbe', '1617-SF', 'Cengage Learning', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(173, 'Programming with C', 'C M Aslam, T A Qureshi', '664-SF', 'Aikman Book Corporation, Urdu Bazar, Lahore', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(174, 'Computer Science', NULL, '636-SF', 'Aikman Book Corporation, Urdu Bazar, Lahore', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:13:58'),
(175, 'Guide book to Computer Science', 'Chaudhry Muhammad Aslam, Muhammad Tauqeer Ahmed Qureshi', '800-SF', 'Aikman Book Corporation, Urdu Bazar, Lahore', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(176, 'C++ from control structures through objects', 'Tony Gaddis', '1513-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(177, 'C++ from control structures through objects', 'Tony Gaddis', '1514-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(178, 'Modern operating systems (Vol 1)', 'Andrew S. Tanenbaum, Herbert Bos', '1551-SF', 'Pearson', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(179, 'Modern operating systems (2)', 'Andrew S. Tanenbaum, Herbert Bos', '1551-SF', 'Pearson', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(180, 'Object-Oriented and classical software engineering', 'Stephen R. Schach', '1552-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(181, 'CCNA Routing and switching study guide (1)', 'Todd Lammle', '1557-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(182, 'CCNA Routing and switching study guide (2)', 'Todd Lammle', '1557-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(183, 'How to program', '', '1168-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(184, 'Internet and world wide web how to program', 'P.J. Deital, H.M. Deitel', '1165-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(185, 'XML how to program', 'Paul Deital, Deital Nieto, Lin and Sandhu', '1179-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(186, 'Computer Networking', 'James F.Kurose, Keith W. Ross', '1555-SF', 'Pearson', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(187, 'Fundamentals of computer system & disk operating system', 'Ch. Muhammad Aslam', '766-SF', 'Aikman Book Corporation, Urdu Bazar, Lahore', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(188, 'Understanding pointers in C', 'Yashavant P. Kanetkar', '754-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(189, 'Operating Systems', 'Harvey M. Dietel', '718-SF', 'Addison-Wesley publishing company', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(190, 'Introductory Quantum Mechanics', 'Richard l. Liboff', '789-SF', 'M/S Combine Printers, Lahore', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(191, 'Vector Analysis', 'Dr. S.M. Yusuf', '804-SF', 'Ilmi kitab khana', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(192, 'Key to Vector Analysis', 'Dr. S.M. Yusuf', '805-SF', 'Ilmi kitab khana', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(193, 'Computer Age', 'Imran Majeed, Naveed Majeed', '637-SF', 'Ilmi Book House, Urdu Bazar, Lahore', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(194, 'Virtual LANs Construction, Implementation, and Management', 'Gilbert Held', '628-D', 'John Wiley & Sons, Inc.', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(195, 'Digital Control Systems Theory, Hardware, Software', 'Constantine H. Houpis, Gary B. Lamont', '479-D', 'McGraw-Hill, Inc.', 'Information Technology', 2, 2, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(196, 'Digital Control Systems Theory, Hardware, Software', 'Constantine H. Houpis, Gary B. Lamont', '480-D', 'McGraw-Hill, Inc.', 'Information Technology', 2, 2, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(197, 'Programming with Java IDL', 'Geoffrey Lewis, Steven Barber, Ellen Siegel', '627-SF', 'Wiley computer publishing', 'Information Technology', 0, 0, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(198, 'Problem Solving using Pascal Algorithm development and programming concepts', 'Romualdas Skvarcius', '771-SF', NULL, 'Information Technology', 0, 0, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(199, 'Discovering Computers', 'Shelly, Cashman, Vermaat', '926-SF', NULL, 'Information Technology', 0, 0, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(200, 'Computer Science PITB notes for Class XI', 'Dr. Hamayun M. Mian, Dr. Sohail Aslam', '757-SF', 'Punjab information technology board', 'Information Technology', 2, 2, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(201, 'Computer Science PITB notes for Class XI', 'Dr. Hamayun M. Mian, Dr. Sohail Aslam', '731-SF', 'Punjab information technology board', 'Information Technology', 2, 2, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(202, 'Introduction to Databases (MS Access)', '', '737-SF', 'Aikman Book Corporation, Urdu Bazar, Lahore', 'Information Technology', 0, 0, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(203, 'Jadeed manual for Turbo C', 'Imran Zafar Butt, Maqsood Iqbal Nasir, Muzammail Mehmood, Kamran Ahmad Siddiqui', '740-SF', 'Jadeed educational services', 'Information Technology', 0, 0, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(204, 'Computer Textbook for Class XI', '', '745-SF', 'Punjab Textbook Lahore', 'Information Technology', 0, 0, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(205, 'Introduction to Mathematical Statistics', 'Robert V. Hogg, Allen T. Craig', '742-D', 'Macmillan publishing Co., Inc.', 'Information Technology', 0, 0, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(206, 'Fundamentals of Database Systems', 'Ramez Elmasri', '1378-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(207, 'Computer Applications in Business', 'Tasleem Mustafa,Tariq Mahmood, Ahsan Raza Sattar, Imran Saeed', NULL, 'Kitab Markaz,Faisalabad', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(208, 'Data Science from Scratch', 'Joel Grus', '1607-SF', 'O\'Reilly', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(209, 'Database Systems', 'Carlos Coronel, Steven Morris', '1606-SF', 'Cengage UK', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(210, 'Management Information System', 'Kenneth C.Laudon, Jane P. Laudon', '1579-SF', 'Pearson', 'Information Technology', 3, 3, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(211, 'Management Information System', 'Kenneth C.Laudon, Jane P. Laudon', '1580-SF', 'Pearson', 'Information Technology', 0, 0, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(212, 'Management Information System', 'Kenneth C.Laudon, Jane P. Laudon', '1581-SF', 'Pearson', 'Information Technology', 0, 0, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(213, 'Java:How to program early objects', 'Paul Dietal,Harvey Dietal', '1584-SF', 'Pearson', 'Information Technology', 4, 4, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(214, 'Java:How to program early objects', 'Paul Dietal,Harvey Dietal', '1585-SF', 'Pearson', 'Information Technology', 4, 4, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(215, 'Java:How to program early objects', 'Paul Dietal,Harvey Dietal', '1780-SF', 'Pearson', 'Information Technology', 4, 4, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(216, 'Java:How to program early objects', 'Paul Dietal,Harvey Dietal', '1586-SF', 'Pearson', 'Information Technology', 4, 4, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(217, 'Database Systems', 'Carlos Coronal, Steven Morris', '1772-SF', 'Cenage UK', 'Information Technology', 0, 0, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(218, 'C# 4.0:The complete reference', 'Herbelt Schildt', '1609-SF', 'McGraw-Hill', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(219, 'Beginning Android 2', 'Mark L.Murphy', '1614-SF', 'Apress', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(220, 'A Brain Friendly Guide: Head first PHP & MySQL', 'Lynn Beighley & Michael Morrison', '1773-SF', 'O\'Reilly', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-08-20 16:21:05'),
(221, 'Automate the Boring Stuff with Python', 'AI Sweigart', '1774-SF', 'William Pollock', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(222, 'Designing Enterprise Applications', 'Inderjeet Singh', '1771-SF', 'Addison-wesley', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(223, 'Database Systems', 'Thomas M.Connolly , Carolyne.Begg', '1550-SF', 'Pearson', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(224, 'Object Oriented Programming in C++', 'Robert Lafore', '1553-SF', 'Sams Publishing', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(225, 'Automata Theory Languages and Computation', 'John E.Hopcroft, Rajeev Motwani, Jeffrey D.Ullman', '1547-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(226, 'Machine Learning', 'Tom M.Mitchell', '1582-SF', 'Carnegie', 'Information Technology', 2, 2, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(227, 'Machine Learning', 'Tom M.Mitchell', '1583-SF', 'Carnegie', 'Information Technology', 2, 2, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(228, 'Object Oriented Programming in C++', 'Robert Lafore', '749-SF', 'Waite Group Press', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(229, 'Learn Windows 95 in a Day', 'Scott M.Fuller ,Kevin D.Pagan', '788-SF', 'BPB Publications', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(230, 'Computer Science', 'J.Glenn Brookshear, Dennis Brylow', '1166-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(231, 'Pattern Recognition and Machine Learning', 'Christopher M.Bishop', '1603-SF', 'Springer', 'Information Technology', 2, 2, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(232, 'Pattern Recognition and Machine Learning', 'Christopher M.Bishop', '1604-SF', 'Springer', 'Information Technology', 2, 2, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(233, 'The 8051 Microcontroller', 'Scott Mackenzie , Raphael C.-W.Phan', '1178-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(234, 'Computer Fundamentals', 'Pradeep K.Sinha, Priti Sinha', '1376-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(235, 'Artificial Intelligence', 'George F lugar', '1591-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(236, 'Introduction to Machine learning', 'Ethem Alpaydin', '1601-SF', 'Library of Congress', 'Information Technology', 2, 2, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(237, 'Introduction to Machine learning', 'Ethem Alpaydin', '1602-SF', 'Library of Congress', 'Information Technology', 2, 2, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(238, 'Assembly Language For x86 Processors', 'Kip R.Irvine', '1379-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(239, 'Computer Today with Basic', 'Donald H.Sanders', '1167-SF', 'McGraw-Hill', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(240, 'Database Systems (volume 1)', 'Carlos Coronel, Steven Morris', '1606-SF', 'Cengage', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(241, 'Database Systems (volume 2)', 'Carlos Coronel, Steven Morris', NULL, 'Cengage', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(242, 'Microsoft Access 7.0a For Windows 95', 'Timothy J.O\'Leary, Linda I.O\'Leary', NULL, 'McGraw-Hill', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(243, 'Microsoft Word97', '', '770-SF', 'Hamdard Kutab khana', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(244, 'Discovering Computers 2005', 'Gary B.Shelly , Thomas J.Cashman , Misty E. Vermaat', '926-SF', 'Shelly Casman Series', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(245, 'Computer Science', 'Taleem Mustafa , Tariq Masood , Imran Saeed , Abid Masood', '989-SF', 'Kitab Markaz,Faisalabad', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(246, 'Problem Solving using Pascal Algorithm Development and Programming Concepts', 'Romualdas Skvarcius', '771-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(247, 'C++ Program Design', 'James P.Cohoon, Jack W. Davidson', '626-D', 'Thomas Casson', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(248, 'Introductory Statistics', 'Thomas H. Wonnacott, Ronaldo J. Wonnacott', '802-D', 'NBF , islamabad', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(249, 'Computer Architecture', 'James M.Feldman, Charles T.Retter', '436-D', 'McGraw-Hill', 'Information Technology', 2, 2, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(250, 'Computer Architecture', 'James M.Feldman, Charles T.Retter', '437-D', 'McGraw-Hill', 'Information Technology', 2, 2, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(251, 'Fortran for Today & Tomorrow', 'Michael H.Pressman', '547-D', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(252, 'Computer Essentials', 'Timothy J.O\'Leary, Linda I.O\'Leary', '485-D', 'McGraw-Hill', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(253, 'Principles of Information Security', 'Michael E. Whitman,Herbert J.Mattord', '1767-SF', 'Cengage Learning', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(254, 'Software Requirements', 'Karl Wiegers,Joy Beatty', '1613-SF', 'Microsoft Press', 'Information Technology', 2, 2, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(255, 'The Intel Microprocessors', 'Barry B. Brey', '1174-SF', 'Pearson Education', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(256, 'Fundamentals of Data Structure in C++', 'Ellis Horowitz, Sartaj Sahni, Dinesh P. Mehta', '1578-SF', NULL, 'Information Technology', 3, 3, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(257, 'The Practice of System and Network Administration', 'Thomas A. Limoncelli, Christina J. Hogan, Strata R. Chalup', '1573-SF', NULL, 'Information Technology', 3, 3, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(258, 'The Practice of System and Network Administration', 'Thomas A. Limoncelli, Christina J. Hogan, Strata R. Chalup', '1779-SF', NULL, 'Information Technology', 3, 3, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(259, 'The Practice of System and Network Administration', 'Thomas A. Limoncelli, Christina J. Hogan, Strata R. Chalup', '1574-SF', NULL, 'Information Technology', 3, 3, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(260, 'Fundamentals of Data Structure in C++', 'Ellis Horowitz, Sartaj Sahni, Dinesh P. Mehta', '1577-SF', NULL, 'Information Technology', 3, 3, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(261, 'Fundamentals of Data Structure in C++', 'Ellis Horowitz, Sartaj Sahni, Dinesh P. Mehta', '1383-SF', NULL, 'Information Technology', 3, 3, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(262, 'Software Requirements', 'Karl Wiegers,Joy Beatty', '1790-SF', 'Microsoft Press', 'Information Technology', 2, 2, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(263, 'Software Quality Assurance', 'Daniel Galin', '1769-SF', 'Pearson', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(264, 'Mastering Enterprise JavaBeans', 'Ed Roman, Rima Patel Sriganesh, Gerald Brose', '1618-SF', 'Wiley Publishing,Inc', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(265, 'Python Crash Course', 'Eric Matthes', '1775-SF', 'William Pollock', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(266, 'Introduction to Computers', 'Peter Norton', '1389-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(267, 'Software Engineering', 'Roger S. Pressman, Bruce R. Maxim', '1180-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(268, 'Biomechanics Concepts and Computation', 'Cees Oomens, Marcel Brekelmans, Frank Baaijens', '1434-SF', 'Cambridge UK', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(269, 'Discovering Computers 2005 a Gateway to Information', 'Gary B. Shelly, Thomas J. Cashman, Misty E. Vermaat', '971-SF', NULL, 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(270, 'Data Communications and Networking', 'Behrouz A. Forouzan, Catherine Coombs,Sophia Chung Fegan', '723-SF', 'McGraw-Hill', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(271, 'C++ How to Program (Vol 1)', 'Paul Deitel, Harvey Deitel', '1554-SF', 'Pearsons NY', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(272, 'C++ How to Program (Vol 2)', 'Paul Deitel, Harvey Deitel', '1554-SF', 'Pearsons NY', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(273, 'C++ How to Program(Vol 3)', 'Paul Deitel, Harvey Deitel', '1554-SF', 'Pearsons NY', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(274, 'C++ How to Program (Vol 4)', 'Paul Deitel, Harvey Deitel', '1554-SF', 'Pearsons NY', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(275, 'Data and Computer Communications', 'William Stallings', '1556-SF', 'Pearson Education', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(276, 'Objective Questions Computer Studies', 'Arshad Javed, Matullah Hashmi ,T.A.Qureshi', '638-SF', 'Aikman Book Corporation', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(277, 'Mastering Practical Writing', 'S.H.Burton', '845-D', 'National Book Foundation', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(278, 'Introducing Systems Analysis', 'Steve Skidmore, Brenda Wroe', '787-SF', 'BPB Publications', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(279, 'Illustrated WordPerfect 5.1', 'Jordan Gold', '783-SF', 'BPB Publications', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(281, 'Visual Programming Using Visual Basic', 'Tariq Mahmood, Tasleem Mustafa, Imran Saeed ,Ahsan Raza Sattar', '881-D', 'IT Series Publications', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(282, 'Disaster Recovery Planning', 'Jon William Toigo', '624-D', 'John Wiley &Sons,Inc', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(283, 'Developer/2000: Build Forms II', 'Pascal Gibert', '782-SF', 'Oracle Corporation', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(284, 'Introduction to Computers', 'Peter Norton', '752-SF', 'McGraw-Hill', 'Information Technology', 1, 1, '2025-06-16 19:12:46', '2025-06-16 19:12:46'),
(285, 'Badminton', 'Fred Brundle', '2475', 'Teach yourself books', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(286, 'Laws of the game', NULL, '2478', 'Penguin books Ltd, England', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(287, 'Body contouring and conditioning through movement', 'Janeet Wessel, Chritine Macintyre', '16-D', 'Allyn and Bacon, Inc.', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(288, 'Olympic games, athletics rules and techniques', 'Dr. A. Waheed Mughal, Muhammad Khalid Mahmood', '1197-SF', NULL, 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(289, 'Table Tennis', 'Harold Myers', '2476', 'British library cataloguing in publication data', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(290, 'Health and physical education for 2nd year', NULL, '115-D', 'Ghulam hussain and sons, publishers, Urdu Bazar, Lahore', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(291, 'Olympic games 1984', 'Tomb Mcnab', '2477', 'Knight books Hodder & Stoughton', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(292, 'The new Hunza health plan', 'Renee Taylor', '874', 'Award books', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(293, 'Buster Crabbe\'s energistics', NULL, '848', 'Playboy press', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(294, 'Hoyle\'s rules of games', NULL, '1351', 'A signet book from new american library', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(295, 'Foundations of sports coaching', 'Paul E. Robinson', '1522-SF', 'Routledge Taylor & Francis Group', 'HPE', 2, 2, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(296, 'Foundations of sports coaching', 'Paul E. Robinson', '1523-SF', 'Routledge Taylor & Francis Group', 'HPE', 2, 2, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(297, 'The oxford companion to sports and games', 'John Arlott', '1194', 'Great britian by oxford university press', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(298, 'Teaching children gymnastics', 'Peter H. Werner, Lori H. Williams, Tina J. Hall', '1431-SF', NULL, 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(299, '101 Games for trainers', 'Bob Pike with Christopher Busse', '1529-SF', 'HRD press Inc.', 'HPE', 0, 2, '2025-06-16 19:26:14', '2025-08-20 02:37:55'),
(300, '101 Games for trainers', 'Bob Pike with Christopher Busse', '1528-SF', 'HRD press Inc.', 'HPE', 0, 2, '2025-06-16 19:26:14', '2025-08-29 19:58:44'),
(301, 'Emergency care in athletic training', 'Keith Gorse, Robert Blanc, Francis Feld, Matthew Radelet', '1398-SF', 'F.A. davis company', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(302, 'The new rules of marketing & PR', NULL, '1405-SF', NULL, 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(303, 'Strategic sports event management olymic edition', 'Guy Masterman', '1424-SF', 'TNQ books and Journals, Chennai, India', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(304, 'Study guide for memmler\'s Structure and function of the human body', 'Kerry L. Hull', '1423-SF', 'Wolters Kluwer', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(305, 'Behind human error', 'David D. Woods, Sidney Dekker, Richard Cook, Leila Johannesen, Nadine', '1428-SF', 'Asghgate e-Book', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(306, 'Test management and evaluation', 'Prof. Shafqat Rasul, Prof. Mahjabeen Shafqat', '1397-SF', 'Sharif sons, Ghosia Chowk, Lahore', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(307, 'Best practice protocols for physiuqe assessment in sport', 'Patria A. Hume, Deborah A. Kerr, Timothy R. Ackland', '1436-SF', 'Springer', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(308, 'Essentials of sports nutrition', 'Fred Brouns, Cherestar', '1401-SF', 'John Wiley & Sons, LTD', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(309, 'Principles and practice of maternal critical care', 'Sharon Einav, Carolyn F.Weiniger, Ruth Landau', '1521-SF', 'Springer nature Switzerland', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(310, 'Talent identification and development in sport', 'Angel Julia Abbott', '1444-SF', NULL, 'HPE', 2, 2, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(311, 'Talent identification and development in sport', 'Angel Julia Abbott', '1714-SF', NULL, 'HPE', 2, 2, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(312, 'Functional anatomy for sport and exercise', 'Clare E. Milner', '1396-SF', 'Routledge Taylor & Francis Group', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(313, 'Foundations of Physical education, exercise science, and sport', 'Jennifer L. Walton-Fisette, Deborah A. Wuest', '1445-SF', 'McGraw Hill education', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(314, 'The future of physical education', 'Anthony Laker, George Sage', '1404-SF', 'Routledge Taylor & Francis Group', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(315, 'The physiological basis of physical education and athletics', 'Edward L. Fox, Donald K. Mathews', '2480', 'CBS college publishing Sauners college publishing', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(316, 'The sports management toolkit', 'Paul Emery', '1524-SF', 'Routledge Taylor & Francis Group', 'HPE', 2, 2, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(317, 'The sports management toolkit', 'Paul Emery', '1525-SF', 'Routledge Taylor & Francis Group', 'HPE', 2, 2, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(318, 'Particles, sources, and fields', 'Julian Schwinger', '1440-SF', 'Advanced book program Perseus Books reading, Massachusetts', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(319, 'Philosophy of education (Dimensions of philosophy)', 'Nel Noddings', '1419-SF', 'Westview press, A member of Perseus Books', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(320, 'Fundamentals of Biomechanics', 'Nihat Ozkaya, Dawn Leger, David Goldsheyder, Margareta Nordin', '1435-SF', 'Springer international publishing switzerland', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(321, 'Infrastructure Redux', 'Nausheen H. Anwar', '1425-SF', 'Palgrave Macmillan', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(322, 'Beyond traditional peacekeeping', 'Donald C. F. Daniel, Bradd C. Hayes', '1426-SF', 'Palgrave Macmillan', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(323, 'Sports Biomechanics', 'Anthony Blazevich', '1415-SF', 'Bloomsburry Sport', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(324, 'Video games and storytelling', 'Souvik Mukherjee', '1409-SF', 'Palgrave Macmillan', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(325, 'Physical education futures', 'David Kirk', '1418-SF', 'Routledge Taylor & Francis Group', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(326, 'Public Management reform', 'Christopher Pollitt, Geert Bouckaert', '1443-SF', 'Oxford university press', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(327, 'Prevention practice and health promotion', 'Catherine Rush Thompson', '1400-SF', NULL, 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(328, 'Teachers guide for physical education for girls in high school', NULL, '2-D', 'California office of state printing', 'HPE', 2, 2, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(329, 'Teachers guide for physical education for girls in high school', NULL, '3-D', 'California office of state printing', 'HPE', 2, 2, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(330, 'Philosophy of physical education & recreation', 'Prof. Jafar Hussain Jag', '1394-SF', 'Jag\'s publications, urdu bazar Lahore', 'HPE', 3, 3, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(331, 'Philosophy of physical education & recreation', 'Prof. Jafar Hussain Jag', '1526-SF', 'Jag\'s publications, urdu bazar Lahore', 'HPE', 3, 3, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(332, 'Philosophy of physical education & recreation', 'Prof. Jafar Hussain Jag', '1527-SF', 'Jag\'s publications, urdu bazar Lahore', 'HPE', 3, 3, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(333, 'Play it again', 'Asterie Baker Provenzo, Eugene F. Provenzo, JR', '17-D', 'Prentice-Hall, Inc.', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(334, 'Lifetime fitness and wellness', 'Melvin H. Williams', '478-D', 'Wm. C. Brown Communications, Inc.', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(335, 'Between past and future', 'Hannah Arendt', '1570-SF', 'The viking press, New York', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(336, 'Reforming education and changing schools', 'Richard Bowe, Stephen J. Ball, Anne Gold', '1414-SF', 'Routledge library editions', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(337, 'A wellness way of life', 'Gwen Robbins, Debbie Powers, Sharon Burgess', '481-D', 'Wm. C. Brown Communications, Inc.', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(338, 'Sport, Racism and social media', 'Neil farrington, Lee Hall, Daniel Kilvington, John Price, Amir Saeed', '2018-SF', 'Routledge Taylor & Francis Group', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(339, 'Musuem communication and social media', 'Kirsten Drotner, Kim Christian Schroder', '1417-SF', 'Routledge Taylor & Francis Group, Research in museum studies', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(340, 'Physical education essential issues', 'Ken Green, Ken Hardman', '1402-SF', 'Sage publications', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(341, 'Physical agents in rehabilitation', 'Michelle H. Camerson', '1399-SF', NULL, 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(342, 'صحت و جسمانی', NULL, '1784', 'United anarkali Lahore', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(343, 'پاکستان کھیل کے میدان میں', 'جمیل مرزا، قاضی ممتاز احمد', '107', 'کیکس پبلی کیشنز لمٹیڈ لندن', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(344, 'صحت و تعلیم جسمانی براۓ انٹرمیدیٹ پارٹ I', 'پروفیسر راۓ محمد کھرل', '1779', 'علمی بک ہاؤس چوک اردو بازار لاہور', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(345, 'صحت و تعلیم جسمانی', 'مسز صابرہ اعظم', '2242', 'پنجاب تیکسٹ بک بورڈ لاہور', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(346, 'جسمانی تعلیم', 'فوزیہ سلیمی', '729-SF', 'پنجاب تیکسٹ بک بورڈ لاہور', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(347, 'باسکٹ بال', 'چوھدری حشمت علی', '2240', 'محمود حسین اینڈ برادرز، صدر بازار، منٹگمری', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(348, 'تعلیمی جمناسٹکمک (حرکاتی سائنس)', 'چوھدری حشمت علی', '2239', 'محمود حسین اینڈ برادرز، صدر بازار، ساہیوال', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(349, 'کھیلوں کے قوانین', 'چوھدری غلام محمد', '2237', 'عنایت اللہ بلڈنگ انار کلی لاہور', 'HPE', 1, 1, '2025-06-16 19:26:14', '2025-06-16 19:26:14'),
(350, 'Media of mass communiation', 'John Vivian', '1208-SF', 'Pearson', 'Economics', 3, 3, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(351, 'Media of mass communiation', 'John Vivian', '1209-SF', 'Pearson', 'Economics', 3, 3, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(352, 'Media of mass communiation', 'John Vivian', '1210-SF', 'Pearson', 'Economics', 3, 3, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(353, 'Physics of human body', 'Irving P. Herman', '1406-SF', 'Springer', 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(354, 'Human physiology', 'Lauralee Sherwood', '1422-SF', 'Cengage Learning', 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(355, 'Gray\'s anatomy for students', 'Richard L. Drake, A. Wayne Vogl, Adam W. M. Mitchell', '1331-SF', 'Fraooq kitab ghar, Pakistan', 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(356, 'Mastering the world of pschology', 'Samuel, e. wood, ellen green wood, denise boyd', '1571-SF', 'Peason', 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(357, 'Instructional Models for physical education', 'Michael W.Metzler', '1199-SF', 'Routledge Taylor & Francis Group', 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(358, 'The philosophy of physical education', 'Steven A. Stolz', '1198-SF', 'Routledge Taylor & Francis Group', 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(359, 'Politics among Nations', 'Hans J. Morgenthau, Kenneth W. Thompson', '1212-SF', NULL, 'Economics', 3, 3, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(360, 'Politics among Nations', 'Hans J. Morgenthau, Kenneth W. Thompson', '1213-SF', NULL, 'Economics', 3, 3, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(361, 'Politics among Nations', 'Hans J. Morgenthau, Kenneth W. Thompson', '1211-SF', NULL, 'Economics', 3, 3, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(362, 'Journalism for all', 'Dr, Mehdi Hasan, Dr. Abdus Salam Khurshid', '1205-SF', 'Aziz Book deopot, Urdu bazar, Lahore', 'Economics', 3, 3, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(363, 'Journalism for all', 'Dr, Mehdi Hasan, Dr. Abdus Salam Khurshid', '1206-SF', 'Aziz Book deopot, Urdu bazar, Lahore', 'Economics', 3, 3, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(364, 'Journalism for all', 'Dr, Mehdi Hasan, Dr. Abdus Salam Khurshid', '1207-SF', 'Aziz Book deopot, Urdu bazar, Lahore', 'Economics', 3, 3, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(366, 'Economics', 'Campbell R. McConnell, Stanley L. Brue, Sean M. Flynn', '1467-SF', NULL, 'Economics', 3, 3, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(367, 'Economics', 'Campbell R. McConnell, Stanley L. Brue, Sean M. Flynn', '1468-SF', NULL, 'Economics', 3, 3, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(368, 'Economics', 'Campbell R. McConnell, Stanley L. Brue, Sean M. Flynn', '1600-SF', NULL, 'Economics', 3, 3, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(369, 'Instructional and entre-preneurship', 'Peter F. Drucker', '2019-SF', 'Perfect bound', 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(370, 'Enterpreneurship and the privatizing of government', 'Calvin A. Kent', '791-D', 'National book foundation, Islamabad', 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(371, 'Management', 'Ricky W. Griffin', '1548-SF', NULL, 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(372, 'Management', 'Stephen P. Robbins, Mary Coulter, Joseph J. Martocchio, Lori K. Long', '1377-SF', NULL, 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(373, 'The lean startup', 'Eric Ries', '1469-SF', 'Penguin random house, UK', 'Economics', 2, 2, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(374, 'The lean startup', 'Eric Ries', '1470-SF', 'Penguin random house, UK', 'Economics', 2, 2, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(375, 'Sports Law', 'Simon Gradiner', '1413-SF', 'Cavendish publishing limited', 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(376, 'An introduction to international relations theory', 'Jill Steans, Lloyd Pettiford, Thomas Diez, Imad El-Anis', '1216-SF', 'Pearson', 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-08-19 09:32:05'),
(377, 'Understanding mass communication', 'Melvin L. DeFleur, Everette E. Dennis', '463-D', 'Houghton mifflin company', 'Economics', 2, 2, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(378, 'Understanding mass communication', 'Melvin L. DeFleur, Everette E. Dennis', '464-D', 'Houghton mifflin company', 'Economics', 2, 2, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(379, 'Grasping the democratic peace', 'Bruce Russett', '1299-SF', 'Princeton university press, new jersey', 'Economics', 2, 2, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(380, 'Grasping the democratic peace', 'Bruce Russett', '1300-SF', 'Princeton university press, new jersey', 'Economics', 2, 2, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(381, 'International politics', 'Robert J. Art, Robert Jervis', '1286-SF', 'Pearson', 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(382, 'Basic mechanics', 'Susan J. Hall', '1395-SF', 'McGraw hill education', 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(383, 'صحت و تعلیم جسمانی', 'مسز صابرہ اعظم', '1781', 'پبلشرز یونائٹڈ، انارکلی، لاہور', 'Economics', 3, 3, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(384, 'صحت و تعلیم جسمانی', 'مسز صابرہ اعظم', '1782', 'پبلشرز یونائٹڈ، انارکلی، لاہور', 'Economics', 3, 3, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(385, 'صحت و تعلیم جسمانی', 'مسز صابرہ اعظم', '1785', 'پبلشرز یونائٹڈ، انارکلی، لاہور', 'Economics', 3, 3, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(386, 'صحت و تعلیم جسمانی (پارٹ I)', 'پروفیسر راۓ محمد کھرل', '3034', 'علمی بک ہاؤس چوک اردو بازار', 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(387, 'صحت و تعلیم جسمانی (پارٹ II)', 'پروفیسر راۓ محمد کھرل', '3035', 'النور ایجوکیشنل پبلشرز اردو', 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(388, 'ہیلتھ اینڈ فشزیکل ایجوکیشن (صحت و تعلیم جسمانی)', 'مسز صابرہ اعظم، مسٹر ای-یو-خان، ونگ کمانڈر حمید علی سوفی', '41', 'لاہور آرٹ پریس، انارکلی، لاہور', 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(389, 'ہیلتھ اینڈ فشزیکل ایجوکیشن', 'مسز صابرہ اعظم، چوھدری بشیر احمد، محمد رفیق، اے یو خان، سید محمد یوسف رضوی', '2238', 'پنجاب ٹیکسٹ بک بورڈ، لاہور', 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(390, 'فلاسفیکل بیسز آف فشزیکل ایجوکیشن', 'ڈاکٹر اے وحید مغل', '1195-SF', NULL, 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(391, 'کھیلوں کے قوانین', 'ڈاکٹر اے وحید مغل', '1196-SF', 'نعیم کمپوزرز، اسلام آ باد', 'Economics', 1, 1, '2025-06-16 19:37:43', '2025-06-16 19:37:43'),
(392, 'Programmed learning aid for introduction sociology', 'Paul B. Horton, Robert L. Horton, Roger H. Hermanson', '29-D', 'Learning systems company', 'Economics', 1, 1, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(393, 'The social experience', 'James W. Vander Zanden', '458-D', 'McGraw hill publishing company', 'Economics', 1, 1, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(394, 'Mass communications', 'Wulber Schramm', '781-D', NULL, 'Economics', 1, 1, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(395, 'Effective business communication', 'Herta. A. Murphy, Herbert W. Hildebrandt, Jane P. Thomas', '1515-SF', NULL, 'Economics', 2, 2, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(396, 'Effective business communication', 'Herta. A. Murphy, Herbert W. Hildebrandt, Jane P. Thomas', '1516-SF', NULL, 'Economics', 2, 2, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(397, 'Business communication today', 'Bovee, Thill, Schatzman', '834-D', 'Pearson', 'Economics', 1, 1, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(398, 'An introduction International relations theory', 'Jill Steans, Lloyd Pettiford, Thomas Diez, Imad El-Anis', '1214-SF', 'Pearson', 'Economics', 1, 2, '2025-06-16 19:48:24', '2025-08-19 10:28:28'),
(399, 'An introduction to international relations theory', 'Jill Steans, Lloyd Pettiford, Thomas Diez, Imad El-Anis', '1215-SF', 'Pearson', 'Economics', 2, 2, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(400, 'International politics', 'Robert J. Art, Robert Jervis', '1284-SF', 'Pearson', 'Economics', 2, 2, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(401, 'International politics', 'Robert J. Art, Robert Jervis', '1285-SF', 'Pearson', 'Economics', 2, 2, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(402, 'International relations', 'Norman D. Palmer, Howard C. Perkins', '764-D', NULL, 'Economics', 1, 1, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(403, 'Business communication today', 'Bovee, Thill', '1517-SF', NULL, 'Economics', 2, 2, '2025-06-16 19:48:24', '2025-08-19 09:27:32'),
(404, 'Business communication today', 'Bovee, Thill', '1518-SF', NULL, 'Economics', 2, 2, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(405, 'Islamic economics alternatives', 'Jomo K.S.', '1438-SF', 'Palgrave Macmillan', 'Economics', 2, 2, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(406, 'Islamic economics alternatives', 'Jomo K.S.', '1416-SF', 'Palgrave Macmillan', 'Economics', 2, 2, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(407, 'The dynamic of mass communication', 'Joseph R. Dominick', '445-D', 'Macmillan-Hill, Inc.', 'Economics', 1, 1, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(408, 'Sociology', 'Paul B. Horton, Chester L. Hunt', '1531-SF', NULL, 'Economics', 2, 2, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(409, 'Sociology', 'Paul B. Horton, Chester L. Hunt', '1532-SF', NULL, 'Economics', 2, 2, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(410, 'Sociology', 'John J. Macionis', '1598-SF', 'Pearson', 'Economics', 1, 1, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(411, 'Social order in Pakistani society', 'Dr. M. S. Baqai', '818-D', 'National book foundation', 'Economics', 1, 1, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(412, 'Mass communication and social media', 'Kirsten Drotner, Kim Christian Schroder', '1507-SF', 'Routledge Taylor & Francis Group', 'Economics', 2, 2, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(413, 'Mass communication and social media', 'Kirsten Drotner, Kim Christian Schroder', '1508-SF', 'Routledge Taylor & Francis Group', 'Economics', 2, 2, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(414, 'The social context of AIDS', 'Joan Huber, Beth E. Schneider', '376-D', 'Sage publications', 'Economics', 1, 1, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(415, 'Understanding social inequality', 'Hubert M. Blalock, Jr.', '404-D', 'Sage publications', 'Economics', 1, 1, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(416, 'Social work processes', 'Beulah Roberts Compton, Burt Galaway', '41-D', 'The dorsey press', 'Economics', 1, 1, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(417, 'Sociology a brief introduction', 'Richard T. Schaefer', '1615-SF', 'McGraw hill education', 'Economics', 1, 1, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(418, 'Sociology and school knowledge', 'Geoff Whitty', '1433-SF', 'Methuen & Co. Ltd', 'Economics', 1, 1, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(419, 'Environmental Sociology', 'John Hannigan', '1432-SF', 'Routledge Taylor & Francis Group', 'Economics', 1, 1, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(420, 'Social Problems', 'Kenneth J. Neubeck', '462-D', 'McGraw-Hill, Inc.', 'Economics', 1, 1, '2025-06-16 19:48:24', '2025-06-16 19:48:24'),
(421, 'The Reluctant Fundamentalist', 'Mohsin Hamid', '1619-SF', 'Kitab mahal (PVT.) LTD. KM library series', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(422, 'Philip Sidney An apology for poetry', 'Prof. Munawar Ali Malik, Prof. Dr. H. Zia-ul-Islam Chaudhry', '1761-SF', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(423, 'Samuel Johnson Preface to Shakespeare', 'Prof. Munawar Ali Malik', '1762-SF', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(424, 'Feminist library theory A reader', 'Mary Eagleton', '1345-SF', 'Wiley-Blackwell publishing Ltd.', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(425, 'Teaching and Learning in the language classroom', 'Tricia Hedge', '2009-SF', 'Oxford university press', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(426, 'Qualitative reaserch', 'David Silverman', '1702-SF', 'Sage publications Ltd.', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(427, 'The norton anthology of theory and criticism (Vol 1)', 'William E. Cain, Laurie A. Frinke, Barbara E. Johnson, John McGowan, Jeffrey J. Williams', '1366-SF', 'W. W Norton & company, Inc.', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(428, 'The norton anthology of theory and criticism (Vol 2)', 'William E. Cain, Laurie A. Frinke, Barbara E. Johnson, John McGowan, Jeffrey J. Williams', '1366-SF', 'W. W Norton & company, Inc.', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(429, 'The norton anthology of theory and criticism (Vol 3)', 'William E. Cain, Laurie A. Frinke, Barbara E. Johnson, John McGowan, Jeffrey J. Williams', '1366-SF', 'W. W Norton & company, Inc.', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(430, 'Literary theory an Introduction', 'Terry Eagleton', '1322-SF', NULL, 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(431, 'Catherine Belsey Critical practice', 'Prof. Munawar Ali Malik, Prof. Shehryar Khan', '1865-SF', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(432, 'Research Design', 'John W. Creswell, J. David Creswell', '1701-SF', 'Sage publications Ltd.', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(433, 'A Mercy a novel', 'Tonny Morrison', '1746-SF', NULL, 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(434, 'The age of kali Indian travels & encounters', 'William Dalrymple', '1565-SF', NULL, 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(435, 'The Fox', 'Lawerence, David Herbert', '1289-SF', NULL, 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(436, 'Arthur Miler Death of a salesman', 'Prof. Munawar Ali Malik, Prof. Dr. H. Zia-ul-Islam Chaudhry', '1750-SF', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(437, 'Arthur Miler Death of a salesman', 'Prof. Munawar Ali Malik, Prof. Dr. H. Zia-ul-Islam Chaudhry', '1754-SF', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(438, 'A farewell to arms', 'Ernest Hemingway', '1243-SF', 'ILQA publications', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-17 12:18:25'),
(439, 'Bapsi Sidhwa Ice-Candy man', 'Prof. Munawar Ali Malik, Syed Muhammad Ali', '1621-SF', 'Kitab mahal (PVT.) LTD. KM library series', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(440, 'The age of race', 'Dr. Shafique Ali Khan', '2683', 'Royal book company, Victoria road, Karachi', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(441, 'Oxford practice grammar', 'John Eastwood', '1077-SF', 'Oxford university press', 'English', 3, 3, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(442, 'Oxford practice grammar', 'John Eastwood', '883-SF', 'Oxford university press', 'English', 3, 3, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(443, 'Oxford practice grammar', 'John Eastwood', '882-SF', 'Oxford university press', 'English', 3, 3, '2025-06-16 19:55:38', '2025-06-16 19:55:38');
INSERT INTO `books` (`id`, `book_name`, `author`, `book_no`, `publisher`, `category`, `available_quantity`, `total_quantity`, `created_at`, `updated_at`) VALUES
(444, 'Principles of language learning and teaching', 'H. Douglas Brown', '844-D', 'National book foundation, Islamabad, Pakistan', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(445, 'The cambridge encyclopedia of language', 'David Crystal', '812-D', 'National book foundation, Umair printers, Lahore, Pakistan', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(446, 'Eugene O\'Neil Long day\'s journey into night', 'Prof. Munawar Ali Malik, Prof. Dr. H. Zia-ul-Islam Chaudhry', '1749-SF', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(447, 'Eugene O\'Neil Long day\'s journey into night', 'Prof. Munawar Ali Malik, Prof. Dr. H. Zia-ul-Islam Chaudhry', '1749-SF', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(448, 'Thomas Hardy The mayor of casterbridge', 'Prof. Munawar Ali Malik, Prof. Dr. H. Zia-ul-Islam Chaudhry', '1242-SF', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(449, 'Selected essays', 'Francis Bacon', '1246-SF', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(450, 'The mill on the floss', 'George Eliot', '1238-SF', 'Kitab mahal (PVT.) LTD. KM library series', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(451, 'The mill on the floss', 'George Eliot', '1239-SF', 'Kitab mahal (PVT.) LTD. KM library series', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(452, 'Burnt shadows', 'Prof. S.P. Sen Gupta', '1662-SF', 'Famous products, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(453, 'Aristotle\'s Poetics', 'Prof. Munawar Ali Malik, Prof. Dr. H. Zia-ul-Islam Chaudhry', '1763-SF', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(454, 'William Wordsworth Preface to the lyrical ballads', 'Prof. Munawar Ali Malik, Prof. Dr. H. Zia-ul-Islam Chaudhry', '1760-SF', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(455, 'Matthew Arnold Culture and Anarchy', 'Prof. Munawar Ali Malik, Prof. Dr. H. Zia-ul-Islam Chaudhry', '1764-SF', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(456, 'Joseph Andrews', 'Henny Fielding', '1356-SF', 'Famous products, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(457, 'Focus on comprehension', 'Peter Ellison', '1192-SF', NULL, 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(458, 'Shuggie Bain', 'Douglas Stuart', '2016-SF', 'Grove press, New York', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(459, 'Shooting an elephant', 'George Orwell', '1759-SF', 'Penguin Books', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(460, 'The merchant of venice', 'William Shakespeare', '1012-SF', 'Vishv Vijay Pvt. Ltd.', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(461, 'Julius Caesar', 'William Shakespeare', '1015-SF', 'Vishv Vijay Pvt. Ltd.', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(462, 'The Namesake', 'Jhumpa Lahiri', '1741-SF', 'A mariner book houghton mifflin company boston, New York', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(463, 'Waiting for Godot', 'Samuel Beckett', '1657-SF', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(464, 'Philosophy the basics', 'Nigel Warburton', '1738-SF', NULL, 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(465, 'Believe me', 'Tahereh Mafi', '1715-SF', NULL, 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(466, 'Six plays', 'Luigi Pirandello', '2012-SF', 'Calder publications', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(467, 'Feminist literary criticism', 'Mary Eagleton', '2013-SF', 'Longman Inc. New York', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(468, 'And the mountains echoed', 'Khaled Hosseini', '1743-SF', 'Penguin Books', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(469, 'The cousins', 'Karen M. Mcmanus', '912-D', 'Penguin random house Delacorte press', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(470, 'Beloved a novel', 'Tonni Morrison', '1745-SF', 'Vintage books a division of random house, New York', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(471, 'Gulliver\'s Travels', 'Jonathan Swift', '1251-SF', 'Harper Collins publishers Ltd', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(472, 'Thomas Hardy The mayor of casterbridge', 'Prof. Munawar Ali Malik, Prof. Dr. H. Zia-ul-Islam Chaudhry', '1240-SF', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(473, 'The god of small things', 'Arundhati Roy', '1700-SF', 'Indian ink publishing Co Pvt Ltd', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(474, 'Great Expectations', 'Prof. Munawar Ali Malik, Prof. Dr. H. Zia-ul-Islam Chaudhry', '1756-SF', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(475, 'Azadi', 'Arundhati Roy', '1681-SF', 'Penguin Books', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(476, 'As good as dead', 'Holly Jackson', '1737-SF', 'Harper Collins publishers Ltd', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(477, 'Ice-candy man', 'Bapsi Sidhwa', '1656-SF', 'Ilqa publications, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(478, 'Norton Anthology of american literature (Vol 1)', 'Nina Baym, Ronald Gottesman, Laurence B. Holland, David Kalstone, Francis Murphy, Hershel Parker, Wi', '252-D', 'Norton & company, New York', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(479, 'Robert Frost Selected poems', 'Prof. Munawar Ali Malik, Prof. Dr. H. Zia-ul-Islam Chaudhry', '1752-SF', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(480, 'Robert Frost Selected poems', 'Prof. Munawar Ali Malik, Prof. Dr. H. Zia-ul-Islam Chaudhry', '1641-SF', 'Kitab mahal (PVT.) LTD. KM library series', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(481, 'English for undergraduates', 'D.H. Howe, T.A. Kirkpatrick, D.L. Kirkpatrick', '880-SF', 'Oxford university press', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(482, 'English for undergraduates', 'D.H. Howe, T.A. Kirkpatrick, D.L. Kirkpatrick', '881-SF', 'Oxford university press', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(483, 'What\'s in a word?', 'Samuela Eckstut, Karen Sorensen', '477-D', 'Longman publishing group UK Ltd', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(484, 'English elements', 'Guest & Eshuys', '570-SF', 'Jacaranda Wiley Ltd, Milton', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(485, 'A short history of english literature', 'Ifor Evans', '596', 'Penguin Books Ltd, England', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(486, 'Great Expectations', 'Charles Dickens', '1807', 'Pan books Ltd, London', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(487, 'A selection of english poetry', 'Milton, Wordsworth, Keats Browning, Robert Frost', '654-SF', 'Prop. College book depot, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(488, 'Good english', 'G. H. Thornton, Kathleen Baron', '600', 'Teach yourself books Hodder and Stoughton', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(489, '30 days to a more powerful vocabulary', 'Dr. Wilfred Funk & Norman Lewis', '2117', 'Pocket books, New York', 'English', 1, 2, '2025-06-16 19:55:38', '2025-08-29 19:58:40'),
(490, 'College Essays', 'Martin', '3203', 'Cooper publishers, Bombay', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(491, 'Dictionary of Proverbs', 'Kam Chuan Aik', '667-D', 'Federal publications', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(492, 'Selected poems', 'T.S. Eliot', '175-D', 'Faber and Faber limited, London', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(493, 'Writing to communicate', 'Carl Geoller', '876', 'A mentor book, New American Library, Times mirror, New York', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(494, 'Harvest of the Sun', 'E.v. Thompson', '1203', 'Pan books Ltd, London', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(495, 'Three for tomorrow', 'Robert silverberg, Roger Zelazny, James Blish', '760', 'Lowe and brydone, Ltd., London', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(496, 'Word power made easy', 'Norman Lewis', '484-SF', 'Pocket books, New York', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(497, 'Animal Farm', 'George Orwell', '651-SF', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(498, 'Spoken english', 'Scott Waugh', '3246', NULL, 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(499, 'Bes quotations for all occassions', 'Lewis C. Henry', '3248', 'Ballantine books', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(500, 'A selection of modern english verse', NULL, '191-D', 'Polymer publication, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(501, 'Guide to english idioms', 'B.A. Phythian', '660-D', 'Federal publications', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(502, 'Dictionary of quotations', 'Dr. B. James', '162-D', 'Goodwill publishing house', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(504, 'Selected Poetry', 'Alfred Tennyson', '295-D', 'The modern library, Random house Inc. New York', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(505, 'Intruder in the dust', 'William Faulkner', '294-D', 'Mcgraw-Hill, Inc.', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(506, 'Animal Farm', 'George Orwell', '650-SF', 'Penguin books', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(507, 'Faster reading self-taught', 'Harry Shefter', '590', 'Pocket books, New York', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(508, 'How to do just about everything', 'Courtney Rosen', '963-SF', 'Harper Collins publishers Ltd', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(509, 'W.wordsworth\'s Selected poems', 'Bashir Hussain, Zafar Ali Rana', '3202', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(510, 'Macbeth', 'William Shakespeare', '3212', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(511, 'Proverbial english', 'M. Zaman, Naveed Akhtar', '959-SF', 'Rabia book house, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(512, 'Azhar appliactions for better jobs', 'M. S. Bhatti', '3204', 'Azhar publishers, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(513, 'Common errors in english', 'Roger Thomson', '3247', NULL, 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(514, 'Robert Browning Selected poems', 'Zafar Ali Rana, N. A. Akhter', '3210', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(515, 'The tales of Olga da Polga', 'Micheal Bond', '537-D', 'Houghton Mifflin company', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(516, 'Usuage and abusage', 'Eric Partridge', '787-D', 'National book foundation, Pakistan', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(517, 'A selection of Short stories and One-act play', NULL, '3002', NULL, 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(518, 'William Shakespeare Antony and Cleopatra', 'Praveen Bhatia', '1019-SF', 'UBS Publishers distributors Pvt. Ltd.', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(519, 'Perfect public learning', 'M. Saqlain Bhatti, Raza-ul-Haq Badakhshani, Muhammad Masood', '663-D', 'Azhar publisers, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(520, 'Common synonyms antonyms', 'M. Zaman, Naveed Akhtar', '665-D', 'Rabia book house, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(521, 'Common idioms and phrases', 'M. Zaman, Naveed Akhtar', '659-D', 'Rabia book house, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(522, 'The Essayist', 'Sheridan Baker', '12-D', 'Thomas Y. Corwell company, New York', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(523, 'The english language in Pakistan', 'Robert J. Baumgardner', '814-D', 'National book foundation, Islamabad, Pakistan', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(524, 'Everyday english dialogue', 'Muhammad Masood', '662-D', 'Azhar publishers, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(525, 'The glass Menagerie', 'Tennessee Williams', '3208', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(526, 'John Miltan Selected poems', 'Zafar Ali Rana, N. A. Akhter', '3214', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(527, 'Selected essays', 'Muhammad Masood', '3239', 'Azhar publishers, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(528, 'Latest essays', NULL, '3240', 'Dogar publishers, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(529, 'Selected poems', 'Milton, Wordsworth, Keats Browning, Robert Frost', '655-SF', 'New kitab mahal publishers', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(530, 'A comprehensive study of the articles: A, An & The', 'Shahid Sarwar Kazi', '538-SF', 'Zujaj publishers, Garhi ahmad abad, Gujrat, Pakistan', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(531, 'Formal semantics and logic', 'Bas C. van Fraassen', '40-D', 'The Macmillan company, New York', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(532, 'Treasury of proverbs and epigrams', NULL, '163-D', 'Avenel books, New York', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(533, 'Invention & Design a rhetorical reader', 'Forrest D. Burt, E. Cleve Want', '51-D', 'Random house, New York', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(534, 'The Arden Shakespeare Macbeth', 'Kenneth Muir', '746-SF', 'Methuen, London & New York', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(535, 'The Arden Shakespeare Macbeth', 'Kenneth Muir', '746-SF', 'Methuen, London & New York', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(536, 'Model english essays', 'Iqbal A Bhatti', '706', NULL, 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(537, 'Conjunction & Interjection', 'M.Masood', '962-SF', 'Rabia book house, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(538, 'Master your english punctuation', 'M.Masood', '956-SF', 'Rabia book house, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(539, 'Master your english pronounciation', 'M.Masood', '958-SF', 'Rabia book house, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(540, 'Best quotations', 'M. Tariq Qureshi', '961-SF', 'Fatima book house, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(541, 'History of English literature', 'Loius Cazamian, Raymond Las Vergnas', '554-SF', NULL, 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(542, 'Ideal essays and letters with stories, Comprehension, Idioms & phrases', 'M. Masood', '3215', 'Shaharyar publisher, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(543, 'The late Lily Shiel', 'Sheilah Graham', '765', 'Grosset & Dunlap, A filmways company publishers, New York', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(544, 'High school english grammar and composition', 'Wren, Martin', '707', 'S. Chand & Company Ltd. New Delhi', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(545, 'American Literature', NULL, '543-D', 'Macmillan publishing company, Inc.', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(546, 'High school english grammar and composition', 'Wren, Martin', '164-D', NULL, 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(547, 'English grammar and composition', 'Chisty, R. A. Khan, S. A. Hamid', '3040', 'Polymer publication, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(548, 'How to build a better vocabulary', 'Maxwell nurnberg, Morris Rosenblum', '700', 'Fawcett popular library, New York', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(549, 'Under the greenwood tree', 'Thomas Hrady', '35', 'Macmillan publishing company, Inc. London', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(550, 'Inside asquith\'s cabinet', 'Edward David', '762', '50 Albemarle street, London', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(551, 'Clear speech', 'Judy B. Gilbert', '262-D', 'Cambridge university press', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(552, 'An anthology of living english prose', 'Muhammad Ismail Bhatti', '44', 'Ilmi kitab khana, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(553, 'The treasury of Khalil Gibran', 'Martin l. Wolf', '2102', 'The citadel press, Secaucus, New Jersey', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(554, 'Master your english proverb', 'M. Masood', '960-SF', 'Rabia book house, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(555, 'Guide to patterns and usage in english', 'A. S. Hornby', '733-D', 'Oxford university press & The english language book society', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(556, 'English simple grammar & composition', 'Zia-ur-Rahman Khan', '3043', 'Markazi Kutub Khana, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(557, 'Good-Bye Mr.Chips', 'James Hilton', '1586', 'Pakistani Branch, Oxford university press', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(558, '5000 proverbs', 'M. Zaman, Naveed Akhtar', '957-SF', 'Rabia book house, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-09-01 04:47:07'),
(559, 'Dialogue Practice', 'Muhammad Masood', '666-D', 'Rabia book house, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(560, 'A selection of english prose for BS students', 'Nosheen Khan, G. S. Qureshi', '945-SF', 'The Caravan book house, Lahore, Pakistan', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(561, 'Signs in action', 'James Sutton', '6-D', 'Reinhold publishing corporation, New York', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(562, 'A selection of modern english essays', 'Sajjad Shaikh', '3007-SF', 'The Caravan book house, Lahore, Pakistan', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(563, 'Good-Bye Mr.Chips', 'James Hilton', '8', 'Punjab Textbook Board, Lahore', 'English', 4, 4, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(564, 'Good-Bye Mr.Chips', 'James Hilton', '45-SF', 'Punjab Textbook Board, Lahore', 'English', 4, 4, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(565, 'Good-Bye Mr.Chips', 'James Hilton', '44-SF', 'Punjab Textbook Board, Lahore', 'English', 4, 4, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(566, 'Good-Bye Mr.Chips', 'James Hilton', '1591', 'Punjab Textbook Board, Lahore', 'English', 4, 4, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(567, 'The old man and the see', 'Ernest Hemingway', '3009', 'Jonathan Cape thirty bedford square London', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(568, 'The old man and the see', 'Ernest Hemingway', '3008', 'W & S brothers Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(569, 'A workbook of english grammar and composition', 'Karamat Hussain, Akhtar-ud-din, Iftikhar Ahmad', '222', 'Jadeed book depot Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(570, 'Modern guide to english', NULL, '711', 'Pakistan book centre, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(571, 'High school english grammar and composition', 'Wren, Martin', '329', 'Shalimar publishers, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(572, 'Chamber Idioms', 'E. M Kirkpatrick, C. M. Schwarz', '668-D', 'W & R chambers Ltd Edinburgh', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(573, 'Living english structure', 'W. Stannard Allen', '553-SF', 'Longman', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(574, 'A selection of Short stories', 'Drek Hudson', '648-SF', 'Allied book corporation', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(575, 'A selection of Short stories', 'Drek Hudson', '649-SF', 'Allied book corporation', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(576, 'A selection of modern english essays', 'Sajjad Shaikh', '3038', 'The Caravan book house, Lahore, Pakistan', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(577, 'Oxford progressive english alternative course', 'A. S. Hornby, R. Mackin', '653', 'Oxford university press', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(578, 'Ripon college composition', 'Ghulam Jilani Asghar', '603-SF', 'Noorsons, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(579, 'Polymer English Grammar', NULL, '46-SF', NULL, 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(580, 'Missing person', 'Karen Hunter Anderson, Kathleen Breugging, John Lance', '263-SF', 'Longman', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(581, 'BS english simple grammar & composition', 'Zia-ur-Rahman Khan', '1039-SF', 'Simple book house, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(582, 'Essentials of english grammar', 'D. Terence Langendoen', '22-D', 'Holt, Rinehart and Winston, Inc.', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(583, 'B.A. Englsih simple grammar & composition', 'Zia-ur-Rahman Khan', '3010', 'Simple book house, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(584, 'A textbook of English for class XI', 'S. Sabir Jamil, Muhammad Aslam Gondal, M. H Hamdani', '870-SF', 'Punjab Textbook Foundaion, Islamabad', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(585, 'A textbook of English for class XI', 'S. Sabir Jamil, Muhammad Aslam Gondal, M. H Hamdani', '871-SF', 'Punjab Textbook Foundaion, Islamabad', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(586, 'A textbook of English for class XI', 'S. Sabir Jamil, Muhammad Aslam Gondal, M. H Hamdani', '872-SF', 'Punjab Textbook Foundaion, Islamabad', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(587, 'B.Sc. Simple grammar & composition', 'Zia-ur-Rahman Khan', '912-SF', 'Simple book house, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(588, 'B.Sc. Simple grammar & composition', 'Zia-ur-Rahman Khan', '944-SF', 'Simple book house, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(589, 'A new anthology of english verse', 'Kaneez Aslam, Shuaib Bin Hasan', '1040-SF', 'The Caravan book house, Lahore, Pakistan', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(590, 'Intermediate English', NULL, '940-SF', 'Punjab Textbook Board, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(591, 'Intermediate English', NULL, '943-SF', 'Punjab Textbook Board, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(592, 'English grammar and composition with textbook supplement', 'Aslam Gondal', '613-SF', 'Ilmi book house, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(593, 'English general', 'Ch. Manzoor Ahmed', '3064', 'Dogar brothers, Urdu bazar, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(594, 'Polymer English grammar and composition for B.A. Students', 'B.A. Chisty, R. A. Khan, S. A. Hamid', '219-D', 'Polymer Publications', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(595, 'Polymer English grammar for intermediate students', 'Mukhtar Parvez, Arif Muhammad, Syed Saadat Mehdi', '3165', 'Polymer Publications', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(596, 'A practical english grammar', 'AJ Thomson, AV Martinet', '1765', 'Oxford University press', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(597, 'Diploma in english', 'S. H. Khan', '2324', 'Maktaba-e-Faridi, Urdu college Karachi', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(598, 'English grammar and composition with textbook supplement for intermediate students', 'DR. A. R. Anjum, Iftikhar Ahmad Bajwa, Nisar Ahmad Qureshi', '614-SF', 'Polymer Publications', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(599, 'Intermediate English short stories', NULL, '36-SF', 'Punjab Textbook Board, Lahore', 'English', 2, 2, '2025-06-16 19:55:38', '2025-06-16 19:55:38'),
(625, 'Chemistry the Molecular Science', 'John Olmsted III, Geroge McWi', '527-D', 'Mosby Year Book Inc', 'Chemistry', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(626, 'Atkins\' Physical Chemistry', 'Peter Atkins, Julio de Paula', '718-D', 'National Book Foundation', 'Chemistry', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(627, 'Physical Chemistry', 'Walter J. Moora', '731-D', 'National Book Foundation', 'Chemistry', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(628, 'Analytical Chemistry', 'Gary D. Christian', '725-D', 'John Wiley&Sons Inc', 'Chemistry', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(629, 'Organic Chemistry', 'John McMurry', '720-D', 'National Book Foundation', 'Chemistry', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(630, 'Harper\'s Review of Biochem:', 'David.W.Martin, Peter.A.Maye', '62-D', 'Lange Medical Publications', 'Chemistry', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(631, 'Problem Solving in General C', 'Ronald A. Delorenzo', '510-D', 'Wm.C.Brown Publishers', 'Chemistry', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(632, 'A-Level Chemistry', 'E.N.Ramsden', '3249', 'Stanley Thornes(Publishers)', 'Chemistry', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(633, 'Modern Inorganic Chemistry', 'Dr. Haq Nawaz Bhatti, Dr. Bashi', '447-D', 'Carvan Book House-Lahore', 'Chemistry', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(634, 'Chemistry', 'James P.Birk', '425-D', 'Houghton Mifflin Company', 'Chemistry', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(635, 'Understanding Social Inequality', 'Hubert M. Blalock, Jr.', '404-D', 'Saga Publications', 'Sociology', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(636, 'Social Order in Pakistani Society', 'Dr.M. Sahibuddin Baqai', '818-D', 'National Book Foundation', 'Sociology', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(637, 'The Social Context of AIDS', 'Joan Huber, Beth E. Schneider', '376-D', 'Saga Publications', 'Sociology', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(638, 'The Social Experience An ', 'James W. Vander Zanden', '459-D', 'McGraw-Hill Publishers', 'Sociology', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(639, 'Social Problems a Critical App', 'Kenneth J. Neubeck', '462-D', 'McGraw-Hill Inc', 'Sociology', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(640, 'Social Work Processes', 'Beulah Roberts Compton, Burt', '41-D', 'The Dorsey Press', 'Sociology', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(641, 'Sociology a Brief Introduction', 'Richard T. Schaefer', '1615-SF', 'McGraw-Hill Education', 'Sociology', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(642, 'Sociology and School Knowle', 'Geoff Whitty', '1433-SF', 'Methuen &Co.Ltd', 'Sociology', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(643, 'Sociology', 'John J. Macionis', '1598-SF', 'Pearson', 'Sociology', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(644, 'Sociology', 'Paul B.Horton, Chester L.Hunt', '1532-SF', 'McGraw Hill', 'Sociology', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(645, 'A History of India Under Babe', 'William Erskine', '2704', 'Fine Arts Publishing House N', 'History', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(646, 'Inside the Third Reich', 'Albert Speer', '1386', 'Macmillan', 'History', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(647, 'A Short History of Islam', 'S.F.Mahmud', '2782', 'Oxford University Press', 'History', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(648, 'A short History of the Arab Pe', 'John Bagot Glubb', '1384', 'Quartet Books Limited', 'History', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(649, 'History of SIND Vol 1', 'Sir H.M.Elliot, Proff John Dows', '702', 'Karimsons Karachi', 'History', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(650, 'Pakistan Year Book', 'Rafique Akhtar', '752', 'East&West Publishing Comp', 'History', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(651, 'Women in Muslim History', 'Charis Waddy', '881', 'Longman', 'History', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(652, 'The Partition of the Punjab 1', 'Mian Muhammad Sadullah', '141-D', 'National Documentation Cent', 'History', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(653, 'The World a General Geograg', 'Sir Dudley Stamp', '878', 'Geographical Publications', 'History', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(654, 'Advanced Engineering Mathe', 'Erwin Kreyszig', '930-SF', 'W.A. Benjamin', 'Mathematics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(655, 'Calculus and its Application', 'Larry J. Goldstein, David C. Lay', '1242-D', 'Prentice Hall', 'Mathematics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(656, 'Calculus', 'Howard Anton', '745-D', 'National Book Foundation', 'Mathematics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(657, 'Calculus and Analytic Geome', 'C.H. Edwards, David E. Penney', '239-D', 'McGraw-Hill Publishers', 'Mathematics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(658, 'Introduction to Algorithms', 'Thomas H.Cormen, Charles E. Le', '1594-SF', 'MIT Press', 'Mathematics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(659, 'Key to Mathematical Method', 'Dr. S.M.Yusuf, Dr.Abdul Majeed', '850-SF', 'Ilmi Kitab Khana', 'Mathematics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(660, 'Salas and Hille\'s Calculus', 'Garret J.Etgen', '635-D', 'John Wiley & Sons', 'Mathematics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(661, 'Thomas\' Calculus', 'George B. Thomas JR.', '1387-SF', 'Pearson', 'Mathematics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(662, 'Calculus', 'Thomas Finney', '743-D', 'National Book Foundation', 'Mathematics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(663, 'Calculs', 'Swokoski,Olinck, Pence', '833-D', 'PWS Publishing Company', 'Mathematics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(664, 'Introduction to Probability', 'Dimitri P.Bertsekas, John N, Tsi', '1540-SF', 'Athena Scientific', 'Statistics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(665, 'Introduction to Statistics', 'Ronald E. Walpole', '1381-SF', 'Collier Macmillan Ltd', 'Statistics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(666, 'Probability and Statistics for', 'J.Lay.Devore', '1541-SF', 'Cengage Learning', 'Statistics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(667, 'Statistics for Social Data Anal', 'George W. Bohrnstedt, David K', '302-D', 'F.E. Peacock Publishers Inc', 'Statistics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(668, 'Probability & Statistics for En', 'Ronald E. Walpole, Raymond H', '1572-SF', 'Prentice Hall', 'Statistics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(669, 'Physics vol 1', 'Robert Resnick,David Halliday', '1185-SF', 'Wiley & Sons', 'Physics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(670, 'Physics vol 2', 'Robert Resnick,David Halliday', '1217-SF', 'Wiley & Sons', 'Physics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(671, 'Fundamental of Physics', 'Robert Resnick,David Halliday', '1367-SF', 'Wiley & Sons', 'Physics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(672, 'Methods of Theoretical Physi', 'Philip M.Morse, Herman Feshb', '1420-SF', 'McGraw Hill Book Compan', 'Physics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(673, 'University Physics with Mode', 'Young, Freedman', '1220-SF', 'Pearson', 'Physics', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(674, 'Maxwell on The Interpretatic', 'P.St.J.Langan', '754-D', 'National Book Foundation', 'Psychology', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(675, 'Stability and Change in Devel', 'Jens B.Asendorpf, Jaan Valsine', '420-D', 'Saga Publications', 'Psychology', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(676, 'Florence W. Kaslow', 'Florence W. Kaslow', '425-D', 'Saga Publications', 'Psychology', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(677, 'Psychology', 'Camille B.Wortman, Elizabeth', '1598-D', 'MCGRAW Hill', 'Psychology', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(678, 'Educational Psychology a Deve', 'Norman A.Sprinthall, Richard C', '432-D', 'MCGRAW Hill', 'Psychology', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(679, 'The Present State of Indian P', 'Sir Syed Ahmed', '997', 'Sang-E-Meel Publishers', 'Political Science', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(680, 'Introduction to Political Scier', 'Carlton Clymer Rodee, Totton J', '322', 'MCGRAW Hill', 'Political Science', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(681, 'Major Foreign Powers', 'Carter Herz', '753-D', 'National Book Foundation', 'Political Science', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(682, 'Political Thought from Plato t', 'M. Judd Harmon', '723-D', 'MCGRAW Hill Book Compan', 'Political Science', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:04:55'),
(683, 'Introduction to Political Scier', 'Carlton Clymer Rodee, Totton J', '776-D', 'MCGRAW Hill Inc', 'Political Science', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(684, 'Iqbal, Jinnah and Pakistan the', 'CM Naim, Fazlur Rehman, Sala', '2708', 'Vanguard Books Ltd', 'Pakistan Science', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(685, 'Pakistan Studies Compulsory', 'Ikram-ul-Haq Raja', '815-SF', 'Azeem Academy', 'Pakistan Science', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(686, 'Pakistan Studies', 'M.D.Zafar', '1405', 'Aziz Publishers', 'Pakistan Science', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(687, 'The Military and Politics in Pa', 'Hasan Askari Rizvi', '884', 'Progressive Publishers', 'Pakistan Science', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(688, 'Speeches and Statement of th', 'M.Rafique Afzal, Mahomed Ali', '306', 'Research Society of Pakistan', 'Quaid-E-Azam', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(689, 'Quaid-I-Azam Jinnah Studies', 'Sharif Al Mujahid', '745', 'Quaid-I-Azam Academy', 'Quaid-E-Azam', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(690, 'Quaid-E-Azam as I Knew Him', 'M. A.H.Ispahani', '309', 'Royal Book Company', 'Quaid-E-Azam', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(691, 'Plain Mr.Jinnah', 'Syed Shamsul Hasan', '577', 'Royal Book Company', 'Quaid-E-Azam', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(692, 'My Leader', 'Z. A. Suleri', '754', 'Progressive Papers Ltd', 'Quaid-E-Azam', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(693, 'Iqbal\'s Philosophy of Religi', 'Dr. Mohammed Maaruf', '586', 'Islamic Book Service', 'Allama Iqbal', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(694, 'Secrets of Collective Life', 'A.R.Tariq', '2261', 'Islamic Book Service', 'Allama Iqbal', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(695, 'Tributes to Iqbal', 'Muhammad Hanif Shahid', '605', 'Sang-E-Meel Publication', 'Allama Iqbal', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(696, 'Iqbal', 'Atiya Begum', '258', 'Aina-I-Adab', 'Allama Iqbal', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:04:34'),
(697, 'Iqbal the Universal Poet', 'Dr. Muhammad Din Taseer', '1959', 'Muneeb Publishers', 'Allama Iqbal', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(698, 'The Vision Selections from th', 'Lieutenant Colonel(Retd) Shai', '128-SF', 'Elite Publishers', 'Islamiyat', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(699, 'Muhammad In The Quran', 'Ali Musa Raza', '2257', 'Madina Publishing Company', 'Islamiyat', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(700, 'Everyday Fiqh Vol 2', 'Abdul Aziz Kamal', '282', 'Islamic Publications Ltd', 'Islamiyat', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(701, 'Mohammad The Prophet of P', 'Allama Syed Suleman Naqvi', '579', 'Oriental Publishers & Books', 'Islamiyat', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(702, 'An Annotated Bibliography o', 'Seyyed Hossein Nasr', '2270', 'Suhail Academy', 'Islamiyat', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(703, 'Jude the Obscure', 'Thomas Hardy', '497-SF', 'A Signet Classic', 'English Novels', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(704, 'Thurston Clarke', 'Thurston Clarke', '34-SF', 'Panther Books', 'English Novels', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(705, 'The Pale Horse', 'Agatha Christie', '861-SF', 'Harper Collins Publishers', 'English Novels', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(706, 'The Warden', 'Anthony Trollope', '2922', 'Oxford University Press', 'English Novels', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(707, 'The Doomsday Conspiracy', 'Sidney Sheldon', '562-SF', 'Fontana, Harper Collins Pub', 'English Novels', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(708, 'A slection of English Poetry', 'Milton, Wordsworth, Keats Bro', '654-SF', 'College Book Depot', 'English Poetry', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(709, 'Modern English Verse', 'Prof. Mrs. U.K.Siraj-ud-Din', '85-SF', 'The Ideal Book House', 'English Poetry', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(710, 'Aristotle\'s Poetics', 'Prof. M.Ali Malik, Prof.Dr.H.Zia', '1763-SF', 'New Kitab Mahal Publishers', 'English Poetry', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(711, 'Selected Poems for B.A', 'Milton, Wordsworth, Keats Bro', '655-SF', 'New Kitab Mahal Publishers', 'English Poetry', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(712, 'An Apology for Poetry', 'Philip Sidney', '1761-SF', 'New Kitab Mahal Publishers', 'English Poetry', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(713, 'History of English Literature', 'Louis Cazamian , Raymond Las', '1554-SF', 'J. M. Dent & Sons Ltd', 'English Literature', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(714, 'Feminist Literery Theory', 'Mary Eagleton', '1345-SF', 'Wiley-Blackwell', 'English Literature', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(715, 'Preface to Shakespeare', 'Samuel Johnson', '1762-SF', 'New Kitab Mahal Publishers', 'English Literature', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(716, 'American Literature', 'George Kearns', '543-D', 'Macmillan Publishing Compa', 'English Literature', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(717, 'Eighteenth Century English L', 'Maximillian E.Novak', '2157', 'The Macmillan Press Ltd', 'English Literature', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(718, 'The English Languge in Pakist', 'Robert J. Baumgardner', '814-D', 'National Book Foundation', 'English Langauge', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41'),
(719, 'The Cambridge Encyclopedia', 'David Crystal', '812-D', 'National Book Foundation', 'English Langauge', 1, 1, '2025-09-09 22:02:41', '2025-09-09 22:02:41');

-- --------------------------------------------------------

--
-- Table structure for table `book_requests`
--

CREATE TABLE `book_requests` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book_requests`
--

INSERT INTO `book_requests` (`id`, `book_id`, `user_id`, `request_date`, `status`, `notes`) VALUES
(11, 299, 41, '2025-08-30 19:28:47', 'pending', ''),
(12, 300, 41, '2025-08-30 19:34:49', 'pending', '');

-- --------------------------------------------------------

--
-- Table structure for table `ebooks`
--

CREATE TABLE `ebooks` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(100) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_size` varchar(20) DEFAULT NULL,
  `file_type` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `cover_image` varchar(255) DEFAULT NULL,
  `type` enum('Pastpapers','outlines','ebooks') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ebooks`
--

INSERT INTO `ebooks` (`id`, `title`, `author`, `category`, `file_path`, `file_size`, `file_type`, `description`, `uploaded_by`, `created_at`, `cover_image`, `type`) VALUES
(1, 'React Interview Questions & Answers Guide', 'Felin Predator', 'Programming', '../uploads/ebooks/684154050fc11_ULTIMATE React Interview Questions & Answers Guide.pdf', '1.78 MB', 'pdf', 'React Interview Questions & Answers Guide', NULL, '2025-06-05 15:23:33', '../uploads/ebook_covers/684f09cbcd7c4.jpg', NULL),
(8, 'HQ-001', 'PU', 'BS IT-1', '../uploads/ebooks/68af666223f08_Holy Quran Notification and Model Paper.pdf', '1.66 MB', 'pdf', 'Translation of Holy Quran', 35, '2025-08-28 03:11:14', '../uploads/ebook_covers/68af6662239c9.jpeg', 'outlines'),
(9, 'GE-165', 'PU', 'BS IT-1', '../uploads/ebooks/68af66d31474e_GE-165.pdf', '102.74 KB', 'pdf', 'Pakistan Studies', 35, '2025-08-28 03:13:07', '../uploads/ebook_covers/68af66d314492.jpg', 'outlines'),
(10, 'GE-163', 'PU', 'BS IT-1', '../uploads/ebooks/68af675db5797_GE-163.pdf', '100.69 KB', 'pdf', 'Islamic Studies', 35, '2025-08-28 03:15:25', '../uploads/ebook_covers/68af675db52a6.jpg', 'outlines'),
(11, 'GE-162', 'PU', 'BS IT-1', '../uploads/ebooks/68af68478a7b3_GE-162.pdf', '101.31 KB', 'pdf', 'English Composition and Comprehension', 35, '2025-08-28 03:19:19', '../uploads/ebook_covers/68af68478a455.jpg', 'outlines'),
(12, 'MS-151', 'PU', 'BS IT-1', '../uploads/ebooks/68af68fde08b0_MS-151.pdf', '109.43 KB', 'pdf', 'Applied Pyhsics', 35, '2025-08-28 03:22:21', '../uploads/ebook_covers/68af68fde05b1.jpeg', 'outlines'),
(13, 'MS-152', 'PU', 'BS IT-1', '../uploads/ebooks/68af69b28e89f_MS-152.pdf', '102.46 KB', 'pdf', 'Calculus & Analytical Geometry', 35, '2025-08-28 03:25:22', '../uploads/ebook_covers/68af69b28e255.jpeg', 'outlines'),
(14, 'GE-161', 'PU', 'BS IT-1', '../uploads/ebooks/68af6b1ca6272_GE-161.pdf', '109.85 KB', 'pdf', 'Introduction to ICT', 35, '2025-08-28 03:31:24', '../uploads/ebook_covers/68af6b1ca5f9b.jpg', 'outlines'),
(15, 'GE-161L', 'PU', 'BS IT-1', '../uploads/ebooks/68af6b50a1ac4_GE-161L.pdf', '108.9 KB', 'pdf', 'Introduction to ICT Lab', 35, '2025-08-28 03:32:16', '../uploads/ebook_covers/68af6b50a1829.jpg', 'outlines'),
(16, 'P2021_GE-161', 'PU', 'BS IT-1', '../uploads/ebooks/68af6beeeefe0_P2021_GE-161.pdf', '143.67 KB', 'pdf', '', 35, '2025-08-28 03:34:54', '../uploads/ebook_covers/68af6beeeec24.jpeg', 'Pastpapers'),
(17, 'P2021_GE-162', 'PU', 'BS IT-1', '../uploads/ebooks/68af6d5204834_P2021_GE-162.pdf', '86.38 KB', 'pdf', '', 35, '2025-08-28 03:40:50', '../uploads/ebook_covers/68af6d52029ab.jpeg', 'Pastpapers'),
(18, 'P2021_GE-163', 'PU', 'BS IT-1', '../uploads/ebooks/68af6dc8ce0d7_P2021_GE-163.pdf', '199.27 KB', 'pdf', '', 35, '2025-08-28 03:42:48', '../uploads/ebook_covers/68af6dc8cde69.png', 'Pastpapers'),
(19, 'P2021_MS-151', 'PU', 'BS IT-1', '../uploads/ebooks/68af6e4154696_P2021_MS-151.pdf', '195.23 KB', 'pdf', '', 35, '2025-08-28 03:44:49', '../uploads/ebook_covers/68af6e415437d.png', 'Pastpapers'),
(20, 'P2021_MS-152A', 'PU', 'BS IT-1', '../uploads/ebooks/68af6ecae86c4_P2021_MS-152A.pdf', '85.3 KB', 'pdf', '', 35, '2025-08-28 03:47:06', '../uploads/ebook_covers/68af6ecae8282.png', 'Pastpapers'),
(21, 'P2021_MS-152A', 'PU', 'BS IT-1', '../uploads/ebooks/68af6f54b3c40_P2021_GE-165.pdf', '113.93 KB', 'pdf', '', 35, '2025-08-28 03:49:24', '../uploads/ebook_covers/68af6f54b396f.png', 'Pastpapers'),
(22, 'HQ-008', 'PU', 'BS IT-8', '../uploads/ebooks/68b017b771585_Holy Quran Notification and Model Paper.pdf', '1.66 MB', 'pdf', 'Translation of Holy Quran', 35, '2025-08-28 15:47:51', '../uploads/ebook_covers/68b017b76ff94.jpg', 'outlines'),
(23, 'DI-421', 'PU', 'BS IT-8', '../uploads/ebooks/68b01883bba40_DI421.pdf', '291.45 KB', 'pdf', 'Virtual Systems and Services', 35, '2025-08-28 15:51:15', '../uploads/covers/68b018ee35cca.png', 'outlines'),
(24, 'DI-421L', 'PU', 'BS IT-8', '../uploads/ebooks/68b0193f0b7a4_DI421L.pdf', '292.19 KB', 'pdf', 'Virtual Systems and Services Lab', 35, '2025-08-28 15:54:23', '../uploads/ebook_covers/68b0193f0a8be.png', 'outlines'),
(25, 'EI-337', 'PU', 'BS IT-8', '../uploads/ebooks/68b019da9acc0_EI337.pdf', '289.26 KB', 'pdf', 'Software Quality Assurance', 35, '2025-08-28 15:56:58', '../uploads/ebook_covers/68b019da9a252.jpeg', 'outlines'),
(26, 'GE-261', 'PU', 'BS IT-8', '../uploads/ebooks/68b01a246b5c4_GE261.pdf', '292.4 KB', 'pdf', 'Technical and Business Writing', 35, '2025-08-28 15:58:12', '../uploads/ebook_covers/68b01a246ad89.jpg', 'outlines'),
(27, 'UE-371', 'PU', 'BS IT-8', '../uploads/ebooks/68b01ad4d2598_EI337.pdf', '289.26 KB', 'pdf', 'Social Service', 35, '2025-08-28 16:01:08', '../uploads/ebook_covers/68b01ad4d2063.jpeg', 'outlines'),
(28, 'GE-166', 'PU', 'BS IT-8', '../uploads/ebooks/68b01b1ce12f7_GE166.pdf', '289.79 KB', 'pdf', 'Professional Practices', 35, '2025-08-28 16:02:20', '../uploads/ebook_covers/68b01b1ce0d3e.jpg', 'outlines'),
(29, 'HQ-007', 'PU', 'BS IT-7', '../uploads/ebooks/68b01c76dbe79_Holy Quran Notification and Model Paper.pdf', '1.66 MB', 'pdf', 'Translation of Holy Quran', 35, '2025-08-28 16:08:06', '../uploads/ebook_covers/68b01c76db9b9.jpeg', 'outlines'),
(30, 'DI-324', 'PU', 'BS IT-7', '../uploads/ebooks/68b01ce3747f9_DI324.pdf', '289.08 KB', 'pdf', 'Database Administration and Management', 35, '2025-08-28 16:09:55', '../uploads/ebook_covers/68b01ce373f42.jpeg', 'outlines'),
(31, 'DI-324L', 'PU', 'BS IT-7', '../uploads/ebooks/68b01d4565c64_DI324L.pdf', '291.95 KB', 'pdf', 'Database Administration and Management Lab', 35, '2025-08-28 16:11:33', '../uploads/ebook_covers/68b01d45658a4.jpeg', 'outlines'),
(32, 'DI-325', 'PU', 'BS IT-7', '../uploads/ebooks/68b01d9c72484_DI325.pdf', '288.82 KB', 'pdf', 'Cyber Security', 35, '2025-08-28 16:13:00', '../uploads/ebook_covers/68b01d9c7215e.jpeg', 'outlines'),
(33, 'DI-321', 'PU', 'BS IT-7', '../uploads/ebooks/68b01df1651d8_DI321.pdf', '291.98 KB', 'pdf', 'IT Project Management', 35, '2025-08-28 16:14:25', '../uploads/ebook_covers/68b01df164cac.jpeg', 'outlines'),
(34, 'EI-334', 'PU', 'BS IT-7', '../uploads/ebooks/68b01e54ac80c_EI334.pdf', '290.26 KB', 'pdf', 'Data Science', 35, '2025-08-28 16:16:04', '../uploads/ebook_covers/68b01e54ac343.jpeg', 'outlines'),
(35, 'HQ-006', 'PU', 'BS IT-6', '../uploads/ebooks/68b01f174023e_Holy Quran Notification and Model Paper.pdf', '1.66 MB', 'pdf', 'Translation of Holy Quran', 35, '2025-08-28 16:19:19', '../uploads/ebook_covers/68b01f173ff10.jpeg', 'outlines'),
(36, 'DI-323', 'PU', 'BS IT-6', '../uploads/ebooks/68b01f7b8a916_DI323.pdf', '290.46 KB', 'pdf', 'System and Network Administration', 35, '2025-08-28 16:20:59', '../uploads/ebook_covers/68b01f7b8a22a.jpeg', 'outlines'),
(37, 'DI-323L', 'PU', 'BS IT-6', '../uploads/ebooks/68b01fa80daf3_DI323L.pdf', '291.91 KB', 'pdf', 'System and Network Administration', 35, '2025-08-28 16:21:44', '../uploads/ebook_covers/68b01fa80d3d4.jpeg', 'outlines'),
(38, 'SI-342', 'PU', 'BS IT-6', '../uploads/ebooks/68b0202b46794_SI342.pdf', '293.04 KB', 'pdf', 'Enterprise Systems', 35, '2025-08-28 16:23:55', '../uploads/ebook_covers/68b0202b463b9.png', 'outlines'),
(39, 'EI-333', 'PU', 'BS IT-6', '../uploads/ebooks/68b0205008a62_EI333.pdf', '291.3 KB', 'pdf', 'Mobile Application Development', 35, '2025-08-28 16:24:32', '../uploads/ebook_covers/68b0205008180.jpeg', 'outlines'),
(40, 'UE-272', 'PU', 'BS IT-6', '../uploads/ebooks/68b0209eee37d_UE272.pdf', '291.11 KB', 'pdf', 'Principles of Management', 35, '2025-08-28 16:25:50', '../uploads/ebook_covers/68b0209eee102.jpeg', 'outlines'),
(41, 'HQ-005', 'PU', 'BS IT-5', '../uploads/ebooks/68b021109a9c0_Holy Quran Notification and Model Paper.pdf', '1.66 MB', 'pdf', 'Translation of Holy Quran', 35, '2025-08-28 16:27:44', '../uploads/ebook_covers/68b021109a692.jpeg', 'outlines'),
(42, 'DI-322', 'PU', 'BS IT-5', '../uploads/ebooks/68b021b0247bb_DI322.pdf', '289.79 KB', 'pdf', 'Web Technologies', 35, '2025-08-28 16:30:24', '../uploads/ebook_covers/68b021b01dbcd.jpeg', 'outlines'),
(43, 'DI-322L', 'PU', 'BS IT-5', '../uploads/ebooks/68b021e01716f_DI322L.pdf', '289.17 KB', 'pdf', 'Web Technologies Lab', 35, '2025-08-28 16:31:12', '../uploads/ebook_covers/68b021e016cbc.jpeg', 'outlines'),
(44, 'CC-311', 'PU', 'BS IT-5', '../uploads/ebooks/68b0225b91327_CC311.pdf', '290.06 KB', 'pdf', 'Operating Systems', 35, '2025-08-28 16:33:15', '../uploads/ebook_covers/68b0225b90fec.jpeg', 'outlines'),
(45, 'CC-311L', 'PU', 'BS IT-5', '../uploads/ebooks/68b02282a649b_CC311L.pdf', '295.1 KB', 'pdf', 'Operating Systems Lab', 35, '2025-08-28 16:33:54', '../uploads/ebook_covers/68b02282a5f57.jpeg', 'outlines'),
(46, 'SI-341', 'PU', 'BS IT-5', '../uploads/ebooks/68b0234dc7484_SI341.pdf', '290.09 KB', 'pdf', 'Software Requirements Engineering', 35, '2025-08-28 16:37:17', '../uploads/ebook_covers/68b0234dc6c55.png', 'outlines'),
(47, 'CC-312', 'PU', 'BS IT-5', '../uploads/ebooks/68b02383871b2_CC312.pdf', '289.17 KB', 'pdf', 'Information Security', 35, '2025-08-28 16:38:11', '../uploads/ebook_covers/68b0238386d7d.jpeg', 'outlines'),
(48, 'EI-331', 'PU', 'BS IT-5', '../uploads/ebooks/68b024012cded_EI331.pdf', '288.89 KB', 'pdf', 'Design and Analysis of Algorithms', 35, '2025-08-28 16:40:17', '../uploads/ebook_covers/68b024012c36e.jpeg', 'outlines'),
(49, 'HPE-301', 'PU', 'BS HPE-5', '../uploads/ebooks/68b0365a64850_C_HPE-301.pdf', '371.07 KB', 'pdf', 'Science of Sports Training  (Major 1)', 35, '2025-08-28 17:58:34', '../uploads/ebook_covers/68b0365a6385e.jpeg', 'outlines'),
(50, 'HPE-302', 'PU', 'BS HPE-5', '../uploads/ebooks/68b03726eb6bc_C_HPE-302.pdf', '357.05 KB', 'pdf', 'PHYSICAL EDUCATION FOR SPECIAL POPULATION', 35, '2025-08-28 18:01:58', '../uploads/ebook_covers/68b03726eb3a5.jpeg', 'outlines'),
(51, 'HPE-303', 'PU', 'BS HPE-5', '../uploads/ebooks/68b037803fe6f_C_HPE-303.pdf', '379.5 KB', 'pdf', 'Sports Nutrition', 35, '2025-08-28 18:03:28', '../uploads/ebook_covers/68b037803b4b6.jpeg', 'outlines'),
(52, 'HPE-304', 'PU', 'BS HPE-5', '../uploads/ebooks/68b038082816c_C_HPE-304.pdf', '407.24 KB', 'pdf', 'Application of Statistics in Physical Education (General 7)', 35, '2025-08-28 18:05:44', '../uploads/ebook_covers/68b0380827b3a.jpeg', 'outlines'),
(53, 'HPE-305', 'PU', 'BS HPE-5', '../uploads/ebooks/68b038aca6950_C_HPE-305.pdf', '211.03 KB', 'pdf', 'Biochemistry (General 2)', 35, '2025-08-28 18:08:28', '../uploads/ebook_covers/68b038aca6567.jpeg', 'outlines'),
(54, 'HPE-306', 'PU', 'BS HPE-5', '../uploads/ebooks/68b0393d5bfa2_C_HPE-306.pdf', '311.04 KB', 'pdf', 'Teaching Practice (Practical)', 35, '2025-08-28 18:10:53', '../uploads/ebook_covers/68b0393d5b915.jpeg', 'outlines'),
(55, 'HPE-311', 'PU', 'BS HPE-6', '../uploads/ebooks/68b03ba41e0b9_C_HPE-311.pdf', '269.71 KB', 'pdf', 'Specialization in one group of track and field (Elective 4)', 35, '2025-08-28 18:21:08', '../uploads/ebook_covers/68b03ba41d86b.jpeg', 'outlines'),
(56, 'HPE-312', 'PU', 'BS HPE-6', '../uploads/ebooks/68b03c65077fd_C_HPE-312.pdf', '513.99 KB', 'pdf', 'Research Methodology in Physical Education (Major 3)', 35, '2025-08-28 18:24:21', '../uploads/ebook_covers/68b03c650753b.jpeg', 'outlines'),
(57, 'HPE-313', 'PU', 'BS HPE-6', '../uploads/ebooks/68b03e4121edd_C_HPE-313.pdf', '334.22 KB', 'pdf', 'Planning Sports Facilities (Foundation 9)', 35, '2025-08-28 18:32:17', '../uploads/ebook_covers/68b03e4121b41.jpeg', 'outlines'),
(58, 'HPE-314', 'PU', 'BS HPE-6', '../uploads/ebooks/68b03f0cb4fbe_C_HPE-314.pdf', '369.02 KB', 'pdf', 'Test Measurement & Evaluation in Phy. Edu. & Sports (Major 4)', 35, '2025-08-28 18:35:40', '../uploads/ebook_covers/68b03f0cb4c07.jpeg', 'outlines'),
(59, 'HPE-315', 'PU', 'BS HPE-6', '../uploads/ebooks/68b03f842ef7b_C_HPE-315.pdf', '518.74 KB', 'pdf', 'Sports Psychology (Major 5)', 35, '2025-08-28 18:37:40', '../uploads/ebook_covers/68b03f842ec6c.jpeg', 'outlines'),
(60, 'HPE-316', 'PU', 'BS HPE-6', '../uploads/ebooks/68b03fd63bdc9_C_HPE-316.pdf', '496.32 KB', 'pdf', 'Environmental Sciences (General 6)', 35, '2025-08-28 18:39:02', '../uploads/ebook_covers/68b03fd63b244.jpeg', 'outlines'),
(61, 'HPE-401', 'PU', 'BS HPE-7', '../uploads/ebooks/68b040db6069c_C_HPE-401.pdf', '351.01 KB', 'pdf', 'Common Sports Injuries, Treatment & Rehabilitation (Major 6)', 35, '2025-08-28 18:43:23', '../uploads/ebook_covers/68b040db603b8.jpeg', 'outlines'),
(62, 'HPE-402', 'PU', 'BS HPE-7', '../uploads/ebooks/68b0412feded0_C_HPE-402.pdf', '412.32 KB', 'pdf', 'Exercise Physiology (Major 7)', 35, '2025-08-28 18:44:47', '../uploads/ebook_covers/68b0412fedc23.jpeg', 'outlines'),
(63, 'HPE-403', 'PU', 'BS HPE-5', '../uploads/ebooks/68b041d5ddfc4_C_HPE-403.pdf', '337.61 KB', 'pdf', 'Role of Media in Sports (Elective 3)', 35, '2025-08-28 18:47:33', '../uploads/ebook_covers/68b041d5dda64.png', 'outlines'),
(64, 'HPE-404', 'PU', 'BS HPE-7', '../uploads/ebooks/68b0429b7dd97_C_HPE-404.pdf', '324.12 KB', 'pdf', 'Scientific Sports Coaching (Foundation 10)', 35, '2025-08-28 18:50:51', '../uploads/ebook_covers/68b0429b7d3ac.jpeg', 'outlines'),
(65, 'HPE-405', 'PU', 'BS HPE-7', '../uploads/ebooks/68b042f5d4613_C_HPE-405.pdf', '199.63 KB', 'pdf', 'Research Project', 35, '2025-08-28 18:52:21', '../uploads/ebook_covers/68b042f5d3bbb.jpeg', 'outlines'),
(66, 'HPE-406', 'PU', 'BS HPE-7', '../uploads/ebooks/68b0432382486_C_HPE-406.pdf', '154.24 KB', 'pdf', 'Specialization in one game (Elective 2)', 35, '2025-08-28 18:53:07', '../uploads/ebook_covers/68b0432381c8e.jpeg', 'outlines'),
(67, 'HPE-411', 'PU', 'BS HPE-8', '../uploads/ebooks/68b0452cb083e_C_HPE-411.pdf', '677.83 KB', 'pdf', 'Sports Medicine (Major 8)', 35, '2025-08-28 19:01:48', '../uploads/ebook_covers/68b0452cb04f2.jpeg', 'outlines'),
(68, 'HPE-412', 'PU', 'BS HPE-8', '../uploads/ebooks/68b04557dd2ac_C_HPE-412.pdf', '513.14 KB', 'pdf', 'Curriculum Development in Physical Education (Major 9)', 35, '2025-08-28 19:02:31', '../uploads/ebook_covers/68b04557dcf36.png', 'outlines'),
(69, 'HPE-413', 'PU', 'BS HPE-8', '../uploads/ebooks/68b047ef12574_C_HPE-413.pdf', '396.54 KB', 'pdf', 'Adapted Physical Education (Major 10)', 35, '2025-08-28 19:13:35', '../uploads/ebook_covers/68b047ef0c581.jpeg', 'outlines'),
(70, 'HPE-414', 'PU', 'BS HPE-8', '../uploads/ebooks/68b0481d234ae_C_HPE-414.pdf', '349.79 KB', 'pdf', 'Research Thesis', 35, '2025-08-28 19:14:21', '../uploads/ebook_covers/68b0481d23175.jpeg', 'outlines'),
(71, 'HPE-301', 'Past Paper', 'BS HPE-5', '../uploads/ebooks/68b066db3c251_P2021_HPE-301.pdf', '102.32 KB', 'pdf', 'Science of Sports Training', 35, '2025-08-28 21:25:31', '../uploads/ebook_covers/68b066db3b9d3.jpeg', 'Pastpapers'),
(72, 'HPE-302', 'Past Paper', 'BS HPE-5', '../uploads/ebooks/68b067362c9a9_P2021_HPE-302.pdf', '76.34 KB', 'pdf', 'Physical Education for Special population', 35, '2025-08-28 21:27:02', '../uploads/ebook_covers/68b067362c5cb.jpeg', 'Pastpapers'),
(73, 'HPE-303', 'Past Paper', 'BS HPE-5', '../uploads/ebooks/68b067a0a2164_P2021_HPE-303.pdf', '97.97 KB', 'pdf', 'Sports Nutrition (Major 2)', 35, '2025-08-28 21:28:48', '../uploads/ebook_covers/68b067a0a1ad5.jpeg', 'Pastpapers'),
(74, 'HPE-304', 'Past Paper', 'BS HPE-5', '../uploads/ebooks/68b067dd2b6ca_P2021_HPE-304.pdf', '36.52 KB', 'pdf', 'Application of Statistics in Physical Education (General 7)', 35, '2025-08-28 21:29:49', '../uploads/ebook_covers/68b067dd2b472.jpeg', 'Pastpapers'),
(75, 'HPE-305', 'Past Paper', 'BS HPE-5', '../uploads/ebooks/68b068157eebd_P2021_HPE-305.pdf', '97.45 KB', 'pdf', 'Biochemistry (General 2', 35, '2025-08-28 21:30:45', '../uploads/ebook_covers/68b068157e9ed.jpeg', 'Pastpapers'),
(76, 'ENG-301A', 'PU', 'BS ENG-5', '../uploads/ebooks/68b06b54320f6_C_ENG-301.pdf', '139.17 KB', 'pdf', 'Criticism and Theory-I', 35, '2025-08-28 21:44:36', '../uploads/ebook_covers/68b06b54318d1.jpeg', 'outlines'),
(77, 'P2021_ENG-301', 'Past Paper', 'BS IT-5', '../uploads/ebooks/68b06e5cbfca7_P2021_ENG-301.pdf', '70.15 KB', 'pdf', '', 35, '2025-08-28 21:57:32', '../uploads/ebook_covers/68b06e5cbf348.jpeg', 'Pastpapers'),
(78, 'P2022_ENG-301', 'Past Paper', 'BS ENG-5', '../uploads/ebooks/68b06eb85f1b7_P2022_ENG-301.pdf', '163.58 KB', 'pdf', '', 35, '2025-08-28 21:59:04', '../uploads/ebook_covers/68b06eb85ed42.jpeg', 'Pastpapers'),
(79, 'ENG-302', 'PU', 'BS ENG-5', '../uploads/ebooks/68b06f0038c0b_C_ENG-302.pdf', '134.4 KB', 'pdf', 'Poetry ( 14th to 18th Century)', 35, '2025-08-28 22:00:16', '../uploads/ebook_covers/68b06f003884e.png', 'outlines'),
(80, 'P2019_ENG-301-ENG-301A', 'Past Paper', 'BS ENG-5', '../uploads/ebooks/68b06f4a4611d_P2019_ENG-301-ENG-301A.pdf', '78.13 KB', 'pdf', 'P2019_ENG-301-ENG-301A', 35, '2025-08-28 22:01:30', '../uploads/ebook_covers/68b06f4a45e9b.jpeg', 'Pastpapers'),
(81, 'P2019_ENG-302', 'Past Paper', 'BS ENG-5', '../uploads/ebooks/68b06f9133bad_P2019_ENG-302.pdf', '46.64 KB', 'pdf', 'P2019_ENG-302', 35, '2025-08-28 22:02:41', '../uploads/ebook_covers/68b06f9133695.jpeg', 'Pastpapers'),
(82, 'P2022_ENG-302', 'Past Paper', 'BS ENG-5', '../uploads/ebooks/68b06fbbc6311_P2022_ENG-302.pdf', '191.4 KB', 'pdf', '', 35, '2025-08-28 22:03:23', '../uploads/ebook_covers/68b06fbbc6006.jpeg', 'Pastpapers'),
(83, 'P2021_ENG-302', 'Past Paper', 'BS ENG-5', '../uploads/ebooks/68b07008db2b0_P2021_ENG-302.pdf', '61.91 KB', 'pdf', '', 35, '2025-08-28 22:04:40', '../uploads/ebook_covers/68b07008db038.jpeg', 'Pastpapers'),
(84, 'ENG-303', 'PU', 'BS ENG-5', '../uploads/ebooks/68b070cde8f08_C_ENG-303.pdf', '121.88 KB', 'pdf', 'Novel (18th & 19th Century)', 35, '2025-08-28 22:07:57', '../uploads/ebook_covers/68b070cde8a66.jpeg', 'outlines'),
(85, 'ENG-303', 'PU', 'BS ENG-5', '../uploads/ebooks/68b07146bc0cd_C_ENG-304.pdf', '127.18 KB', 'pdf', 'Journalistic Discourse', 35, '2025-08-28 22:09:58', '../uploads/ebook_covers/68b07146bbd9d.png', 'outlines'),
(86, 'ENG-305', 'PU', 'BS ENG-5', '../uploads/ebooks/68b071c096c1d_C_ENG-305.pdf', '111.19 KB', 'pdf', 'Sociolinguistics', 35, '2025-08-28 22:12:00', '../uploads/ebook_covers/68b071c096805.jpeg', 'outlines'),
(87, 'ENG-306', 'PU', 'BS ENG-5', '../uploads/ebooks/68b071fde7d74_C_ENG-306.pdf', '116.9 KB', 'pdf', 'Visionary Discourse', 35, '2025-08-28 22:13:01', '../uploads/ebook_covers/68b071fde7ae8.jpeg', 'outlines'),
(88, 'ENG-307', 'PU', 'BS IT-6', '../uploads/ebooks/68b073fa33012_C_ENG-307.pdf', '105.14 KB', 'pdf', 'Criticism and Theory-II', 35, '2025-08-28 22:21:30', '../uploads/ebook_covers/68b073fa32b3f.jpeg', 'outlines'),
(89, 'ENG-308', 'PU', 'BS ENG-6', '../uploads/ebooks/68b07467cb17f_C_ENG-308.pdf', '126.6 KB', 'pdf', 'Classics in Drama', 35, '2025-08-28 22:23:19', '../uploads/ebook_covers/68b07467cacbc.jpeg', 'outlines'),
(90, 'ENG-309', 'PU', 'BS ENG-6', '../uploads/ebooks/68b09c0a84d87_C_ENG-309.pdf', '138.21 KB', 'pdf', '19th Century Poetry', 35, '2025-08-29 01:12:26', '../uploads/ebook_covers/68b09c0a8460f.jpeg', 'outlines'),
(91, 'ENG-310', 'PU', 'BS ENG-6', '../uploads/ebooks/68b09c953e52d_C_ENG-310.pdf', '131.52 KB', 'pdf', 'Fantasy', 35, '2025-08-29 01:14:45', '../uploads/ebook_covers/68b09c953de87.jpeg', 'outlines'),
(92, 'ENG-311', 'PU', 'BS ENG-6', '../uploads/ebooks/68b09ce932bee_C_ENG-310.pdf', '131.52 KB', 'pdf', 'World Literatures in Translation', 35, '2025-08-29 01:16:09', '../uploads/ebook_covers/68b09ce9326e5.jpeg', 'outlines'),
(93, 'ENG-401', 'PU', 'BS ENG-7', '../uploads/ebooks/68b09e1526d9b_C_ENG-401.pdf', '115.65 KB', 'pdf', '20th Century British Literature : Poetry & Drama', 35, '2025-08-29 01:21:09', '../uploads/ebook_covers/68b09e1526612.jpeg', 'outlines'),
(94, 'ENG-402', 'PU', 'BS ENG-7', '../uploads/ebooks/68b09e53dd34c_C_ENG-402.pdf', '104.43 KB', 'pdf', '20th Century Fiction & Prose', 35, '2025-08-29 01:22:11', '../uploads/ebook_covers/68b09e53dcc52.jpeg', 'outlines'),
(95, 'ENNG-403', 'PU', 'BS ENG-7', '../uploads/ebooks/68b09eb5604a1_C_ENG-403.pdf', '123.73 KB', 'pdf', 'American Literature', 35, '2025-08-29 01:23:49', '../uploads/ebook_covers/68b09eb55fdd5.jpeg', 'outlines'),
(96, 'ENG-404', 'PU', 'BS ENG-7', '../uploads/ebooks/68b09efc0bcfe_C_ENG-404.pdf', '106.89 KB', 'pdf', 'South Asian Literature', 35, '2025-08-29 01:25:00', '../uploads/ebook_covers/68b09efc0ade6.jpeg', 'outlines'),
(97, 'ENG-405', 'PU', 'BS ENG-7', '../uploads/ebooks/68b09f358f88a_C_ENG-405.pdf', '106.57 KB', 'pdf', 'Research Methodology', 35, '2025-08-29 01:25:57', '../uploads/ebook_covers/68b09f358f4ed.png', 'outlines'),
(98, 'ENG-406', 'PU', 'BS ENG-8', '../uploads/ebooks/68b0a08b60446_C_ENG-406.pdf', '116.49 KB', 'pdf', 'Continental Literature', 35, '2025-08-29 01:31:39', '../uploads/ebook_covers/68b0a08b5b24c.jpeg', 'outlines'),
(99, 'ENG-407', 'PU', 'BS ENG-8', '../uploads/ebooks/68b0a10dd83ba_C_ENG-407.pdf', '123.32 KB', 'pdf', 'Pakistani Literature', 35, '2025-08-29 01:33:49', '../uploads/ebook_covers/68b0a10dd7dd5.jpeg', 'outlines'),
(100, 'ENG-408', 'PU', 'BS ENG-8', '../uploads/ebooks/68b0a1a45377c_C_ENG-408.pdf', '122.43 KB', 'pdf', 'Teaching of Literature', 35, '2025-08-29 01:36:20', '../uploads/ebook_covers/68b0a1a453349.jpeg', 'outlines'),
(101, 'ENG-409', 'PU', 'BS ENG-8', '../uploads/ebooks/68b0a27430ce7_C_ENG-409.pdf', '103.8 KB', 'pdf', 'Research Project', 35, '2025-08-29 01:39:48', '../uploads/ebook_covers/68b0a2743097d.jpeg', 'outlines'),
(102, 'Professional Issues in Software  Engineering  Third edition', 'Frank Bott  Allison Coleman  Jack Eaton  Diane Rowland', 'BS IT-8', '../uploads/ebooks/68b0a3ecd78cc_Textbook-Professional Issues in Software Engineering.pdf', '2.07 MB', 'pdf', 'Professinal Practice', 35, '2025-08-29 01:46:04', '../uploads/ebook_covers/68b0a3ecd75f5.png', 'ebooks'),
(103, 'Software Engineering  A PRACTITIONER S APPROACH', 'Roger S. Pressman, Ph.D.  Bruce R. Maxim, Ph.D.', 'BS IT-8', '../uploads/ebooks/68b0a52ce4a6d_Roger S. Pressman, B. Maxim, Software Engineering_ A Practitioner\'s __Approach, 8th Edition, McGraw-Hill, 2014, ISBN_ 0078022126..pdf', '22.93 MB', 'pdf', 'SQA', 35, '2025-08-29 01:51:24', '../uploads/ebook_covers/68b0a52ce428d.jpeg', 'ebooks'),
(104, 'Software Quality  Assurance  From theory to implementation', 'Daniel Galin', 'BS IT-8', '../uploads/ebooks/68b0a59c1f066_Software Quality Assurance From Theory to Implementation.pdf', '5.37 MB', 'pdf', 'SQA', 35, '2025-08-29 01:53:16', '../uploads/ebook_covers/68b0a59c1ec9a.jpeg', 'ebooks'),
(105, 'Design, Implementation, and Applications  HANDBOOK OF VIRTUAL ENVIRONMENTS', 'Kelly S. Hale  Kay M. Stanney', 'BS IT-8', '../uploads/ebooks/68b0a78ac9949_handbook-of-virtual-environments-design-implementation-and-applications-second-edition-9781466511859-1466511850_compress.pdf', '37.45 MB', 'pdf', 'second edition', 35, '2025-08-29 02:01:30', '../uploads/ebook_covers/68b0a78ac9607.jpeg', 'ebooks'),
(106, 'Cloud	Computing  Concepts,	Technology	&	Architecture', 'Thomas	Erl,  Zaigham	Mahmood,  and	Ricardo	Puttini', 'BS IT-8', '../uploads/ebooks/68b0a81a6963e_CLOUD COMPUTING TEXT BOOK.pdf', '16.99 MB', 'pdf', 'Virtual System', 35, '2025-08-29 02:03:54', '../uploads/ebook_covers/68b0a81a69497.jpeg', 'ebooks'),
(107, 'A	Guide	to	the	PROJECT	MANAGEMENT  BODY	OF	KNOWLEDGE', 'Sechste Ausgabe', 'BS IT-7', '../uploads/ebooks/68b0aab7e8da2_a-guide-to-the-project-management-body-of-knowledge-6e.pdf', '15.04 MB', 'pdf', 'IT Project Management 6th edition', 35, '2025-08-29 02:15:03', '../uploads/ebook_covers/68b0aab7e8be3.jpeg', 'ebooks'),
(108, 'Information Technology Project Management', 'Kathy Schwalbe', 'BS IT-7', '../uploads/ebooks/68b0ac201c45a_Information Technology Project Management.pdf', '13.65 MB', 'pdf', 'Information Technology Project Management  8th edition', 35, '2025-08-29 02:21:04', '../uploads/ebook_covers/68b0ac201b598.jpeg', 'ebooks'),
(109, 'Data	Science	from	Scratch', 'Joel	Grus', 'BS IT-7', '../uploads/ebooks/68b0ad79c8606_Data_Science_From_Scratch.pdf', '7.05 MB', 'pdf', '1st edition', 35, '2025-08-29 02:26:49', '../uploads/ebook_covers/68b0ad79c8277.png', 'ebooks'),
(110, 'Starting Out with Python', 'Tony Gaddis', 'BS IT-7', '../uploads/ebooks/68b0ae1d16614_Tony Gaddis - Starting Out with Python [Global Edition]-Pearson (2021).pdf', '14.42 MB', 'pdf', 'FIFTH EDITION', 35, '2025-08-29 02:29:33', '../uploads/ebook_covers/68b0ae1d161b9.jpeg', 'ebooks'),
(111, 'Python Data Science Handbook Essential Tools for Working', 'Jake VanderPlas', 'BS IT-7', '../uploads/ebooks/68b0aeb54e792_Python Data Science Handbook_ Essential To - Jake Vanderplas.pdf', '21.29 MB', 'pdf', '', 35, '2025-08-29 02:32:05', '../uploads/ebook_covers/68b0aeb54e2dc.jpeg', 'ebooks'),
(112, 'Data Science from Scratch  First Principles with Python', 'Joel	Grus', 'BS IT-7', '../uploads/ebooks/68b0af18255e4_Joel Grus - Data Science from Scratch_ First Principles with Python-O\'Reilly Media (2019).pdf', '9.97 MB', 'pdf', 'Second Edition', 35, '2025-08-29 02:33:44', '../uploads/ebook_covers/68b0af1825290.jpeg', 'ebooks'),
(113, 'CompTIA  Security+  Guide to  Network Security  Fundamentals', 'Mark CiaMpa', 'BS IT-7', '../uploads/ebooks/68b0afa4465ee_A 2022 Comptia Security+ Guide to Network Security Fundamentals by Mark Ciampa (z-lib.org).pdf', '13.21 MB', 'pdf', 'Seventh Edition', 35, '2025-08-29 02:36:04', '../uploads/ebook_covers/68b0afa4462ee.png', 'ebooks'),
(114, 'Artificial Intelligence  A Modern Approach', 'Stuart Russell and Peter Norvig', 'BS IT-6', '../uploads/ebooks/68b0b0ba78377_(PEARSON SERIES IN ARTIFICIAL INTELLIGENCE) Stuart Russell and Peter Norvig - Artificial Intelligence_ A Modern Approach-Pearson (2020).pdf', '36.74 MB', 'pdf', 'Fourth Edition', 35, '2025-08-29 02:40:42', '../uploads/ebook_covers/68b0b0ba77f4f.jpeg', 'ebooks'),
(115, 'Beginning  JavaScript', 'Jeremy McPeak  Paul Wilton', 'BS IT-6', '../uploads/ebooks/68b0b15cf231e_Javascript Book.pdf', '15.43 MB', 'pdf', 'Fifth Edition', 35, '2025-08-29 02:43:24', '../uploads/ebook_covers/68b0b15cf1f1f.jpeg', 'ebooks'),
(116, 'Beginning Android 2', 'Mark L. Murphy', 'BS IT-6', '../uploads/ebooks/68b0b24e4c74c_Mark Murphy - Beginning Android 2-Apress (2010).pdf', '10.01 MB', 'pdf', '', 35, '2025-08-29 02:47:26', '../uploads/ebook_covers/68b0b24e4c3f8.jpeg', 'ebooks'),
(117, 'Management', '-Stephen.P Robbins', 'BS IT-6', '../uploads/ebooks/68b0b3a706b40_Management-Stephen.P Robbins.pdf', '34.63 MB', 'pdf', '', 35, '2025-08-29 02:53:11', '../uploads/ebook_covers/68b0b3a706803.jpeg', 'ebooks'),
(118, 'Principles of Information Security', 'Michael E. Whitman,Herbert J. Mattord', 'BS IT-5', '../uploads/ebooks/68b0b7c86844f_Principles of Information Security, 6th edition..pdf', '20.19 MB', 'pdf', 'sixth edition', 35, '2025-08-29 03:10:48', '../uploads/ebook_covers/68b0b7c867f31.jpeg', 'ebooks'),
(119, 'OPERATING  SYSTEM  CONCEPTS', 'ABRAHAM SILBERSCHATZ,PETER BAER GALVIN,GREG GAGNE', 'BS IT-5', '../uploads/ebooks/68b0c21067186_Abraham Silberschatz-Operating System Concepts (9th,2012_12).pdf', '7.58 MB', 'pdf', 'Ninth Edition', 35, '2025-08-29 03:54:40', '../uploads/ebook_covers/68b0c21066e3d.jpeg', 'ebooks'),
(120, 'Physics of the HumanBody', 'Irving P. Herman', 'BS HPE-2', '../uploads/ebooks/68b0c4a7d09a4_Herman Physics of the Human Body.pdf', '33.52 MB', 'pdf', '', 35, '2025-08-29 04:05:43', '../uploads/ebook_covers/68b0c4a7d079c.jpeg', 'ebooks'),
(121, 'Essentials of  Medical Physiology', 'K Sembulingam ,Prema Sembulingam', 'BS HPE-3', '../uploads/ebooks/68b11205333ec_KSembulingam _EssentialsofMedical_Physiology, 6th Edition.pdf', '35.86 MB', 'pdf', 'Sixth Edition', 35, '2025-08-29 09:35:49', '../uploads/ebook_covers/68b11205320f2.jpeg', 'ebooks'),
(122, 'TRACK AND FIELD  FACILITIES MANUAL', 'World Athletics', 'BS HPE-1', '../uploads/ebooks/68b1148e69497_manual_construction_track_iaaf.pdf', '8.11 MB', 'pdf', '', 35, '2025-08-29 09:46:38', '../uploads/ebook_covers/68b1148e6919a.jpeg', 'ebooks'),
(123, 'Textbook of 11 grade', 'Khalid Mehmod, SaleemUllah Satti,Naveed Akmal', '1st Year Pre Engineering', '../uploads/ebooks/68b115a41b241_Math Grade 11.pdf', '26.86 MB', 'pdf', '', 35, '2025-08-29 09:51:16', '../uploads/ebook_covers/68b115a41af54.jpeg', 'ebooks'),
(124, 'Physics', 'Naeem Nazeer,Nazir Ahmed Malik,Ajaz Ahmed', '1st Year Pre Medical', '../uploads/ebooks/68b11666a5f11_Physics Grade 11.pdf', '17.31 MB', 'pdf', '', 35, '2025-08-29 09:54:30', '../uploads/ebook_covers/68b11666a5c61.jpeg', 'ebooks'),
(125, 'Physics class 12', 'Naeem Nazeer,Nazir Ahmed Malik,Ajaz Ahmed', '2nd Year Pre Medical', '../uploads/ebooks/68b1177bc75bf_v2-12-physics-book-2025 (1).pdf', '36.04 MB', 'pdf', '', 35, '2025-08-29 09:59:07', '../uploads/ebook_covers/68b1177bc72dd.jpeg', 'ebooks'),
(126, 'Math Class 12', 'Khalid Mehmod, SaleemUllah Satti,Naveed Akmal', '2nd Year Pre Engineering', '../uploads/ebooks/68b11802d3e13_v2-12-maths-book-2025.pdf', '39.01 MB', 'pdf', '', 35, '2025-08-29 10:01:22', '../uploads/ebook_covers/68b11802d3b43.jpeg', 'ebooks'),
(127, 'COMPETITION AND  TECHNICAL RULES', 'World Athletics', 'BS HPE-4', '../uploads/ebooks/68b118a330d1f_GGG_RTI_WA_2022 (1) (2).pdf', '1.81 MB', 'pdf', '', 35, '2025-08-29 10:04:03', '../uploads/ebook_covers/68b118a33085b.jpeg', 'ebooks'),
(128, 'Biochemistry', 'PUNJB PHARMACY COUNCIL, LAHORE', 'BS HPE-2', '../uploads/ebooks/68b11be9a90c0_BIOCHEMISTRY-1.pdf', '2.4 MB', 'pdf', '', 35, '2025-08-29 10:18:01', '../uploads/ebook_covers/68b11be9a87c9.png', 'ebooks'),
(129, 'Anatomy Physiology', 'PUNJB PHARMACY COUNCIL, LAHORE', 'BS HPE-1', '../uploads/ebooks/68b11ecd64227_anatomy_physiology.pdf', '9.29 MB', 'pdf', '', 35, '2025-08-29 10:30:21', '../uploads/ebook_covers/68b11ecd63f59.jpeg', 'ebooks'),
(130, 'Managing Information  Technology Projects', 'Laszlo Peter ,Professor Mike Kagioglou', 'BS IT-2', '../uploads/ebooks/68b9bf0a089aa_(Domain-specific Bodies of Knowledge in Project Management) Srinath Perera, Robert Eadie - Managing Information Technology Projects_ Building a Body of Knowledge in It Project Management-World Scienti.pdf', '13.27 MB', 'pdf', '', 35, '2025-09-04 23:32:10', '../uploads/ebook_covers/68b9bf0a07bc1.jpeg', 'ebooks'),
(131, 'C++ Primer Plus', 'Stephen Prata', 'BS IT-2', '../uploads/ebooks/68b9bfc83130b_(Ebook) Sams - C  Primer Plus 5Th Edition 2005.pdf', '24.88 MB', 'pdf', 'fifth edition', 35, '2025-09-04 23:35:20', '../uploads/ebook_covers/68b9bfc830b89.jpeg', 'ebooks'),
(132, 'Software Project  Management  FOR  DUMmIES', 'Teresa Luckey,Joseph Phillips', 'BS IT-3', '../uploads/ebooks/68b9c02ebdce6_(For Dummies) Teresa Luckey, Joseph Phillips - Software Project Management For Dummies-Wiley (2006).pdf', '5.91 MB', 'pdf', '', 35, '2025-09-04 23:37:02', '../uploads/ebook_covers/68b9c02ebd6b7.jpeg', 'ebooks'),
(134, 'Professional Apress Pro ASP.NET MVC 4', 'Adam Freeman', 'BS IT-5', '../uploads/ebooks/68b9c5754a01b_(Professional Apress) Adam Freeman - Pro ASP.NET MVC 4-Apress (2013).pdf', '22.66 MB', 'pdf', 'fourth edition', 35, '2025-09-04 23:59:33', '../uploads/ebook_covers/68b9c57549d1a.jpeg', 'ebooks'),
(135, 'Operating System Concepts', 'Abraham Silberschatz', 'BS IT-5', '../uploads/ebooks/68b9c6d511aad_Abraham Silberschatz Operating System Concepts (9th,2012_12).pdf', '7.51 MB', 'pdf', '9th edition', 35, '2025-09-05 00:05:25', '../uploads/ebook_covers/68b9c6d511695.jpeg', 'ebooks'),
(136, 'Database System', 'Abraham Silberschatz, Henry F. Korth, S. Sudarshan', 'BS IT-4', '../uploads/ebooks/68b9c7e3cfff3_Abraham Silberschatz, Henry F. Korth, S. Sudarshan - Database System Concepts-McGraw-Hill Education (2019).pdf', '15.53 MB', 'pdf', 'seventh edition', 35, '2025-09-05 00:09:55', '../uploads/ebook_covers/68b9c7e3cfbf9.jpeg', 'ebooks'),
(137, 'Translation of Holy Quran', 'PU', 'BS IT-2', '../uploads/ebooks/68bd526a39677_Holy Quran Notification and Model Paper.pdf', '1.66 MB', 'pdf', '', 35, '2025-09-07 16:37:46', '', 'outlines'),
(138, 'CC-111', 'PU', 'BS IT-2', '../uploads/ebooks/68bd55a2b99d6_CC111.pdf', '293.33 KB', 'pdf', 'Discrete Structures', 35, '2025-09-07 16:51:30', '../uploads/ebook_covers/68bd55a2b7611.jpeg', 'outlines'),
(139, 'CC-112', 'PU', 'BS IT-2', '../uploads/ebooks/68bd55f35dd76_CC112.pdf', '291.96 KB', 'pdf', 'Programming Fundamentals', 35, '2025-09-07 16:52:51', '../uploads/ebook_covers/68bd55f35d97a.jpeg', 'outlines'),
(140, 'CC-112L', 'PU', 'BS IT-2', '../uploads/ebooks/68bd561881cd7_CC112L.pdf', '291.78 KB', 'pdf', 'Programming Fundamentals LAB', 35, '2025-09-07 16:53:28', '../uploads/ebook_covers/68bd5618819d9.jpeg', 'outlines'),
(141, 'GE-164', 'PU', 'BS IT-2', '../uploads/ebooks/68bd56bb1c1fc_GE164.pdf', '291.64 KB', 'pdf', 'Communication and Presentation Skills', 35, '2025-09-07 16:56:11', '../uploads/ebook_covers/68bd56bb1bb96.jpeg', 'outlines'),
(142, 'UE-171', 'PU', 'BS IT-2', '../uploads/ebooks/68bd571bc1605_UE171.pdf', '290.29 KB', 'pdf', 'Introduction to Economics', 35, '2025-09-07 16:57:47', '../uploads/ebook_covers/68bd571bc12ec.jpeg', 'outlines'),
(143, 'UE-172', 'PU', 'BS IT-2', '../uploads/ebooks/68bd573ccc06b_UE172.pdf', '369.13 KB', 'pdf', 'Arabic Language', 35, '2025-09-07 16:58:20', '../uploads/ebook_covers/68bd573ccbd73.jpeg', 'outlines'),
(144, 'HQ-003', 'PU', 'BS IT-3', '../uploads/ebooks/68bd57f43eede_Holy Quran Notification and Model Paper.pdf', '1.66 MB', 'pdf', 'Translation of Holy Quran', 35, '2025-09-07 17:01:24', '../uploads/ebook_covers/68bd57f43e840.jpeg', 'outlines'),
(145, 'CC-211', 'PU', 'BS IT-3', '../uploads/ebooks/68bd5813a27e3_CC211.pdf', '290.46 KB', 'pdf', 'Object Oriented Programming', 35, '2025-09-07 17:01:55', '../uploads/ebook_covers/68bd5813a22c2.jpeg', 'outlines'),
(146, 'CC-211L', 'PU', 'BS IT-3', '../uploads/ebooks/68bd5833abd6f_CC211L.pdf', '291.2 KB', 'pdf', 'Object Oriented Programming LAB', 35, '2025-09-07 17:02:27', '../uploads/ebook_covers/68bd5833ab653.jpeg', 'outlines'),
(147, 'CC-214', 'PU', 'BS IT-3', '../uploads/ebooks/68bd58bf471a4_CC214.pdf', '289.88 KB', 'pdf', 'Computer Networks', 35, '2025-09-07 17:04:47', '../uploads/ebook_covers/68bd58bf46e07.jpeg', 'outlines'),
(148, 'CC-214L', 'PU', 'BS IT-3', '../uploads/ebooks/68bd58e12c12c_CC214L.pdf', '296.83 KB', 'pdf', 'Computer Networks LAB', 35, '2025-09-07 17:05:21', '../uploads/ebook_covers/68bd58e12bd67.jpeg', 'outlines'),
(149, 'EI-231', 'PU', 'BS IT-3', '../uploads/ebooks/68bd594891600_EI231.pdf', '290.36 KB', 'pdf', 'Computer Organization and Design', 35, '2025-09-07 17:07:04', '../uploads/ebook_covers/68bd594891201.jpeg', 'outlines'),
(150, 'UE-271', 'PU', 'BS IT-3', '../uploads/ebooks/68bd599b2b763_UE271.pdf', '289.93 KB', 'pdf', 'Introduction to Psychology', 35, '2025-09-07 17:08:27', '../uploads/ebook_covers/68bd599b2b3ac.jpeg', 'outlines'),
(151, 'MS-251', 'PU', 'BS IT-3', '../uploads/ebooks/68bd59b829424_MS251.pdf', '292.36 KB', 'pdf', 'Probability and Statistics', 35, '2025-09-07 17:08:56', '../uploads/ebook_covers/68bd59b828e11.jpeg', 'outlines'),
(152, 'HQ-004', 'PU', 'BS IT-4', '../uploads/ebooks/68bd5a3e91623_Holy Quran Notification and Model Paper.pdf', '1.66 MB', 'pdf', 'Translation of Holy Quran', 35, '2025-09-07 17:11:10', '../uploads/ebook_covers/68bd5a3e911c0.jpeg', 'outlines'),
(153, 'CC-213', 'PU', 'BS IT-4', '../uploads/ebooks/68bd5a80ba767_CC213L.pdf', '292.02 KB', 'pdf', 'Data Structures and Algorithms', 35, '2025-09-07 17:12:16', '../uploads/ebook_covers/68bd5a80ba150.jpeg', 'outlines'),
(154, 'CC-213L', 'PU', 'BS IT-4', '../uploads/ebooks/68bd5aeb27524_CC213L.pdf', '292.02 KB', 'pdf', 'Data Structures and Algorithms LAB', 35, '2025-09-07 17:14:03', '../uploads/ebook_covers/68bd5aeb26dc3.jpeg', 'outlines'),
(155, 'CC-215', 'PU', 'BS IT-4', '../uploads/ebooks/68bd5b68562a3_CC215.pdf', '292.05 KB', 'pdf', 'Database Systems', 35, '2025-09-07 17:16:08', '../uploads/ebook_covers/68bd5b6855c10.jpeg', 'outlines'),
(156, 'CC-215L', 'PU', 'BS IT-4', '../uploads/ebooks/68bd5b882f662_CC215L.pdf', '291.21 KB', 'pdf', 'Database Systems LAB', 35, '2025-09-07 17:16:40', '../uploads/ebook_covers/68bd5b882f317.jpeg', 'outlines'),
(157, 'CC-212', 'PU', 'BS IT-4', '../uploads/ebooks/68bd5c051db53_CC212.pdf', '290.74 KB', 'pdf', 'Software Engineering', 35, '2025-09-07 17:18:45', '../uploads/ebook_covers/68bd5c051d530.png', 'outlines'),
(158, 'SI-241', 'PU', 'BS IT-4', '../uploads/ebooks/68bd5da5e00b4_SI241.pdf', '290.64 KB', 'pdf', 'Modeling and Simulation', 35, '2025-09-07 17:25:41', '../uploads/ebook_covers/68bd5da5def3d.jpeg', 'outlines'),
(159, 'MS-252', 'PU', 'BS IT-4', '../uploads/ebooks/68bd5de089935_MS252.pdf', '293.04 KB', 'pdf', 'Linear Algebra', 35, '2025-09-07 17:26:40', '../uploads/ebook_covers/68bd5de0889d1.jpeg', 'outlines'),
(160, 'HQ-001', 'PU', 'BS ENG-1', '../uploads/ebooks/68bd694cacb1b_Holy Quran Notification and Model Paper.pdf', '1.66 MB', 'pdf', 'Translation of Holy Quran', 35, '2025-09-07 18:15:24', '../uploads/ebook_covers/68bd694cabf80.jpeg', 'outlines'),
(161, 'ISE-111', 'PU', 'BS ENG-1', '../uploads/ebooks/68bd6980bfc01_C_ISE-111.pdf', '844.66 KB', 'pdf', 'Islamiat/Ethics', 35, '2025-09-07 18:16:16', '../uploads/ebook_covers/68bd6980bf0df.jpeg', 'outlines'),
(162, 'ENG-111', 'PU', 'BS ENG-1', '../uploads/ebooks/68bd69e2a13a8_C_ENG-111.pdf', '137.66 KB', 'pdf', 'English-I (Language in Use)', 35, '2025-09-07 18:17:54', '../uploads/ebook_covers/68bd69e29e9bf.jpeg', 'outlines'),
(163, 'COMP-111', 'PU', 'BS ENG-1', '../uploads/ebooks/68bd6aa93d815_C_COMP-111.pdf', '295.34 KB', 'pdf', 'Computer (Introduction and Applications)', 35, '2025-09-07 18:21:13', '../uploads/ebook_covers/68bd6aa93c8dd.jpeg', 'outlines'),
(164, 'ENG-101', 'PU', 'BS ENG-1', '../uploads/ebooks/68bd6adeba078_C_ENG-101.pdf', '128.21 KB', 'pdf', 'Introduction to Literature-I (History of English Literature-I)', 35, '2025-09-07 18:22:06', '../uploads/ebook_covers/68bd6adeb96ae.jpeg', 'outlines'),
(165, 'ENG-102', 'PU', 'BS ENG-1', '../uploads/ebooks/68bd6b29a2988_C_ENG-102.pdf', '115.02 KB', 'pdf', 'Introduction to Linguistics-I', 35, '2025-09-07 18:23:21', '../uploads/ebook_covers/68bd6b29a193f.jpeg', 'outlines'),
(166, 'APSY-111', 'PU', 'BS ENG-1', '../uploads/ebooks/68bd6bb00c8eb_C_APSY-111.pdf', '87.54 KB', 'pdf', 'Fundamentals of Psychology', 35, '2025-09-07 18:25:36', '../uploads/ebook_covers/68bd6bb00b931.jpeg', 'outlines'),
(167, 'HQ-002', 'PU', 'BS ENG-2', '../uploads/ebooks/68bd6d1dee77a_Holy Quran Notification and Model Paper.pdf', '1.66 MB', 'pdf', 'Translation of Holy Quran', 35, '2025-09-07 18:31:41', '../uploads/ebook_covers/68bd6d1dee300.jpeg', 'outlines'),
(168, 'PST-111', 'PU', 'BS ENG-2', '../uploads/ebooks/68bd6d4e8dcaf_C_PST-111.pdf', '69.52 KB', 'pdf', 'Pakistan Studies', 35, '2025-09-07 18:32:30', '../uploads/ebook_covers/68bd6d4e8c157.jpeg', 'outlines'),
(169, 'ENG-112', 'PU', 'BS ENG-2', '../uploads/ebooks/68bd6d7b52e77_C_ENG-112.pdf', '124.07 KB', 'pdf', 'English-II (Academic Reading and Writing)', 35, '2025-09-07 18:33:15', '../uploads/ebook_covers/68bd6d7b52001.png', 'outlines'),
(170, 'ENG-103', 'PU', 'BS ENG-2', '../uploads/ebooks/68bd6db8bbeca_C_ENG-103.pdf', '143.13 KB', 'pdf', 'Introduction to Literature-II (Poetry and One Act Plays)', 35, '2025-09-07 18:34:16', '../uploads/ebook_covers/68bd6db8bb71a.jpeg', 'outlines'),
(171, 'ENG-104', 'PU', 'BS ENG-2', '../uploads/ebooks/68bd6e22d7b55_C_ENG-104.pdf', '113.32 KB', 'pdf', 'Introduction to Linguistics-II', 35, '2025-09-07 18:36:02', '../uploads/ebook_covers/68bd6e22d6499.png', 'outlines'),
(172, 'BSCS-111', 'PU', 'BS ENG-2', '../uploads/ebooks/68bd6e9ad1d13_C_BSCS-111-211.pdf', '66.14 KB', 'pdf', 'Mass Communication', 35, '2025-09-07 18:38:02', '../uploads/ebook_covers/68bd6e9ad1076.jpeg', 'outlines'),
(173, 'IR-111', 'PU', 'BS ENG-2', '../uploads/ebooks/68bd6eb9c463a_C_IR-111.pdf', '61.94 KB', 'pdf', 'International Relations', 35, '2025-09-07 18:38:33', '../uploads/ebook_covers/68bd6eb9c351e.jpeg', 'outlines'),
(174, 'HQ-003', 'PU', 'BS ENG-3', '../uploads/ebooks/68bd70924ada9_Holy Quran Notification and Model Paper.pdf', '1.66 MB', 'pdf', 'Translation of Holy Quran', 35, '2025-09-07 18:46:26', '../uploads/ebook_covers/68bd70924aaa7.jpeg', 'outlines'),
(175, 'ENG-201', 'PU', 'BS ENG-3', '../uploads/ebooks/68bd7122a659b_C_ENG-201.pdf', '113.09 KB', 'pdf', 'English-III (Advance Communication Skills)', 35, '2025-09-07 18:48:50', '../uploads/ebook_covers/68bd7122a6094.jpeg', 'outlines'),
(176, 'ENG-202', 'PU', 'BS ENG-3', '../uploads/ebooks/68bd714c6123a_C_ENG-202.pdf', '166.81 KB', 'pdf', 'Introduction to Literature-III (Fiction and Non-Fiction)', 35, '2025-09-07 18:49:32', '../uploads/ebook_covers/68bd714c60de1.jpeg', 'outlines'),
(177, 'ENG-203', 'PU', 'BS ENG-3', '../uploads/ebooks/68bd717746db7_C_ENG-203.pdf', '139.92 KB', 'pdf', 'Introduction to Linguistics-III (Phonetics and English Phonology)', 35, '2025-09-07 18:50:15', '../uploads/ebook_covers/68bd7177469fd.jpeg', 'outlines'),
(178, 'BBA-211', 'PU', 'BS ENG-3', '../uploads/ebooks/68bd720d194fa_C_BBA-211.pdf', '44.03 KB', 'pdf', 'Entrepreneurship', 35, '2025-09-07 18:52:45', '../uploads/ebook_covers/68bd720d18f73.jpeg', 'outlines'),
(179, 'HR-211', 'PU', 'BS ENG-3', '../uploads/ebooks/68bd726f53598_C_HR-211.pdf', '68.3 KB', 'pdf', 'Human Resource Management', 35, '2025-09-07 18:54:23', '../uploads/ebook_covers/68bd726f53105.jpeg', 'outlines'),
(180, 'PHIL-211A', 'PU', 'BS ENG-3', '../uploads/ebooks/68bd729485fc8_C_PHIL-211A.pdf', '144.96 KB', 'pdf', 'Introduction to Philosophy (Rev)', 35, '2025-09-07 18:55:00', '../uploads/ebook_covers/68bd729485afd.jpeg', 'outlines'),
(181, 'HQ-004', 'PU', 'BS ENG-4', '../uploads/ebooks/68bd73f930212_Holy Quran Notification and Model Paper.pdf', '1.66 MB', 'pdf', 'Translation of Holy Quran', 35, '2025-09-07 19:00:57', '../uploads/ebook_covers/68bd73f92fefb.jpeg', 'outlines'),
(182, 'ENG-204', 'PU', 'BS ENG-4', '../uploads/ebooks/68bd7426252f0_C_ENG-204.pdf', '128.1 KB', 'pdf', 'English-IV (Advance Academic Reading and Writing)', 35, '2025-09-07 19:01:42', '../uploads/ebook_covers/68bd742624fab.jpeg', 'outlines'),
(183, 'ENG-205', 'PU', 'BS ENG-4', '../uploads/ebooks/68bd744f2bdab_C_ENG-205.pdf', '118.66 KB', 'pdf', 'Introduction to Literature-IV (History of Literature-II)', 35, '2025-09-07 19:02:23', '../uploads/ebook_covers/68bd744f2ba90.jpeg', 'outlines'),
(184, 'ENG-206', 'PU', 'BS ENG-4', '../uploads/ebooks/68bd7478a8d99_C_ENG-206.pdf', '114.27 KB', 'pdf', 'Introduction to Linguistics-IV (The Structure of English)', 35, '2025-09-07 19:03:04', '../uploads/ebook_covers/68bd7478a850a.jpeg', 'outlines'),
(185, 'HR-213', 'PU', 'BS ENG-4', '../uploads/ebooks/68bd7516e9171_C_HR-213.pdf', '65.8 KB', 'pdf', 'Citizenship Education (Human Rights)', 35, '2025-09-07 19:05:42', '../uploads/ebook_covers/68bd7516e8dbe.jpeg', 'outlines'),
(186, 'GEOG-211', 'PU', 'BS ENG-4', '../uploads/ebooks/68bd75419174b_C_GEOG-211.pdf', '63.83 KB', 'pdf', 'Introduction to Geography', 35, '2025-09-07 19:06:25', '../uploads/ebook_covers/68bd754191227.jpeg', 'outlines'),
(187, 'SOC-211', 'PU', 'BS ENG-4', '../uploads/ebooks/68bd756cb2e63_C_SOC-211.pdf', '132.82 KB', 'pdf', 'Introduction to Sociology', 35, '2025-09-07 19:07:08', '../uploads/ebook_covers/68bd756cb2b88.jpeg', 'outlines'),
(188, 'ENG-115', 'PU', 'BS HPE-1', '../uploads/ebooks/68bd8cc753eef_C_ENG-115.pdf', '337.31 KB', 'pdf', 'Functional English (Compulsory 1)', 35, '2025-09-07 20:46:47', '../uploads/ebook_covers/68bd8cc753bb2.jpeg', 'outlines'),
(189, 'MATH-115', 'PU', 'BS HPE-1', '../uploads/ebooks/68bd8cfe35b15_C_MATH-115.pdf', '249.36 KB', 'pdf', 'Fundamental Application of Algebra (Compulsory 3)', 35, '2025-09-07 20:47:42', '../uploads/ebook_covers/68bd8cfe3556d.jpeg', 'outlines'),
(190, 'PHY-115', 'PU', 'BS HPE-1', '../uploads/ebooks/68bd8d28ec1e0_C_PHY-115.pdf', '428.88 KB', 'pdf', 'Fundamental Application of Physics (General 1)', 35, '2025-09-07 20:48:24', '../uploads/ebook_covers/68bd8d28ebc69.jpeg', 'outlines'),
(191, 'HPE-101', 'PU', 'BS HPE-1', '../uploads/ebooks/68bd8dff4448c_C_HPE-101.pdf', '349.41 KB', 'pdf', 'Philosophical basis of Physical Education (Foundation 1)', 35, '2025-09-07 20:51:59', '../uploads/ebook_covers/68bd8dff43d83.jpeg', 'outlines'),
(192, 'HPE-102', 'PU', 'BS HPE-1', '../uploads/ebooks/68bd8e2e46563_C_HPE-101 (1).pdf', '349.41 KB', 'pdf', 'Games-I (Badminton, Basketball & Football)', 35, '2025-09-07 20:52:46', '../uploads/ebook_covers/68bd8e2e46157.jpeg', 'outlines'),
(193, 'HPE-103', 'PU', 'BS HPE-1', '../uploads/ebooks/68bd8e5494822_C_HPE-101 (2).pdf', '349.41 KB', 'pdf', 'Athletics-I (Sprint Races)', 35, '2025-09-07 20:53:24', '../uploads/ebook_covers/68bd8e5493f66.jpeg', 'outlines'),
(194, 'ENG-116', 'PU', 'BS HPE-2', '../uploads/ebooks/68bd90cc5851c_C_ENG-116.pdf', '231.47 KB', 'pdf', 'Communication Skills of English (Compulsory 4)', 35, '2025-09-07 21:03:56', '../uploads/ebook_covers/68bd90cc581cd.png', 'outlines'),
(195, 'MATH-116', 'PU', 'BS HPE-2', '../uploads/ebooks/68bd910c1da97_C_MATH-116.pdf', '242.42 KB', 'pdf', 'Fundamental application of Calculus / Univ. Optional (Compulsory 6)', 35, '2025-09-07 21:05:00', '../uploads/ebook_covers/68bd910c1d7fd.jpeg', 'outlines'),
(196, 'HPE-113', 'PU', 'BS HPE-2', '../uploads/ebooks/68bd913d2ad78_C_HPE-113.pdf', '245.66 KB', 'pdf', 'Biomechanics (Foundation 3)', 35, '2025-09-07 21:05:49', '../uploads/ebook_covers/68bd913d2a9d2.jpeg', 'outlines'),
(197, 'SOC-115', 'PU', 'BS HPE-2', '../uploads/ebooks/68bd91708ddf4_C_SOC-115.pdf', '377.18 KB', 'pdf', 'Sociology (General 5)', 35, '2025-09-07 21:06:40', '../uploads/ebook_covers/68bd91708d762.jpeg', 'outlines'),
(198, 'HPE-113', 'PU', 'BS HPE-2', '../uploads/ebooks/68bd91ba40726_C_HPE-113.pdf', '245.66 KB', 'pdf', 'Games-II (Tennis, Netball & Hockey)', 35, '2025-09-07 21:07:54', '../uploads/ebook_covers/68bd91ba4000d.jpeg', 'outlines'),
(199, 'ENG-315', 'PU', 'BS HPE-3', '../uploads/ebooks/68bd9238edf96_C_ENG-215.pdf', '238.2 KB', 'pdf', 'Technical Writing and Presentation Skills of English (Compulsory 7)', 35, '2025-09-07 21:10:00', '../uploads/ebook_covers/68bd9238edb33.png', 'outlines'),
(200, 'HPE-201', 'PU', 'BS HPE-3', '../uploads/ebooks/68bd929271b16_C_HPE-201.pdf', '351.56 KB', 'pdf', 'Application of Computer in Physical Education (Compulsory 8)', 35, '2025-09-07 21:11:30', '../uploads/ebook_covers/68bd929271845.jpeg', 'outlines'),
(201, 'HPE-202', 'PU', 'BS HPE-3', '../uploads/ebooks/68bd9475e7a65_C_HPE-202.pdf', '257.24 KB', 'pdf', 'Talent Identification in Sports', 35, '2025-09-07 21:19:33', '../uploads/ebook_covers/68bd9475e7729.png', 'outlines'),
(202, 'HPE-203', 'PU', 'BS HPE-3', '../uploads/ebooks/68bd94cb6eae1_C_HPE-203.pdf', '134.91 KB', 'pdf', 'Basics of Human Anatomy (Foundation 6)', 35, '2025-09-07 21:20:59', '../uploads/ebook_covers/68bd94cb6e3a7.png', 'outlines'),
(203, 'HPE-211', 'PU', 'BS HPE-4', '../uploads/ebooks/68bd955bcf73e_C_HPE-211.pdf', '270.86 KB', 'pdf', 'Application of modern technologies in Sports (General 4)', 35, '2025-09-07 21:23:23', '../uploads/ebook_covers/68bd955bcf270.jpeg', 'outlines'),
(204, 'HPE-212', 'PU', 'BS HPE-4', '../uploads/ebooks/68bd95cfe18c5_C_HPE-212.pdf', '510.66 KB', 'pdf', 'Administration and Management in Sports (Foundation 7)', 35, '2025-09-07 21:25:19', '../uploads/ebook_covers/68bd95cfe0e6c.png', 'outlines'),
(205, 'HPE-213', 'PU', 'BS HPE-4', '../uploads/ebooks/68bd963b311ab_C_HPE-213.pdf', '352.65 KB', 'pdf', 'Basics of Human Physiology (Foundation 8)', 35, '2025-09-07 21:27:07', '../uploads/ebook_covers/68bd963b30ca2.png', 'outlines'),
(206, 'HPE-214', 'PU', 'BS HPE-4', '../uploads/ebooks/68bd96cfb6bf7_C_HPE-214.pdf', '231.62 KB', 'pdf', 'Games-IV (Rifle Shooting, Archery, Wrestling, Boxing & Weightlifting)', 35, '2025-09-07 21:29:35', '../uploads/ebook_covers/68bd96cfb6401.jpeg', 'outlines'),
(207, 'HPE-215', 'PU', 'BS HPE-4', '../uploads/ebooks/68bd971601bf4_C_HPE-215.pdf', '186.27 KB', 'pdf', 'Athletics-IV (Throwing Events)', 35, '2025-09-07 21:30:46', '../uploads/ebook_covers/68bd971601653.jpeg', 'outlines'),
(208, 'a-guide-to-the-project-management-body-of-knowledge-6e', 'PMBOK	guide', 'BS IT-6', '../uploads/ebooks/68bda31676bec_a-guide-to-the-project-management-body-of-knowledge-6e.pdf', '15.04 MB', 'pdf', 'SIXTH EDITION', 35, '2025-09-07 22:21:58', '../uploads/ebook_covers/68bda3167660b.jpeg', 'ebooks'),
(209, 'AI algorithms, data structures, and idioms in Prolog, Lisp, and Java', 'George F. Luger, William A.Stubblefield', 'BS IT-5', '../uploads/ebooks/68bda43e2aea8_AI algorithms, data structures, and idioms in Prolog, Lisp, and Java.pdf', '2.49 MB', 'pdf', '', 35, '2025-09-07 22:26:54', '../uploads/ebook_covers/68bda43e2ab97.jpeg', 'ebooks'),
(210, 'Computer Networks', 'Andrew S. Tanenbaum', 'BS IT-3', '../uploads/ebooks/68bda499bd4a7_Andrew S. Tanenbaum - Computer Networks.pdf', '6.58 MB', 'pdf', 'fifth edition', 35, '2025-09-07 22:28:25', '../uploads/ebook_covers/68bda499bd24a.jpeg', 'ebooks'),
(211, 'artificial intelligence structures and strategies for  complex problem solving', 'George F. Luger', 'BS IT-6', '../uploads/ebooks/68bda50ad3d2f_artificial intelligence structures and strategies for  complex problem solving.pdf', '6.78 MB', 'pdf', 'Sixth edition', 35, '2025-09-07 22:30:18', '../uploads/ebook_covers/68bda50ad3922.jpeg', 'ebooks'),
(212, 'How to program with an introduction to c', 'Paul Deitel,Harvey Deitel', 'BS IT-2', '../uploads/ebooks/68bda7b030275_c how to program with an introduction to c global edition 8th edition.pdf', '5.43 MB', 'pdf', 'global edition 8th edition', 35, '2025-09-07 22:41:36', '../uploads/ebook_covers/68bda7b02f820.jpeg', 'ebooks'),
(213, 'C++ 14 Quick Syntax Reference', 'Mikael Olsson', 'BS IT-3', '../uploads/ebooks/68bda86463dc2_C++_14_Quick_Syntax_Reference.pdf', '613.67 KB', 'pdf', 'second edition', 35, '2025-09-07 22:44:36', '../uploads/ebook_covers/68bda86463597.jpeg', 'ebooks'),
(214, 'computer fundamental complete-i', 'Pradeep K. Sinha & Priti Sinha', 'BS IT-1', '../uploads/ebooks/68bda8dcbc492_computer_fundamental_complete-i.pdf', '3.43 MB', 'pdf', '', 35, '2025-09-07 22:46:36', '../uploads/ebook_covers/68bda8dcbc1cc.jpeg', 'ebooks'),
(215, 'Java how to program', 'Paul Deitel,Harvey Deitel', 'BS IT-7', '../uploads/ebooks/68bdaa8979416_download-pdf-ebooks.org-1489929113Bv7P9.pdf', '24.09 MB', 'pdf', 'Ninth edition', 35, '2025-09-07 22:53:45', '../uploads/ebook_covers/68bdaa8979111.jpeg', 'ebooks'),
(216, 'C# 4.0:  The Complete Reference', 'Herbert Schildt', 'BS IT-6', '../uploads/ebooks/68bdaf69eb817_Herbert Schildt - C# 4.0 The Complete Reference-McGraw-Hill Osborne Media (2010).pdf', '9.1 MB', 'pdf', '', 35, '2025-09-07 23:14:33', '../uploads/ebook_covers/68bdaf69ea7e2.jpeg', 'ebooks');
INSERT INTO `ebooks` (`id`, `title`, `author`, `category`, `file_path`, `file_size`, `file_type`, `description`, `uploaded_by`, `created_at`, `cover_image`, `type`) VALUES
(217, 'HTML5  Digital Classroom', 'Jeremy Osborn', 'BS IT-1', '../uploads/ebooks/68bdafda86647_HTML5 Digital Classroom.pdf', '6.47 MB', 'pdf', '', 35, '2025-09-07 23:16:26', '../uploads/ebook_covers/68bdafda862e5.jpeg', 'ebooks'),
(218, 'Oracle Database 11g: SQL  Fundamentals II', 'Chaitanya Koratamaddi', 'BS IT-5', '../uploads/ebooks/68bdb0732e921_ilide.info-11g-sql-fundamentals-ii-student-guide-vol-i-pr_36e3a56cc726f43f8321be10d6c6f5a9.pdf', '4.89 MB', 'pdf', 'Student Guide – Volume 1', 35, '2025-09-07 23:18:59', '../uploads/ebook_covers/68bdb0732e630.png', 'ebooks'),
(219, 'INFORMATION TECHNOLOGY   PROJECT MANAGEMENT', 'Kathy Schwalbe', 'BS HPE-2', '../uploads/ebooks/68bdb0fe268ff_Information Technology Project Management.pdf', '13.73 MB', 'pdf', '8th edition', 35, '2025-09-07 23:21:18', '../uploads/ebook_covers/68bdb0fe265b9.jpeg', 'ebooks'),
(220, 'INTRODUCTION TO  ALGORITHMS', 'THOMAS H.  CHARLES E.       RONALD L.  CORMEN  LEISERSON  RIVEST  CLIFFORD STEIN', 'BS IT-4', '../uploads/ebooks/68bdb193c0a5d_Intro to algo 3rd Edition.pdf', '5.54 MB', 'pdf', 'third edition', 35, '2025-09-07 23:23:47', '../uploads/ebook_covers/68bdb193c05bc.jpeg', 'ebooks'),
(221, 'Introduction to the Design and Analysis of Algorithms', 'Anany Levitin', 'BS IT-2', '../uploads/ebooks/68bdb24d7ec0f_Introduction to the Design and Analysis of Algorithms (3rd ed.) [Levitin 2011-10-09].pdf', '9.03 MB', 'pdf', '3rd edition', 35, '2025-09-07 23:26:53', '../uploads/ebook_covers/68bdb24d7e953.jpeg', 'ebooks'),
(222, 'Beginning  JavaScript', 'Jeremy McPeak  Paul Wilton', 'BS IT-6', '../uploads/ebooks/68bdb305a3d2f_Javascript Book.pdf', '15.43 MB', 'pdf', 'Fifth Edition', 35, '2025-09-07 23:29:57', '../uploads/ebook_covers/68bdb305a360c.jpeg', 'ebooks'),
(223, 'programming  OOP C++', 'Tasleem Mustafa,Tariq Mahmood', 'BS IT-2', '../uploads/ebooks/68bdb4c1a8d4a_Key Book to programming Exercises of OOP C++ (FreeBooks.pk).pdf', '15 MB', 'pdf', 'Key Book to programming Exercises of OOP C++', 35, '2025-09-07 23:37:21', '../uploads/ebook_covers/68bdb4c1a8a9b.jpeg', 'ebooks'),
(224, 'SIMULATION MODELING  &  ANALYSIS', 'Averill M. LAw W David Kelton', 'BS IT-3', '../uploads/ebooks/68bdb55321001_LIBRO_SIMULATION_MODELING_ANALYSIS.pdf', '10.54 MB', 'pdf', 'Second edition', 35, '2025-09-07 23:39:47', '../uploads/ebook_covers/68bdb55320d15.jpeg', 'ebooks'),
(225, 'Digital Design', 'M. Morris Mano', 'BS IT-4', '../uploads/ebooks/68bdbceddb41e_M. Morris Mano, Morris M Mano Digital Design 3rd edition.pdf', '13.43 MB', 'pdf', '33rd edition', 35, '2025-09-08 00:12:13', '../uploads/ebook_covers/68bdbcedce6ae.jpeg', 'ebooks'),
(226, 'Oracle database 11g  dba', 'Bob Bryla', 'BS IT-4', '../uploads/ebooks/68bdbe6eb7d51_oracle-database-11g-dba-handbook.pdf', '9.52 MB', 'pdf', 'oracle-database-11g-dba-handbook', 35, '2025-09-08 00:18:38', '../uploads/ebook_covers/68bdbe6eb6312.jpeg', 'ebooks'),
(227, 'RESEARCH METHODS IN  SPORT STUDIES AND SPORT  MANAGEMENT', 'A. J. Veal and Simon Darcy', 'BS HPE-8', '../uploads/ebooks/68bdc082cf754_research-methods-in-sport-studies-and-sport-management-2014.pdf', '7.12 MB', 'pdf', '', 35, '2025-09-08 00:27:30', '../uploads/ebook_covers/68bdc082cedd1.jpeg', 'ebooks'),
(228, 'Formulation in Psychology and  Psychotherapy', 'Lucy Johnstone and  Rudi Dallos', 'BS ENG-2', '../uploads/ebooks/68bdc1396d74c_A2G7C7_Formulation_in_Psychology_and_Psychotherapy.pdf', '2.14 MB', 'pdf', 'second edition', 35, '2025-09-08 00:30:33', '../uploads/ebook_covers/68bdc1396cdfd.jpeg', 'ebooks'),
(229, 'Desk Reference  to the  Diagnostic Criteria', 'DSM-5', 'BS ENG-3', '../uploads/ebooks/68bdc1c1e73e1_DSM-5-By-American-Psychiatric-Association.pdf', '1.79 MB', 'pdf', '', 35, '2025-09-08 00:32:49', '../uploads/ebook_covers/68bdc1c1e70e5.jpeg', 'ebooks'),
(230, 'Fundamentals of  human neuropsychology', 'BrYaN KolB & iaN q. WHiSHaW', 'BS HPE-3', '../uploads/ebooks/68bdc297df3d8_Fundamentals_of_Human_Neuropsychology_7t.pdf', '27.31 MB', 'pdf', 'SEVENTH EdiTioN', 35, '2025-09-08 00:36:23', '../uploads/covers/68bdc2bac42a1.jpeg', 'ebooks'),
(231, 'Introduction to Probability', 'Dimitri P. Bertsekas and John N. Tsitsiklis', 'BS HPE-7', '../uploads/ebooks/68bdc31a123cc_Math--Bertsekas_Tsitsiklis_Introduction_to_probability.pdf', '2.04 MB', 'pdf', '', 35, '2025-09-08 00:38:34', '../uploads/ebook_covers/68bdc31a11d5d.jpeg', 'ebooks'),
(232, 'The Grammar of English Grammars', 'Goold Brown', 'BS ENG-1', '../uploads/ebooks/68bf0dd61664c_The-Grammar-of-English-Grammars.pdf', '9.75 MB', 'pdf', '', 35, '2025-09-09 00:09:42', '../uploads/ebook_covers/68bf0dd615cd4.jpeg', 'ebooks'),
(233, 'A U T O B I O G R A P H Y  OF  B E N J A M I N  F R A N K L I N', 'E. BOYD SMITH', 'BS ENG-5', '../uploads/ebooks/68bf1101cb9c1_Autobiography-of-Benjamin-Franklin.pdf', '3.78 MB', 'pdf', '', 35, '2025-09-09 00:23:13', '../uploads/ebook_covers/68bf1101cb2a3.jpeg', 'ebooks'),
(234, 'LEONARDO DA VINCI', 'MAURICE W. BROCKWELL', 'BS ENG-6', '../uploads/ebooks/68bf11c29f4d9_Leonardo-Da-Vinci.pdf', '1.08 MB', 'pdf', '', 35, '2025-09-09 00:26:26', '../uploads/ebook_covers/68bf11c29f21a.jpeg', 'ebooks'),
(235, 'Science Of Speech', 'Dr. Niruben Amin', 'BS ENG-3', '../uploads/ebooks/68bf17299eb0f_Science-Of-Speech.pdf', '543.38 KB', 'pdf', '', 35, '2025-09-09 00:49:29', '../uploads/ebook_covers/68bf17299de5d.jpg', 'ebooks'),
(236, 'THE SCIENCE OF  HUMAN NATURE', 'WILLIAM HENRY PYLE', 'BS HPE-5', '../uploads/ebooks/68bf178c6ed7e_The-Science-of-Human-Nature-A-Psychology-for-Beginners.pdf', '1.55 MB', 'pdf', '', 35, '2025-09-09 00:51:08', '../uploads/ebook_covers/68bf178c6eb01.jpg', 'ebooks'),
(237, 'Outdoor Sports and Games', 'CLAUDE H. MILLER', 'BS HPE-6', '../uploads/ebooks/68bf1a5238fe7_Outdoor-Sports-and-Games.pdf', '3.9 MB', 'pdf', '', 35, '2025-09-09 01:02:58', '../uploads/ebook_covers/68bf1a5238cd0.jpg', 'ebooks'),
(238, 'The	Complete	Works of William Shakespeare', 'William Shakespeare', 'BS ENG-5', '../uploads/ebooks/68bf1aedd35e4_The-Complete-Works-of-William-Shakespeare.pdf', '9.81 MB', 'pdf', '', 35, '2025-09-09 01:05:33', '../uploads/ebook_covers/68bf1aedd3263.jpg', 'ebooks'),
(239, 'THE EDUCATION OF THE CHILD', 'Elen Key', 'BS ENG-3', '../uploads/ebooks/68bf1ee839f97_The-Education-of-the-Child.pdf', '312.47 KB', 'pdf', '', 35, '2025-09-09 01:22:32', '../uploads/ebook_covers/68bf1ee8399da.jpg', 'ebooks'),
(240, 'THE CURSE OF EDUCATION', 'HAROLD E. GORST', 'BS ENG-4', '../uploads/ebooks/68bf1f2c83cf1_The-Curse-of-Education.pdf', '536.61 KB', 'pdf', '', 35, '2025-09-09 01:23:40', '../uploads/ebook_covers/68bf1f2c838c3.jpg', 'ebooks'),
(241, 'The Genius', 'Theodore	Dreiser', 'BS ENG-8', '../uploads/ebooks/68bf220ce3133_The-\'\'Genius\'\'.pdf', '2.98 MB', 'pdf', 'Novel', 35, '2025-09-09 01:35:56', '../uploads/ebook_covers/68bf220ce2930.jpg', 'ebooks');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` enum('suggestion','complaint','appreciation') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fines`
--

CREATE TABLE `fines` (
  `id` int(11) NOT NULL,
  `issued_book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('pending','paid') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fulfilled_bookrequests`
--

CREATE TABLE `fulfilled_bookrequests` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reservation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','fulfilled','cancelled','expired') NOT NULL DEFAULT 'active',
  `priority_number` int(11) NOT NULL,
  `expires_at` datetime NOT NULL,
  `notified_at` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `issued_books`
--

CREATE TABLE `issued_books` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `issue_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `return_date` date NOT NULL,
  `actual_return_date` date DEFAULT NULL,
  `status` enum('issued','returned','overdue') NOT NULL DEFAULT 'issued',
  `fine_amount` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `issued_books`
--

INSERT INTO `issued_books` (`id`, `book_id`, `user_id`, `issue_date`, `return_date`, `actual_return_date`, `status`, `fine_amount`) VALUES
(93, 220, 41, '2025-08-19 20:24:50', '2025-08-27', '2025-08-19', 'returned', 0.00),
(103, 220, 41, '2025-08-19 09:29:49', '2025-09-02', '2025-08-19', 'returned', 0.00),
(116, 489, 41, '2025-08-29 19:58:40', '2025-09-13', NULL, 'issued', 0.00),
(117, 558, 41, '2025-08-29 19:58:42', '2025-09-13', '2025-09-01', 'returned', 0.00),
(118, 300, 41, '2025-08-29 19:58:44', '2025-09-13', NULL, 'issued', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(100) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `attempt_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `success` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `identifier`, `ip_address`, `attempt_time`, `success`) VALUES
(472, 'iqranoureench@gmail.com', '::1', '2025-09-09 20:28:08', 1),
(473, 'maleehamushtaq1008@gmail.com', '::1', '2025-09-09 20:40:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `is_read`, `created_at`) VALUES
(270, 41, 'Your reservation for \'A Brain Friendly Guide: Head first PHP & MySQL\' has been approved. Please collect the book from the library.', 0, '2025-08-19 20:24:50'),
(286, 41, 'Your book \'A Brain Friendly Guide: Head first PHP & MySQL\' has been returned successfully.', 0, '2025-08-19 09:27:16'),
(299, 41, 'Please collect your approved book \'A Brain Friendly Guide: Head first PHP & MySQL\'. It has now been issued to you. Due date: September 2, 2025.', 0, '2025-08-19 09:29:49'),
(302, 41, 'Your book \'A Brain Friendly Guide: Head first PHP & MySQL\' has been returned successfully.', 0, '2025-08-19 09:31:59'),
(347, 41, 'Your request for \'A Brain Friendly Guide: Head first PHP & MySQL\' was rejected because all available copies have been allocated.', 0, '2025-08-20 02:50:26'),
(366, 41, 'Your request for \'5000 proverbs\' has been approved. Please collect it within 2 days.', 0, '2025-08-29 19:58:13'),
(367, 41, 'Your request for \'30 days to a more powerful vocabulary\' has been approved. Please collect it within 2 days.', 0, '2025-08-29 19:58:15'),
(368, 41, 'Your request for \'101 Games for trainers\' has been approved. Please collect it within 2 days.', 0, '2025-08-29 19:58:17'),
(369, 41, 'Please collect your approved book \'30 days to a more powerful vocabulary\'. It has now been issued to you. Due date: September 13, 2025.', 0, '2025-08-29 19:58:40'),
(370, 41, 'Please collect your approved book \'5000 proverbs\'. It has now been issued to you. Due date: September 13, 2025.', 0, '2025-08-29 19:58:42'),
(371, 41, 'Please collect your approved book \'101 Games for trainers\'. It has now been issued to you. Due date: September 13, 2025.', 0, '2025-08-29 19:58:44'),
(372, 41, 'Your reservation request for \'101 Games for trainers\' has been submitted and is pending approval.', 0, '2025-08-30 19:28:47'),
(373, 41, 'Your reservation request for \'101 Games for trainers\' has been submitted and is pending approval.', 0, '2025-08-30 19:34:49'),
(375, 41, 'Your book \'5000 proverbs\' has been returned successfully.', 0, '2025-09-01 04:47:07'),
(376, 41, 'Your request for \'The Design of Everyday Things\' has been approved. Please collect it within 2 days.', 0, '2025-09-09 08:31:37');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  `created_at` datetime NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `user_id`, `token`, `created_at`, `expires_at`) VALUES
(42, 35, '7f2e2f64abbd2d1e1d33e1c32fb91903ed99b60a5653307f3e2e7054111c1195', '2025-08-18 17:51:56', '2025-08-18 13:51:56'),
(43, 80, '736383db0e9f099cf7d15e50ad1767aa871b2164ce5b73858d37dd24e79b9632', '2025-08-24 10:26:21', '2025-08-24 06:26:21'),
(44, 41, 'b9ced984e605c46950c1044d0a54788eae5d9c511cc8f684e9e10c9573d0d232', '2025-08-31 13:15:58', '2025-08-31 09:15:58');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `fine_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_method` varchar(50) DEFAULT NULL,
  `receipt_number` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `payment_details` text DEFAULT NULL,
  `payment_status` varchar(50) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_requests`
--

CREATE TABLE `reservation_requests` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `collected` tinyint(1) NOT NULL DEFAULT 0,
  `expires_at` datetime DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `collected_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation_requests`
--

INSERT INTO `reservation_requests` (`id`, `book_id`, `user_id`, `request_date`, `status`, `notes`, `collected`, `expires_at`, `approved_at`, `collected_at`) VALUES
(68, 220, 41, '2025-08-17 22:57:48', 'approved', '', 1, NULL, NULL, '2025-08-19 14:29:49'),
(89, 220, 41, '2025-08-20 02:49:03', 'rejected', '', 0, NULL, NULL, NULL),
(90, 300, 41, '2025-08-29 19:57:33', 'approved', '', 1, '2025-09-01 00:58:17', '2025-08-30 00:58:17', '2025-08-30 00:58:44'),
(91, 489, 41, '2025-08-29 19:57:40', 'approved', '', 1, '2025-09-01 00:58:15', '2025-08-30 00:58:15', '2025-08-30 00:58:40'),
(92, 558, 41, '2025-08-29 19:57:45', 'approved', '', 1, '2025-09-01 00:58:12', '2025-08-30 00:58:12', '2025-08-30 00:58:42'),
(93, 438, 41, '2025-08-30 19:33:53', 'pending', '', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(20) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('librarian','student','faculty') NOT NULL,
  `class` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `approval_status` varchar(20) DEFAULT 'pending',
  `approved_at` timestamp NULL DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL,
  `email_verified` tinyint(1) DEFAULT 0,
  `email_verification_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `unique_id`, `name`, `email`, `password`, `role`, `class`, `phone`, `address`, `created_at`, `approval_status`, `approved_at`, `rejected_at`, `email_verified`, `email_verification_token`) VALUES
(35, 'LIB15970', 'Librarian', 'iqranoureench@gmail.com', '$2y$10$5u2GNPjA9Mtp9vG2mnQ64uloByZV8z032B/8Q8s0VeteIHBmgplxq', 'librarian', NULL, '03095810285', NULL, '2025-08-13 23:55:09', 'approved', NULL, NULL, 0, NULL),
(41, 'STU70547', 'Maleeha Mushtaq', 'maleehamushtaq1008@gmail.com', '$2y$10$VIniCetNz5e/OultgbM01ecreeY90ucoVw9Qz9DZgweFdeKG0XK9i', 'student', 'BS IT-8', '03466855225', NULL, '2025-08-17 22:55:36', 'approved', NULL, NULL, 0, NULL),
(80, 'STU11370', 'Iqra Noureen', 'iqrachaudhry34@gmail.com', '$2y$10$kcgeGiiUxQcl9WrevetDKOsZ88nsrttiDY.bUU.x54T25GRfPTuyu', 'student', 'BS IT-2', '03456893624', NULL, '2025-08-23 15:07:23', 'approved', '2025-08-23 15:08:02', NULL, 1, NULL),
(90, 'STU82156', 'Iqra Noureen', 'iqrachaudhry374@gmail.com', '$2y$10$6CFBO3E9r9ZCYpDJVYlx3.Jv7b0DiWbGAuRXda4dVcrhkgIhCfa3S', 'student', 'BS ENG-5', '03095810285', NULL, '2025-08-30 19:38:05', 'approved', '2025-08-30 19:38:56', NULL, 0, '271a3e820f03d612cc2f4d8565b6ebf5');

-- --------------------------------------------------------

--
-- Table structure for table `weed_off_books`
--

CREATE TABLE `weed_off_books` (
  `id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `book_title` varchar(255) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `removed_by` int(11) DEFAULT NULL,
  `removed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `weed_off_books`
--

INSERT INTO `weed_off_books` (`id`, `book_id`, `book_title`, `reason`, `removed_by`, `removed_at`) VALUES
(1, 365, 'Politics of piety', 'damage', 35, '2025-08-14 00:31:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book_requests`
--
ALTER TABLE `book_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ebooks`
--
ALTER TABLE `ebooks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploaded_by` (`uploaded_by`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `fines`
--
ALTER TABLE `fines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issued_book_id` (`issued_book_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `fulfilled_bookrequests`
--
ALTER TABLE `fulfilled_bookrequests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_book_priority` (`book_id`,`priority_number`),
  ADD KEY `idx_status_expires` (`status`,`expires_at`);

--
-- Indexes for table `issued_books`
--
ALTER TABLE `issued_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_identifier_time` (`identifier`,`attempt_time`),
  ADD KEY `idx_ip_time` (`ip_address`,`attempt_time`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fine_id` (`fine_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reservation_requests`
--
ALTER TABLE `reservation_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `unique_id` (`unique_id`);

--
-- Indexes for table `weed_off_books`
--
ALTER TABLE `weed_off_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `removed_by` (`removed_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=720;

--
-- AUTO_INCREMENT for table `book_requests`
--
ALTER TABLE `book_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ebooks`
--
ALTER TABLE `ebooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fines`
--
ALTER TABLE `fines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `fulfilled_bookrequests`
--
ALTER TABLE `fulfilled_bookrequests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `issued_books`
--
ALTER TABLE `issued_books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=474;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=377;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `reservation_requests`
--
ALTER TABLE `reservation_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `weed_off_books`
--
ALTER TABLE `weed_off_books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_requests`
--
ALTER TABLE `book_requests`
  ADD CONSTRAINT `book_requests_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_requests_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ebooks`
--
ALTER TABLE `ebooks`
  ADD CONSTRAINT `ebooks_ibfk_1` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fines`
--
ALTER TABLE `fines`
  ADD CONSTRAINT `fines_ibfk_1` FOREIGN KEY (`issued_book_id`) REFERENCES `issued_books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fines_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fulfilled_bookrequests`
--
ALTER TABLE `fulfilled_bookrequests`
  ADD CONSTRAINT `fulfilled_bookrequests_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fulfilled_bookrequests_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `issued_books`
--
ALTER TABLE `issued_books`
  ADD CONSTRAINT `issued_books_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `issued_books_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`fine_id`) REFERENCES `fines` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reservation_requests`
--
ALTER TABLE `reservation_requests`
  ADD CONSTRAINT `reservation_requests_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_requests_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `weed_off_books`
--
ALTER TABLE `weed_off_books`
  ADD CONSTRAINT `weed_off_books_ibfk_1` FOREIGN KEY (`removed_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
