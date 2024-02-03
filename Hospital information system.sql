CREATE DATABASE IF NOT EXISTS HospitalDB;
USE HospitalDB;
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(50),
    experience_years INT,
    contact_number VARCHAR(15),
    email VARCHAR(100)
);
INSERT INTO Doctor(doctor_id,doctor_name,specialization,experience_years,contact_number,email) VALUES
(101, 'Dr. John Smith', 'Cardiology', 10, '+1234567890', 'john@example.com'),
(102, 'Dr. Mary Johnson', 'Pediatrics', 8, '+9876543210', 'mary@example.com'),
(103, 'Dr. Robert Davis', 'Orthopedics', 15, '+1122334455', 'robert@example.com'),
(104, 'Dr. Smith', 'Dermatologists', 11, '+1209873390', 'smith@example.com'),
(105, 'Dr. Johnson', 'Endocrinologists', 18, '+1010543210', 'jhonson@example.com'),
(106, 'Dr. Davis', 'Gastroenterologists', 5, '+2456334455', 'davis@example.com'),
(107, 'Dr. John', 'Gynecologist', 19, '+9876567890', 'joson@example.com'),
(108, 'Dr. Mary', 'Orthopedic Surgeon', 13, '+5642843210', 'ria@example.com'),
(109, 'Dr. Robert', 'Radiology', 15, '+8989334455', 'ror@example.com'),
(110, 'Dr. Anu', 'Cardiology', 6, '+7689445678', 'anu@example.com'),
(111, 'Dr. Abi', 'Pulmonologist', 9, '+9078540210', 'abi@example.com'),
(112, 'Dr. Kumar', 'Orthopedics', 13, '+1177384455', 'kumar@example.com'),
(113, 'Dr. Muthulakshmi', 'Pediatrics', 10, '+9067567890', 'lakshmi@example.com'),
(114, 'Dr. Tharun', 'Dentist', 8, '+8738632965', 'tharun@example.com'),
(115, 'Dr. sorna', 'Psychiatrist', 15, '+1720654355', 'sorna@example.com');
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    contact_number VARCHAR(15),
    email VARCHAR(100)
);
INSERT INTO Patient(patient_id,patient_name,age,gender,contact_number,email)VALUES
(201, 'Alice Miller', 25, 'Female', '+1987654321', 'alice@example.com'),
(202, 'Bob Harris', 40, 'Male', '+1654321987', 'bob@example.com'),
(203, 'Eva Martinez', 32, 'Female', '+1765432198', 'eva@example.com'),
(204, 'Miller', 25, 'Female', '+1982224321', 'miller@example.com'),
(205, 'Harris', 40, 'Male', '+333321987', 'harris@example.com'),
(206, 'Martinez', 32, 'Female', '+4445432198', 'mart@example.com'),
(207, 'Alice', 25, 'Female', '+1675465431', 'ali@example.com'),
(208, 'Bob', 40, 'Male', '+1234567892', 'b@example.com'),
(209, 'Eva', 32, 'Female', '+9146573218', 'ea@example.com'),
(210, 'Ancy', 25, 'Female', '+1967894321', 'ancy@example.com'),
(211, 'Bala', 40, 'Male', '+9129321987', 'bala@example.com'),
(212, 'Erin', 32, 'Female', '+8945432568', 'erin@example.com'),
(213, 'Ava', 25, 'Female', '+7987654567', 'ava@example.com'),
(214, 'Bhavani', 40, 'Male', '+8123321987', 'bhava@example.com'),
(215, 'Elisa', 32, 'Female', '+7189543218', 'elisa@example.com');
CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    appointment_date DATE,
    diagnosis VARCHAR(200),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);
INSERT INTO Appointment(appointment_id,doctor_id,patient_id,appointment_date,diagnosis)VALUES
(301, 101, 201, '2023-01-15', 'Cardiac checkup'),
(302, 102, 202, '2023-02-20', 'Pediatric consultation'),
(303, 103, 203, '2023-03-25', 'Orthopedic examination'),
(304, 104, 204, '2023-04-18', 'Dermatology checkup'),
(305, 105, 205, '2023-05-12', 'Endocrinology consultation'),
(306, 106, 206, '2023-03-24', 'Gastroenterology examination'),
(307, 107, 207, '2023-02-13', 'Gynecolog checkup'),
(308, 108, 208, '2023-04-20', 'Orthopedia consultation'),
(309, 109, 209, '2023-05-24', 'Radiology examination'),
(310, 110, 210, '2023-06-15', 'Cardiac checkup'),
(311, 111, 211, '2023-03-26', 'Pulmonology consultation'),
(312, 112, 212, '2023-02-25', 'Orthopedic examination'),
(313, 113, 213, '2023-04-16', 'Pediatrics checkup'),
(314, 114, 214, '2023-02-23', 'Dental consultation'),
(315, 115, 215, '2023-05-22', 'Psychiatric examination');
-- Query to get details of patients with their appointments
SELECT P.patient_id, P.patient_name, P.age, P.gender, A.appointment_date, D.doctor_name, A.diagnosis
FROM Patient P
JOIN Appointment A ON P.patient_id = A.patient_id
JOIN Doctor D ON A.doctor_id = D.doctor_id
ORDER BY A.appointment_date;

-- Query to find doctors with the highest and lowest experience
SELECT specialization, 
       MAX(experience_years) AS max_experience, 
       MIN(experience_years) AS min_experience
FROM Doctor
GROUP BY specialization;

-- Query to count the number of patients in each age group
SELECT CASE 
    WHEN age < 30 THEN 'Under 30'
    WHEN age BETWEEN 30 AND 50 THEN '30-50'
    ELSE 'Over 50' 
END AS age_group,
COUNT(patient_id) AS patient_count
FROM Patient
GROUP BY age_group;









