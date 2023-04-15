-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 15, 2023 at 08:43 AM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kidkid`
--

-- --------------------------------------------------------

--
-- Table structure for table `Admin`
--

CREATE TABLE `Admin` (
  `AdminName` varchar(50) NOT NULL,
  `AdminID` varchar(50) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Admin`
--

INSERT INTO `Admin` (`AdminName`, `AdminID`, `Email`, `Password`, `FirstName`, `LastName`) VALUES
('admin', 'Admin001', NULL, '1', 'a', 'b');

-- --------------------------------------------------------

--
-- Table structure for table `Characters`
--

CREATE TABLE `Characters` (
  `CharacterID` varchar(20) NOT NULL,
  `StoryID` varchar(20) NOT NULL,
  `CharacterName` varchar(50) NOT NULL,
  `CharacterImg` text NOT NULL,
  `date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Characters`
--

INSERT INTO `Characters` (`CharacterID`, `StoryID`, `CharacterName`, `CharacterImg`, `date`) VALUES
('character001', 'story001', 'pig', 'image-1681383076335.H.png', '2023-04-12 22:51:16'),
('character002', 'story001', 'Dew', 'image-1680971345260.New Project (3).png', '2023-04-12 23:06:03');

-- --------------------------------------------------------

--
-- Table structure for table `Custom`
--

CREATE TABLE `Custom` (
  `CustomID` int(10) NOT NULL,
  `CharacterID` varchar(20) DEFAULT NULL,
  `StoryID` varchar(20) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `DressingHead` text,
  `DressingBody` text,
  `UploadImg` text,
  `Drawing` text,
  `date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Dressing`
--

CREATE TABLE `Dressing` (
  `DressingID` int(20) NOT NULL,
  `DressingType` varchar(50) NOT NULL,
  `HeadImg` text,
  `BodyImg` text,
  `date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Dressing`
--

INSERT INTO `Dressing` (`DressingID`, `DressingType`, `HeadImg`, `BodyImg`, `date`) VALUES
(3, 'Head', 'image-1681110429329.head1.png', NULL, '2023-04-09 19:07:09'),
(9, 'Head', 'image-1681203442243.head2.png', NULL, '2023-04-10 20:57:22'),
(11, 'Head', 'image-1681216342767.head3.png', NULL, '2023-04-11 00:32:22'),
(12, 'Head', 'image-1681216363742.head4.png', NULL, '2023-04-11 00:32:43'),
(13, 'Head', 'image-1681216379940.head5.png', NULL, '2023-04-11 00:32:59'),
(14, 'Head', 'image-1681216390040.head6.png', NULL, '2023-04-11 00:33:10'),
(15, 'Head', 'image-1681216398424.head7.png', NULL, '2023-04-11 00:33:18'),
(16, 'Head', 'image-1681216407058.head8.png', NULL, '2023-04-11 00:33:27'),
(17, 'Body', NULL, 'image-1681217871322.body1.png', '2023-04-11 00:57:51'),
(18, 'Body', NULL, 'image-1681217894275.body2.png', '2023-04-11 00:58:14'),
(19, 'Body', NULL, 'image-1681217908275.body3.png', '2023-04-11 00:58:28'),
(20, 'Body', NULL, 'image-1681217916893.body4.png', '2023-04-11 00:58:36'),
(21, 'Body', NULL, 'image-1681217925317.body5.png', '2023-04-11 00:58:45'),
(22, 'Body', NULL, 'image-1681217949092.body6.png', '2023-04-11 00:59:09'),
(23, 'Body', NULL, 'image-1681217956779.body7.png', '2023-04-11 00:59:16'),
(24, 'Body', NULL, 'image-1681217964025.body8.png', '2023-04-11 00:59:24');

-- --------------------------------------------------------

--
-- Table structure for table `SpeechRecognition`
--

CREATE TABLE `SpeechRecognition` (
  `SpeechID` varchar(20) NOT NULL,
  `UserName` varchar(20) NOT NULL,
  `StoryID` varchar(20) NOT NULL,
  `OriginalVoice` varchar(50) NOT NULL,
  `UserVoice` varchar(50) NOT NULL,
  `Score` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Story`
--

CREATE TABLE `Story` (
  `StoryID` varchar(20) NOT NULL,
  `AdminName` varchar(50) NOT NULL,
  `StoryTitleEng` varchar(100) NOT NULL,
  `StoryTitleThai` varchar(100) DEFAULT NULL,
  `StoryImage` text,
  `Author` varchar(50) DEFAULT NULL,
  `IntroductionStoryEng` text,
  `IntroductionStoryThai` text,
  `PublisherName` varchar(50) DEFAULT NULL,
  `DatePublication` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Story`
--

INSERT INTO `Story` (`StoryID`, `AdminName`, `StoryTitleEng`, `StoryTitleThai`, `StoryImage`, `Author`, `IntroductionStoryEng`, `IntroductionStoryThai`, `PublisherName`, `DatePublication`, `date`) VALUES
('story001', 'admin', 'The Three Little Pigs', 'ลูกหมูสามตัว', 'image-1680956628845.image-1678554242130.H.png', 'kiddraw', 'Once upon a time there were three little pigs', 'กาลครั้งหนึ่งนานมาแล้ว มีลูกหมูสามตั', 'kiddraw club', '05-04-2023', '2023-04-05 04:04:22'),
('story002', 'admin', 'Little Red Riding Hood', 'หนูน้อยหมวกแดง', 'image-1681049147498.maxresdefault.png', 'kiddraw', 'There was once a sweet little maid who lived with her father', 'ครั้งหนึ่งมีสาวน้อยน่ารักคนหนึ่งอาศัยอยู่กับพ่อแม่ในกระท่อมเล็กๆ ริมหมู่บ้าน ', 'kiddraw club', '05-04-2023', '2023-04-05 04:07:30');

-- --------------------------------------------------------

--
-- Table structure for table `StoryDetail`
--

CREATE TABLE `StoryDetail` (
  `StoryDetailID` int(20) NOT NULL,
  `StoryID` varchar(20) NOT NULL,
  `PageNo` int(11) NOT NULL,
  `PageType` varchar(50) DEFAULT NULL,
  `StoryDetailEng` text NOT NULL,
  `AudioEng` text NOT NULL,
  `StoryDetailThai` text NOT NULL,
  `AudioThai` text,
  `QuestionEng` varchar(50) DEFAULT NULL,
  `QuestionThai` varchar(50) DEFAULT NULL,
  `AnswerEng1` varchar(50) DEFAULT NULL,
  `AnswerEng2` varchar(50) DEFAULT NULL,
  `AnswerThai1` varchar(50) DEFAULT NULL,
  `AnswerThai2` varchar(50) DEFAULT NULL,
  `PageNoAnswer1` int(50) DEFAULT NULL,
  `PageNoAnswer2` int(50) DEFAULT NULL,
  `PageNoNext` int(50) DEFAULT NULL,
  `SceneImage` text,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AudioAnswerEng1` text,
  `AudioAnswerEng2` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `StoryDetail`
--

INSERT INTO `StoryDetail` (`StoryDetailID`, `StoryID`, `PageNo`, `PageType`, `StoryDetailEng`, `AudioEng`, `StoryDetailThai`, `AudioThai`, `QuestionEng`, `QuestionThai`, `AnswerEng1`, `AnswerEng2`, `AnswerThai1`, `AnswerThai2`, `PageNoAnswer1`, `PageNoAnswer2`, `PageNoNext`, `SceneImage`, `date`, `AudioAnswerEng1`, `AudioAnswerEng2`) VALUES
(60, 'story001', 1, 'alternative', 'a', 'audio/1story001Eng.mp3', 'a', 'audio/1story001TH.mp3', 'a', 'a', 'a', 'a', 'a', 'a', 2, 3, NULL, 'image-1680956628845.image-1678554242130.H.png', '2023-04-15 08:08:25', 'audio/a.mp3', 'audio/a.mp3'),
(61, 'story001', 2, 'normal', 'b', 'audio/2story001Eng.mp3', 'b', 'audio/2story001TH.mp3', 'b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'image-1681049147498.maxresdefault.png', '2023-04-15 08:08:50', NULL, NULL),
(62, 'story001', 3, 'normal', 'c', 'audio/3story001Eng.mp3', 'c', 'audio/3story001TH.mp3', 'c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 'image-16793.jpg', '2023-04-15 08:09:04', NULL, NULL),
(63, 'story001', 4, 'normal', 'd', 'audio/4story001Eng.mp3', 'd', 'audio/4story001TH.mp3', 'd', 'd', 'd', 'd', 'd', 'd', NULL, NULL, NULL, 'image-1680956628845.image-1678554242130.H.png', '2023-04-15 08:09:17', 'audio/d.mp3', 'audio/d.mp3');

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `UserName` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `ImageProfile` text,
  `Email` varchar(50) DEFAULT NULL,
  `Password` varchar(50) NOT NULL,
  `Follower` varchar(50) DEFAULT NULL,
  `Following` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`UserName`, `FirstName`, `LastName`, `ImageProfile`, `Email`, `Password`, `Follower`, `Following`, `date`) VALUES
('1', '1', '1', 'image-1681546765313.color-palette.png', NULL, '1', NULL, NULL, '2023-04-14 20:19:25');

-- --------------------------------------------------------

--
-- Table structure for table `WatchList`
--

CREATE TABLE `WatchList` (
  `WatchListID` varchar(20) NOT NULL,
  `StoryID` varchar(20) NOT NULL,
  `UserID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`AdminName`);

--
-- Indexes for table `Characters`
--
ALTER TABLE `Characters`
  ADD PRIMARY KEY (`CharacterID`),
  ADD KEY `characters_ibfk_1` (`StoryID`);

--
-- Indexes for table `Custom`
--
ALTER TABLE `Custom`
  ADD PRIMARY KEY (`CustomID`),
  ADD KEY `UserName` (`UserName`),
  ADD KEY `custom_ibfk_2` (`StoryID`),
  ADD KEY `CharacterID` (`CharacterID`);

--
-- Indexes for table `Dressing`
--
ALTER TABLE `Dressing`
  ADD PRIMARY KEY (`DressingID`);

--
-- Indexes for table `SpeechRecognition`
--
ALTER TABLE `SpeechRecognition`
  ADD PRIMARY KEY (`SpeechID`),
  ADD KEY `speechrecognition_ibfk_1` (`UserName`),
  ADD KEY `speechrecognition_ibfk_2` (`StoryID`);

--
-- Indexes for table `Story`
--
ALTER TABLE `Story`
  ADD PRIMARY KEY (`StoryID`),
  ADD KEY `AdminName` (`AdminName`);

--
-- Indexes for table `StoryDetail`
--
ALTER TABLE `StoryDetail`
  ADD PRIMARY KEY (`StoryDetailID`),
  ADD KEY `StoryID` (`StoryID`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`UserName`);

--
-- Indexes for table `WatchList`
--
ALTER TABLE `WatchList`
  ADD PRIMARY KEY (`WatchListID`),
  ADD KEY `watchlist_ibfk_1` (`StoryID`),
  ADD KEY `watchlist_ibfk_2` (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Custom`
--
ALTER TABLE `Custom`
  MODIFY `CustomID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=384;

--
-- AUTO_INCREMENT for table `Dressing`
--
ALTER TABLE `Dressing`
  MODIFY `DressingID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `StoryDetail`
--
ALTER TABLE `StoryDetail`
  MODIFY `StoryDetailID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Characters`
--
ALTER TABLE `Characters`
  ADD CONSTRAINT `characters_ibfk_1` FOREIGN KEY (`StoryID`) REFERENCES `story` (`StoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Custom`
--
ALTER TABLE `Custom`
  ADD CONSTRAINT `custom_ibfk_1` FOREIGN KEY (`UserName`) REFERENCES `User` (`UserName`),
  ADD CONSTRAINT `custom_ibfk_2` FOREIGN KEY (`StoryID`) REFERENCES `Story` (`StoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `custom_ibfk_3` FOREIGN KEY (`CharacterID`) REFERENCES `Characters` (`CharacterID`);

--
-- Constraints for table `SpeechRecognition`
--
ALTER TABLE `SpeechRecognition`
  ADD CONSTRAINT `speechrecognition_ibfk_1` FOREIGN KEY (`UserName`) REFERENCES `user` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `speechrecognition_ibfk_2` FOREIGN KEY (`StoryID`) REFERENCES `story` (`StoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Story`
--
ALTER TABLE `Story`
  ADD CONSTRAINT `story_ibfk_1` FOREIGN KEY (`AdminName`) REFERENCES `Admin` (`AdminName`);

--
-- Constraints for table `StoryDetail`
--
ALTER TABLE `StoryDetail`
  ADD CONSTRAINT `storydetail_ibfk_1` FOREIGN KEY (`StoryID`) REFERENCES `story` (`StoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `WatchList`
--
ALTER TABLE `WatchList`
  ADD CONSTRAINT `watchlist_ibfk_1` FOREIGN KEY (`StoryID`) REFERENCES `story` (`StoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `watchlist_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserName`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
