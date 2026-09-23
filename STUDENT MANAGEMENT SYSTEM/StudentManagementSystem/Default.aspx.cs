using System;
using System.Data.SqlClient;

namespace StudentManagementSystem
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTotalStudents();
            }
        }

        /// <summary>
        /// Fetches the total number of students from the database
        /// and displays it on the dashboard.
        /// </summary>
        private void LoadTotalStudents()
        {
            try
            {
                using (SqlConnection con = DBHelper.GetConnection())
                {
                    string query = "SELECT COUNT(*) FROM Students";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        int count = (int)cmd.ExecuteScalar();
                        lblTotalStudents.Text = count.ToString();
                    }
                }
            }
            catch (Exception)
            {
                // If something goes wrong (e.g. DB not reachable), fail gracefully.
                lblTotalStudents.Text = "0";
            }
        }
    }
}
