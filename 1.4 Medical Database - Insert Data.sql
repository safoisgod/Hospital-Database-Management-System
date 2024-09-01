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



-- -------------------------------------------------------------------------------------------
-- add medications
INSERT INTO medical_database.medication (MedicationName, Brand, Description) VALUES
('Aspirin', 'Bayer', 'Used to reduce pain, fever, or inflammation'),
('Ibuprofen', 'Advil', 'Nonsteroidal anti-inflammatory drug'),
('Metformin', 'Glucophage', 'Used to treat type 2 diabetes'),
('Amoxicillin', 'Amoxil', 'Antibiotic used to treat bacterial infections'),
('Lisinopril', 'Prinivil', 'Used to treat high blood pressure'),
('Simvastatin', 'Zocor', 'Used to lower cholesterol levels'),
('Omeprazole', 'Prilosec', 'Used to treat acid reflux and ulcers'),
('Hydrochlorothiazide', 'Microzide', 'Diuretic used to treat high blood pressure'),
('Atorvastatin', 'Lipitor', 'Statin used to lower cholesterol'),
('Cetirizine', 'Zyrtec', 'Antihistamine used to relieve allergy symptoms'),
('Gabapentin', 'Neurontin', 'Used to treat nerve pain and seizures'),
('Prednisone', 'Deltasone', 'Corticosteroid used to reduce inflammation'),
('Metoprolol', 'Lopressor', 'Beta-blocker used to treat high blood pressure and heart issues'),
('Losartan', 'Cozaar', 'Angiotensin II receptor blocker used to treat high blood pressure'),
('Clopidogrel', 'Plavix', 'Antiplatelet medication used to prevent blood clots'),
('Citalopram', 'Celexa', 'Antidepressant used to treat depression'),
('Fluticasone', 'Flonase', 'Corticosteroid used to treat nasal allergies'),
('Azithromycin', 'Zithromax', 'Antibiotic used to treat various infections'),
('Lorazepam', 'Ativan', 'Benzodiazepine used to treat anxiety'),
('Albuterol', 'Ventolin', 'Bronchodilator used to treat asthma and other respiratory conditions');



-- --------------------------------------------------------------------
-- add Prescriptions
CALL AddPrescription('P0001', 'D0001', NULL, 50.75, NULL, '20mg daily');
CALL AddPrescription('P0002', 'D0002', 102, 75.50, '2024-08-02 11:30:00', '10mg twice daily');
CALL AddPrescription('P0003', NULL, 103, 120.00, '2024-08-03 09:15:00', '30mg once daily');
CALL AddPrescription('P0004', 'D0003', 104, 45.25, '2024-08-04 14:00:00', '15mg daily');
CALL AddPrescription('P0005', 'D0004', 105, 89.99, '2024-08-05 16:45:00', '25mg daily');
CALL AddPrescription('P0006', 'D0001', 106, 67.30, '2024-08-06 08:00:00', '50mg daily');
CALL AddPrescription('P0007', NULL, 107, 33.60, '2024-08-07 10:20:00', '5mg twice daily');
CALL AddPrescription('P0008', 'D0002', 108, 110.20, '2024-08-08 13:10:00', '40mg once daily');
CALL AddPrescription('P0009', 'D0003', 109, 55.80, '2024-08-09 11:00:00', '10mg thrice daily');
CALL AddPrescription('P0010', 'D0004', 110, 98.40, '2024-08-10 09:25:00', '20mg twice daily');
CALL AddPrescription('P0011', NULL, 111, 77.00, '2024-08-11 12:15:00', '15mg daily');
CALL AddPrescription('P0012', 'D0001', 112, 85.90, '2024-08-12 14:00:00', '10mg daily');
CALL AddPrescription('P0013', 'D0002', 113, 65.70, '2024-08-13 10:30:00', '25mg once daily');
CALL AddPrescription('P0014', 'D0003', 114, 92.30, '2024-08-14 16:10:00', '30mg twice daily');
CALL AddPrescription('P0015', 'D0004', 115, 40.50, '2024-08-15 11:45:00', '5mg daily');
CALL AddPrescription('P0016', NULL, 116, 60.00, '2024-08-16 13:25:00', '15mg twice daily');
CALL AddPrescription('P0017', 'D0001', 117, 73.85, '2024-08-17 09:55:00', '20mg once daily');
CALL AddPrescription('P0018', 'D0002', 118, 48.90, '2024-08-18 10:40:00', '25mg daily');
CALL AddPrescription('P0019', 'D0003', 119, 83.70, '2024-08-19 15:20:00', '30mg daily');
CALL AddPrescription('P0020', 'D0004', 120, 55.00, '2024-08-20 12:00:00', '10mg thrice daily');
