 -- ----------------------------------------------------------------------------------
 -- Insert default departments
 INSERT INTO medical_database.department
	(DepartmentName, DepartmentCode)
VALUES
	("Emergency Department", "ERR"), ("Imaging Depatment", "IR"),
	("Operation Department","OD"), ("Intensive Care Unit", "ICU"), ("Storage","STR"),
	("Mother Child","MOTHCHILD"), ("Dialysis","DIALYSIS"), ("Consultation", "CONSULT"), ("Technical Department","TECHDEP"),
	("Rehabilitation","REHAB"), ("Administration","ADMIN"), ("Pharmacy","PHARM"), ("Laboratorium","LABS");
 -- ----------------------------------------------------------------------------------
 
 
 
 
 -- ----------------------------------------------------------------------------------
 -- add Patients
 -- Insert data into the patient table

CALL AddPatient('John', 'Doe', '1985-06-15', 'M', '123 Elm St', '5551234567', 101);
CALL AddPatient('Jane', 'Smith', '1990-11-23', 'F', '456 Oak Ave', '5552345678', 102);
CALL AddPatient('Alice', 'Johnson', '1978-02-10', 'F', '789 Pine Dr', '5553456789', 103);
CALL AddPatient('Bob', 'Brown', '1983-09-05', 'M', '321 Maple Ln', '5554567890', 104);
CALL AddPatient('Emily', 'Davis', '1992-12-30', 'F', '654 Cedar Blvd', '5555678901', 105);
CALL AddPatient('Michael', 'Wilson', '1980-03-22', 'M', '987 Birch St', '5556789012', 106);
CALL AddPatient('Olivia', 'Martinez', '1988-07-18', 'F', '543 Walnut St', '5557890123', 107);
CALL AddPatient('Ethan', 'Garcia', '1995-01-29', 'M', '876 Ash Ave', '5558901234', 108);
CALL AddPatient('Sophia', 'Anderson', '1993-08-14', 'F', '210 Maple St', '5559012345', 109);
CALL AddPatient('James', 'Thomas', '1976-05-11', 'M', '135 Elm Dr', '5550123456', 110);
CALL AddPatient('Ava', 'Taylor', '1989-10-20', 'F', '246 Pine Blvd', '5551234568', 111);
CALL AddPatient('William', 'White', '1994-04-09', 'M', '357 Oak Ln', '5552345679', 112);
CALL AddPatient('Isabella', 'Harris', '1996-11-30', 'F', '468 Cedar Dr', '5553456780', 113);
CALL AddPatient('Benjamin', 'Clark', '1982-06-23', 'M', '579 Birch Ave', '5554567891', 114);
CALL AddPatient('Mia', 'Lewis', '1987-12-15', 'F', '680 Walnut Blvd', '5555678902', 115);
CALL AddPatient('Lucas', 'Walker', '1991-07-09', 'M', '791 Ash Ln', '5556789013', 116);
CALL AddPatient('Charlotte', 'Young', '1986-09-28', 'F', '902 Maple Ave', '5557890124', 117);
CALL AddPatient('Alexander', 'King', '1979-02-14', 'M', '113 Pine St', '5558901235', 118);
CALL AddPatient('Amelia', 'Wright', '1990-08-05', 'F', '224 Cedar Ln', '5559012346', 119);
CALL AddPatient('Daniel', 'Lopez', '1984-12-17', 'M', '335 Birch Blvd', '5550123457', 120);
CALL AddPatient('Harper', 'Hill', '1992-04-23', 'F', '446 Walnut Dr', '5551234569', 121);


-- ---------------------------------------------------------------------------------------------
-- add Physicians

-- Insert data into the physician table

CALL AddPhysician('Liam', 'Miller', 'ERR', 'Emergency Physician', '5551112233', 'liam.miller@example.com');
CALL AddPhysician('Emma', 'Moore', 'IR', 'Radiologist', '5552223344', 'emma.moore@example.com');
CALL AddPhysician('Noah', 'Taylor', 'OD', 'Surgeon', '5553334455', 'noah.taylor@example.com');
CALL AddPhysician('Olivia', 'Anderson', 'ICU', 'Intensivist', '5554445566', 'olivia.anderson@example.com');
CALL AddPhysician('Aiden', 'Jackson', 'STR', 'Storage Specialist', '5555556677', 'aiden.jackson@example.com');
CALL AddPhysician('Sophia', 'Harris', 'MOTHCHILD', 'Pediatrician', '5556667788', 'sophia.harris@example.com');
CALL AddPhysician('Mason', 'White', 'DIALYSIS', 'Nephrologist', '5557778899', 'mason.white@example.com');
CALL AddPhysician('Isabella', 'Martin', 'CONSULT', 'Consultant', '5558889900', 'isabella.martin@example.com');
CALL AddPhysician('Ethan', 'Garcia', 'TECHDEP', 'Technical Specialist', '5559990011', 'ethan.garcia@example.com');
CALL AddPhysician('Charlotte', 'Brown', 'REHAB', 'Rehabilitation Specialist', '5550001122', 'charlotte.brown@example.com');
CALL AddPhysician('Lucas', 'Wilson', 'ADMIN', 'Administrative Physician', '5551112233', 'lucas.wilson@example.com');
CALL AddPhysician('Mia', 'Lee', 'PHARM', 'Pharmacist', '5552223344', 'mia.lee@example.com');
CALL AddPhysician('Benjamin', 'Clark', 'LABS', 'Laboratory Physician', '5553334455', 'benjamin.clark@example.com');
CALL AddPhysician('Ava', 'Scott', 'ERR', 'Emergency Physician', '5554445566', 'ava.scott@example.com');
CALL AddPhysician('James', 'Lewis', 'IR', 'Imaging Specialist', '5555556677', 'james.lewis@example.com');
CALL AddPhysician('Harper', 'Young', 'OD', 'Surgeon', '5556667788', 'harper.young@example.com');
CALL AddPhysician('William', 'King', 'ICU', 'Intensivist', '5557778899', 'william.king@example.com');
CALL AddPhysician('Evelyn', 'Adams', 'STR', 'Storage Specialist', '5558889900', 'evelyn.adams@example.com');
CALL AddPhysician('Owen', 'Baker', 'MOTHCHILD', 'Pediatrician', '5559990011', 'owen.baker@example.com');
CALL AddPhysician('Lily', 'Nelson', 'DIALYSIS', 'Nephrologist', '5550001122', 'lily.nelson@example.com');
CALL AddPhysician('Elijah', 'Carter', 'CONSULT', 'Consultant', '5551112234', 'elijah.carter@example.com');
