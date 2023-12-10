package com.sami.airline_management_system_project.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

@WebServlet("/search_coupon_all")
public class search_coupon_all extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");


        PrintWriter out = response.getWriter();
        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "AIRRESERVE";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "";
        Statement st=null;
        try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url + dbName, userName, password);
            System.out.println("connected!.....");
                ArrayList al = null;
                ArrayList pid_list = new ArrayList();
                String query1 = "select * from coupon_table";
                System.out.println("query1 " + query1);
                st = conn.createStatement();
                ResultSet rs = st.executeQuery(query1);

                while (rs.next()) {
                    al = new ArrayList();
                    al.add(rs.getString(1));
                    al.add(rs.getInt(2));
                    System.out.println("al :: " + al);
                    pid_list.add(al);
                }

                request.setAttribute("piList", pid_list);
                RequestDispatcher view = request.getRequestDispatcher("coupon_search_succ.jsp");
                view.forward(request, response);
                conn.close();
                System.out.println("Disconnected!");
                }
            
            catch (Exception e) {
                e.printStackTrace();
            }
        }

    


}
