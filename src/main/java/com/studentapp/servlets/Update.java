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
import jakarta.servlet.http.HttpSession;

@WebServlet("/update")
public class Update extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        studentDao st = new StudentDaoImp();
        HttpSession session = req.getSession(false);
        student s = (student) session.getAttribute("student");

        s.setSname(req.getParameter("name"));
        s.setBranch(req.getParameter("branch"));
        s.setLocation(req.getParameter("location"));

        RequestDispatcher rd = req.getRequestDispatcher("dashboard.jsp");
        if (st.updateStudent(s)) {
            req.setAttribute("success", "update successfully");
        } else {
            req.setAttribute("fail", "update failed");
        }
        rd.forward(req, resp);
    }
}