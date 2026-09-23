using System;

namespace StudentManagementSystem
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            // Runs once when the application first starts.
        }

        protected void Application_End(object sender, EventArgs e)
        {
            // Runs when the application shuts down.
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            // Runs whenever an unhandled error occurs anywhere in the app.
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            // Runs when a new user session begins.
        }

        protected void Session_End(object sender, EventArgs e)
        {
            // Runs when a session ends.
        }
    }
}
