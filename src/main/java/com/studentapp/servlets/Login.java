package com.studentapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.studentapp.dao.studentDao;
import com.studentapp.dao.StudentDaoImp;
import com.studentapp.dto.student;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/Login")

public class Login extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		studentDao st = new StudentDaoImp();
		PrintWriter out = resp.getWriter();
		student s = st.getStudent(req.getParameter("identifier"),req.getParameter("pwd"));	
		HttpSession session=req.getSession(true);
		System.out.println("LOGIN STUDENT = " + s);

		if(s != null) {	    
			RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
			//req.setAttribute("student",s);
			session.setAttribute("student",s);
			req.setAttribute("succes","login succesfully");
			rd.forward(req, resp);
		}else {
			out.print("Login Failed");
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			req.setAttribute("fail","Login Failed....");
			rd.forward(req, resp);
		}
		
	}
	

}