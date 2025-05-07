# 🏥 Clinic Booking System – MySQL + FastAPI Project

## 📌 Project Overview

This project is divided into two parts:

- **Question 1**: A complete relational database design and implementation using MySQL for a Clinic Booking System.
- **Question 2**: A functional CRUD API built with FastAPI and connected to the MySQL database, allowing management of patients, doctors, appointments, and prescriptions.

---

## 🧠 Question 1 – Database Design (MySQL)

A well-structured relational database was created using MySQL.

### 📁 Features

- **Patients Table**: Stores patient info (ID, name, contact, gender, DOB)
- **Doctors Table**: Stores doctor info (ID, name, specialization, contact)
- **Appointments Table**: Links patients with doctors and stores date/time
- **Prescriptions Table**: Linked one-to-one with appointments

### ✅ SQL Constraints Used

- `PRIMARY KEY` and `FOREIGN KEY` constraints
- `NOT NULL`, `UNIQUE`
- One-to-One, One-to-Many relationships

### 📂 File

- `question1_clinic_booking.sql` – Contains all `CREATE TABLE` statements and sample data (well-commented)

---

## 💻 Question 2 – CRUD API (FastAPI + MySQL)

A RESTful API was built using **FastAPI** that performs full **CRUD operations**.

### 🔌 Tech Stack

- Python + FastAPI
- MySQL (via XAMPP)
- SQLAlchemy ORM
- Uvicorn for serving

### 🔧 Features

| Entity        | Operations                          |
|---------------|-------------------------------------|
| Patients      | Create, Read, Update, Delete        |
| Doctors       | Create, Read, Update, Delete        |
| Appointments  | Book and manage appointments        |
| Prescriptions | Link prescriptions to appointments  |

---

## 🚀 How to Setup & Run the Project

### 🐬 MySQL (XAMPP)

1. Open XAMPP → Start Apache and MySQL.
2. Go to [phpMyAdmin](http://localhost/phpmyadmin) and create a new database named `clinic_db`.
3. Import the SQL schema:  
   - Open `question2_crud_api/db_schema.sql` and import it into `clinic_db`.

### 🐍 FastAPI Setup

1. Open your terminal and navigate to the project folder:
   ```bash
   cd final-project
   
2.Create and activate a virtual environment:
python -m venv env
env\Scripts\activate  # Windows


3.Install dependencies:
pip install -r requirements.txt


4.Run the server:
uvicorn main:app --reload


5.Access the API documentation in your browser:
http://127.0.0.1:8000/docs
