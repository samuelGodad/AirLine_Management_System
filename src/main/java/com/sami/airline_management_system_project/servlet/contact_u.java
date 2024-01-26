package com.sami.airline_management_system_project.servlet;


import com.sami.airline_management_system_project.dao.ContactUsDao;
import com.sami.airline_management_system_project.db.DataBaseConnector;
import com.sami.airline_management_system_project.model.ContactUs;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/contact_u")
public class contact_u extends HttpServlet {

    private ContactUsDao contactUsDao = new ContactUsDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        ContactUs contactUs = new ContactUs(name, email, message, subject);

        try {
            Connection conn = DataBaseConnector.getConnection();
            contactUsDao.saveContactUs(contactUs,conn);
            HttpSession session = request.getSession();
            session.setAttribute("subject", subject);
            if(session.getAttribute("flag")=="1"){
                RequestDispatcher view = request.getRequestDispatcher("contact_response");
                view.forward(request, response);
                System.out.print("Record Inserted");
            }
            else if(session.getAttribute("flag")=="2"){
                RequestDispatcher view = request.getRequestDispatcher("contact_response_u");
                view.forward(request, response);
                System.out.print("Record Inserted");
            }
            else{
                RequestDispatcher view = request.getRequestDispatcher("error");
                view.forward(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}