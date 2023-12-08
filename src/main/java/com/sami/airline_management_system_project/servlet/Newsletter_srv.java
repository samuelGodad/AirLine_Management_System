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
import java.sql.Connection;
import java.sql.DriverManager;
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
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "AIRRESERVE";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "";
        
        try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url + dbName, userName, password);
            System.out.println("..................Inside Newsletter Servelet.....");
            System.out.println("connected!.....");
                String emails = request.getParameter("emails");
                System.out.println(emails);
                Statement st=conn.createStatement();
                HttpSession session = request.getSession();
                session.getAttribute("pagename");
                System.out.println("pagename="+session.getAttribute("pagename"));
               
                if(emails == null || "".equals(emails)){
                    RequestDispatcher view = request.getRequestDispatcher((String) session.getAttribute("pagename"));
                    view.forward(request, response);
                    System.out.print("Record Not Inserted by "+session.getAttribute("pagename")+"As Email was empty");
                }
                else{
                    int i=st.executeUpdate("INSERT INTO Newsletter (emails) values('" + emails + "')");
            
                    RequestDispatcher view = request.getRequestDispatcher((String) session.getAttribute("pagename"));
                    view.forward(request, response);
                    System.out.print("Record Inserted by "+session.getAttribute("pagename"));
                    conn.close();
                    System.out.println("Disconnected!");
                    System.out.println("..................Inside Newsletter Servelet.....");
                    
                }
                
                
                }
            
            catch (Exception e) {
                e.printStackTrace();
            }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
