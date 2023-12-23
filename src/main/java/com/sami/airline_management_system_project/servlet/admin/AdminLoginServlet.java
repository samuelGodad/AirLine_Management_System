package com.sami.airline_management_system_project.servlet.admin;

import com.sami.airline_management_system_project.dao.AdminDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
@WebServlet("/admin_login_servlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String adminName = request.getParameter("admin_name");
        String adminPassword = request.getParameter("admin_pass");
        boolean isValidAdmin = false;

        if (adminName != null && adminPassword != null) {
            AdminDao adminDAO = new AdminDao();
            isValidAdmin = adminDAO.validateAdmin(adminName, adminPassword);
        }

        if (isValidAdmin) {
            HttpSession session = request.getSession();
            session.setAttribute("admin_name", adminName);
            response.sendRedirect(request.getContextPath() + "/admin_login_pass");
        }else {
            request.setAttribute("errorMessage", "Invalid admin login credentials. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/admin/admin_login.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle GET requests if needed
    }
}

