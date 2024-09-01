GRANT SELECT, INSERT, UPDATE, DELETE ON hospitalDB.* TO 'doctor'@'localhost';

-- Ensure you have the `GRANT OPTION` privilege
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
