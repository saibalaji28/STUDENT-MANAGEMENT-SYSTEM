# 🎓 Student Management System

An **ASP.NET Web Forms tiny project** that demonstrates complete **CRUD (Create, Read, Update, Delete)** operations on a SQL Server database, built with C#, ADO.NET and a clean, modern UI.

> Built as a college tiny project to demonstrate practical, working knowledge of ASP.NET Web Forms and SQL Server — not just theory.

---

## 📌 Project Description

Student Management System is a simple web application that lets a user **add, view, update and delete student records** stored in a SQL Server database (`StudentDB`). It focuses on being easy to read, easy to explain in a viva, and fully functional out of the box.

---

## ✨ Features

- 🏠 **Dashboard / Home Page** — shows a welcome banner and the total number of students currently in the database.
- ➕ **Add Student** — form with Name, Email, Course and Age, with full client + server-side validation.
- 📋 **View Students** — all students displayed in a clean `GridView` table with Edit and Delete actions.
- ✏️ **Edit Student** — loads the selected student's data into a form, updates the record, and shows a success message.
- 🗑️ **Delete Student** — deletes a record after a JavaScript confirmation prompt, then refreshes the list.
- ✅ **Validation** — empty fields, invalid email format, and invalid age are all blocked before reaching the database.
- 🛡️ **Safe SQL** — every query uses **parameterized ADO.NET commands** (`SqlParameter`), never string concatenation, so the app is protected from SQL Injection.
- ⚠️ **Error Handling** — every database operation is wrapped in `try/catch` with user-friendly messages.
- 🎨 **Clean UI** — responsive navbar, cards, styled table and buttons using a single custom stylesheet (no external UI framework).

---

## 🛠️ Technologies Used

| Layer          | Technology                          |
|----------------|--------------------------------------|
| UI              | ASP.NET Web Forms, HTML5, CSS3      |
| Language        | C#                                    |
| Framework       | .NET Framework 4.8                   |
| Data Access     | ADO.NET (`SqlConnection`, `SqlCommand`, `SqlDataAdapter`) |
| Database        | Microsoft SQL Server                 |
| IDE             | Visual Studio 2019 / 2022            |

---

## 🔄 CRUD Operations

| Operation | Page              | SQL Statement Used                              |
|-----------|-------------------|--------------------------------------------------|
| Create    | `AddStudent.aspx` | `INSERT INTO Students (...) VALUES (...)`        |
| Read      | `Students.aspx`   | `SELECT * FROM Students ORDER BY ID`             |
| Update    | `EditStudent.aspx`| `UPDATE Students SET ... WHERE ID = @ID`         |
| Delete    | `Students.aspx`   | `DELETE FROM Students WHERE ID = @ID`            |

All queries use parameters (`@Name`, `@Email`, `@Course`, `@Age`, `@ID`) — no raw string concatenation of user input anywhere in the project.

---

## 🗄️ Database Setup

1. Open **SQL Server Management Studio (SSMS)** and connect to your local SQL Server instance.
2. Open `StudentManagementSystem/Database/StudentDB.sql`.
3. Execute the script (`F5`). This will:
   - Create the `StudentDB` database (if it doesn't exist)
   - Create the `Students` table
   - Insert 3 sample student records

**Students table structure:**

```sql
CREATE TABLE Students
(
    ID      INT IDENTITY(1,1) PRIMARY KEY,
    Name    VARCHAR(100) NOT NULL,
    Email   VARCHAR(100) NOT NULL,
    Course  VARCHAR(100) NOT NULL,
    Age     INT NOT NULL
);
```

---

## ▶️ How to Run the Project

1. **Clone or download** this repository.
2. Run the database script (see **Database Setup** above).
3. Open `StudentManagementSystem.sln` in **Visual Studio**.
4. Open `StudentManagementSystem/Web.config` and confirm the `connectionString` matches your local SQL Server instance name (default is `.\SQLEXPRESS`).
5. Press **F5** (or click **IIS Express ▶ Run**) to build and launch the app in your browser.
6. The app opens on `Default.aspx` — use the navbar to Add or View students.

> Full step-by-step setup instructions (from creating the project to testing every CRUD operation) are provided in the project documentation (`Documentation.docx`).

---

## 👥 Team Members

| Name        | Enrollment No.   |
|-------------|------------------|
| Taha Bohra  | 2405101010107    |
| Burhanuddin | 2405101010081    |

---

## 📸 Screenshots

> Add screenshots of your running application here after you run the project.

- `screenshots/home.png` — Dashboard / Home Page
- `screenshots/add-student.png` — Add Student form
- `screenshots/view-students.png` — Student list (GridView)
- `screenshots/edit-student.png` — Edit Student form

---

## 🚀 Future Improvements

- Add search and filter functionality on the Students page
- Add pagination and sorting to the GridView for large datasets
- Add login/authentication for admin-only access
- Add student photo upload
- Move to ASP.NET Core MVC / Razor Pages for a modern architecture
- Add export to Excel/PDF for student records

---

## 📄 License

This project was created for academic / educational purposes as a college tiny project.
