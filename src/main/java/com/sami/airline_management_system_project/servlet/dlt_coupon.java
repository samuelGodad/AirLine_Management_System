package com.sami.airline_management_system_project.servlet;

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
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "AIRRESERVE";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "";
        try {
            int count=0;
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url + dbName, userName, password);
            System.out.println("connected!.....");
            String cname = request.getParameter("cname");
            String discoutnpercentage = request.getParameter("discoutnpercentage");
            int dp=Integer.parseInt(discoutnpercentage);
            
            HttpSession session = request.getSession();
            session.setAttribute("cname", cname);
             
            Statement st1=null;
            String query1 = "select discoutnpercentage from coupon_table where cname='" + cname + "' ";
            System.out.println("query1 " + query1);
            st1 = conn.createStatement();
            int discount=0;
            ResultSet rs = st1.executeQuery(query1);
            while(rs.next()){
                discount = rs.getInt(1);
            }
            System.out.println("discount: "+discount);
            System.out.println("dp: "+dp);
            if(dp==discount){
                String dlt = "DELETE FROM coupon_table WHERE cname = ? and discoutnpercentage = ?";
                PreparedStatement psdlt=conn.prepareStatement(dlt);
                psdlt.setString(1, cname);
                psdlt.setInt(2,dp);
                int i=psdlt.executeUpdate();
                if(i==1)
                {
                    System.out.println("Record Deleted");
                }
                RequestDispatcher view = request.getRequestDispatcher("coupon_dlt_scs.jsp");
                view.forward(request, response);
                conn.close();
            }
            else{
                System.out.println("Record Can't be Deleted");
                RequestDispatcher view = request.getRequestDispatcher("coupon_dlt_fld.jsp");
                view.forward(request, response);
                conn.close();
            }
                
        }
        catch(ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException  e){
            System.out.print(e);
        }       
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
