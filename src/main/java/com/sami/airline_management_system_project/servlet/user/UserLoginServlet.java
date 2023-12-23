package com.sami.airline_management_system_project.servlet.user;

import com.sami.airline_management_system_project.dao.UserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/user_login_servlet")
public class UserLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean isValidUser = false;

        if (username != null && password != null) {
            UserDao userDAO = new UserDao();
            isValidUser = userDAO.validateUser(username, password);
        }

        if (isValidUser) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect(request.getContextPath() + "/user_login_pass");
        } else {
            request.setAttribute("errorMessage","Invalid user login credentials. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user_login.jsp");
            dispatcher.forward(request, response);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle GET requests if needed
    }

}
