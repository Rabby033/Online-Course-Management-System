package com.entity;

public class retrive_course_model {
    private int id;
    private String reg;
    private String course_name;
    //contructor
	public retrive_course_model(int id, String reg, String course_name) {
		super();
		this.id = id;
		this.reg = reg;
		this.course_name = course_name;
	}
	
	public retrive_course_model() {
		super();
		// TODO Auto-generated constructor stub
	}
	//getter and setter
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getReg() {
		return reg;
	}
	public void setReg(String reg) {
		this.reg = reg;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
    
	
    
}
