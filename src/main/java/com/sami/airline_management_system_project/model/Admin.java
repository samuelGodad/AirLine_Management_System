package com.sami.airline_management_system_project.model;

public class Admin {
	private String adminName;
	private String password;
	public Admin() {
	}

	public Admin(String adminName, String password) {
		this.adminName = adminName;
		this.password = password;
	}

	public String getAdminName() {
		return adminName;
	}

	public String getPassword() {
		return password;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
