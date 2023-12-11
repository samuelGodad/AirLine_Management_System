package com.sami.airline_management_system_project.model;

public class User {
	private String fullname;
	private String username;
	private String phno;
	private String countryCode;
	private String email_address;
	private String password;

	private String city;
	private String pincode;
	private String state;


	public User() {


	}

	public User(String fullname, String username, String email_address, String password, String countryCode, String city, String pincode, String state,String phno) {
		this.fullname = fullname;
		this.username = username;
		this.email_address = email_address;
		this.password = password;
		this.countryCode = countryCode;
		this.city = city;
		this.pincode = pincode;
		this.state = state;
		this.phno =phno;
	}

	public void setFullName(String fullname) {
		this.fullname = fullname;

	}

	public String getFullName() {
		return fullname;
	}

	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getPhno() {
		return phno;
	}

	public void setUserName(String username) {
		this.username = username;

	}

	public String getUserName() {
		return username;
	}

	public void setEmail_address(String email_address) {
		this.email_address = email_address;
	}

	public String getEmail_address() {
		return email_address;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return this.password;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;

	}

	public String getCountryCode() {
		return countryCode;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCity() {
		return city;
	}

	public void setPincod(String pincode) {
		this.pincode = pincode;
	}

	public String getPincod() {
		return pincode;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getState() {
		return state;
	}
}
