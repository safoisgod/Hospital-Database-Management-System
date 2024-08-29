-- -----------------------------------------------------------------------------------
-- this trigger is meant to automatically insert a Patient ID upon every new entry into the Patients table
DROP TRIGGER IF EXISTS PatientIDTrigger;
DELIMITER //
CREATE TRIGGER PatientIDTrigger
	BEFORE INSERT ON medical_database.patient
		FOR EACH ROW BEGIN
        -- lets begin by 
			DECLARE next_id INT;
            
            SELECT IFNULL(MAX(SUBSTRING(PatientID,2)),0) +1 INTO next_id FROM medical_database.patient;
            SET NEW.PatientID = CONCAT("P",LPAD(next_id, 4, "0"));
	END;
    //
DELIMITER ;
-- -----------------------------------------------------------------------------------





-- -----------------------------------------------------------------------------------
-- this trigger is meant to automatically insert a Patient ID upon every new entry into the Physician table
DROP TRIGGER IF EXISTS PhysicianIDTrigger;
DELIMITER //
CREATE TRIGGER PhysicianIDTrigger
	BEFORE INSERT ON medical_database.physician
		FOR EACH ROW BEGIN
        -- lets begin by 
			DECLARE next_id INT;
            
            SELECT IFNULL(MAX(SUBSTRING(PhysicianID,2)),0) +1 INTO next_id FROM medical_database.physician;
            SET NEW.PhysicianID = CONCAT("D",LPAD(next_id, 4, "0"));
	END;
    //
DELIMITER ;
-- -----------------------------------------------------------------------------------





-- -----------------------------------------------------------------------------------
-- this trigger is meant to automatically insert a Patient ID upon every new entry into the Physician table
DROP TRIGGER IF EXISTS NurseIDTrigger;
DELIMITER //
CREATE TRIGGER NurseIDTrigger
	BEFORE INSERT ON medical_database.nurse
		FOR EACH ROW BEGIN
        -- lets begin by 
			DECLARE next_id INT;
            
            SELECT IFNULL(MAX(SUBSTRING(NurseID,2)),0) + 1 INTO next_id FROM medical_database.nurse;
            SET NEW.NurseID = CONCAT("N",LPAD(next_id, 4, "0"));
	END;
    //
DELIMITER ;
-- -----------------------------------------------------------------------------------





-- -----------------------------------------------------------------------------------
-- this trigger is meant to automatically insert a NonMedics ID upon every new entry into the Physician table
DROP TRIGGER IF EXISTS NonMedicIDTrigger;
DELIMITER //
CREATE TRIGGER NonMedicIDTrigger
	BEFORE INSERT ON medical_database.non_medic
		FOR EACH ROW BEGIN
        -- lets begin by 
			DECLARE next_id INT;
            
            SELECT IFNULL(MAX(SUBSTRING(NonMedicID,2)),0) + 1 INTO next_id FROM mmedical_database.non_medic;
            SET NEW.NonMedicID = CONCAT("C",LPAD(next_id, 4, "0"));
	END;
    //
DELIMITER ;
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- this trigger is meant to automatically insert a NonMedics ID upon every new entry into the Physician table
DROP TRIGGER IF EXISTS PrescriptionIDTrigger;
DELIMITER //
CREATE TRIGGER PrescriptionIDTrigger
	BEFORE INSERT ON medical_database.prescription
		FOR EACH ROW BEGIN
        -- lets begin by 
			DECLARE next_id INT;
            
            SELECT IFNULL(MAX(SUBSTRING(PrescriptionID,5)),0) + 1 INTO next_id FROM mmedical_database.prescription;
            SET NEW.PrescriptionID = CONCAT("PRES",LPAD(next_id, 6, "0"));
	END;
    //
DELIMITER ;
-- ------------
