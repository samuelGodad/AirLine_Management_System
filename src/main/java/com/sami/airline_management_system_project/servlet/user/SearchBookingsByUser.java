package com.sami.airline_management_system_project.servlet.user;

import com.sami.airline_management_system_project.dao.FlightDao;
import com.sami.airline_management_system_project.dao.UserBookingDao;
import com.sami.airline_management_system_project.model.Flight;
import com.sami.airline_management_system_project.model.UserBooking;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;




import com.sami.airline_management_system_project.dao.FlightDao;
import com.sami.airline_management_system_project.model.Flight;
import jakarta.servlet.*;
        import jakarta.servlet.http.*;
        import jakarta.servlet.annotation.*;
        import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/search_Bookings_by_user")
public class SearchBookingsByUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserBookingDao userBookingDao = null;
        try {
            userBookingDao = new UserBookingDao();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        List<UserBooking> bookings;

        bookings =  userBookingDao.getAllBookings(request);

        request.setAttribute("piList", bookings);
        System.out.println(bookings);
        RequestDispatcher view = request.getRequestDispatcher("search_filter_bookings_result_u");
        view.forward(request, response);

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request,response);
    }
}