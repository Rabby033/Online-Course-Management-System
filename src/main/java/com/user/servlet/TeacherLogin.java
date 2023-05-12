package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBconnect;
import com.entity.Teacher;
import com.dao.*;
import com.entity.User;

@WebServlet("/teacherLogin")
public class TeacherLogin extends HttpServlet{
	
	public static String t_name;
	
	//Teacher login form of jsp 
	//request This method for login 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String mail = req.getParameter("teacher_mail");
		String password = req.getParameter("password");
		System.out.println(mail + password);

		HttpSession session = req.getSession();
		
		TeacherDao dao=new TeacherDao(DBconnect.getConn());
		Teacher teacher=dao.login(mail, password);
		
		//checking if teacher is already add in database
		
		if (teacher!=null) {
			System.out.println(teacher.getMail()+teacher.getName());
			t_name= teacher.getName();
			session.setAttribute("userObj",teacher);
			session.setAttribute("loggedIn", true);
			session.setAttribute("user_reg", teacher.getName());
			
			//redirect to teacher dashboard after
			// successful login
			
			resp.sendRedirect("teacher_dashboard.jsp");
			
		} else {
			System.out.println("wrong");
			session.setAttribute("errorMsg", "invalid email & password");
			resp.sendRedirect("teacherlogin.jsp");
		}
	}
   
}

