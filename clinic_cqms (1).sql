-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 15, 2026 at 01:51 AM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `clinic_cqms`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `AppointmentID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) NOT NULL,
  `DoctorID` int(11) NOT NULL,
  `DepartmentID` int(11) NOT NULL,
  `AppointmentDate` date NOT NULL,
  `AppointmentTime` time NOT NULL,
  `VisitType` varchar(30) NOT NULL,
  `Duration` int(11) DEFAULT NULL,
  `Status` varchar(20) NOT NULL,
  `CreatedAt` datetime NOT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `idx_appointment_date` (`AppointmentDate`),
  KEY `PatientID` (`PatientID`),
  KEY `DoctorID` (`DoctorID`),
  KEY `DepartmentID` (`DepartmentID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`AppointmentID`, `PatientID`, `DoctorID`, `DepartmentID`, `AppointmentDate`, `AppointmentTime`, `VisitType`, `Duration`, `Status`, `CreatedAt`) VALUES
(1, 1, 1, 1, '2026-05-10', '09:00:00', 'Consultation', 30, 'Scheduled', '2026-05-07 19:39:18'),
(2, 2, 2, 2, '2026-05-11', '10:30:00', 'Checkup', 20, 'Scheduled', '2026-05-07 19:39:18'),
(3, 3, 1, 1, '2026-05-12', '14:00:00', 'Follow-up', 15, 'Confirmed', '2026-05-07 19:39:18'),
(4, 4, 3, 3, '2026-05-13', '11:00:00', 'Dental Cleaning', 45, 'Scheduled', '2026-05-07 19:39:18'),
(5, 1, 1, 1, '2026-05-15', '16:00:00', 'Review', 15, 'Pending', '2026-05-07 19:39:18');

-- --------------------------------------------------------

--
-- Table structure for table `clinic`
--

