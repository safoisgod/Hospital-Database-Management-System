--
CREATE PROCEDURE AddPatient(
    IN firstName VARCHAR(50),
    IN lastName VARCHAR(50),
    IN dob DATE,
    IN gender ENUM('Male', 'Female', 'Other'),
    IN address TEXT,
    IN phoneNumber VARCHAR(15)
)
BEGIN
    INSERT INTO Patients (FirstName, LastName, DateOfBirth, Gender, Address, PhoneNumber)
    VALUES (firstName, lastName, dob, gender, address, phoneNumber);
END;