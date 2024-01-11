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
import java.sql.*;

@WebServlet("/delete_coupon")
public class dlt_coupon extends HttpServlet {

    protected  void  doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        processRequest(request, response);


    }
    protected  void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Connection conn = null;
        try {
            int count=0;
            conn = DataBaseConnector.getConnection();
            System.out.println("connected!.....");
            String cname = request.getParameter("coupon_name");
            String discountpercentage = request.getParameter("discountpercentage");
            int dp=Integer.parseInt(discountpercentage);
            HttpSession session = request.getSession();
            session.setAttribute("cname", cname);
            Statement st1=null;
            String query1 = "select discountpercentage from coupon_table where coupon_name='" + cname + "' ";
            st1 = conn.createStatement();
            int discount=0;
            ResultSet rs = st1.executeQuery(query1);
            while(rs.next()){
                discount = rs.getInt(1);
            }

            if(dp==discount){
                String dlt = "DELETE FROM coupon_table WHERE coupon_name = ? and discountpercentage = ?";
                PreparedStatement psdlt=conn.prepareStatement(dlt);
                psdlt.setString(1, cname);
                psdlt.setInt(2,dp);
                int i=psdlt.executeUpdate();
                if(i==1)
                {
                    request.setAttribute("deleteSuccess", "true");
                }
                RequestDispatcher view = request.getRequestDispatcher("search_coupon_all");
                view.forward(request, response);
            }
            else{
                RequestDispatcher view = request.getRequestDispatcher("coupon_dlt_fld");
                view.forward(request, response);
            }

        }
        catch(SQLException e){
            System.out.print(e);
        }

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }
}