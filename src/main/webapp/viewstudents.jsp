<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.studentapp.dto.student" %>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>Student List</title>

</head>

<body>

<%
    ArrayList<student> list = null;

    if (request.getAttribute("stdlist") != null) {

        list = (ArrayList<student>) request.getAttribute("stdlist");

    }
%>


<!-- SUCCESS MESSAGE -->

<%
    if (request.getAttribute("success") != null) {
%>

    <h2>
        <%= request.getAttribute("success") %>
    </h2>

<%
    }
%>


<!-- FAIL MESSAGE -->

<%
    if (request.getAttribute("fail") != null) {
%>

    <h2>
        <%= request.getAttribute("fail") %>
    </h2>

<%
    }
%>


<table border="1">

    <thead>

        <tr>

            <th>Sid</th>

            <th>Name</th>

            <th>Branch</th>

            <th>Email</th>

            <th>Location</th>

            <th>Action</th>

        </tr>

    </thead>


    <tbody>

    <%
        if (list != null) {

            for (student s : list) {
    %>

        <tr>

            <td>
                <%= s.getSid() %>
            </td>

            <td>
                <%= s.getSname() %>
            </td>

            <td>
                <%= s.getBranch() %>
            </td>

            <td>
                <%= s.getEmail() %>
            </td>

            <td>
                <%= s.getLocation() %>
            </td>

            <td>

                <a href="Delete?Sid=<%= s.getSid() %>">

                    <button type="button">
                        Delete
                    </button>

                </a>

            </td>

        </tr>

    <%
            }
        }
    %>

    </tbody>

</table>

</body>

</html>