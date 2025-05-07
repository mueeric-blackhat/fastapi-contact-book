question 1:
-- Create the database
CREATE DATABASE IF NOT EXISTS clinic_db;
USE clinic_db;

-- Patients table
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    phone VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Doctors table
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    phone VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Appointments table (Many-to-One: Many appointments for one doctor and one patient)
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Prescriptions table (One-to-Many: One appointment can have many prescriptions)
CREATE TABLE Prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    medication_name VARCHAR(100),
    dosage VARCHAR(50),
    instructions TEXT,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

-- Medical Records table (One-to-One with Patient)
CREATE TABLE MedicalRecords (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT UNIQUE NOT NULL,
    blood_type VARCHAR(5),
    allergies TEXT,
    chronic_conditions TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Sample Data Insertion

-- Patients
INSERT INTO Patients (full_name, date_of_birth, gender, phone, email)
VALUES 
('John Doe', '1990-05-14', 'Male', '0700111222', 'john@example.com'),
('Alice Smith', '1985-11-22', 'Female', '0711222333', 'alice@example.com');

-- Doctors
INSERT INTO Doctors (full_name, specialty, phone, email)
VALUES 
('Dr. Jane Smith', 'Cardiology', '0700123456', 'dr.jane@clinic.com'),
('Dr. Robert Kim', 'Dermatology', '0711234567', 'dr.robert@clinic.com');

-- Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, reason)
VALUES 
(1, 1, '2025-05-10 10:30:00', 'Chest pain and shortness of breath'),
(2, 2, '2025-05-11 14:00:00', 'Skin rash and itching');

-- Prescriptions
INSERT INTO Prescriptions (appointment_id, medication_name, dosage, instructions)
VALUES 
(1, 'Aspirin', '75mg', 'Take one tablet daily after meals'),
(2, 'Hydrocortisone Cream', 'Apply 2x daily', 'Apply to affected area for 7 days');

-- Medical Records
INSERT INTO MedicalRecords (patient_id, blood_type, allergies, chronic_conditions)
VALUES 
(1, 'O+', 'Peanuts', 'Hypertension'),
(2, 'A-', 'None', 'Asthma');
