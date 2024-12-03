DELIMITER $$

-- Trigger to validate surgery dates
CREATE TRIGGER `before_insert_surgeries`
BEFORE INSERT ON `surgeries`
FOR EACH ROW
BEGIN
    DECLARE admission DATE;
    DECLARE discharge DATE;

    -- Fetch the admission and discharge dates for the patient
    SELECT `AdmissionDate`, `DischargeDate` INTO admission, discharge
    FROM `patients`
    WHERE `PatientID` = NEW.`PatientID`;

    -- Validate that the surgery date is within the admission and discharge period
    IF NEW.`SurgeryDate` < admission OR NEW.`SurgeryDate` > discharge THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Surgery date must be between admission and discharge dates.';
    END IF;
END $$

DELIMITER ;
