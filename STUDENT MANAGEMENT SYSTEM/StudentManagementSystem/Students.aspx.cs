using System;
using System.Data;
using System.Data.SqlClient;

namespace StudentManagementSystem
{
    public partial class Students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // If we were redirected here after an Update, show a success message.
                if (Request.QueryString["updated"] == "1")
                {
                    ShowMessage("Student updated successfully.", true);
                }

                BindStudents();
            }
        }

        /// <summary>
        /// READ operation - loads all students from the database into the GridView.
        /// </summary>
        private void BindStudents()
        {
            try
            {
                using (SqlConnection con = DBHelper.GetConnection())
                {
                    string query = "SELECT ID, Name, Email, Course, Age FROM Students ORDER BY ID";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        gvStudents.DataSource = dt;
                        gvStudents.DataBind();
                    }
                }
            }
            catch (Exception)
            {
                ShowMessage("Something went wrong. Please try again.", false);
            }
        }

        /// <summary>
        /// Handles Edit and Delete button clicks raised from within the GridView.
        /// </summary>
        protected void gvStudents_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int studentId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditStudent")
            {
                Response.Redirect("EditStudent.aspx?id=" + studentId);
            }
            else if (e.CommandName == "DeleteStudent")
            {
                DeleteStudent(studentId);
            }
        }

        /// <summary>
        /// DELETE operation - removes the selected student from SQL Server,
        /// then refreshes the grid.
        /// </summary>
        private void DeleteStudent(int id)
        {
            try
            {
                using (SqlConnection con = DBHelper.GetConnection())
                {
                    string query = "DELETE FROM Students WHERE ID = @ID";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@ID", id);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                ShowMessage("Student deleted successfully.", true);
            }
            catch (Exception)
            {
                ShowMessage("Something went wrong. Please try again.", false);
            }

            // Refresh the list either way so the grid reflects the current DB state.
            BindStudents();
        }

        /// <summary>
        /// Optional polish: right-align the ID and Age columns for readability.
        /// </summary>
        protected void gvStudents_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            // Left intentionally simple - no extra logic needed for this tiny project.
        }

        private void ShowMessage(string message, bool isSuccess)
        {
            pnlMessage.Visible = true;
            lblMessage.Text = message;
            lblMessage.CssClass = isSuccess ? "alert alert-success" : "alert alert-danger";
        }
    }
}
