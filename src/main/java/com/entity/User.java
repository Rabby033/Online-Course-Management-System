package com.entity;

public class User {

	private String fullname;
	private String reg;
	private String password;
	
	//constructor 
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	//constructor with parameter
	public User(String fullname, String reg, String password) {
		super();
		this.fullname = fullname;
		this.reg = reg;
		this.password = password;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getReg() {
		return reg;
	}
	public void setReg(String reg) {
		this.reg = reg;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	
}
