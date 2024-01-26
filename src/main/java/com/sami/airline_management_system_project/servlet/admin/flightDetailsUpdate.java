package com.sami.airline_management_system_project.servlet.admin;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.logging.Logger;

import com.sami.airline_management_system_project.dao.FlightDao;
import com.sami.airline_management_system_project.model.Flight;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/flight_details_update")
public class flightDetailsUpdate extends HttpServlet {
	private final static Logger LOGGER = Logger.getLogger(flightDetailsUpdate.class.getName());

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Enumeration<String> parameterNames = request.getParameterNames();
		List<Flight> flightsToUpdate = new ArrayList<>();

		while (parameterNames.hasMoreElements()) {
			String paramName = parameterNames.nextElement();
			if (paramName.startsWith("flight_id")) {
				String rowIndex = paramName.substring("flight_id".length());

				String flightId = request.getParameter("flight_id" + rowIndex);
				String flightName = request.getParameter("flight_name" + rowIndex);
				String flightNo = request.getParameter("flight_no" + rowIndex);
				String fromCity = request.getParameter("from_city" + rowIndex);
				String toCity = request.getParameter("to_city" + rowIndex);
				String dateOfFlight = request.getParameter("date_of_flight" + rowIndex);
				String flightArrivalTime = request.getParameter("flight_arrival_time" + rowIndex);
				String flightReachTime = request.getParameter("flight_reach_time" + rowIndex);
				String duration = request.getParameter("duration" + rowIndex);

				int firstClassSeat = Integer.parseInt(request.getParameter("first_class_seat" + rowIndex));
				int firstClassSeatBooked = Integer.parseInt(request.getParameter("first_class_seat_booked" + rowIndex));
				int firstClassSeatAval = Integer.parseInt(request.getParameter("first_class_seat_aval" + rowIndex));
				int bussClassSeat = Integer.parseInt(request.getParameter("buss_class_seat" + rowIndex));
				int bussClassSeatBooked = Integer.parseInt(request.getParameter("buss_class_seat_booked" + rowIndex));
				int bussClassSeatAval = Integer.parseInt(request.getParameter("buss_class_seat_aval" + rowIndex));
				int ecoClassSeat = Integer.parseInt(request.getParameter("eco_class_seat" + rowIndex));
				int ecoClassSeatBooked = Integer.parseInt(request.getParameter("eco_class_seat_booked" + rowIndex));
				int ecoClassSeatAval = Integer.parseInt(request.getParameter("eco_class_seat_aval" + rowIndex));
				double firstClassPrice = Double.parseDouble(request.getParameter("first_class_price" + rowIndex));
				double bussClassPrice = Double.parseDouble(request.getParameter("buss_class_price" + rowIndex));
				double ecoClassPrice = Double.parseDouble(request.getParameter("eco_class_price" + rowIndex));
				Flight flight = new Flight();
				flight.setFlightId(flightId);
				flight.setFlightNo(flightNo);
				flight.setFlightName(flightName);
				flight.setFromCity(fromCity);
				flight.setToCity(toCity);
				flight.setDateOfFlight(dateOfFlight);
				flight.setFlightArrivalTime(flightArrivalTime);
				flight.setFlightReachTime(flightReachTime);
				flight.setDuration(duration);
				flight.setFirstClassSeat(firstClassSeat);
				flight.setFirstClassSeatBooked(firstClassSeatBooked);
				flight.setFirstClassSeatAval(firstClassSeatAval);
				flight.setBussClassSeat(bussClassSeat);
				flight.setBussClassSeatBooked(bussClassSeatBooked);
				flight.setBussClassSeatAval(bussClassSeatAval);
				flight.setEcoClassSeat(ecoClassSeat);
				flight.setEcoClassSeatBooked(ecoClassSeatBooked);
				flight.setEcoClassSeatAval(ecoClassSeatAval);
				flight.setFirstClassPrice(firstClassPrice);
				flight.setEcoClassPrice(ecoClassPrice);
				flight.setBussClassPrice(bussClassPrice);

				flightsToUpdate.add(flight);
			}
		}

		try {
			FlightDao flightDao = new FlightDao();
			flightDao.updateFlights(flightsToUpdate);

			LOGGER.info("Flight details updated successfully");
			response.sendRedirect(request.getContextPath() + "/search_flight_by_admin?updateSuccess=true");
		} catch (SQLException e) {
			// LOGGER.severe("Error updating flight details: " + e.getMessage());
			System.out.println();
			throw new RuntimeException(e);
		}
	}
}
