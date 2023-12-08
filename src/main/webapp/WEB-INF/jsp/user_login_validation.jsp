<%@ page import ="java.sql.*" %>
<%
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AIRRESERVE?" + "user=root");    
        PreparedStatement pst = conn.prepareStatement("Select username,password from user_details where username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()){
           String U_name=request.getParameter("username");
           session.setAttribute("username",U_name);
           response.sendRedirect("user_login_pass.jsp");
        }       
        else
           response.sendRedirect("user_login_failed.jsp");            
   }
   catch(Exception e){       
       response.sendRedirect("error.jsp");       
   }      
%>