# Setup Guide — Student Management System

This guide walks you through everything from creating the project in Visual Studio to testing all four CRUD operations, plus a troubleshooting section for common errors.

---

## Part 1 — Prerequisites

Install these before you start:

1. **Visual Studio 2019 or 2022** (Community Edition is free) with the **"ASP.NET and web development"** workload checked during install.
2. **SQL Server** — either full SQL Server or **SQL Server Express** (free).
3. **SQL Server Management Studio (SSMS)** — used to run the database script.

---

## Part 2 — Get the Project into Visual Studio

You have two options:

### Option A — Use the provided project as-is (recommended)
1. Download/unzip the project folder so you have:
   ```
   StudentManagementSystem.sln
   StudentManagementSystem/   (contains all .aspx, .cs, Web.config, etc.)
   ```
2. Double-click `StudentManagementSystem.sln`. Visual Studio will open with the full project already wired up (all pages, code-behind files, Web.config, and the stylesheet).

### Option B — Recreate it from scratch in Visual Studio (if your instructor wants you to build it manually)
1. Open Visual Studio → **Create a new project**.
2. Search for **"ASP.NET Web Application (.NET Framework)"** → select it → Next.
3. Name it `StudentManagementSystem` → choose a location → Create.
4. On the next screen, choose the **Empty** template, and check **Web Forms** → Create.
5. Right-click the project in Solution Explorer → **Add → New Folder** → create `Content`, `Database`, and `App_Code` folders.
6. Add each `.aspx` page: right-click project → **Add → New Item → Web Form**, name it exactly as in this project (`Default.aspx`, `AddStudent.aspx`, `Students.aspx`, `EditStudent.aspx`).
7. Copy-paste the markup and code-behind content from this project's files into the matching new files.
8. Add `Content/style.css` (right-click `Content` folder → Add → New Item → Style Sheet).
9. Add `App_Code/DBHelper.cs` (right-click project → Add → New Item → Class, or Add → Add ASP.NET Folder → App_Code first, then add the class inside it).

**Option A is strongly recommended** — it's faster and avoids typos.

---

## Part 3 — Set Up the Database

1. Open **SQL Server Management Studio (SSMS)**.
2. Connect to your local server (usually `.\SQLEXPRESS` or `localhost`).
3. Open the file: `StudentManagementSystem/Database/StudentDB.sql`.
4. Click **Execute** (or press `F5`).
5. In the **Object Explorer**, refresh **Databases** — you should now see `StudentDB` → `Tables` → `dbo.Students`.
6. Right-click the `Students` table → **Select Top 1000 Rows** to confirm the 3 sample records were inserted.

---

## Part 4 — Connect the Project to SQL Server

1. In Visual Studio, open `Web.config`.
2. Find the `<connectionStrings>` section:
   ```xml
   <add name="StudentDBConnection"
        connectionString="Data Source=.\SQLEXPRESS;Initial Catalog=StudentDB;Integrated Security=True;TrustServerCertificate=True"
        providerName="System.Data.SqlClient" />
   ```
3. Update `Data Source` to match **your** SQL Server instance name:
   - Default local instance → `Data Source=.`
   - SQL Server Express → `Data Source=.\SQLEXPRESS`
   - Named instance → `Data Source=YOUR_PC_NAME\INSTANCE_NAME`
   - (To find your instance name, open SSMS — the name shown at login is what you need.)
4. Save `Web.config`.

---

## Part 5 — Run the Project

1. In Visual Studio, press **F5** (or click the green ▶ "IIS Express" button in the toolbar).
2. Visual Studio will build the project and launch it in your default browser using **IIS Express**.
3. The browser should open directly to `Default.aspx`, showing the Student Management System dashboard with the current total student count.

---

## Part 6 — Test Every CRUD Operation

### ✅ Test Create (Insert)
1. Click **Add Student** in the navbar.
2. Fill in Name, Email, Course and Age → click **Add Student**.
3. You should see a green "Student added successfully." message.
4. Click **View Students** — confirm the new record appears in the table.

### ✅ Test Read (View)
1. Click **View Students** in the navbar.
2. Confirm all records (including the 3 sample rows from the SQL script) are listed with ID, Name, Email, Course, Age.
3. Go back to **Home** — confirm the "Total Students" number matches the row count.

### ✅ Test Update (Edit)
1. On the **View Students** page, click **Edit** next to any student.
2. The Edit Student form should load with that student's current data.
3. Change a field (e.g. Course) → click **Save Changes**.
4. You should be redirected to the Students list with a green "Student updated successfully." message, and the row should reflect the new value.

