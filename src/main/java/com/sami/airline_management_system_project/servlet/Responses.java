package com.sami.airline_management_system_project.servlet;

import com.sami.airline_management_system_project.db.DataBaseConnector;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

@WebServlet("/responses")
public class Responses extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Connection conn = null;
        Statement st = null;
        try {
            conn = DataBaseConnector.getConnection();
            ArrayList al = null;
            ArrayList pid_list = new ArrayList();
            String query1 = "select * from contact_table";
            assert conn != null;
            st = conn.createStatement();
            ResultSet rs = st.executeQuery(query1);

            while (rs.next()) {
                al = new ArrayList();
                al.add(rs.getString(1));
                al.add(rs.getString(2));
                al.add(rs.getString(3));
                al.add(rs.getString(4));
                pid_list.add(al);
            }

            request.setAttribute("piList", pid_list);
            RequestDispatcher view = request.getRequestDispatcher("Responses");
            view.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}