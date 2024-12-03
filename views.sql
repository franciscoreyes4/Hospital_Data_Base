-- View for patients with stays of 10 days or longer
CREATE VIEW `report_1_patients_with_long_stays` AS
SELECT `FirstName`, `LastName`, `PatientID`
FROM `patients`
WHERE DATEDIFF(`DischargeDate`, `AdmissionDate`) >= 10;

-- View for doctors who have seen patients
CREATE VIEW `report_2_doctors_for_patients` AS
SELECT DISTINCT `d`.`DoctorID`, `d`.`FirstName`, `d`.`LastName`
FROM `doctors` d
INNER JOIN `visits` v ON `d`.`DoctorID` = `v`.`DoctorID`;

-- View for surgeries conducted in spring months
CREATE VIEW `report_3_surgeries_in_spring` AS
SELECT `p`.`FirstName` AS `PatientFirstName`, `p`.`LastName` AS `PatientLastName`,
       `d`.`FirstName` AS `DoctorFirstName`, `d`.`LastName` AS `DoctorLastName`, `s`.`SurgeryDate`
FROM `patients` p
INNER JOIN `surgeries` s ON `p`.`PatientID` = `s`.`PatientID`
INNER JOIN `doctors` d ON `s`.`DoctorID` = `d`.`DoctorID`
WHERE MONTH(`s`.`SurgeryDate`) BETWEEN 3 AND 5;
