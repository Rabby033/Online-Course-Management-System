package com.admin.servlet;

public class Teacher {
	private int id;
	private String teacher_name;
	private String course_name;
	//constructor for teacher model
	public Teacher(int id, String teacher_name, String course_name) {
		super();
		this.id = id;
		this.teacher_name = teacher_name;
		this.course_name = course_name;
	}
	//getter and setter
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
    
}
