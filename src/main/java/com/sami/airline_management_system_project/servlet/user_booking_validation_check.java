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
import java.util.Random;

@WebServlet("/user_booking_validation_check")
public class user_booking_validation_check extends HttpServlet {
    private static final long serialVersionUID = 1L;
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
        System.out.println("-------------------------------INSIDE USER_BOOKING_VALIDATION_CHECK ----------------------");
        PrintWriter out = response.getWriter();
        Connection con = null;
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "AIRRESERVE";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "";
        Statement st=null;
        int min = 11069;      
        int max = 99099;
        String PNR = "PNR00"+(int)(Math.random()*(max-min+1)+min);
        
        Random rnd = new Random();
        char a = (char) ('a' + rnd.nextInt(26));
        char b = (char) ('a' + rnd.nextInt(26));
        char c = (char) ('a' + rnd.nextInt(26));
        char A = Character.toUpperCase(a);
        char B = Character.toUpperCase(b);
        char C = Character.toUpperCase(c);
        String transaction_id = "XX"+a+B+c+"YY"+(int)(Math.random()*(max-min+1)+min)+C+b+A;    
        
        String username=request.getParameter("username");    
        String flight_id=request.getParameter("flight_id");    
        String ticket_type=request.getParameter("ticket_type");    
        String date_of_flight=request.getParameter("date_of_flight");  
        String adults1=request.getParameter("adults");
        int adults=Integer.parseInt(adults1);    
        String no_of_seats1=request.getParameter("no_of_seats");    
        int no_of_seats=Integer.parseInt(no_of_seats1);
        int child = no_of_seats - adults;
        
        System.out.println("date_of_flight: "+date_of_flight);
        System.out.println("adults: "+adults);
        System.out.println("child: "+child);
        System.out.println("no_of_seats: "+no_of_seats);
            
