package com.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//admin requests this method when assining courses to any teacher
@WebServlet("/assign")
//
public class Assign_course extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String reg_no;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String teacher_name = request.getParameter("teacher_name");
		String course_name = request.getParameter("coursename");
		HttpSession sessions = request.getSession(false);
		reg_no = (String) sessions.getAttribute("user_reg");

		try {
			// Load the MySQL driver
			Class.forName("com.mysql.jdbc.Driver");

			// Connect to the database
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/course_management", "root",
					"rabby");

			// Prepare the SQL statement
			String sql = "INSERT INTO assign_course (teacher_name, course_name) VALUES (?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, teacher_name);
			ps.setString(2, course_name);

			ps.executeUpdate();

			// Close the database connection
			ps.close();
			con.close();

			response.sendRedirect("admin_index.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
