# 🧘‍♀️ Zumba Slot Booking System

This is a dynamic web-based application developed using **Java Servlets**, **JSP**, **JDBC**, and **MySQL**. It allows users to register for Zumba sessions and enables an admin (instructor) to manage participant slots efficiently. The project is structured as a Maven-based Dynamic Web Project and deployed on Apache Tomcat.

---

## 🔧 Tech Stack

- Java EE (Servlets, JSP)
- JDBC for database communication
- MySQL for data storage
- Apache Tomcat for deployment
- Maven for build and dependency management
- HTML, CSS, JSP for frontend

---

## 🎯 Features

### 👥 User:
- Home Page with Navigation Bar
- Register as a Zumba participant
- Log in with email and password
- View available time slots
- Register for an open slot
- Receive appropriate success or warning messages

### 🛠️ Admin:
- Admin login access
- View all available slots
- See a list of participants registered for each slot

---

## 🚀 Setup & Run Instructions

1. **Clone the repository**:
   ```bash
   git clone https://github.com/manuelbecker123/zumba-slot-booking.git

2. **Open in SpringtoolSuite**: as a Maven Project.

3. **Configure MySQL Database:**
   ```sql
   -- Create the database
CREATE DATABASE IF NOT EXISTS phase_2Project;
USE phase_2Project;

-- ====================================
-- Table: users
-- ====================================
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,                 -- Unique user ID
    name VARCHAR(100) NOT NULL,                        -- User's full name
    age INT NOT NULL,                                  -- User's age
    weight DECIMAL(5,2) NOT NULL,                      -- User's weight in kg (with 2 decimal places)
    address VARCHAR(255) NOT NULL,                     -- User's full address
    email VARCHAR(100) NOT NULL UNIQUE,                -- User's email (must be unique)
    tel_number VARCHAR(20) NOT NULL,                   -- User's telephone number
    password VARCHAR(100) NOT NULL,                    -- User's password (plaintext or hashed)
    role VARCHAR(20) NOT NULL DEFAULT 'user'           -- Role: 'admin' or 'user', default is 'user'
) ENGINE=InnoDB;

-- ====================================
-- Insert the admin user
-- ====================================
INSERT INTO users (id, name, age, weight, address, email, tel_number, password, role)
VALUES (
    1,
    'Rohit Sharma',
    26,
    80.00,
    '500 Buffalo Drive, Los Angeles, CA',
    'rohit@admin.com',
    '+12135557777',
    '1234',
    'admin'
);

-- ====================================
-- Table: slots
-- ====================================
CREATE TABLE slots (
    slot_id INT PRIMARY KEY AUTO_INCREMENT,            -- Unique identifier for the slot
    date DATE NOT NULL,                                -- Date of the slot
    time TIME NOT NULL,                                -- Time of the slot
    count INT NOT NULL                                 -- Number of participants registered or allowed
) ENGINE=InnoDB;

-- ====================================
-- Insert Available Slots with count
-- ====================================
INSERT INTO slots (date, time, count)
VALUES
  ('2025-04-10', '09:00:00', 20),
  ('2025-04-10', '13:00:00', 20);

-- ====================================
-- Table: slots_registered
-- ====================================
CREATE TABLE slots_registered (
    registration_id INT PRIMARY KEY AUTO_INCREMENT,    -- Unique registration ID
    date DATE NOT NULL,                                -- Date of the booked slot
    time TIME NOT NULL,                                -- Time of the booked slot
    emailid VARCHAR(100) NOT NULL,                     -- Email of the user who registered
    CONSTRAINT unique_user_slot UNIQUE (emailid, date, time)  -- One user can register only once for a specific date and time
) ENGINE=InnoDB;

  4. **Set DB credentials** in DbUtil.java
  ```java
  String jdbcURL = "jdbc:mysql://localhost:3306/phase_2Project";
  String dbUser = "root";
  String dbPassword = "your_password";

  5.  **Package the project using maven**
  ```bash
  mvn clean package

  6. Run the index file with Tomcat Server. 




