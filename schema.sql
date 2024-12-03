-- Create the database schema
CREATE SCHEMA IF NOT EXISTS `hospitaldb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `hospitaldb`;

-- Create the departments table
CREATE TABLE IF NOT EXISTS `departments` (
  `DepartmentID` INT NOT NULL AUTO_INCREMENT, -- Unique identifier for each department
  `DepartmentName` VARCHAR(255) NOT NULL, -- Name of the department
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create the doctors table
CREATE TABLE IF NOT EXISTS `doctors` (
  `DoctorID` INT NOT NULL AUTO_INCREMENT, -- Unique identifier for each doctor
  `FirstName` VARCHAR(255) NOT NULL, -- Doctor's first name
  `LastName` VARCHAR(255) NOT NULL, -- Doctor's last name
  `Specialty` VARCHAR(255), -- Doctor's area of specialization
  PRIMARY KEY (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create the patients table
CREATE TABLE IF NOT EXISTS `patients` (
  `PatientID` INT NOT NULL AUTO_INCREMENT, -- Unique identifier for each patient
  `FirstName` VARCHAR(255) NOT NULL, -- Patient's first name
  `LastName` VARCHAR(255) NOT NULL, -- Patient's last name
  `AdmissionDate` DATE NOT NULL, -- Date the patient was admitted
  `DischargeDate` DATE, -- Date the patient was discharged
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create the services table
CREATE TABLE IF NOT EXISTS `services` (
  `ServiceID` INT NOT NULL AUTO_INCREMENT, -- Unique identifier for each service
  `ServiceName` VARCHAR(255) NOT NULL, -- Name of the service
  `Cost` DECIMAL(10, 2) NOT NULL, -- Cost of the service
  PRIMARY KEY (`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create the surgeries table
CREATE TABLE IF NOT EXISTS `surgeries` (
  `SurgeryID` INT NOT NULL AUTO_INCREMENT, -- Unique identifier for each surgery
  `PatientID` INT NOT NULL, -- Foreign key to the patients table
  `DoctorID` INT NOT NULL, -- Foreign key to the doctors table
  `SurgeryDate` DATE NOT NULL, -- Date of the surgery
  `DepartmentID` INT NOT NULL, -- Foreign key to the departments table
  PRIMARY KEY (`SurgeryID`),
  FOREIGN KEY (`PatientID`) REFERENCES `patients`(`PatientID`),
  FOREIGN KEY (`DoctorID`) REFERENCES `doctors`(`DoctorID`),
  FOREIGN KEY (`DepartmentID`) REFERENCES `departments`(`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create the visits table
CREATE TABLE IF NOT EXISTS `visits` (
  `VisitID` INT NOT NULL AUTO_INCREMENT, -- Unique identifier for each visit
  `PatientID` INT NOT NULL, -- Foreign key to the patients table
  `DoctorID` INT NOT NULL, -- Foreign key to the doctors table
  `DepartmentID` INT NOT NULL, -- Foreign key to the departments table
  `ServiceID` INT NOT NULL, -- Foreign key to the services table
  `VisitDate` DATE NOT NULL, -- Date of the visit
  PRIMARY KEY (`VisitID`),
  FOREIGN KEY (`PatientID`) REFERENCES `patients`(`PatientID`),
  FOREIGN KEY (`DoctorID`) REFERENCES `doctors`(`DoctorID`),
  FOREIGN KEY (`DepartmentID`) REFERENCES `departments`(`DepartmentID`),
  FOREIGN KEY (`ServiceID`) REFERENCES `services`(`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
