package com.sami.airline_management_system_project.servlet;

import com.sami.airline_management_system_project.dao.AdminDao;
import com.sami.airline_management_system_project.dao.UserDao;
import com.sami.airline_management_system_project.model.User;
import com.sun.net.httpserver.HttpPrincipal;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/user_login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String admin_name = request.getParameter("admin_name");
		String admin_pass = request.getParameter("admin_pass");
		boolean isValidAdmin = false;
		boolean isvalidUser = false;

		if (username != null && password != null) {
			UserDao userDAO = new UserDao();
			isvalidUser = userDAO.validateUser(username, password);

		}
		if (admin_name != null && admin_pass != null) {
			AdminDao adminDAO = new AdminDao();
			isValidAdmin = adminDAO.validateAdmin(admin_name, admin_pass);

		}
		if (isvalidUser) {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			response.sendRedirect(request.getContextPath() + "/user_login_pass");
		} else if (isValidAdmin) {
			HttpSession session = request.getSession();
			session.setAttribute("admin_name", admin_name);
			response.sendRedirect(request.getContextPath() + "/admin_login_pass");

		} else {

			response.sendRedirect(request.getContextPath() + "/user_login_failed");
		}
	}


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}