        HttpSession session = request.getSession();
        session.setAttribute("pnrno", PNR);
        session.setAttribute("ticket_type", ticket_type);
        System.out.println(ticket_type);
        System.out.println(no_of_seats);
        try    
        {    
            Class.forName(driver).newInstance();
            con = DriverManager.getConnection(url + dbName, userName, password);
            System.out.println("connected!.....");   
               
            if(null != ticket_type)switch (ticket_type) {
                case "Business Class":
                    int bs_valid=0;
                    String query_for_bs = "SELECT buss_class_seat_aval FROM flight_details WHERE flight_id = ? AND date_of_flight = ? ";
                    PreparedStatement pstmt_bs=con.prepareStatement(query_for_bs);
                    pstmt_bs.setString(1,flight_id);
                    pstmt_bs.setString(2,date_of_flight);
                    ResultSet rst = pstmt_bs.executeQuery();
                    
                    while(rst.next()){
                        bs_valid = rst.getInt(1);
                        }
                    
                    
                    
                    if(no_of_seats > bs_valid){
                        RequestDispatcher view = request.getRequestDispatcher("user_booking_failed.jsp");
                        view.forward(request, response);
                        con.close();
                        System.out.println("Cant Inserted!");
                        
                    }
                    else{
                    
                        int fair_1=1;
                        String cost_1 = "SELECT buss_class_price FROM flight_details WHERE flight_id = ?";
                        PreparedStatement cst1_ps=con.prepareStatement(cost_1);
                        cst1_ps.setString(1, flight_id);
                        ResultSet rst_cst1 = cst1_ps.executeQuery();
                    
                        while(rst_cst1.next()){
                            fair_1 = rst_cst1.getInt(1);
                        }
                        
                        int ff_1 = fair_1 * no_of_seats;
                        String bff =String.valueOf(ff_1);
                        String ff= "RS: " + bff + "/-";
                        
                        HttpSession ses=request.getSession();
                        ses.setAttribute("ff",ff);
                        
                        String query="Insert into booking_details (username, flight_no, date_of_flight, no_of_seats, ticket_type, adults, child, PNR) values (?, ?, ?, ?, ?, ?, ?, ?)";
                        PreparedStatement pstmt=con.prepareStatement(query);
                        pstmt.setString(1, username);
                        pstmt.setString(2, flight_id);
                        pstmt.setString(3, date_of_flight);
                        pstmt.setInt(4, no_of_seats);
                        pstmt.setString(5, ticket_type);
                        pstmt.setInt(6, adults);
                        pstmt.setInt(7, child);
                        pstmt.setString(8, PNR);
                        int x=pstmt.executeUpdate();
                        if(x==1)
                        {
                            System.out.println("Values Inserted Successfully");
                        }
                        
                        String update_bs = "UPDATE flight_details SET buss_class_seat_booked = buss_class_seat_booked + ?, buss_class_seat_aval = buss_class_seat_aval - ? WHERE flight_id = ? AND date_of_flight = ? ";
                        PreparedStatement pst_up_bs=con.prepareStatement(update_bs);
                        pst_up_bs.setInt(1,no_of_seats);
                        pst_up_bs.setInt(2,no_of_seats);
                        pst_up_bs.setString(3,flight_id);
                        pst_up_bs.setString(4,date_of_flight);
                        
                        int y=pst_up_bs.executeUpdate();
                        if(y==1)
                        {
                            System.out.println("Values Updated Successfully To Flight Details");
                        }
                        
                        String pay_q_bs="Insert into payment_details (PNR, transaction_id, address, payment_gateway, fair, coupon, discount, actual_fair) values (?, ?, ?, ?, ?, ?, ?, ?)";
                        PreparedStatement pay_ps_bs =con.prepareStatement(pay_q_bs);
                        pay_ps_bs.setString(1, PNR);
                        pay_ps_bs.setString(2, transaction_id);
                        pay_ps_bs.setString(3, "NULL");
                        pay_ps_bs.setString(4, "NULL");
                        pay_ps_bs.setInt(5, ff_1);
                        pay_ps_bs.setString(6, "NULL");
                        pay_ps_bs.setInt(7, 0);
                        pay_ps_bs.setInt(8, ff_1);
                        int pay_bs=pay_ps_bs.executeUpdate();
                        if(pay_bs==1)
                        {
                            System.out.println("Values Inserted Successfully To Payment Details");
                        }
                        RequestDispatcher view = request.getRequestDispatcher("user_booking.jsp");
                        view.forward(request, response);
                        con.close();
                    
                    }   break;
                case "First Class":
                    
                    int fair_2=1;
                        String cost_2 = "SELECT first_class_price FROM flight_details WHERE flight_id = ?";
                        PreparedStatement cst2_ps=con.prepareStatement(cost_2);
                        cst2_ps.setString(1, flight_id);
                        ResultSet rst_cst2 = cst2_ps.executeQuery();
                    
                        while(rst_cst2.next()){
                            fair_2 = rst_cst2.getInt(1);
                        }
                        
                        int ff_2 = fair_2 * no_of_seats;
                        String fff =String.valueOf(ff_2);
                        String ff= "RS: " + fff + "/-";
                        
                        HttpSession ses=request.getSession();
                        ses.setAttribute("ff",ff);
                    
                    int fs_valid=0;
                    String query_for_fs = "SELECT first_class_seat_aval FROM flight_details WHERE flight_id = ? ";
                    PreparedStatement pstmt_fs=con.prepareStatement(query_for_fs);
                    pstmt_fs.setString(1,flight_id);
                    //ResultSet rst = null;
                    ResultSet rst1 = pstmt_fs.executeQuery();
                    
                    while(rst1.next()){
                        fs_valid = rst1.getInt(1);
                    }
                    
                    if(no_of_seats > fs_valid){
                        RequestDispatcher view = request.getRequestDispatcher("user_booking_failed.jsp");
                        view.forward(request, response);
                        con.close();
                        System.out.println("Cant Inserted!");
                    }
                    else{
                        String query="Insert into booking_details (username, flight_no, date_of_flight, no_of_seats, ticket_type, adults, child, PNR) values (?, ?, ?, ?, ?, ?, ?, ?)";
                        PreparedStatement pstmt=con.prepareStatement(query);
                        pstmt.setString(1, username);
                        pstmt.setString(2, flight_id);
                        pstmt.setString(3, date_of_flight);
                        pstmt.setInt(4, no_of_seats);
                        pstmt.setString(5, ticket_type);
                        pstmt.setInt(6, adults);
                        pstmt.setInt(7, child);
                        pstmt.setString(8, PNR);
                        
                        int x=pstmt.executeUpdate();
                        if(x==1)
                        {
                            out.println("Values Inserted Successfully");
                        }
                        
                        String update_fs = "UPDATE flight_details SET first_class_seat_booked = first_class_seat_booked + ?, first_class_seat_aval = first_class_seat_aval - ? WHERE flight_id = ? AND date_of_flight = ? ";
                        PreparedStatement pst_up_fs=con.prepareStatement(update_fs);
                        pst_up_fs.setInt(1,no_of_seats);
                        pst_up_fs.setInt(2,no_of_seats);
                        pst_up_fs.setString(3,flight_id);
                        pst_up_fs.setString(4,date_of_flight);
                        
                        int y=pst_up_fs.executeUpdate();
                        if(y==1)
                        {
                            System.out.println("Values Updated Successfully");
                        }
                        
                        String pay_q_fs="Insert into payment_details (PNR, transaction_id, address, payment_gateway, fair, coupon, discount, actual_fair) values (?, ?, ?, ?, ?, ?, ?, ?)";
                        PreparedStatement pay_ps_fs =con.prepareStatement(pay_q_fs);
                        pay_ps_fs.setString(1, PNR);
                        pay_ps_fs.setString(2, transaction_id);
                        pay_ps_fs.setString(3, "NULL");
                        pay_ps_fs.setString(4, "NULL");
                        pay_ps_fs.setInt(5, ff_2);
                        pay_ps_fs.setString(6, "NULL");
                        pay_ps_fs.setInt(7, 0);
                        pay_ps_fs.setInt(8, ff_2);
                        
                        int pay_fs=pay_ps_fs.executeUpdate();
                        if(pay_fs==1)
                        {
                            System.out.println("Values Inserted Successfully To Payment Details");
                        }
                        
                        RequestDispatcher view = request.getRequestDispatcher("user_booking.jsp");
                        view.forward(request, response);
                        con.close();
                        System.out.println("Disconnected!");
                    }break;
                    
                case "Coach Class":
                    int fair_3=1;
                        String cost_3 = "SELECT eco_class_price FROM flight_details WHERE flight_id = ?";
                        PreparedStatement cst3_ps=con.prepareStatement(cost_3);
                        cst3_ps.setString(1, flight_id);
                        ResultSet rst_cst3 = cst3_ps.executeQuery();
                    
                        while(rst_cst3.next()){
                            fair_3 = rst_cst3.getInt(1);
                        }
                        
                        int ff_3 = fair_3 * no_of_seats;
                        String eff =String.valueOf(ff_3);
                        String eeff= "RS: " + eff + "/-";
                        
                        HttpSession sess=request.getSession();
                        sess.setAttribute("ff",eeff);
                    
                    int cs_valid=0;
                    String query_for_cs = "SELECT eco_class_seat_aval FROM flight_details WHERE flight_id = ? ";
                    PreparedStatement pstmt_cs=con.prepareStatement(query_for_cs);
                    pstmt_cs.setString(1,flight_id);
                    //ResultSet rst = null;
                    ResultSet rst2 = pstmt_cs.executeQuery();
                    
                    while(rst2.next()){
                        cs_valid = rst2.getInt(1);
                    }
                    
                    if(no_of_seats > cs_valid){
                        RequestDispatcher view = request.getRequestDispatcher("user_booking_failed.jsp");
                        view.forward(request, response);
                        con.close();
                        System.out.println("Cant Inserted!");
                    }
                    else{
                        String query="Insert into booking_details (username, flight_no, date_of_flight, no_of_seats, ticket_type, adults, child, PNR) values (?, ?, ?, ?, ?, ?, ?, ?)";
                        PreparedStatement pstmt=con.prepareStatement(query);
                        pstmt.setString(1, username);
                        pstmt.setString(2, flight_id);
                        pstmt.setString(3, date_of_flight);
                        pstmt.setInt(4, no_of_seats);
                        pstmt.setString(5, ticket_type);
                        pstmt.setInt(6, adults);
                        pstmt.setInt(7, child);
                        pstmt.setString(8, PNR);
                        
                        int x=pstmt.executeUpdate();
                        if(x==1)
                        {
                            out.println("Values Inserted Successfully");
                        }
                        
                        String update_cs = "UPDATE flight_details SET eco_class_seat_booked = eco_class_seat_booked + ?, eco_class_seat_aval = eco_class_seat_aval - ? WHERE flight_id = ? AND date_of_flight = ? ";
                        PreparedStatement pst_up_cs=con.prepareStatement(update_cs);
                        pst_up_cs.setInt(1,no_of_seats);
                        pst_up_cs.setInt(2,no_of_seats);
                        pst_up_cs.setString(3,flight_id);
                        pst_up_cs.setString(4,date_of_flight);
                        
                        int y=pst_up_cs.executeUpdate();
                        if(y==1)
                        {
                            System.out.println("Values Updated Successfully");
                        }
                        
                        String pay_q_cs="Insert into payment_details (PNR, transaction_id, address, payment_gateway, fair, coupon, discount, actual_fair) values (?, ?, ?, ?, ?, ?, ?, ?)";
                        PreparedStatement pay_ps_cs =con.prepareStatement(pay_q_cs);
                        pay_ps_cs.setString(1, PNR);
                        pay_ps_cs.setString(2, transaction_id);
                        pay_ps_cs.setString(3, "NULL");
                        pay_ps_cs.setString(4, "NULL");
                        pay_ps_cs.setInt(5, ff_3);
                        pay_ps_cs.setString(6, "NULL");
                        pay_ps_cs.setInt(7, 0);
                        pay_ps_cs.setInt(8, ff_3);
                        
                        int pay_cs=pay_ps_cs.executeUpdate();
                        if(pay_cs==1)
                        {
                            System.out.println("Values Inserted Successfully To Payment Details");
                        }
                        
                        RequestDispatcher view = request.getRequestDispatcher("user_booking.jsp");
                        view.forward(request, response);
                        con.close();
                        System.out.println("Disconnected!");
                    }break;
                default:
                    break;
            }
           System.out.println("-------------------------------INSIDE USER_BOOKING_VALIDATION_CHECK ----------------------");    
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
        out.close();
        
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