DROP TABLE IF EXISTS `clinic`;
CREATE TABLE IF NOT EXISTS `clinic` (
  `ClinicID` int(11) NOT NULL,
  `ClinicName` varchar(100) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `PhoneNo` varchar(15) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `OpeningTime` time NOT NULL,
  `ClosingTime` time NOT NULL,
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`ClinicID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clinic`
--

INSERT INTO `clinic` (`ClinicID`, `ClinicName`, `Location`, `PhoneNo`, `Email`, `OpeningTime`, `ClosingTime`, `Status`) VALUES
(0, 'Main Clinic Eldoret', '123 Main St Eldoret', '+254700000000', 'info@clinic.co.ke', '08:00:00', '17:00:00', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `DepartmentID` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(50) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepartmentID`, `DepartmentName`, `Description`, `Status`) VALUES
(1, 'General Practice', NULL, 'Active'),
(2, 'Pediatrics', NULL, 'Active'),
(3, 'Dental', NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `DoctorID` int(11) NOT NULL AUTO_INCREMENT,
  `DoctorName` varchar(100) NOT NULL,
  `Gender` char(1) NOT NULL,
  `Qualification` varchar(50) NOT NULL,
  `Specialization` varchar(50) DEFAULT NULL,
  `LicenseNo` varchar(20) DEFAULT NULL,
  `PhoneNo` varchar(15) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL,
  `AvgConsultationTime` int(11) DEFAULT NULL,
  `ConsultationFee` decimal(10,2) NOT NULL,
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`DoctorID`),
  UNIQUE KEY `LicenseNo` (`LicenseNo`),
  KEY `DepartmentID` (`DepartmentID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`DoctorID`, `DoctorName`, `Gender`, `Qualification`, `Specialization`, `LicenseNo`, `PhoneNo`, `Email`, `DepartmentID`, `AvgConsultationTime`, `ConsultationFee`, `Status`) VALUES
(1, 'Dr. James Kimani', 'M', 'MBChB', 'General Practice', 'KMPDC001', '+254711000001', 'james@clinic.co.ke', 1, 30, '1500.00', 'Active'),
(2, 'Dr. Mary Wanjiku', 'F', 'MBChB, MMed', 'Pediatrics', 'KMPDC002', '+254711000002', 'mary@clinic.co.ke', 2, 25, '2000.00', 'Active'),
(3, 'Dr. Peter Omondi', 'M', 'BDS', 'Dentistry', 'KMPDC003', '+254711000003', 'peter@clinic.co.ke', 3, 40, '2500.00', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `medicalrecord`
--

DROP TABLE IF EXISTS `medicalrecord`;
CREATE TABLE IF NOT EXISTS `medicalrecord` (
  `RecordID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) DEFAULT NULL,
  `AppointmentID` int(11) DEFAULT NULL,
  `DoctorID` int(11) DEFAULT NULL,
  `Diagnosis` text,
  `Treatment` text,
  `Prescription` text,
  `RecordDate` date NOT NULL,
  PRIMARY KEY (`RecordID`),
  KEY `idx_medicalrecord_patient` (`PatientID`),
  KEY `AppointmentID` (`AppointmentID`),
  KEY `DoctorID` (`DoctorID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `medicalrecord`
--

INSERT INTO `medicalrecord` (`RecordID`, `PatientID`, `AppointmentID`, `DoctorID`, `Diagnosis`, `Treatment`, `Prescription`, `RecordDate`) VALUES
(1, 1, 1, 1, 'Common Cold', 'Rest and hydration', 'Paracetamol 500mg TID for 3 days, Cetirizine 10mg OD', '2026-05-10'),
(2, 2, 2, 2, 'Routine Child Wellness Check', 'Growth monitoring normal', 'Vitamin D drops 400 IU daily', '2026-05-11'),
(3, 3, 3, 1, 'Hypertension Follow-up', 'BP stable at 130/85', 'Amlodipine 5mg OD - continue', '2026-05-12'),
(4, 4, 4, 3, 'Dental Caries', 'Tooth filling required', 'Amoxicillin 500mg TID for 5 days, Ibuprofen 400mg PRN', '2026-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `NotificationID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) DEFAULT NULL,
  `AppointmentID` int(11) DEFAULT NULL,
  `NotificationType` varchar(50) NOT NULL,
  `NotificationMessage` text NOT NULL,
  `NotificationDate` date NOT NULL,
  `NotificationTime` time NOT NULL,
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`NotificationID`),
  KEY `idx_notification_date` (`NotificationDate`),
  KEY `PatientID` (`PatientID`),
  KEY `AppointmentID` (`AppointmentID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`NotificationID`, `PatientID`, `AppointmentID`, `NotificationType`, `NotificationMessage`, `NotificationDate`, `NotificationTime`, `Status`) VALUES
(1, 1, 1, 'SMS', 'Reminder: You have an appointment with Dr. James Kimani on 2026-05-10 at 09:00 AM', '2026-05-09', '18:00:00', 'Sent'),
(2, 2, 2, 'Email', 'Your appointment with Dr. Mary Wanjiku is confirmed for 2026-05-11 at 10:30 AM', '2026-05-10', '08:00:00', 'Sent'),
(3, 3, 3, 'SMS', 'Reminder: Payment pending for your appointment on 2026-05-12', '2026-05-11', '19:30:00', 'Sent'),
(4, 4, 4, 'Email', 'Dental appointment confirmed with Dr. Peter Omondi on 2026-05-13 at 11:00 AM', '2026-05-12', '09:00:00', 'Sent'),
(5, 1, 5, 'SMS', 'Your follow-up appointment is scheduled for 2026-05-15 at 04:00 PM', '2026-05-14', '17:00:00', 'Pending'),
(6, 1, 1, 'SMS', 'Reminder: You have an appointment with Dr. James Kimani on 2026-05-10 at 09:00 AM. Arrive 15 mins early.', '2026-05-09', '18:00:00', 'Sent'),
(7, 2, 2, 'Email', 'Your appointment with Dr. Mary Wanjiku is confirmed for 2026-05-11 at 10:30 AM. Thank you.', '2026-05-10', '08:00:00', 'Sent'),
(8, 3, 3, 'SMS', 'Payment pending: Ksh 1500 for your appointment on 2026-05-12. Pay via M-Pesa 123456.', '2026-05-11', '19:30:00', 'Sent'),
(9, 4, 4, 'WhatsApp', 'Dental appointment confirmed with Dr. Peter Omondi on 2026-05-13 at 11:00 AM.', '2026-05-12', '09:00:00', 'Sent'),
(10, 1, 5, 'SMS', 'Follow-up appointment scheduled for 2026-05-15 at 04:00 PM. Reply YES to confirm.', '2026-05-14', '17:00:00', 'Pending'),
(11, 2, NULL, 'Email', 'Your test results are ready for collection at the clinic reception.', '2026-05-12', '14:00:00', 'Sent');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `PatientID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientName` varchar(100) NOT NULL,
  `Gender` char(1) NOT NULL,
  `DoB` date NOT NULL,
  `BloodGroup` varchar(5) DEFAULT NULL,
  `PhoneNo` varchar(15) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Allergies` varchar(200) DEFAULT NULL,
  `Status` varchar(20) NOT NULL,
  `RegistrationDate` date NOT NULL,
  PRIMARY KEY (`PatientID`),
  KEY `idx_patient_phone` (`PhoneNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`PatientID`, `PatientName`, `Gender`, `DoB`, `BloodGroup`, `PhoneNo`, `Email`, `Address`, `Allergies`, `Status`, `RegistrationDate`) VALUES
(1, 'John Doe', 'M', '1990-05-15', 'O+', '+254711111111', 'john@email.com', 'Pioneer Estate, Eldoret', 'None', 'Active', '2026-05-07'),
(2, 'Jane Smith', 'F', '1985-08-22', 'A-', '+254722222222', 'jane@email.com', 'Elgon View, Eldoret', 'Penicillin', 'Active', '2026-05-07'),
(3, 'David Kiprotich', 'M', '2000-12-01', 'B+', '+254733333333', 'david@email.com', 'Kapsoya, Eldoret', 'None', 'Active', '2026-05-07'),
(4, 'Mercy Chebet', 'F', '1995-03-10', 'AB+', '+254744444444', 'mercy@email.com', 'Langas, Eldoret', 'Sulfa drugs', 'Active', '2026-05-07');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `AppointmentID` int(11) DEFAULT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `PaymentMethod` varchar(30) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `PaymentDate` date NOT NULL,
  `PaymentTime` time NOT NULL,
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `idx_payment_date` (`PaymentDate`),
  KEY `AppointmentID` (`AppointmentID`),
  KEY `PatientID` (`PatientID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `AppointmentID`, `PatientID`, `PaymentMethod`, `Amount`, `PaymentDate`, `PaymentTime`, `Status`) VALUES
(1, 1, 1, 'M-Pesa', '1500.00', '2026-05-10', '08:55:00', 'Paid'),
(2, 2, 2, 'Cash', '2000.00', '2026-05-11', '10:15:00', 'Paid'),
(3, 3, 3, 'M-Pesa', '1500.00', '2026-05-12', '13:45:00', 'Pending'),
(4, 4, 4, 'Card', '2500.00', '2026-05-13', '10:50:00', 'Paid'),
(5, 5, 1, 'NHIF', '1500.00', '2026-05-15', '15:30:00', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
CREATE TABLE IF NOT EXISTS `queue` (
  `QueueID` int(11) NOT NULL AUTO_INCREMENT,
  `AppointmentID` int(11) DEFAULT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `QueueNumber` int(11) NOT NULL,
  `QueueDate` date NOT NULL,
  `EstimatedTime` time DEFAULT NULL,
  `ActualTime` time DEFAULT NULL,
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`QueueID`),
  KEY `idx_queue_date_number` (`QueueDate`,`QueueNumber`),
  KEY `AppointmentID` (`AppointmentID`),
  KEY `PatientID` (`PatientID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `queue`
--

INSERT INTO `queue` (`QueueID`, `AppointmentID`, `PatientID`, `QueueNumber`, `QueueDate`, `EstimatedTime`, `ActualTime`, `Status`) VALUES
(1, 1, 1, 1, '2026-05-10', '09:00:00', '20:01:50', 'Completed'),
(2, 2, 2, 1, '2026-05-11', '10:30:00', NULL, 'Waiting'),
(3, 3, 3, 2, '2026-05-12', '14:00:00', NULL, 'Waiting'),
(4, 4, 4, 1, '2026-05-13', '11:00:00', NULL, 'Waiting'),
(5, 5, 1, 2, '2026-05-15', '16:00:00', NULL, 'Scheduled'),
(6, NULL, 1, 99, '2026-05-20', NULL, NULL, 'Waiting');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`) ON UPDATE CASCADE;

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`) ON UPDATE CASCADE;

--
-- Constraints for table `medicalrecord`
--
ALTER TABLE `medicalrecord`
  ADD CONSTRAINT `medicalrecord_ibfk_7` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `medicalrecord_ibfk_8` FOREIGN KEY (`AppointmentID`) REFERENCES `appointment` (`AppointmentID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `medicalrecord_ibfk_9` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`) ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`AppointmentID`) REFERENCES `appointment` (`AppointmentID`) ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`AppointmentID`) REFERENCES `appointment` (`AppointmentID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON UPDATE CASCADE;

--
-- Constraints for table `queue`
--
ALTER TABLE `queue`
  ADD CONSTRAINT `queue_ibfk_1` FOREIGN KEY (`AppointmentID`) REFERENCES `appointment` (`AppointmentID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `queue_ibfk_2` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON UPDATE CASCADE;
