using System;
using System.Data;
using System.Data.SqlClient;

namespace StudentManagementSystem
{
    public partial class EditStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Expecting a query string like EditStudent.aspx?id=3
                if (string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    Response.Redirect("Students.aspx");
                    return;
                }

                int studentId;
                if (!int.TryParse(Request.QueryString["id"], out studentId))
                {
                    Response.Redirect("Students.aspx");
                    return;
                }

                hdnStudentId.Value = studentId.ToString();
                LoadStudent(studentId);
            }
        }

        /// <summary>
        /// READ (single record) - loads the selected student's data into the form
        /// so the user can modify it.
        /// </summary>
        private void LoadStudent(int id)
        {
            try
            {
                using (SqlConnection con = DBHelper.GetConnection())
                {
                    string query = "SELECT Name, Email, Course, Age FROM Students WHERE ID = @ID";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@ID", id);
                        con.Open();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                txtName.Text = reader["Name"].ToString();
                                txtEmail.Text = reader["Email"].ToString();
                                txtCourse.Text = reader["Course"].ToString();
                                txtAge.Text = reader["Age"].ToString();
                            }
                            else
                            {
                                // No student found with that ID.
                                Response.Redirect("Students.aspx");
                            }
                        }
                    }
                }
            }
            catch (Exception)
            {
                ShowMessage("Something went wrong. Please try again.", false);
            }
        }

        /// <summary>
        /// UPDATE operation - saves the modified student data back to SQL Server.
        /// </summary>
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            int studentId = Convert.ToInt32(hdnStudentId.Value);
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string course = txtCourse.Text.Trim();
            int age = Convert.ToInt32(txtAge.Text.Trim());

            try
            {
                using (SqlConnection con = DBHelper.GetConnection())
                {
                    string query = "UPDATE Students " +
                                   "SET Name = @Name, Email = @Email, Course = @Course, Age = @Age " +
                                   "WHERE ID = @ID";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Course", course);
                        cmd.Parameters.AddWithValue("@Age", age);
                        cmd.Parameters.AddWithValue("@ID", studentId);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                // Redirect back to the list page with a flag so it can show
                // a "Student updated successfully." message.
                Response.Redirect("Students.aspx?updated=1");
            }
            catch (Exception)
            {
                ShowMessage("Something went wrong. Please try again.", false);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Students.aspx");
        }

        private void ShowMessage(string message, bool isSuccess)
        {
            pnlMessage.Visible = true;
            lblMessage.Text = message;
            lblMessage.CssClass = isSuccess ? "alert alert-success" : "alert alert-danger";
        }
    }
}
