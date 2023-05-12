package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDao {

	private Connection conn;
	//constructor
	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}
	//method for registering new student 
	public boolean register(User u) {
		boolean f = false;

		try {
			//sql query
			String sql = "insert into student_details(fullname,reg_no,pass) values(?,?,?) ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getFullname());
			ps.setString(2, u.getReg());
			ps.setString(3, u.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	// method for student login validation
	public User login(String em, String psw) {
		User u = null;

		try {
			//sql query
			String sql = "select * from student_details where reg_no=? and pass=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				u=new User();
				u.setFullname(rs.getString(1));
				u.setReg(rs.getString(3));
				u.setPassword(rs.getString(4));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return u;
	}

}
