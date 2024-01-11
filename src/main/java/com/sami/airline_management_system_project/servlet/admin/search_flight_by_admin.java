
package com.sami.airline_management_system_project.servlet.admin;

import com.sami.airline_management_system_project.dao.FlightDao;
import com.sami.airline_management_system_project.model.Flight;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/search_flight_by_admin")
public class search_flight_by_admin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	FlightDao flightDao = null;
	try {
	    flightDao = new FlightDao();
	} catch (SQLException e) {
	    throw new RuntimeException(e);
	}
	List<Flight> flights;
        String flightId = request.getParameter("flight_id");
        String flightName =request.getParameter("flight_name");
        String flightNo = request.getParameter("flight_no");
        String fromCity = request.getParameter("from_city");
        String toCity = request.getParameter("to_city");
        if (flightId != null &&  !flightId.isEmpty()) {
            flights = flightDao.getFlightById(flightId);
        }
        else if (flightNo != null && !flightNo.isEmpty()) {
                flights = flightDao.getFlightByFlightNo(flightNo);
        }
        else if (fromCity != null && !fromCity.isEmpty() && toCity != null && !toCity.isEmpty()) {
            // Search for a flight by from and to city
            flights = flightDao.getFlightByFromAndToCity(fromCity, toCity);

        }else if (flightName != null && !flightName.isEmpty()) {
                flights = flightDao.getFlightByFlightName(flightName);
        } else {
            flights = flightDao.getAllFlights();
        }
        request.setAttribute("piList", flights);
        RequestDispatcher view = request.getRequestDispatcher("search_filter_flights_result_a");
        view.forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
