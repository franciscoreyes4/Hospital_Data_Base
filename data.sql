-- Populate the departments table
INSERT INTO `departments` (`DepartmentName`) VALUES
('Inpatient'),
('Operating Room'),
('Emergency'),
('Intensive Care');

-- Populate the doctors table
INSERT INTO `doctors` (`FirstName`, `LastName`, `Specialty`) VALUES
('Olivia', 'Smith', 'Cardiologist'),
('James', 'Johnson', 'Neurologist'),
('Emily', 'Brown', 'Dermatologist');

-- Populate the patients table
INSERT INTO `patients` (`FirstName`, `LastName`, `AdmissionDate`, `DischargeDate`) VALUES
('John', 'Doe', '2022-01-01', '2022-01-10'),
('Alice', 'Smith', '2022-02-15', '2022-02-25'),
('Bob', 'Johnson', '2022-04-10', '2022-04-20');

-- Populate the services table
INSERT INTO `services` (`ServiceName`, `Cost`) VALUES
('Cardiology Consultation', 120.00),
('Cardiac Stress Test', 200.00),
('Dermatology Evaluation', 100.00);

-- Populate the surgeries table
INSERT INTO `surgeries` (`PatientID`, `DoctorID`, `SurgeryDate`, `DepartmentID`) VALUES
(1, 1, '2022-01-05', 1),
(2, 2, '2022-02-20', 2),
(3, 3, '2022-04-15', 3);

-- Populate the visits table
INSERT INTO `visits` (`PatientID`, `DoctorID`, `DepartmentID`, `ServiceID`, `VisitDate`) VALUES
(1, 1, 1, 1, '2023-01-15'),
(2, 2, 1, 2, '2023-02-25'),
(3, 3, 1, 3, '2023-03-15');
