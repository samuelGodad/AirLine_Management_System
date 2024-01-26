package com.sami.airline_management_system_project.servlet.user;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.sami.airline_management_system_project.dao.UserDao;
import com.sami.airline_management_system_project.helper.Keys;
import com.sami.airline_management_system_project.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
@WebServlet("/upload-image")
public class uploadImageServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        synchronized (this) {
            HttpSession session = request.getSession();
            String username = ((User) session.getAttribute("loginUser")).getUserName();

            try (InputStream inputStream = request.getPart("userCoverPhoto").getInputStream()) {
                int rowAffected = UserDao.updateUserAvatar(inputStream, username);
                if (rowAffected > 0) {
                    // Successfully updated only the profile image
                    User updatedUser = UserDao.getUser(username,false );
                    session.setAttribute("loginUser", updatedUser);
                    response.sendRedirect(request.getContextPath() + "/user_login_pass"); // Redirect to the user_login_pass page
                } else {
                    // Handle the case where image update failed
                    response.sendRedirect(request.getContextPath() + "/user_login_pass?error=1");
                }
            } catch (Exception e) {
                e.printStackTrace();
                // Handle exceptions appropriately
                response.sendRedirect(request.getContextPath() + "/user_login_pass?error=1");
            }
        }

    }

        @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
