
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Forgot Password</title>

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

    .forgot-container {
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
    form input[type="email"],
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

    .back-login {
        text-align: center;
        margin-top: 20px;
    }

    .back-login a {
        color: #007bff;
        text-decoration: none;
        font-weight: bold;
    }

    .back-login a:hover {
        text-decoration: underline;
    }

</style>

</head>

<body>

<div class="forgot-container">

    <h1>Forgot Password?</h1>

    <p class="subtitle">
        Enter your details to reset your password
    </p>


<%
if(request.getAttribute("success") != null){
%>

    <div class="success-message">
        <%=request.getAttribute("success")%>
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


<form action="forgotpassword" method="post">

    <input type="text"
           name="identifier"
           placeholder="Enter your Email or Phone Number"
           required>

    <input type="password"
           name="password"
           placeholder="Enter new password"
           required>

    <input type="password"
           name="confirm"
           placeholder="Confirm new password"
           required>

    <input type="submit"
           value="Reset Password">

</form>


<div class="back-login">

    <a href="login.jsp">
        Back to Login
    </a>

</div>

</div>

</body>

</html>
