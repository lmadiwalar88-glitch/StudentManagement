package com.studentapp.servlets;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import java.util.ArrayList;

import com.studentapp.dao.StudentDaoImp;
import com.studentapp.dao.studentDao;
import com.studentapp.dto.student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/Viewstudents")

public class Viewstudents extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	studentDao st=new StudentDaoImp();
	ArrayList<student>list=st.getStudent();
	
	if(list!=null) {
		RequestDispatcher rd = req.getRequestDispatcher("viewstudents.jsp");
				req.setAttribute("stdlist",list);
		rd.forward(req, resp);
	}
		
	}

}
