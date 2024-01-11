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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet("/search_coupon")
public class search_coupon extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Connection conn = DataBaseConnector.getConnection();
            System.out.println("connected!.....");
            String cname = request.getParameter("cname");

            if(cname == null || cname.isEmpty()){
                RequestDispatcher error = request.getRequestDispatcher("coupon_search_failed.jsp");
                error.forward(request, response);
                System.out.println("Disconnected!");
            }
            else{
                ArrayList al = null;
                ArrayList pid_list = new ArrayList();
                String query1 = "select * from coupon_table where coupon_name= ? ";

                PreparedStatement ps = conn.prepareStatement(query1);
                ps.setString(1, cname);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    al = new ArrayList();
                    al.add(rs.getString(1));
                    al.add(rs.getInt(2));
                    System.out.println("al :: " + al);
                    pid_list.add(al);
                }
                request.setAttribute("piList", pid_list);
                RequestDispatcher view = request.getRequestDispatcher("coupon_search_success");
                view.forward(request, response);

                System.out.println("Disconnected!");
            }

        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}