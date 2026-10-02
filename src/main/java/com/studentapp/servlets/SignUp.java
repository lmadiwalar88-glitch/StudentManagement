package com.studentapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.studentapp.dao.studentDao;
import com.studentapp.dao.StudentDaoImp;
import com.studentapp.dto.student;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.GenericServlet;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/signup")
public class SignUp extends GenericServlet {

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
    	studentDao st=new StudentDaoImp();
    	student s=new student();
    	
    	PrintWriter out=res.getWriter();
    	
    	s.setSname(req.getParameter("name"));
    	s.setPhone(Long.parseLong(req.getParameter("phone")));
    	s.setEmail(req.getParameter("email"));
    	s.setLocation(req.getParameter("loc"));
    	s.setBranch(req.getParameter("branch"));
    	
    	String password=req.getParameter("password");
    	String confirm=req.getParameter("confirm");
    	
    	if(password.equals(confirm)) {
    		s.setPassword(password);
    		if(st.insertStudent(s)) {
    			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
    			req.setAttribute("success","Sign Up Successfully...");
    			rd.forward(req, res);
    		}
    		else {
//        		out.print("Sign up failed....");
    			RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
    			req.setAttribute("fail", "Sign up failed");
    			rd.forward(req, res);
        	}
    	}
    	else {
    		out.print("Password Mismatch...");
    	}
    	
            	
    	
    	
    	

    }
}