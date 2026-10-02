package com.studentapp.dao;

import java.util.ArrayList;

import com.studentapp.dto.student;

public interface studentDao {

	public boolean insertStudent(student s);
	public boolean updateStudent(student s);
	public boolean deleteStudent(student s);
	public student getStudent(String email,String password);
	public student getStudent (String email,long phone);
    public ArrayList<student> getStudent();
    public student getStudent(String identifier);
}
