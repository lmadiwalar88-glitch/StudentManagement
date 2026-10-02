package com.studentapp.servlets;

import java.io.IOException;

import com.studentapp.dao.studentDao;
import com.studentapp.dao.StudentDaoImp;
import com.studentapp.dto.student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forgotpassword")
public class Forgot extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        studentDao st = new StudentDaoImp();

        String identifier = req.getParameter("identifier");
        String password = req.getParameter("password");
        String confirm = req.getParameter("confirm");

        student s = st.getStudent(identifier);

        if (s != null) {

            if (password.equals(confirm)) {

                if (s.getPassword().equals(confirm)) {

                    resp.getWriter().print("This password is already used");

                } else {

                    s.setPassword(confirm);

                    if (st.updateStudent(s)) {
                        resp.getWriter().print("Password updated successfully");
                    } else {
                        resp.getWriter().print("Something went wrong");
                    }
                }

            } else {

                resp.getWriter().print("Password mismatch");
            }

        } else {

            resp.getWriter().print("No data found");
        }
    }
}