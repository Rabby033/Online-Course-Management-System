package com.dao;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;
import com.admin.servlet.*;
import com.entity.User;
import com.entity.retrive_course_model;

public class Courselist_dao {
	private Connection conn;
     
	public Courselist_dao(Connection conn) {
		super();
		this.conn = conn;
	}
	// Retrieving list of all course from database
	public List<String> Course_list() {
		
		List<String> list = new ArrayList<String>();
		String s=null;
		try {
			// sql query for selecting course name
			String sql="SELECT course_name FROM assign_course ";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {		
				s=rs.getString(1);
				list.add(s);
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	}
}
