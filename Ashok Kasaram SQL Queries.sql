CREATE DATABASE UniversityRegistrationSystem;
USE UniversityRegistrationSystem;

-- Create login table
CREATE TABLE login (
    login_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Create student_details table
CREATE TABLE student_details (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL,
    dob DATE NOT NULL,
    login_id INT,
    FOREIGN KEY (login_id) REFERENCES login(login_id)
);

CREATE TABLE IF NOT EXISTS Courses (
  Course_Id INT PRIMARY KEY AUTO_INCREMENT,
  CourseName VARCHAR(50),
  InstructorName VARCHAR(50),
  StarTime TIME,
  EndTime TIME,
  RoomNumber VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS Enrollment (
Enrollment_Id INT PRIMARY KEY AUTO_INCREMENT,
Student_Id INT,
Course_Id INT,
Grade CHAR(1),
FOREIGN KEY (student_Id) references student_details(student_Id),
FOREIGN KEY (course_Id) references Courses(course_Id)
);

CREATE TABLE IF NOT EXISTS Schedule (
schedule_Id INT PRIMARY KEY AUTO_INCREMENT,
student_Id INT,
course_Id INT,
startTime TIME,
endTime TIME,
RoomNumber VARCHAR(20),
FOREIGN KEY (student_Id) references student_details(student_Id),
FOREIGN KEY (course_Id) references Courses(course_Id)
);

CREATE TABLE Department (
Department_Id INT PRIMARY KEY AUTO_INCREMENT,
DepartmentName VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS Professor(
Professor_Id INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Address VARCHAR(100),
PhoneNumber VARCHAR(20),
Email VARCHAR(50)
  );
  
ALTER TABLE Courses
ADD COLUMN Department_Id INT,
ADD FOREIGN KEY (Department_Id) REFERENCES Department(Department_Id);

ALTER TABLE Courses
ADD COLUMN Professor_Id INT,
ADD FOREIGN KEY (Professor_Id) REFERENCES Professor(Professor_Id);

-- INSERT Statement for Registration
INSERT INTO login (username, password) VALUES ('ka11', '123456789');

-- SELECT Statement for Login Verification
SELECT * FROM login WHERE username = 'ka11' AND password = '123456789';

-- UPDATE Statement for Updating Student Details
UPDATE student_details 
SET first_name = 'LanaDel', 
    last_name = 'Rey', 
    address = '11217 NW 7th Street', 
    phone_number = '1234567890', 
    email = 'lanadelrey@gmail.com', 
    dob = '1111-01-01' 
WHERE student_id = '2';

-- DELETE Statement for Deleting Student Details
DELETE FROM student_details WHERE student_id = '2';



-- Retrieve the names of all students
SELECT first_name, last_name FROM student_details;

-- Retrieve a student's password based on their ID
SELECT password FROM login WHERE login_Id = 2;

-- Retrieve student details based on their first name
SELECT * FROM student_details WHERE first_name = 'LanaDel';

-- Retrieve students with phone numbers starting with a specific prefix
SELECT * FROM student_details WHERE phone_number LIKE '1';

-- Retrieve students born after a certain date
SELECT * FROM student_details WHERE dob > '1000-01-01';

-- Retrieve students living in a specific address
SELECT * FROM student_details WHERE address = '11217 NW 7th Street';

-- Insert data into the student_details table
INSERT INTO student_details (first_name, last_name, address, phone_number, email, dob) 
VALUES ('LanaDel', 'Rey', '11217 NW 7th Street', '1234567890', 'lanadelrey@gmail.com', '1111-01-01');

-- Update data in the student_details table based on the student's ID
UPDATE student_details SET address = '11217 NW 11 St', phone_number = '1234567891' WHERE student_Id = 2;

-- Delete a student based on their ID
DELETE FROM student_details WHERE student_Id = 2;
