package com.sami.airline_management_system_project.dao;

import com.sami.airline_management_system_project.model.ContactUs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ContactUsDao {

    public void saveContactUs(ContactUs contactUs, Connection conn) throws SQLException {
	String sql = "INSERT INTO contact_table (name, email, subject, message) values(?, ?, ?, ?)";
	try (PreparedStatement ps = conn.prepareStatement(sql)) {
	    ps.setString(1, contactUs.getName());
	    ps.setString(2, contactUs.getEmail());
	    ps.setString(3, contactUs.getSubject());
	    ps.setString(4, contactUs.getMessage());
	    ps.executeUpdate();
	}
    }
}