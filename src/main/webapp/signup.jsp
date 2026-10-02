
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Sign Up</title>

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

    .signup-container {
        background-color: white;
        width: 350px;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    .error-message {
        text-align: center;
        color: red;
        margin-bottom: 15px;
    }

    form input {
        width: 100%;
        padding: 10px;
        margin: 8px 0;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    form input[type="submit"] {
        background-color: #007bff;
        color: white;
        border: none;
        cursor: pointer;
        font-size: 16px;
        margin-top: 15px;
    }

    form input[type="submit"]:hover {
        background-color: #0056b3;
    }

    .login-link {
        text-align: center;
        margin-top: 20px;
        font-size: 16px;
    }

    .login-link a {
        color: #007bff;
        text-decoration: none;
        font-weight: bold;
    }

    .login-link a:hover {
        text-decoration: underline;
    }

</style>

</head>

<body>

<div class="signup-container">

    <h2>Sign Up</h2>

<%
if(request.getAttribute("fail") != null){
%>

    <div class="error-message">
        <%=request.getAttribute("fail") %>
    </div>

<%
}
%>

<form action="signup" method="post">

    <input type="text"
           name="name"
           placeholder="Enter name">

    <input type="tel"
           name="phone"
           placeholder="Enter phone">

    <input type="text"
           name="email"
           placeholder="Enter email">

    <input type="text"
           name="loc"
           placeholder="Enter location">

    <input type="text"
           name="branch"
           placeholder="Enter branch">

    <input type="password"
           name="password"
           placeholder="Enter password">

    <input type="password"
           name="confirm"
           placeholder="Enter confirm password">

    <input type="submit"
           value="Sign Up">

</form>


<p class="login-link">

    Already have an account?
    <a href="login.jsp">Login</a>

</p>

</div>

</body>

</html>

