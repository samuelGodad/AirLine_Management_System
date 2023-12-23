package com.sami.airline_management_system_project.dao;

import com.sami.airline_management_system_project.db.DataBaseConnector;
import com.sami.airline_management_system_project.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
	private Connection connection;
	private  PreparedStatement statement;
	private ResultSet resultSet;
	// Insert a new user into the user_details table
	public void insertUser(User user) {


		try {
			connection = DataBaseConnector.getConnection();
			String sql = "INSERT INTO user_details (fullname, username, password, mobileno,  email_address, state, city, pincode) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			try {
				statement = connection.prepareStatement(sql);
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
			statement.setString(1, user.getFullName());
			statement.setString(2, user.getUserName());
			statement.setString(3, user.getPassword());
			statement.setString(4,"+" + user.getCountryCode() + " " + user.getPhno());
			statement.setString(5, user.getEmail_address());
			statement.setString(6, user.getState());
			statement.setString(7, user.getCity());
			statement.setString(8, user.getPincod());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Retrieve a user from the user_details table by username
	public User getUserByUsername(String username) {
		User user = null;
		try {
			connection = DataBaseConnector.getConnection();
			String sql = "SELECT * FROM user_details WHERE username = ?";
			assert connection != null;
			statement = connection.prepareStatement(sql);
			statement.setString(1, username);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				user = new User();
				user.setFullName(resultSet.getString("fullname"));
				user.setUserName(resultSet.getString("username"));
				user.setPassword(resultSet.getString("password"));
				user.setEmail_address(resultSet.getString("email_address"));
				user.setState(resultSet.getString("state"));
				user.setCity(resultSet.getString("city"));
				user.setPincod(resultSet.getString("pincode"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	// Update an existing user in the user_details table
	public void updateUser(User user) {

		try {
			connection = DataBaseConnector.getConnection();
			String sql = "UPDATE user_details SET fullname = ?, password = ?, mobileno = ?, email_address = ?, state = ?, city = ?, pincode = ? WHERE username = ?";
			statement = connection.prepareStatement(sql);
			statement.setString(1, user.getFullName());
			statement.setString(2, user.getPassword());
			statement.setString(3,"+" + user.getCountryCode() + " " + user.getPhno());
			statement.setString(4, user.getEmail_address());
			statement.setString(5, user.getState());
			statement.setString(6, user.getCity());
			statement.setString(7, user.getPincod());
			statement.setString(8, user.getUserName());
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// Delete an existing user from the user_details table
	public void deleteUser(String username) {
		try {
			connection = DataBaseConnector.getConnection();
			String sql = "DELETE FROM user_details WHERE username = ?";
			statement = connection.prepareStatement(sql);
			statement.setString(1, username);
			statement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public boolean validateUser(String username, String password) {
		boolean isValidUser = false;
		try {
			connection = DataBaseConnector.getConnection();
			String sql = "SELECT * FROM user_details WHERE username = ? AND password = ?";
			statement = connection.prepareStatement(sql);
			statement.setString(1, username);
			statement.setString(2, password);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				isValidUser = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isValidUser;
	}
	public boolean isUsernameExists(String username) {
		boolean usernameExists = false;
		String query = "SELECT COUNT(*) FROM user_details WHERE username = ?";
		try {
			connection = DataBaseConnector.getConnection();
			statement = connection.prepareStatement(query);
			statement.setString(1, username);
			resultSet = statement.executeQuery();
			if (resultSet.next()) {
				usernameExists = resultSet.getInt(1) > 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return usernameExists;
	}
	// Close resources when necessary
	public void closeResources() {
		try {
			if (resultSet != null) {
				resultSet.close();
			}
			if (statement != null) {
				statement.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// Close the connection when necessary
	public void closeConnection() {
		try {
			if (connection != null && !connection.isClosed()) {
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
