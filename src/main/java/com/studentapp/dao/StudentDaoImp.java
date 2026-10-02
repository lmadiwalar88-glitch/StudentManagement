package com.studentapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.studentapp.dto.student;
import com.studentapp.conn.Connect;
public class StudentDaoImp  implements studentDao{
	
	
	Connection con=null;
	public StudentDaoImp() {
		con=Connect.getConn();
	}

	@Override
	public boolean insertStudent(student s) {
		// TODO Auto-generated method stub
		String query = "INSERT INTO student(sname, phone, email, branch, location, password, date) VALUES(?,?,?,?,?,?,SYSDATE())";
		PreparedStatement ps=null;
		int res=0;
		try {
			ps=con.prepareStatement(query);
			
			ps.setString(1,s.getSname());
			ps.setLong(2,s.getPhone());
			ps.setString(3, s.getEmail());
			ps.setString(4, s.getBranch());
			ps.setString(5, s.getLocation());
			ps.setString(6,s.getPassword());
			
			res=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res>0)
			return true;
		else
			return false;
	}
	

	@Override
	public boolean updateStudent(student s) {

	    String query = "UPDATE STUDENT SET SNAME=?, EMAIL=?, PHONE=?, BRANCH=?, LOCATION=?, PASSWORD=? WHERE SID=?";

	    PreparedStatement ps = null;
	    int res = 0;

	    try {
	        ps = con.prepareStatement(query);

	        ps.setString(1, s.getSname());
	        ps.setString(2, s.getEmail());
	        ps.setLong(3, s.getPhone());
	        ps.setString(4, s.getBranch());
	        ps.setString(5, s.getLocation());
	        ps.setString(6, s.getPassword());
	        ps.setInt(7, s.getSid());

	        res = ps.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return res > 0;
	}
	@Override
	public boolean deleteStudent(student s) {
		String query = "Delete from student where sid=? and sid!=1";
		PreparedStatement ps = null;
		int res = 0;
		try {
			ps = con.prepareStatement(query);
			ps.setInt(1, s.getSid());

			res = ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (res > 0)
			return true;
		else
			return false;
		
		
	}

	@Override
	public student getStudent(String email, String password) {
		// TODO Auto-generated method stub
		String query="SELECT * FROM STUDENT WHERE EMAIL=? AND PASSWORD=?";
		PreparedStatement ps=null;
	    student s=null;
	    
	    try {
			ps=con.prepareStatement(query);
		
	   ps.setString(1, email);
	   ps.setString(2, password);
	   
	   ResultSet rs=ps.executeQuery();
	   
	   if(rs.next()) {
		   s=new student();
		   //int id=rs.getInt("sid");
		  // s.setSid(id);
		   s.setSid(rs.getInt("sid"));
		   s.setSname(rs.getString("sname"));
		   s.setPhone(rs.getLong("phone"));
		   s.setBranch(rs.getString("branch"));
		   s.setLocation(rs.getString("location"));
		   s.setPassword(rs.getString("password"));
		   s.setDate(rs.getString("date"));
		   s.setEmail(rs.getString("email"));
		   
	   }
	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}

	@Override
	public student getStudent(String email, long phone) {

	    String query = "SELECT * FROM STUDENT WHERE EMAIL=? AND PHONE=?";
	    student s = null;

	    try {
	        PreparedStatement ps = con.prepareStatement(query);

	        ps.setString(1, email);
	        ps.setLong(2, phone);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            s = new student();

	            s.setSid(rs.getInt("sid"));
	            s.setSname(rs.getString("sname"));
	            s.setPhone(rs.getLong("phone"));
	            s.setEmail(rs.getString("email"));
	            s.setBranch(rs.getString("branch"));
	            s.setLocation(rs.getString("location"));
	            s.setPassword(rs.getString("password"));
	            s.setDate(rs.getString("date"));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return s;
	}

	@Override
	public ArrayList<student> getStudent() {
	
		    ArrayList<student> list = new ArrayList<student>();

		    String query = "SELECT * FROM STUDENT WHERE SID != 1";

		    try {

		        PreparedStatement ps = con.prepareStatement(query);

		        ResultSet rs = ps.executeQuery();

		        while (rs.next()) {

		            student s = new student();

		            s.setSid(rs.getInt("sid"));
		            s.setSname(rs.getString("sname"));
		            s.setPhone(rs.getLong("phone"));
		            s.setBranch(rs.getString("branch"));
		            s.setLocation(rs.getString("location"));
		            s.setPassword(rs.getString("password"));
		            s.setDate(rs.getString("date"));
		            s.setEmail(rs.getString("email"));

		            list.add(s);
		        }

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return list;
		}
	@Override
	public student getStudent(String identifier) {

	    student s = null;

	    try {

	        PreparedStatement ps;

	        if (identifier.matches("\\d+")) {

	            String query = "SELECT * FROM STUDENT WHERE PHONE=?";

	            ps = con.prepareStatement(query);
	            ps.setLong(1, Long.parseLong(identifier));

	        } else {

	            String query = "SELECT * FROM STUDENT WHERE EMAIL=?";

	            ps = con.prepareStatement(query);
	            ps.setString(1, identifier);
	        }

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {

	            s = new student();

	            s.setSid(rs.getInt("sid"));
	            s.setSname(rs.getString("sname"));
	            s.setPhone(rs.getLong("phone"));
	            s.setEmail(rs.getString("email"));
	            s.setBranch(rs.getString("branch"));
	            s.setLocation(rs.getString("location"));
	            s.setPassword(rs.getString("password"));
	            s.setDate(rs.getString("date"));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return s;
	}
	}