-- ---------------------------------------------
-- procedure for adding data into the Patient Table
DROP PROCEDURE IF EXISTS AddPatient;

DELIMITER //
CREATE PROCEDURE AddPatient(
    IN firstName VARCHAR(50),
    IN lastName VARCHAR(50),
    IN dob DATE,
    IN sex ENUM('M', 'F'),
    IN address VARCHAR (50),
    IN phoneNumber VARCHAR(10),
    IN insuranceID INT
)
BEGIN
    INSERT INTO medical_database.patient (
		FirstName, 
		LastName, 
        DOB, 
        Sex, 
        Address, 
        PhoneNumber, 
        InsuranceID)
    VALUES (
		firstName, 
        lastName, 
        dob, 
        sex, 
        address, 
        phoneNumber, 
        insuranceID);
END //
DELIMITER ;
-- ------------------------------------------------


-- -------------------------------------------------
-- procedure for adding data into the Physician Table
DROP PROCEDURE IF EXISTS AddPhysician;

DELIMITER //
CREATE PROCEDURE AddPhysician(
    IN firstName VARCHAR(50),
    IN lastName VARCHAR(50),
    IN departmentCode VARCHAR(15),
    IN position VARCHAR (50),
    IN phoneNumber VARCHAR(10),
    IN email VARCHAR(100)
)
BEGIN
    INSERT INTO medical_database.physician (
		FirstName, 
		LastName, 
		DepartmentCode, 
		Position, 
		PhoneNumber, 
		Email)
    VALUES (
		firstName, 
		lastName, 
		departmentCode, 
		position, 
		phoneNumber, 
		email);
END //
DELIMITER ;
-- -------------------------------------------------




-- -------------------------------------------------
-- procedure for adding data into the Nurse Table
DROP PROCEDURE IF EXISTS AddNurse;

DELIMITER //
CREATE PROCEDURE AddNurse(
    IN firstName VARCHAR(50),
    IN lastName VARCHAR(50),
    IN departmentCode VARCHAR(15),
    IN position VARCHAR (50),
    IN phoneNumber VARCHAR(10),
    IN email VARCHAR(100)
)
BEGIN
    INSERT INTO medical_database.nurse (
		FirstName, 
		LastName, 
		DepartmentCode, 
		Position, 
		PhoneNumber, 
		Email)
    VALUES (
		firstName, 
		lastName, 
		departmentCode, 
		position, 
		phoneNumber, 
		email);
END //
DELIMITER ;
-- -------------------------------------------------





-- -------------------------------------------------
-- procedure for adding data into the Non_Medic Table
DROP PROCEDURE IF EXISTS AddNonMedic;

DELIMITER //
CREATE PROCEDURE AddNonMedic(
    IN firstName VARCHAR(50),
    IN lastName VARCHAR(50),
    IN departmentCode VARCHAR(5),
    IN position VARCHAR (50),
    IN phoneNumber VARCHAR(10),
    IN email VARCHAR(100)
)
BEGIN
    INSERT INTO medical_database.non_medic (
		FirstName, 
		LastName, 
		DepartmentCode, 
		Position, 
		PhoneNumber, 
		Email)
    VALUES (
		firstName, 
		lastName, 
		departmentCode, 
		position, 
		phoneNumber, 
		email);
END //
DELIMITER ;
-- -------------------------------------------------





-- -------------------------------------------------
-- procedure for adding data into the Prescription Table
DROP PROCEDURE IF EXISTS AddPrescription;

DELIMITER //

CREATE PROCEDURE AddPrescription(
    IN patientID VARCHAR(5),
    IN physicianID VARCHAR(5),
    IN medicationID INT,
    IN prescriptionCost DECIMAL(10,2),
    IN prescriptionDate TIMESTAMP,
    IN dosage VARCHAR(50)
)
BEGIN
    INSERT INTO medical_database.prescription (
        PatientID, 
        PhysicianID, 
        MedicationID, 
        PrescriptionCost, 
        PrescriptionDate, 
        Dosage)
    VALUES (
        patientID, 
        physicianID, 
        medicationID, 
        IFNULL(prescriptionCost, 0.00), 
        IFNULL(prescriptionDate, NOW()), 
        dosage);
END //

DELIMITER ;
-- -------------------------------------------------





-- -------------------------------------------------
-- procedure for adding data into the Prescription Table
DROP PROCEDURE IF EXISTS AddAppointment;

DELIMITER //
CREATE PROCEDURE AddAppointment(
    IN patientID VARCHAR(5),
    IN physicianID VARCHAR(5),
    IN medicationID INT,
    IN prescriptionCost DECIMAL(10,2),
    IN prescriptionDate TIMESTAMP,
    IN dosage VARCHAR(50)
)
BEGIN
    INSERT INTO medical_database.appointment (
		PatientID, 
        PhysicianID, 
        MedicationID, 
        PrescriptionCost, 
        PrecriptionDate, 
        Dosage)
    VALUES (
		patientID, 
        physicianID, 
        medicationID, 
        prescriptionCost, 
        prescriptionDate, 
        dosage);
END //
DELIMITER ;
-- -------------------------------------------------