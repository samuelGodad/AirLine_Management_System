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
import java.sql.SQLException;
import java.sql.Statement;
@WebServlet("/contact_u")
public class contact_u extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        System.out.println("-------------------------------INSIDE CONTACT ----------------------");
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
            System.out.println("connected!.....");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String subject = request.getParameter("subject");
            String message = request.getParameter("message");
            System.out.print("Connected");
            HttpSession session = request.getSession();
            session.setAttribute("subject", subject);
            System.out.println("Before execution");
            Statement st=conn.createStatement();
            int i=st.executeUpdate("INSERT INTO contact_table (name, email, subject,message) values('" + name + "','" + email + "', '"+subject+"', '"+message+"')");
            System.out.println("i=" +i);
           
            session.getAttribute("flag");
            System.out.print("flag="+session.getAttribute("flag"));
            
            
            if(session.getAttribute("flag")=="1"){
                RequestDispatcher view = request.getRequestDispatcher("contact_response.jsp");
                view.forward(request, response);
                System.out.print("Record Inserted");
            }
            else if(session.getAttribute("flag")=="2"){
                RequestDispatcher view = request.getRequestDispatcher("contact_response_u.jsp");
                view.forward(request, response);
                System.out.print("Record Inserted");
            }
            else{
                RequestDispatcher view = request.getRequestDispatcher("error.jsp");
                view.forward(request, response);
            }
            
            
        }
        catch(IOException | ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException | ServletException e){
            System.out.print(e);
        }  
        System.out.println("-------------------------------INSIDE CONTACT ----------------------");
    }
        
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
