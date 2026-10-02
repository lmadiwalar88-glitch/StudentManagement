
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Login</title>

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

    .login-container {
        background-color: white;
        width: 350px;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
    }

    h1 {
        text-align: center;
        margin-bottom: 10px;
    }

    .subtitle {
        text-align: center;
        color: #666;
        margin-bottom: 25px;
    }

    .success-message {
        text-align: center;
        color: green;
        margin-bottom: 15px;
    }

    .error-message {
        text-align: center;
        color: red;
        margin-bottom: 15px;
    }

    form input[type="text"],
    form input[type="password"] {
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

    .forgot-password {
        text-align: right;
        margin-top: 12px;
    }

    .forgot-password a {
        color: #007bff;
        text-decoration: none;
    }

    .forgot-password a:hover {
        text-decoration: underline;
    }

    .signup-link {
        text-align: center;
        margin-top: 20px;
    }

    .signup-link a {
        color: #007bff;
        text-decoration: none;
        font-weight: bold;
    }

    .signup-link a:hover {
        text-decoration: underline;
    }

</style>

</head>

<body>

<div class="login-container">

    <h1>Welcome Back</h1>

    <p class="subtitle">
        Login to your account
    </p>


<%
if(request.getAttribute("succes") != null){
%>

    <div class="success-message">
        <%=request.getAttribute("succes")%>
    </div>

<%
}
%>


<%
if(request.getAttribute("fail") != null){
%>

    <div class="error-message">
        <%=request.getAttribute("fail")%>
    </div>

<%
}
%>


<form action="Login" method="post">

    <input type="text"
           name="identifier"
           placeholder="Enter your Email or Phone Number"
           required>

    <input type="password"
           name="pwd"
           placeholder="Enter your password"
           required>

    <input type="submit"
           value="Login">

</form>


<div class="forgot-password">

    <a href="forgotpassword.jsp">
        Forgot password?
    </a>

</div>


<div class="signup-link">

    Don't have an account?
    <a href="signup.jsp">
        Sign Up
    </a>

</div>

</div>

</body>

</html>

