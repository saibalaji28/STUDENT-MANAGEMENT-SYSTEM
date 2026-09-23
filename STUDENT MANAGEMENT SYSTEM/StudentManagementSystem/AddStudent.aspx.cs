using System;
using System.Data.SqlClient;

namespace StudentManagementSystem
{
    public partial class AddStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Nothing needed on initial load.
        }

        /// <summary>
        /// Handles the "Add Student" button click.
        /// Validates input (ASP.NET validators already ran client + server side),
        /// then inserts the new student using a parameterized query.
        /// </summary>
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            // Page.IsValid confirms all validators on the ValidationGroup passed.
            if (!Page.IsValid)
            {
                return;
            }

            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string course = txtCourse.Text.Trim();
            int age = Convert.ToInt32(txtAge.Text.Trim());

            try
            {
                using (SqlConnection con = DBHelper.GetConnection())
                {
                    string query = "INSERT INTO Students (Name, Email, Course, Age) " +
                                   "VALUES (@Name, @Email, @Course, @Age)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Parameterized query - protects against SQL Injection
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Course", course);
                        cmd.Parameters.AddWithValue("@Age", age);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                ShowMessage("Student added successfully.", true);
                ClearForm();
            }
            catch (Exception)
            {
                ShowMessage("Something went wrong. Please try again.", false);
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
            pnlMessage.Visible = false;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        private void ClearForm()
        {
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtCourse.Text = string.Empty;
            txtAge.Text = string.Empty;
        }

        /// <summary>
        /// Shows a success (green) or error (red) message banner at the top of the form.
        /// </summary>
        private void ShowMessage(string message, bool isSuccess)
        {
            pnlMessage.Visible = true;
            lblMessage.Text = message;
            lblMessage.CssClass = isSuccess ? "alert alert-success" : "alert alert-danger";
        }
    }
}
