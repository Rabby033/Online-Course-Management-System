package com.admin.servlet;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
public class retriving_data {
	private Connection conn;

	public retriving_data(Connection conn) {
		this.conn = conn;
	}
	// retriving list of all teacher from the database

	public List<Teacher> getAllTeachers() {
        List<Teacher> teachers = new ArrayList<Teacher>();

        try {
            String sql = "SELECT * FROM teachers";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            //adding teacher's name in the list

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String course = rs.getString("course");
                Teacher teacher = new Teacher(id,name, course);
                teachers.add(teacher);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return teachers;
    }
	
}
