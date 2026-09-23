<%@ Page Title="View Students" Language="C#" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="StudentManagementSystem.Students" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>View Students</title>
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
                <h2>All Students</h2>

                <!-- Success / error message -->
                <asp:Panel ID="pnlMessage" runat="server" Visible="false">
                    <asp:Label ID="lblMessage" runat="server" CssClass="alert"></asp:Label>
                </asp:Panel>

                <asp:GridView ID="gvStudents" runat="server"
                    AutoGenerateColumns="false"
                    CssClass="grid-table"
                    DataKeyNames="ID"
                    GridLines="None"
                    OnRowCommand="gvStudents_RowCommand"
                    OnRowDataBound="gvStudents_RowDataBound"
                    EmptyDataText="No students found. Click 'Add Student' to create one.">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-Width="60px" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Course" HeaderText="Course" />
                        <asp:BoundField DataField="Age" HeaderText="Age" ItemStyle-Width="60px" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server"
                                    CommandName="EditStudent"
                                    CommandArgument='<%# Eval("ID") %>'
                                    CssClass="btn btn-sm btn-primary">Edit</asp:LinkButton>
                                &nbsp;
                                <asp:LinkButton ID="lnkDelete" runat="server"
                                    CommandName="DeleteStudent"
                                    CommandArgument='<%# Eval("ID") %>'
                                    CssClass="btn btn-sm btn-danger"
                                    OnClientClick='<%# "return confirm(\"Are you sure you want to delete " + Eval("Name") + "?\");" %>'>Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <div class="btn-row">
                    <a href="AddStudent.aspx" class="btn btn-success">+ Add New Student</a>
                    <a href="Default.aspx" class="btn btn-secondary">Back to Home</a>
                </div>
            </div>
        </div>

        <div class="footer">
            Student Management System &copy; 2026 &mdash; ASP.NET Tiny Project
        </div>

    </form>
</body>
</html>
