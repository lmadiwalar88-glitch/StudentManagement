<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.studentapp.dto.student" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Student Management Dashboard</title>

    <link rel="stylesheet"
          href="dashboard.css">
</head>
<body>
<%
if(request.getAttribute("success")!=null){
%>
<%=request.getAttribute("success") %>
<%
}
%>

<%student s=null;
if(session.getAttribute("student")!=null){
s=(student)session.getAttribute("student");
}%>


<div class="dashboard">

    <!-- Sidebar -->
    <aside class="sidebar">
        <h2 class="logo"> welcome <%=s.getSname() %></h2>

        <ul class="menu">
            <li class="active">
                <a href="dashboard.jsp">Dashboard</a>
            </li>

            <li>
                <a href="addstudent.jsp">Add Student</a>
            </li>

            <li>
            <%if(s.getSid()==1){ %>
               <a href="Viewstudents">View Students</a>
                <%} %>
            

            <li>
                <a href="update.jsp">Update Student</a>
                <a href="profile.jsp">View profile</a>
               <a href="login.jsp" class="logout">Logout</a>
            </li>

            <li>
                <a href="Viewstudents">Delete Student</a>
            </li>

            <li>
                <a href="forgotpassword.jsp">Forgot Password</a>
            </li>
        </ul>

        <div class="logout">
            <a href="login.jsp">Logout</a>
        </div>
    </aside>


    <!-- Main Content -->
    <main class="main-content">

        <!-- Navbar -->
        <nav class="navbar">
            <div>
                <h2>Dashboard</h2>
                <p>Student Management System</p>
            </div>

            <div class="profile">
                <div class="profile-icon">S</div>
                
            </div>
        </nav>


        <!-- Welcome Section -->
        <section class="welcome">
            <h1>Welcome <%=s.getSname() %></h1>
            <p>Manage student records easily from one place.</p>
        </section>


        <!-- Statistics Cards -->
        <section class="stats">

            <div class="stat-card blue">
                <h3>Total Students</h3>
                <h1>250</h1>
                <p>Registered students</p>
            </div>

            <div class="stat-card green">
                <h3>Active Students</h3>
                <h1>220</h1>
                <p>Currently active</p>
            </div>

            <div class="stat-card orange">
                <h3>New Admissions</h3>
                <h1>30</h1>
                <p>Recently admitted</p>
            </div>

        </section>


        <!-- Management Section -->
        <section class="management">
            <h2>Student Management</h2>

            <div class="management-cards">

                <div class="management-card">
                    <h3>Add Student</h3>
                    <p>Register a new student in the system.</p>
                    <a href="addstudent.jsp" class="btn">Add Student</a>
                </div>

                <%if(s.getSid()==1){ %>
<div class="management-card">
    <h3>View Students</h3>
    <p>View student details and records.</p>
   <a href="Viewstudents" class="btn">View Students</a>
</div>
<%} %>

                <div class="management-card">
                    <h3>Update Student</h3>
                    <p>Modify existing student information.</p>
                  <a href="update.jsp" class="btn">Update Student</a>
                </div>

                <div class="management-card">
                    <h3>Delete Student</h3>
                    <p>Remove a student record from the system.</p>
                  <a href="Viewstudents" class="btn">Delete Student</a>
                </div>

            </div>
        </section>


        <!-- Recent Activity -->
        <section class="activity">
            <h2>Quick Overview</h2>

            <div class="activity-box">
                <p>✔ Student records can be managed from the menu.</p>
                <p>✔ Add new students using the Add Student option.</p>
                <p>✔ View or update student details whenever required.</p>
            </div>
        </section>


        <!-- Footer -->
        <footer>
            <p>© 2026 StudentApp | Student Management System</p>
        </footer>

    </main>

</div>
</body>
</html>