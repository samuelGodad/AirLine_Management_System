package com.sami.airline_management_system_project.dao;

import com.sami.airline_management_system_project.connection.DataBaseConnector;
import com.sami.airline_management_system_project.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
	// Insert a new user into the user_details table
	public void insertUser(User user) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		try {
			connection = DataBaseConnector.getConnection();
			String sql = "INSERT INTO user_details (fullname, username, password, mobileno,  email_address, state, city, pincode) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			try {
				pstmt = connection.prepareStatement(sql);
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
			pstmt.setString(1, user.getFullName());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4,"+" + user.getCountryCode() + " " + user.getPhno());
			pstmt.setString(5, user.getEmail_address());
			pstmt.setString(6, user.getState());
			pstmt.setString(7, user.getCity());
			pstmt.setString(8, user.getPincod());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Retrieve a user from the user_details table by username
	public User getUserByUsername(String username) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User user = null;
		try {
			connection = DataBaseConnector.getConnection();
			String sql = "SELECT * FROM user_details WHERE username = ?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setFullName(rs.getString("fullname"));
				user.setUserName(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail_address(rs.getString("email_address"));
				user.setState(rs.getString("state"));
				user.setCity(rs.getString("city"));
				user.setPincod(rs.getString("pincode"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	// Update an existing user in the user_details table
	public void updateUser(User user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DataBaseConnector.getConnection();
			String sql = "UPDATE user_details SET fullname = ?, password = ?, mobileno = ?, email_address = ?, state = ?, city = ?, pincode = ? WHERE username = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getFullName());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3,"+" + user.getCountryCode() + " " + user.getPhno());
			pstmt.setString(4, user.getEmail_address());
			pstmt.setString(5, user.getState());
			pstmt.setString(6, user.getCity());
			pstmt.setString(7, user.getPincod());
			pstmt.setString(8, user.getUserName());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// Delete an existing user from the user_details table
	public void deleteUser(String username) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DataBaseConnector.getConnection();
			String sql = "DELETE FROM user_details WHERE username = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public boolean validateUser(String username, String password) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean isValidUser = false;
		try {
			connection = DataBaseConnector.getConnection();
			String sql = "SELECT * FROM user_details WHERE username = ? AND password = ?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				isValidUser = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isValidUser;
	}
}
