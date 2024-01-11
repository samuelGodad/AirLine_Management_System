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


@WebServlet("/user_booking_final_check")
public class user_booking_final_check extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
        System.out.println("-------------------------------INSIDE USER_BOOKING_FINAL_CHECK ----------------------");
        PrintWriter out = response.getWriter();
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "AIRRESERVE";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "";
        Statement st=null;
        String address=request.getParameter("address");    
        String payment_type=request.getParameter("payment_type");    
        String upino=request.getParameter("upino");    
        String coupon=request.getParameter("coupon");
        HttpSession session=request.getSession(false);  
        String PNR=(String)session.getAttribute("PNR");
        System.out.println(PNR);
        String ticket_type=(String)session.getAttribute("ticket_type");
        System.out.println(ticket_type);
        System.out.println(coupon);
        try    
        {    
            Class.forName(driver).newInstance();
            con = DriverManager.getConnection(url + dbName, userName, password);
            System.out.println("connected!.....");
                int fair1=0;
                String fair_q = "SELECT fair FROM payment_details WHERE PNR = ? ";
                PreparedStatement pstmt_fs=con.prepareStatement(fair_q);
                pstmt_fs.setString(1,PNR);
                ResultSet ff = pstmt_fs.executeQuery();
                while(ff.next()){
                    fair1 = ff.getInt(1);
                }
                int dis = 0;
                String dicountq = "SELECT discoutnpercentage FROM coupon_table WHERE cname = ?";
                PreparedStatement psds=con.prepareStatement(dicountq);
                psds.setString(1,coupon);
                ResultSet ds = psds.executeQuery();
                while(ds.next()){
                    dis = ds.getInt(1);
                }
                System.out.println(dis);
                int minus = 0;
                minus = (fair1 * dis)/100;
                fair1 = fair1 - minus;
                System.out.println(minus);
                System.out.println(fair1);
                String n_coupon = "Not Inserted!";
            if(coupon == " " || coupon == null){
                coupon = n_coupon;
                System.out.println("coupon"+coupon);
            }
                String update = "UPDATE payment_details SET address = ?, payment_gateway = ?, payment_id = ?, coupon = ?, discount = ?, actual_fair= ? WHERE PNR= ?";
                    PreparedStatement pst=con.prepareStatement(update);
                    pst.setString(1,address);
                    pst.setString(2,payment_type);
                    pst.setString(3,upino);
                    pst.setString(4,coupon);
                    pst.setInt(5,dis);
                    pst.setInt(6,fair1);
                    pst.setString(7, PNR);                        
                    int y=pst.executeUpdate();
                    if(y==1)
                    {
                        System.out.println("Values Updated Successfully");
                    }
                    RequestDispatcher view = request.getRequestDispatcher("payment_success.jsp");
                    view.forward(request, response);
                    
        }     
        catch (Exception e) {
            e.printStackTrace();
            RequestDispatcher view = request.getRequestDispatcher("payment_failed.jsp");
            view.forward(request, response);
        }
        out.close();
        System.out.println("-------------------------------INSIDE USER_BOOKING_FINAL_CHECK ----------------------");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}