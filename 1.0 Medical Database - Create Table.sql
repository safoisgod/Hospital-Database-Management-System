-- ----------------------------------------------------------------------------------
DROP SCHEMA IF EXISTS medical_database;
CREATE SCHEMA medical_database;
-- ----------------------------------------------------------------------------------



-- ----------------------------------------------------------------------------------
USE medical_database;
-- ----------------------------------------------------------------------------------




-- ---------------------------------------------------------------------
-- let's first begin with the patient table
DROP TABLE IF EXISTS medical_database.patient;
CREATE TABLE medical_database.patient
	-- i will like to assume that, to differentiate betwen different ypes of IDs, we will start the IDs with come Identifier Char like "P" for Patients, "D" for Physician(Doctor), "N" for Nurse etc
    -- so to make this work we will create a trigger in the Trigger SQL file after creating these kind of tables
	(PatientID VARCHAR(5) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Sex VARCHAR(1), CHECK (Sex IN ("M","F")),
    Address VARCHAR (50),
    PhoneNumber VARCHAR(10),
    InsuranceID INTEGER,
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
  -- ----------------------------------------------------------------------------------
  
  
  
  
  
 -- ----------------------------------------------------------------------------------   
    -- a department table   
DROP TABLE IF EXISTS medical_database.department;
CREATE TABLE medical_database.department
	(DepartmentName VARCHAR(50),
	DepartmentCode VARCHAR(15) PRIMARY KEY,
    HOD VARCHAR(100));
-- ----------------------------------------------------------------------------
 
 
 

 
 -- ------------------------------------------------------------------------
 -- let's create a table for the Medical Staff
 DROP TABLE IF EXISTS medical_database.physician;
 CREATE TABLE medical_database.physician
	(PhysicianID VARCHAR(5) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DepartmentCode VARCHAR(15),
    Position VARCHAR(25) DEFAULT NULL,
    Speciality VARCHAR(100) DEFAULT NULL,
    PhoneNumber VARCHAR(10) DEFAULT NULL,
    Email VARCHAR(100) DEFAULT NULL,
    HireDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (DepartmentCode) REFERENCES medical_database.department(DepartmentCode));
  -- ----------------------------------------------------------------------------------
  
  
  

    
-- ------------------------------------------------------------------------------
-- Nurses table
 DROP TABLE IF EXISTS medical_database.nurse;
 CREATE TABLE medical_database.nurse
	(NurseID VARCHAR(5) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DepartmentCode VARCHAR(5),
    Position VARCHAR(25) DEFAULT NULL,
    PhoneNumber VARCHAR(10) DEFAULT NULL,
    Email VARCHAR(100) DEFAULT NULL,
    HireDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (DepartmentCode) REFERENCES medical_database.department(DepartmentCode));
  -- ----------------------------------------------------------------------------------
  
  
    

    
 -- ---------------------------------------------------------------------------------
-- Non Medical Staff Table
DROP TABLE IF EXISTS medical_database.non_medic;
CREATE TABLE medical_database.non_medic
	(NonMedicID VARCHAR(5) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DepartmentCode VARCHAR(5),
    Position VARCHAR(25) DEFAULT NULL,
    PhoneNumber VARCHAR(10) DEFAULT NULL,
    Email VARCHAR(100) DEFAULT NULL,
    HireDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (DepartmentCode) REFERENCES medical_database.department(DepartmentCode));   
  -- ----------------------------------------------------------------------------------
  
  
  

    
-- ---------------------------------------------------------------------------------
-- medications table
DROP TABLE IF EXISTS medical_database.medication;
CREATE TABLE medical_database.medication
	(MedicationID INT AUTO_INCREMENT PRIMARY KEY,
    MedicationName VARCHAR(100),
    Brand VARCHAR (100),
    Description VARCHAR(255));
-- ----------------------------------------------------------------------------------





-- -----------------------------------------------------------------------------------
-- prescription table
DROP TABLE IF EXISTS medical_database.prescription;
CREATE TABLE medical_database.prescription (
		PrescriptionID VARCHAR(10) PRIMARY KEY,
        PatientID VARCHAR(5),
        FOREIGN KEY(PatientID) REFERENCES medical_database.patient(PatientID),
        PhysicianID VARCHAR(5),
        FOREIGN KEY(PhysicianID) REFERENCES medical_database.physician(PhysicianID),
        MedicationID INT,
        FOREIGN KEY (MedicationID) REFERENCES medical_database.medication(MedicationID),
        PrescriptionCost DECIMAL(10,2),
        PrescriptionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        Dosage VARCHAR (50));
-- ---------------------------------------------------------------------------------------





-- ----------------------------------------------------------------------------------
-- block table
DROP TABLE IF EXISTS medical_database.block;
CREATE TABLE medical_database.block
	(BlockFloor INT ,
    BlockCode INT,
    PRIMARY KEY (Blockfloor, BlockCode));
-- -----------------------------------------------------------------------------------------






-- ----------------------------------------------------------------------------------   
-- room table
DROP TABLE IF EXISTS medical_database.room;
CREATE TABLE medical_database.room (
    RoomNumber INT PRIMARY KEY,
    RoomType VARCHAR(50),
    BlockFloor INT,
    BlockCode INT,
    NoOfBeds INT,
    BedsAvailable INT,
    FOREIGN KEY (BlockFloor, BlockCode)
        REFERENCES medical_database.block (BlockFloor , BlockCode)
);
-- -----------------------------------------------------------------------------------------






-- ----------------------------------------------------------------------------------  
-- appointments table
CREATE TABLE medical_database.appointment (
	AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID VARCHAR(5),
    PhysicianID VARCHAR(5),
    AppointmentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Reason TEXT,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (PatientID) REFERENCES patient(PatientID),
    FOREIGN KEY (PhysicianID) REFERENCES physician(PhysicianID));
-- -----------------------------------------------------------------------------------------






-- ----------------------------------------------------------------------------------  
-- medical_records table
CREATE TABLE medical_records (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID VARCHAR(5),
    PhysicianID VARCHAR(5),
    RecordDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Diagnosis TEXT,
    Treatment TEXT,
    FOREIGN KEY (PatientID) REFERENCES patient(PatientID),
    FOREIGN KEY (PhysicianID) REFERENCES physician(PhysicianID)
);
