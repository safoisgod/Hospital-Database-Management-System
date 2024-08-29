DROP SCHEMA IF EXISTS medical_database;
CREATE SCHEMA medical_database;

USE medical_database;

-- ---------------------------------------------------------------------
-- let's first begin with the patient table
DROP TABLE IF EXISTS medical_database.patient;
CREATE TABLE medical_database.patient
	-- i will like to assume that, to differentiate betwen different ypes of IDs, we will start the IDs with come Identifier Char like "P" for Patients, "D" for Physician(Doctor), "N" for Nurse etc
    -- so to make this work we will create a trigger after creating these kind of tables
	(PatientID VARCHAR(5) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Sex VARCHAR(1), CHECK (Sex IN ("M","F")),
    Address VARCHAR (50),
    PhoneNumber VARCHAR(10),
    InsuranceID INTEGER);

-- this trigger is meant to automatically insert a Patient ID upon every new entry into the Patients table
DROP TRIGGER IF EXISTS PatientIDTrigger;
DELIMITER //
CREATE TRIGGER PatientIDTrigger
	BEFORE INSERT ON medical_database.patient
		FOR EACH ROW BEGIN
        -- lets begin by 
			DECLARE next_id INT;
            
            SELECT IFNULL(COUNT(PatientID),0) +1 INTO next_id FROM medical_database.patient;
            SET NEW.PatientID = CONCAT("P",LPAD(next_id, 4, "0"));
	END;
    //
DELIMITER ;
-- -----------------------------------------------------------------------




-- -------------------------------------------------------------------------
-- a department table   
DROP TABLE IF EXISTS medical_database.department;
CREATE TABLE medical_database.department
	(DepartmentName VARCHAR(50),
	DepartmentCode VARCHAR(10) PRIMARY KEY,
    HOD VARCHAR(100));
-- ----------------------------------------------------------------------------
INSERT INTO medical_database.department
	(DepartmentName, DepartmentCode)
VALUES
	("Emergency Department", "ERR"), ("Imaging Depatment", "IR"),
	("Operation Department","OD"), ("Intensive Care Unit", "ICU"), ("Storage","STR"),
	("Mother Child","MOTHCHILD"), ("Dialysis","DIALYSIS"), ("Consultation", "CONSULT"), ("Technical Department","TECHDEP"),
	("Rehabilitation","REHAB"), ("Administration","ADMIN"), ("Pharmacy","PHARM"), ("Laboratorium","LABS");
 
 
 
 -- ------------------------------------------------------------------------
 -- let's create a table for the Medical Staff
 DROP TABLE IF EXISTS medical_database.physician;
 CREATE TABLE medical_database.physician
	(PhysicianID VARCHAR(5) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentCode VARCHAR(5),
    Position VARCHAR(25),
    FOREIGN KEY (DepartmentCode) REFERENCES medical_database.department(DepartmentCode));
    
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
-- -------------------------------------------------------------------------------
INSERT INTO medical_database.physician(FirstName, LastName)
VALUES ("NnanaN", "AWSSags"),("William","Adams")



-- ------------------------------------------------------------------------------
-- Nurses table
 DROP TABLE IF EXISTS medical_database.nurse;
 CREATE TABLE medical_database.nurse
	(NurseID VARCHAR(5) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID VARCHAR(5),
    Position VARCHAR(25),
    FOREIGN KEY (DepartmentID) REFERENCES medical_database.department(DepartmentID));
    
    -- this trigger is meant to automatically insert a Patient ID upon every new entry into the Physician table
DROP TRIGGER IF EXISTS NurseIDTrigger;
DELIMITER //
CREATE TRIGGER NurseIDTrigger
	BEFORE INSERT ON medical_database.nurse
		FOR EACH ROW BEGIN
        -- lets begin by 
			DECLARE next_id INT;
            
            SELECT IFNULL(COUNT(NurseID),0) +1 INTO next_id FROM medical_database.nurse;
            SET NEW.NurseID = CONCAT("D",LPAD(next_id, 4, "0"));
	END;
    //
DELIMITER ;
-- -----------------------------------------------------------------------------------




-- ---------------------------------------------------------------------------------
-- Non Medical Staff Table
DROP TABLE IF EXISTS medical_database.non_medic;
CREATE TABLE medical_database.non_medic
	(NonMedicID VARCHAR(5) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID VARCHAR(5),
    Position VARCHAR(25),
    FOREIGN KEY (DepartmentID) REFERENCES medical_database.department(DepartmentID));
    
    -- this trigger is meant to automatically insert a Patient ID upon every new entry into the Physician table
DROP TRIGGER IF EXISTS NonMedicIDTrigger;
DELIMITER //
CREATE TRIGGER NonMedicIDTrigger
	BEFORE INSERT ON medical_database.non_medic
		FOR EACH ROW BEGIN
        -- lets begin by 
			DECLARE next_id INT;
            
            SELECT IFNULL(COUNT(NonMedicID),0) +1 INTO next_id FROM medical_database.non_medic;
            SET NEW.NonMedicID = CONCAT("D",LPAD(next_id, 4, "0"));
	END;
    //
DELIMITER ;
-- ----------------------------------------------------------------------------------
    
    
    
    
-- ---------------------------------------------------------------------------------
-- medications table
DROP TABLE IF EXISTS medical_database.medication;
CREATE TABLE medical_database.medication
	(MedicationID INT PRIMARY KEY,
    MedicationName VARCHAR(100),
    Brand VARCHAR (100),
    Description VARCHAR(255));
-- ----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- prescription table
DROP TABLE IF EXISTS medical_database.prescription;
CREATE TABLE medical_database.prescription
		(PrescriptionID INT PRIMARY KEY,
        PatientID VARCHAR(5),
        FOREIGN KEY(PatientID) REFERENCES medical_database.patient(PatientID),
        EmployeeID VARCHAR(5),
        FOREIGN KEY(EmployeeID) REFERENCES medical_database.physician(EmployeeID),
        MedicationID INT,
        FOREIGN KEY (MedicationID) REFERENCES medical_database.medication(MedicationID),
        PrescriptionCost DECIMAL(10,2),
        PrecriptionDate TIMESTAMP,
        Dosage VARCHAR (50));
-- ---------------------------------------------------------------------------------------




-- ----------------------------------------------------------------------------------------
-- block table
DROP TABLE IF EXISTS medical_database.block;
CREATE TABLE medical_database.block
-- -----------------------------------------------------------------------------------------
    
