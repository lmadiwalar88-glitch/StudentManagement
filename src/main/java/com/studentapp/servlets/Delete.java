package com.studentapp.servlets;

import java.io.IOException;

import com.studentapp.dao.StudentDaoImp;
import com.studentapp.dao.studentDao;
import com.studentapp.dto.student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Delete")
public class Delete extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("Sid"));

        student s1 = new student();
        s1.setSid(id);

        studentDao st = new StudentDaoImp();

        if (st.deleteStudent(s1)) {

            req.setAttribute("success", "DELETED SUCCESSFULLY");

        } else {

            req.setAttribute("fail", "UNABLE TO DELETE STUDENT");

        }

        // Get the updated student list
        studentDao st2 = new StudentDaoImp();

        java.util.ArrayList<student> list = st2.getStudent();

        req.setAttribute("stdlist", list);

        // Directly open JSP
        RequestDispatcher rd = req.getRequestDispatcher("viewstudents.jsp");
        rd.forward(req, resp);
    }
}