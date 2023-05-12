package com.entity;

public class Teacher {
	private String mail;
	private String pass;
	private String name;
	//constructor for empty parameter
	public Teacher() {
		super();
		// TODO Auto-generated constructor stub
	}
	//constructor with parameter
	public Teacher(String mail, String pass, String name) {
		super();
		this.mail = mail;
		this.pass = pass;
		this.name = name;
	}
	
	//getter and setter
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	

}
