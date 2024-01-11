package com.sami.airline_management_system_project.servlet.user;

import com.sami.airline_management_system_project.helper.DeleteFile;
import com.sami.airline_management_system_project.helper.Keys;
import com.sami.airline_management_system_project.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;

import java.io.*;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.sami.airline_management_system_project.dao.UserDao;

import static java.lang.System.out;

@WebServlet("/update_user_details_servlet")
@MultipartConfig(maxFileSize = 16177215,location = "C:/Users/Sami/Downloads/year 4 semister 1/enterprise/java resources/java servlet projects/java jsp project/Airline_management_system_project/src/main/webapp/pics") // upload file's size up to 16MB
public class UpdateUserDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	synchronized (this ){
	String newUsername = request.getParameter("newUsername");
	String fullname = request.getParameter("fullname");
	String email_address = request.getParameter("email_address");
	String phno = request.getParameter("mobileno");
	String city = request.getParameter("city");
	String pincode = request.getParameter("pincode");

	String password = request.getParameter("password");
	String state = request.getParameter("state");
	String originalUsername = request.getParameter("originalUsername");
	HttpSession session = request.getSession();
	User user = new User();
	user.setUserName(newUsername);
	user.setFullName(fullname);
	user.setPassword(password);
	user.setPhno(phno);
	user.setEmail_address(email_address);
	user.setState(state);
	user.setCity(city);
	user.setPincod(pincode);
	UserDao userDAO = new UserDao();
	userDAO.updateUser(user, originalUsername);
	session.setAttribute("loginUser",originalUsername);
	// Retrieve the updated data from the database and set it to the session
	User updatedUser = userDAO.getUserByUsername(newUsername);
	session.setAttribute("loginUser", updatedUser);
	response.sendRedirect(request.getContextPath() + "/user_login_pass");
    }
}}