package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBconnect;
import com.entity.User;

//student register of jsp file forward this servlet file
@WebServlet("/user_register")
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			// collect information from frontend to add into database

			String fullName = req.getParameter("fullname");
			String registration_no = req.getParameter("reg");
			String password = req.getParameter("password");

			User u = new User(fullName, registration_no, password);

			UserDao dao = new UserDao(DBconnect.getConn());

			HttpSession session = req.getSession();
			boolean f = dao.register(u);

			if (f) {
                //redirect to the loginpage after successfully registered
				
				session.setAttribute("sucMsg", "Register Sucessfully");
				resp.sendRedirect("index.jsp");

			} else {
				System.out.println("something");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

//		super.doPost(req, resp);
	}

}
