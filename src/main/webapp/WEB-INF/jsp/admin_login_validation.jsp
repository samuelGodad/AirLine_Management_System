<%@ page import ="java.sql.*" %>
<%
    try{
        String admin_name = request.getParameter("admin_name");   
        String admin_pass = request.getParameter("admin_pass");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AIRRESERVE?" + "user=root");    
        PreparedStatement pst = conn.prepareStatement("Select admin_name,admin_pass from admin_log where admin_name=? and admin_pass=?");
        pst.setString(1, admin_name);
        pst.setString(2, admin_pass);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()){
           String A_name=request.getParameter("admin_name");
           session.setAttribute("admin_name",A_name);
           response.sendRedirect("admin_login_pass.jsp");
        }       
        else
           response.sendRedirect("admin_login_failed.jsp");            
   }
   catch(Exception e){       
       response.sendRedirect("error.jsp");       
   }      
%>