using System;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// DBHelper.cs
/// Small helper class that returns a ready-to-use SqlConnection.
/// Keeping this logic in one place means we only need to change the
/// connection string in one location (Web.config) for the whole project.
/// </summary>
public class DBHelper
{
    // Reads the connection string named "StudentDBConnection" from Web.config
    public static SqlConnection GetConnection()
    {
        string connStr = ConfigurationManager.ConnectionStrings["StudentDBConnection"].ConnectionString;
        return new SqlConnection(connStr);
    }
}
