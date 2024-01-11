package com.sami.airline_management_system_project.servlet.admin;

import com.sami.airline_management_system_project.dao.FlightDao;
import com.sami.airline_management_system_project.model.Flight;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/add_flight_validator")
public class AddFlightValidationServlet extends HttpServlet {
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  Flight flight = new Flight();
  flight.setFlightId(request.getParameter("flight_id"));
  flight.setFlightNo(request.getParameter("flight_no"));
  flight.setFlightName(request.getParameter("flight_name"));
  flight.setFromCity(request.getParameter("from_city"));
  flight.setToCity(request.getParameter("to_city"));
  flight.setDateOfFlight(request.getParameter("date_of_flight"));
  
  flight.setFlightArrivalTime(request.getParameter("flight_arrival_time"));
  flight.setFlightReachTime(request.getParameter("flight_reach_time"));
  flight.setFirstClassSeat(Integer.parseInt(request.getParameter("first_class_seat")));
  flight.setFirstClassSeatBooked(0);
  flight.setFirstClassSeatAval(Integer.parseInt(request.getParameter("first_class_seat")));
  flight.setBussClassSeat(Integer.parseInt(request.getParameter("buss_class_seat")));
  flight.setBussClassSeatBooked(0);
  flight.setBussClassSeatAval(Integer.parseInt(request.getParameter("buss_class_seat")));
  flight.setEcoClassSeat(Integer.parseInt(request.getParameter("eco_class_seat")));
  flight.setEcoClassSeatBooked(0);
  flight.setEcoClassSeatAval(Integer.parseInt(request.getParameter("eco_class_seat")));
  flight.setFirstClassPrice(Double.parseDouble(request.getParameter("first_class_price")));
  flight.setBussClassPrice(Double.parseDouble(request.getParameter("buss_class_price")));
  flight.setEcoClassPrice(Double.parseDouble(request.getParameter("eco_class_price")));
  
  String time1 = request.getParameter("flight_arrival_time");
  String time2 = request.getParameter("flight_reach_time");
  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm:ss");
  try {
   Date date1 = simpleDateFormat.parse(time1);
   Date date2 = simpleDateFormat.parse(time2);
   long differenceInMilliSeconds = Math.abs(date2.getTime() - date1.getTime());
   long differenceInHours = (differenceInMilliSeconds / (60 * 60 * 1000)) % 24;
   long differenceInMinutes = (differenceInMilliSeconds / (60 * 1000)) % 60;
   long differenceInSeconds = (differenceInMilliSeconds / 1000) % 60;
   
   String duration = differenceInHours + ":" + differenceInMinutes + ":" + differenceInSeconds;
   flight.setDuration(duration);
   FlightDao flightDao = new FlightDao();
   if (flightDao.addFlight(flight)) {
    
    response.sendRedirect("add_flight_success");
   } else {
    request.setAttribute("errorMessage", "Flight already exists or key value error");
    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/addflights.jsp");
        requestDispatcher.forward(request, response);
        
//    response.sendRedirect("addflights_failed");
   }
  } catch (Exception e) {
   request.setAttribute("errorMessage", "Flight already exists or key value error ");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/jsp/addflights.jsp");
        requestDispatcher.forward(request, response);
   
//   response.sendRedirect("addflights_failed");
  }
 }
}