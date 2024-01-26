package com.sami.airline_management_system_project.servlet.user;

import com.sami.airline_management_system_project.dao.UserDao;
import com.sami.airline_management_system_project.helper.Keys;
import com.sami.airline_management_system_project.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.logging.*;

@WebServlet("/user_login_servlet")
public class UserLoginServlet extends HttpServlet {
    Logger logger = Logger.getLogger(UserLoginServlet.class.getName());
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
            UserDao userDao =new UserDao();
            User loginUser = userDao.getUserByUsername(username);
            HttpSession session = request.getSession();
//            session.setAttribute("username", username);
            session.setAttribute("loginUser",loginUser);
            session.setAttribute("username",username);

//            User user =userDao.getUserByUsername(username);
            session.setAttribute(Keys.USER, loginUser);


            response.sendRedirect(request.getContextPath() + "/user_login_pass");
        } else {
            request.setAttribute("errorMessage","Invalid user login credentials. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/user/user_login.jsp");
            dispatcher.forward(request, response);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle GET requests if needed
    }

}
