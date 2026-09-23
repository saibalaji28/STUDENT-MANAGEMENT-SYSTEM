/*=====================================================================
  Student Management System - Database Script
  Project : ASP.NET Tiny Project
  Team    : Taha Bohra (2405101010107), Burhanuddin (2405101010081)
=======================================================================
  HOW TO RUN THIS SCRIPT
  1. Open SQL Server Management Studio (SSMS).
  2. Connect to your local SQL Server instance.
  3. Open this file (File > Open > File...) or paste its contents
     into a New Query window.
  4. Click "Execute" (or press F5).
  This will create the StudentDB database and the Students table,
  and insert a few sample rows so the app has data to show right away.
=======================================================================*/

-- 1. Create the database (only if it does not already exist)
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'StudentDB')
BEGIN
    CREATE DATABASE StudentDB;
END
GO

USE StudentDB;
GO

-- 2. Create the Students table (only if it does not already exist)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Students') AND type = N'U')
BEGIN
    CREATE TABLE Students
    (
        ID      INT IDENTITY(1,1) PRIMARY KEY,
        Name    VARCHAR(100) NOT NULL,
        Email   VARCHAR(100) NOT NULL,
        Course  VARCHAR(100) NOT NULL,
        Age     INT NOT NULL
    );
END
GO

-- 3. Insert a few sample records (optional - safe to remove)
IF NOT EXISTS (SELECT 1 FROM Students)
BEGIN
    INSERT INTO Students (Name, Email, Course, Age) VALUES
    ('Aarav Sharma',   'aarav.sharma@example.com',   'B.Tech CSE', 20),
    ('Priya Mehta',    'priya.mehta@example.com',    'B.Tech IT',  21),
    ('Rohan Verma',    'rohan.verma@example.com',    'BCA',        19);
END
GO

-- 4. Quick check - view all students
SELECT * FROM Students;
GO
