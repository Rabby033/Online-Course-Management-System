package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpSession; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/enrollCourse")
public class enroll_course extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String reg = (String) session.getAttribute("user_reg");
		String course_name = req.getParameter("course_name");
		try {
			// Load the MySQL driver
			Class.forName("com.mysql.jdbc.Driver");

			// Connect to the database
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/course_management", "root", "rabby");

			// Prepare the SQL statement
			String sql = "INSERT INTO register_course (reg, course) VALUES (?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,reg);
			ps.setString(2,course_name);

			ps.executeUpdate();

			// Close the database connection
			ps.close();
			con.close();

			resp.sendRedirect("student_dashboard.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
   
}
