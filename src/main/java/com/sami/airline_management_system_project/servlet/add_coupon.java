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

@WebServlet("/add_coupon")
public class add_coupon extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        System.out.println("-------------------------------INSIDE ADD_COUPON ----------------------");
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
            
            HttpSession session = request.getSession();
            session.setAttribute("cname", cname);
            
            Statement st=conn.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM coupon_table WHERE cname='"+cname+"'");
            while(rs.next()){
                count++;
            }
            if(count>0){
                RequestDispatcher view = request.getRequestDispatcher("coupon_add_failed.jsp");
                view.forward(request, response);
                System.out.print("Record NOt Inserted");
            }
            else{
                int i=st.executeUpdate("INSERT INTO coupon_table (cname, discoutnpercentage) values('" + cname + "','" + discoutnpercentage + "')");
                RequestDispatcher view = request.getRequestDispatcher("coupon_add_success.jsp");
                view.forward(request, response);
                System.out.print("Record Inserted");
            }
        }
        catch(IOException | ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException | ServletException e){
            System.out.print(e);
        }  
        System.out.println("-------------------------------INSIDE ADD_COUPON ----------------------");
    }
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
