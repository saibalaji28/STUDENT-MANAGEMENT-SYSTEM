<%@ Page Title="Add Student" Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="StudentManagementSystem.AddStudent" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Add Student</title>
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
            <div class="card">
                <h2>Add New Student</h2>

                <!-- Success / error message -->
                <asp:Panel ID="pnlMessage" runat="server" Visible="false">
                    <asp:Label ID="lblMessage" runat="server" CssClass="alert"></asp:Label>
                </asp:Panel>

                <div class="form-group">
                    <label for="txtName">Full Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="e.g. Aarav Sharma"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server"
                        ControlToValidate="txtName"
                        ErrorMessage="Name is required."
                        CssClass="field-error"
                        Display="Dynamic"
                        ValidationGroup="AddStudent" />
                </div>

                <div class="form-group">
                    <label for="txtEmail">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="e.g. aarav.sharma@example.com"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email is required."
                        CssClass="field-error"
                        Display="Dynamic"
                        ValidationGroup="AddStudent" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Please enter a valid email address."
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                        CssClass="field-error"
                        Display="Dynamic"
                        ValidationGroup="AddStudent" />
                </div>

                <div class="form-group">
                    <label for="txtCourse">Course</label>
                    <asp:TextBox ID="txtCourse" runat="server" CssClass="form-control" placeholder="e.g. B.Tech CSE"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCourse" runat="server"
                        ControlToValidate="txtCourse"
                        ErrorMessage="Course is required."
                        CssClass="field-error"
                        Display="Dynamic"
                        ValidationGroup="AddStudent" />
                </div>

                <div class="form-group">
                    <label for="txtAge">Age</label>
                    <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" placeholder="e.g. 20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAge" runat="server"
                        ControlToValidate="txtAge"
                        ErrorMessage="Age is required."
                        CssClass="field-error"
                        Display="Dynamic"
                        ValidationGroup="AddStudent" />
                    <asp:RangeValidator ID="rvAge" runat="server"
                        ControlToValidate="txtAge"
                        ErrorMessage="Age must be a whole number between 1 and 120."
                        MinimumValue="1"
                        MaximumValue="120"
                        Type="Integer"
                        CssClass="field-error"
                        Display="Dynamic"
                        ValidationGroup="AddStudent" />
                </div>

                <div class="btn-row">
                    <asp:Button ID="btnAdd" runat="server" Text="Add Student" CssClass="btn btn-success"
                        ValidationGroup="AddStudent" OnClick="btnAdd_Click" />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-secondary"
                        CausesValidation="false" OnClick="btnClear_Click" />
                    <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-secondary"
                        CausesValidation="false" OnClick="btnBack_Click" />
                </div>
            </div>
        </div>

        <div class="footer">
            Student Management System &copy; 2026 &mdash; ASP.NET Tiny Project
        </div>

    </form>
</body>
</html>
