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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/search_coupon_ds")
public class search_coupon_ds extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String discountPercentage = request.getParameter("discoutnpercentage");
        if (discountPercentage == null || discountPercentage.isEmpty()) {
            RequestDispatcher error = request.getRequestDispatcher("coupon_search_failed.jsp");
            error.forward(request, response);
        } else {
            int dp = Integer.parseInt(discountPercentage);
            ArrayList<ArrayList<String>> pid_list = new ArrayList<>();

            String query = "SELECT * FROM coupon_table WHERE discountpercentage = ?";

            HttpSession session = request.getSession();
            Connection conn = null;
            PreparedStatement ps = null;
            try {
                // Check if a connection already exists in the session
                if (session.getAttribute("DBConnection") != null) {
                    conn = (Connection) session.getAttribute("DBConnection");
                } else {
                    // If not, create a new connection and store it in the session
                    conn = DataBaseConnector.getConnection();
                    session.setAttribute("DBConnection", conn);
                }
                ps = conn.prepareStatement(query);
                ps.setInt(1, dp);

                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    ArrayList<String> al = new ArrayList<>();
                    al.add(rs.getString(1));
                    al.add(String.valueOf(rs.getInt(2)));
                    pid_list.add(al);
                    System.out.println(" here are all the lists of the give id al :: " + al);
                }

                request.setAttribute("piList", pid_list);
                RequestDispatcher view = request.getRequestDispatcher("coupon_search_success");
                view.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (ps != null) {
                    try {
                        ps.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}