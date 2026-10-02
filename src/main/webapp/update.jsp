<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.studentapp.dto.student" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Update Student</title>

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

.update-container {
    background-color: white;
    width: 350px;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.2);
}

h1 {
    text-align: center;
    margin-bottom: 25px;
}

form input[type="text"] {
    width: 100%;
    padding: 10px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 5px;
}

form input[type="submit"] {
    width: 100%;
    padding: 10px;
    margin-top: 15px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

form input[type="submit"]:hover {
    background-color: #0056b3;
}

.back {
    text-align: center;
    margin-top: 20px;
}

.back a {
    color: #007bff;
    text-decoration: none;
    font-weight: bold;
}

</style>

</head>

<body>

<%
student s = null;

if(session.getAttribute("student") != null) {
    s = (student) session.getAttribute("student");
}
%>

<div class="update-container">

    <h1>Update Details</h1>

    <form action="update" method="post">

        <input type="text"
               name="name"
               value="<%= s != null ? s.getSname() : "" %>"
               placeholder="Enter Name">

        <input type="text"
               name="branch"
               value="<%= s != null ? s.getBranch() : "" %>"
               placeholder="Enter Branch">

        <input type="text"
               name="location"
               value="<%= s != null ? s.getLocation() : "" %>"
               placeholder="Enter Location">

        <input type="submit" value="Update">

    </form>

    <div class="back">
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>

</div>

</body>

</html>