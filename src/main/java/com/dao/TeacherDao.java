package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.Teacher;
import com.entity.User;

public class TeacherDao {
	private Connection conn;
	//constructor
	public TeacherDao (Connection conn) {
		super();
		this.conn = conn;
	}
	//validation for teacher login
	public Teacher login(String em, String psw) {
		Teacher u = null;

		try {
			//sql query
			String sql = "select * from teacher_list where mail=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				u=new Teacher();
				u.setMail(rs.getString(1));
				u.setPass(rs.getString(2));
				u.setName(rs.getString(3));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return u;
	}


}
