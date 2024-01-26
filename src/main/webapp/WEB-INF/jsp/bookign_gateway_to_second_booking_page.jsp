<%@ page import ="java.sql.*" %>
<%
    try{
        String username = request.getParameter("username");   
        String flight_id = request.getParameter("flight_id");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AIRRESERVE?" + "user=root");
        String ticket_type = request.getParameter("ticket_type");
        int no_of_seats = Integer.parseInt(request.getParameter("no_of_seats"));
        PreparedStatement buss_class_seat_aval = conn.prepareStatement("Select buss_class_seat_aval from flight_details");
        PreparedStatement eco_class_seat_aval = conn.prepareStatement("Select eco_class_seat_aval from flight_details");
        PreparedStatement first_class_seat_aval = conn.prepareStatement("Select first_class_seat_aval from flight_details");
        
        if(ticket_type == "Coach Class"){
            
            
        
        }
        
        PreparedStatement pst = conn.prepareStatement("Select username,password from user_details where username=? and flight_id=?");
        pst.setString(1, username);
        pst.setString(2, flight_id);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next()){
           String U_name=request.getParameter("username");
           session.setAttribute("username",U_name);
           response.sendRedirect("user_login_pass.jsp");
        }       
        else
           response.sendRedirect("booking_failed.jsp");            
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>