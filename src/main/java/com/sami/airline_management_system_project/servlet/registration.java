package com.sami.airline_management_system_project.servlet;
import com.sami.airline_management_system_project.dao.UserDao;
import com.sami.airline_management_system_project.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/registration")
public class registration extends HttpServlet {
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String fullname = request.getParameter("fullname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String countryCode = request.getParameter("countryCode");
		String phno = request.getParameter("phno");
		String email_address = request.getParameter("email_address");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String pincode = request.getParameter("pincode");
		UserDao userDAO = new UserDao();

		if (userDAO.isUsernameExists(username)) {
			request.setAttribute("errorMessage", "Username already exists. Please choose a different one.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/register.jsp");
			dispatcher.forward(request, response);
			return;
		}

		try {
			User user = new User();
			user.setFullName(fullname);
			user.setUserName(username);
			user.setPassword(password);
			user.setCountryCode(countryCode);
			user.setPhno(phno);
			user.setEmail_address(email_address);
			user.setState(state);
			user.setCity(city);
			user.setPincod(pincode);
			userDAO.insertUser(user);
			username = user.getUserName();
			request.getSession().setAttribute("username", username);
			response.sendRedirect(request.getContextPath() + "/registration_success");
			System.out.println("record inserted successfully");
		} catch (Exception e) {
			e.printStackTrace();
			// Handle other exceptions here if needed
			request.setAttribute("errorMessage", "An error occurred. Please try again.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/register.jsp");
			dispatcher.forward(request, response);
		}
	}

}