### ✅ Test Delete
1. On the **View Students** page, click **Delete** next to any student.
2. A browser confirmation popup should appear ("Are you sure you want to delete …?").
3. Click **OK**.
4. You should see a green "Student deleted successfully." message, and the row should be gone from the table.
5. Confirm the "Total Students" count on the Home page has decreased by one.

### ✅ Test Validation
1. Go to **Add Student** and click **Add Student** without filling anything in — you should see inline red error messages and no record should be added.
2. Try an invalid email like `test123` (no `@` or domain) — you should see "Please enter a valid email address."
3. Try an age like `0`, `-5`, or `200` — you should see the age range error.

---

## Common Errors & Solutions

| Error | Likely Cause | Solution |
|---|---|---|
| **"Cannot open database 'StudentDB' requested by the login"** | The database script wasn't run, or the connection string points to the wrong server. | Re-run `StudentDB.sql` in SSMS. Double-check the `Data Source` value in `Web.config` matches your SQL Server instance name. |
| **"A network-related or instance-specific error occurred while establishing a connection to SQL Server"** | SQL Server service isn't running, or the instance name is wrong. | Open **SQL Server Configuration Manager** and make sure the SQL Server service is running. Verify the instance name in `Web.config`. |
| **"Login failed for user..."** | `Integrated Security=True` requires Windows Authentication, but SQL Server is set to SQL-only authentication. | In SSMS, right-click the server → Properties → Security → enable "SQL Server and Windows Authentication mode", OR keep Windows Authentication mode (default is fine for most local setups). |
| **Blank/broken page styling (no colors, no navbar look)** | `Content/style.css` isn't linked correctly, or the `Content` folder wasn't copied. | Confirm `Content/style.css` exists in the project and that each `.aspx` page has `<link rel="stylesheet" href="Content/style.css" />` in the `<head>`. |
| **"The type or namespace name 'DBHelper' could not be found"** | `DBHelper.cs` isn't in the `App_Code` folder, or the folder isn't recognized as a special ASP.NET folder. | Make sure the folder is literally named `App_Code` (Visual Studio treats this name specially) and `DBHelper.cs` is directly inside it. |
| **GridView shows no Edit/Delete buttons or doesn't respond to clicks** | `OnRowCommand` isn't wired up, or `CommandName`/`CommandArgument` are missing on the LinkButtons. | Confirm `OnRowCommand="gvStudents_RowCommand"` is present on the `<asp:GridView>` tag and each `LinkButton` has both `CommandName` and `CommandArgument` set. |
| **Age validator lets in text like "abc"** | The `RangeValidator`'s `Type` isn't set to `Integer`. | Confirm `Type="Integer"` is present on `rvAge` in both `AddStudent.aspx` and `EditStudent.aspx`. |
| **Changes made to a student don't save** | The hidden field storing the student ID (`hdnStudentId`) wasn't populated, usually because the page reloaded on postback and re-ran `Page_Load` logic. | Confirm all loading logic in `Page_Load` is wrapped inside `if (!IsPostBack) { ... }`, exactly as written in `EditStudent.aspx.cs`. |
| **"Could not load type 'StudentManagementSystem.Default'"** | The `Inherits` attribute in the `.aspx` file doesn't match the namespace/class name in the code-behind. | Confirm every `.aspx` page's `Inherits="StudentManagementSystem.XXX"` matches the `namespace StudentManagementSystem { public partial class XXX ... }` in its `.cs` file. |
| **Port already in use / IIS Express won't start** | Another instance of IIS Express (or another app) is using the same port. | Close other running Visual Studio debug sessions, or change the port in the project's **Properties → Web** tab. |

---

## Quick Reference — Where Everything Lives

| File | Purpose |
|---|---|
| `Default.aspx` / `.cs` | Dashboard/home page — shows total student count |
| `AddStudent.aspx` / `.cs` | Create (Insert) a new student |
| `Students.aspx` / `.cs` | Read (list) + Delete students, GridView |
| `EditStudent.aspx` / `.cs` | Update an existing student |
| `App_Code/DBHelper.cs` | Returns a ready-to-use `SqlConnection` from `Web.config` |
| `Content/style.css` | All visual styling for the app |
| `Database/StudentDB.sql` | Creates the database, table, and sample data |
| `Web.config` | Connection string and framework settings |
| `Global.asax` / `.cs` | Application-level startup events (not heavily used here) |
