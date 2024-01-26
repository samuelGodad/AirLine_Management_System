package com.sami.airline_management_system_project.servlet;

import com.sami.airline_management_system_project.dao.FlightDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import com.sami.airline_management_system_project.model.Flight;

@WebServlet("/deleteFlight")
public class DeleteFlightServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flightId = request.getParameter("flightId");

        try {
            FlightDao flightDao = new FlightDao();
            boolean success = flightDao.deleteFlight(flightId);

            if (success) {
                System.out.println("Flight deleted successfully");
                // Fetch the updated list of flights
                List<Flight> flights = flightDao.getAllFlights();
                // Set the updated list as a request attribute
                request.setAttribute("piList", flights);
                // Forward the request back to the JSP page
                RequestDispatcher dispatcher = request.getRequestDispatcher("/search_filter_flights_result_a");
                dispatcher.forward(request, response);
            } else {
                System.out.println("Flight deletion failed");
                response.sendRedirect(request.getContextPath() + "/search_filter_flights_result_a?deleteSuccess=false");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}