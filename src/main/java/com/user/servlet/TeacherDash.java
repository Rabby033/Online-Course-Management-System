package com.user.servlet;
import com.dao.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/teacher_dashboard")
public class TeacherDash {
	public String name= TeacherLogin.t_name;
	
}
