package com.sami.airline_management_system_project.servlet;
import com.sami.airline_management_system_project.db.DataBaseConnector;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

@WebServlet("/newsletter_srv")
public class Newsletter_srv extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        Connection conn = null;

        try {
            conn = DataBaseConnector.getConnection();
            String emails = request.getParameter("emails");
            System.out.println(emails);
            Statement st = conn.createStatement();
            HttpSession session = request.getSession();
            session.getAttribute("pagename");
            if (emails == null || "".equals(emails)) {
                RequestDispatcher view = request.getRequestDispatcher((String) session.getAttribute("pagename"));
                view.forward(request, response);
            } else {
                int i = st.executeUpdate("INSERT INTO Newsletter (emails) values('" + emails + "')");
                RequestDispatcher view = request.getRequestDispatcher((String) session.getAttribute("pagename"));
                view.forward(request, response);
                System.out.print("Record Inserted by " + session.getAttribute("pagename"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}