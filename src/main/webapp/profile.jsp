<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.studentapp.dto.student" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Profile</title>

<style>

body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    margin: 0;
}

.profile-container {
    background-color: white;
    width: 500px;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.2);
}

h1 {
    text-align: center;
    margin-bottom: 25px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: left;
}

th {
    background-color: #007bff;
    color: white;
}

.back {
    text-align: center;
    margin-top: 25px;
}

.back a {
    display: inline-block;
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}

.back a:hover {
    background-color: #0056b3;
}

</style>

</head>

<body>

<%
student s = (student) session.getAttribute("student");
%>

<div class="profile-container">

    <h1>My Profile</h1>

    <table>

        <tr>
            <th>Sid</th>
            <td><%=s.getSid() %></td>
        </tr>

        <tr>
            <th>Name</th>
            <td><%=s.getSname() %></td>
        </tr>

        <tr>
            <th>Phone</th>
            <td><%=s.getPhone() %></td>
        </tr>

        <tr>
            <th>Email</th>
            <td><%=s.getEmail() %></td>
        </tr>

        <tr>
            <th>Location</th>
            <td><%=s.getLocation() %></td>
        </tr>

        <tr>
            <th>Branch</th>
            <td><%=s.getBranch() %></td>
        </tr>

    </table>

    <div class="back">
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>

</div>

</body>

</html>