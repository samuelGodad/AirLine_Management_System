package com.sami.airline_management_system_project.db;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
public class DataBaseConnector {
	private static Connection connection = null;
	public static Connection getConnection() {
		if (connection == null) {
			try {
//				Class.forName("org.postgresql.Driver");
				Class.forName("com.mysql.cj.jdbc.Driver");
				Properties props = new Properties();
				InputStream input = DataBaseConnector.class.getClassLoader().getResourceAsStream("db.properties");
				if (input == null) {
					System.out.println("Sorry, unable to find db.properties");
					return null;
				}
				props.load(input);
				String url = props.getProperty("db.url");
				String user = props.getProperty("db.user");
				String password = props.getProperty("db.password");
				connection = DriverManager.getConnection(url, user, password);
				System.out.println("connected successfully");
			} catch (ClassNotFoundException | SQLException | IOException e) {
				System.out.println("you cannot connect");
				throw new RuntimeException(e);
			}
		}
		System.out.println(connection+" db connector");
		return connection;
	}
}
