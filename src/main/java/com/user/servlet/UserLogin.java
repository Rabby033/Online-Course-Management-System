package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBconnect;
import com.dao.UserDao;
import com.entity.User;



//user login form of jsp file request
//this page for login validation

@WebServlet("/userLogin")
public class UserLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String reg = req.getParameter("registration_no");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();
		
		UserDao dao=new UserDao(DBconnect.getConn());
		User user=dao.login(reg, password);
		
		if (user!=null) {
			session.setAttribute("userObj",user);
			session.setAttribute("loggedIn", true);
			session.setAttribute("user_reg", reg);
			
			//redirecting to student dashboard page after successfull login
			
			resp.sendRedirect("student_dashboard.jsp");
		} else {
			session.setAttribute("errorMsg", "invalid email & password");
			
			//redirecting to the same page for invalid id password
			resp.sendRedirect("index.jsp");
		}
	}
   
}
