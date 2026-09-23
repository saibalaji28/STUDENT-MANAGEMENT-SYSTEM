<%@ Page Title="Home" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StudentManagementSystem.Default" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Student Management System</title>
    <link rel="stylesheet" href="Content/style.css" />
</head>
<body>
    <form id="form1" runat="server">

        <!-- Navigation Bar -->
        <div class="navbar">
            <a class="brand" href="Default.aspx">Student Management System</a>
            <div class="nav-links">
                <a href="Default.aspx">Home</a>
                <a href="AddStudent.aspx">Add Student</a>
                <a href="Students.aspx">View Students</a>
            </div>
        </div>

        <div class="page-container">

            <!-- Hero Section -->
            <div class="hero">
                <h1>Student Management System</h1>
                <p>Manage student records easily using ASP.NET and SQL Server.</p>
                <div class="hero-buttons">
                    <a href="AddStudent.aspx" class="btn btn-success">+ Add Student</a>
                    <a href="Students.aspx" class="btn btn-secondary">View Students</a>
                </div>
            </div>

            <!-- Stats -->
            <div class="stats-row">
                <div class="stat-card">
                    <div class="stat-number">
                        <asp:Label ID="lblTotalStudents" runat="server" Text="0"></asp:Label>
                    </div>
                    <div class="stat-label">Total Students</div>
                </div>
            </div>

            <!-- About card -->
            <div class="card">
                <h2>About this Project</h2>
                <p>
                    This is a simple ASP.NET Web Forms tiny project that demonstrates
                    complete CRUD (Create, Read, Update, Delete) operations on a SQL
                    Server database. Use the navigation bar above to add new students,
                    or view / edit / delete existing student records.
                </p>
            </div>

        </div>

        <div class="footer">
            Student Management System &copy; 2026 &mdash; ASP.NET Tiny Project
        </div>

    </form>
</body>
</html>
