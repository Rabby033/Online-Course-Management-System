package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {

	private static Connection conn;
	//Connection with database
	public static Connection getConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/course_management", "root", "rabby");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}
}
