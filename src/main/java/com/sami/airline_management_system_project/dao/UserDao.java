package com.sami.airline_management_system_project.dao;

import com.sami.airline_management_system_project.db.DataBaseConnector;
import com.sami.airline_management_system_project.helper.StringHelper;
import com.sami.airline_management_system_project.model.User;

import java.io.IOException;
import java.io.InputStream;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UserDao {
    private Connection connection;
    private PreparedStatement statement;
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
	    statement.setString(4, "+" + user.getCountryCode() + " " + user.getPhno());
	    statement.setString(5, user.getEmail_address());
	    statement.setString(6, user.getState());
	    statement.setString(7, user.getCity());
	    statement.setString(8, user.getPincod());
	    statement.executeUpdate();
	} catch (SQLException e) {
		System.out.println("couldn't create user");
	    e.printStackTrace();
	}
    }

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
		user.setUserName(resultSet.getString("username"));
		user.setFullName(resultSet.getString("fullname"));
		user.setEmail_address(resultSet.getString("email_address"));
		user.setPhno(resultSet.getString("mobileno"));
		user.setCity(resultSet.getString("city"));

		user.setPincod(resultSet.getString("pincode"));

		user.setPassword(resultSet.getString("password"));
		user.setState(resultSet.getString("state"));
		user.setAvatar(StringHelper.convertBase64(resultSet.getBytes("avatar")));

//				user.setCountryCode(resultSet.getString("mobileno").substring(1, 3));
	    }
	} catch (SQLException e) {
	    e.printStackTrace();
	}
	return user;
    }

    private static User extractUser(ResultSet rs) throws SQLException {
	User user = null;
	if (rs.next()) {
	    String avatar = StringHelper.convertBase64(rs.getBytes("avatar"));
	    user = new User(
		    rs.getString("fullname"),
		    rs.getString("username"),
		    rs.getString("email_address"),
		    rs.getString("password"),
		    rs.getString("mobileno"), // This should be the countryCode
		    rs.getString("city"),
		    rs.getString("pincode"),
		    rs.getString("state"),
		    avatar);
	    user.setPhno(rs.getString("mobileno"));

	}
	return user;
    }

	// Update this method to include an option to fetch only the avatar
	public static User getUser(String username, boolean fetchAvatar) throws SQLException {
	    String select;
	    if (fetchAvatar) {
		// Select only the avatar column
		select = "select avatar from user_details where username = ?";
	    } else {
		// Select all columns
		select = "select  fullname,username, password,mobileno,email_address,  city, state,pincode,   avatar from user_details where username = ?";
	    }

	    Connection c = null;
	    PreparedStatement pStmt = null;
	    ResultSet resultSet = null;

	    try {
		c = DataBaseConnector.getConnection();
		pStmt = c.prepareStatement(select);
		pStmt.setString(1, username);

		if (fetchAvatar) {
		    // Fetch only the avatar column
		    resultSet = pStmt.executeQuery();
		    if (resultSet.next()) {
			User user = new User();
			user.setAvatar(StringHelper.convertBase64(resultSet.getBytes("avatar")));
			return user;
		    }
		} else {
		    resultSet = pStmt.executeQuery();
		    return extractUser(resultSet);
		}
	    } catch (SQLException e){
		e.printStackTrace();
	    }
//	    finally {
//		// Close the ResultSet here
//		if (resultSet != null) {
//		    try {
//			resultSet.close();
//		    } catch (SQLException e) {
//			e.printStackTrace();
//		    }
//		}
//
//		if (pStmt != null) {
//		    try {
//			pStmt.close();
//		    } catch (SQLException e) {
//			e.printStackTrace();
//		    }
//		}
//	    }

	    return null; // Return null in case of an error
	}

    // Update an existing user in the user_details table
    public void updateUser(User user, String originalUsername) {
	try {
	    connection = DataBaseConnector.getConnection();
	    String sql = "UPDATE user_details SET fullname = ?,username = ?, password = ?, mobileno = ?, email_address = ?, state = ?, city = ?, pincode = ? WHERE username = ?";
	    statement = connection.prepareStatement(sql);
	    statement.setString(1, user.getFullName());
	    statement.setString(2, user.getUserName());
	    statement.setString(3, user.getPassword());
	    statement.setString(4, user.getPhno());
	    statement.setString(5, user.getEmail_address());
	    statement.setString(6, user.getState());
	    statement.setString(7, user.getCity());
	    statement.setString(8, user.getPincod());
	    statement.setString(9, originalUsername);
	    int rowsUpdated = statement.executeUpdate();
	    if (rowsUpdated > 0) {
		System.out.println("An existing user was updated successfully!");
	    }
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
    public static int updateUserAvatar(InputStream inputStream, String username) throws SQLException {
	String sql = "UPDATE user_details SET avatar = ? WHERE username = ?";
	int rowAffected = 1;
	Connection connection = null;
	PreparedStatement statement = null;

	try {
	    connection = DataBaseConnector.getConnection();
	    statement = connection.prepareStatement(sql);
	    connection.setAutoCommit(false); // turn off auto-commit mode

	    if (inputStream != null) {
		// fetches input stream of the upload file for the blob column
		statement.setBinaryStream(1, inputStream, inputStream.available());
	    }

	    statement.setString(2, username);

	    rowAffected = statement.executeUpdate();
	    connection.commit(); // commit the transaction
	} catch (SQLException | IOException ex) {
	    ex.printStackTrace();
	}
//	finally {
//	    // Close the PreparedStatement here
//	    if (statement != null) {
//		try {
//		    statement.close();
//		} catch (SQLException e) {
//		    e.printStackTrace();
//		}
//	    }

	    // Close the connection here
//	    if (connection != null) {
//		try {
//		    connection.setAutoCommit(true); // turn auto-commit mode back on
////		    connection.close();
//		} catch (SQLException e) {
//		    e.printStackTrace();
//		}
//	    }
//	}

	return rowAffected;
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
