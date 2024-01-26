package com.sami.airline_management_system_project.servlet;

import com.sami.airline_management_system_project.db.DataBaseConnector;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
@WebServlet("/cancellation")
public class Cancellation extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        Connection connection = null;

        try {
            connection=DataBaseConnector.getConnection();
            System.out.println("connected!.....");
            String PNR = request.getParameter("PNR");

            String vpnr = "";
            String pnrq = "SELECT PNR FROM booking_details WHERE PNR = ? ";
            PreparedStatement pq1 = connection.prepareStatement(pnrq);
            pq1.setString(1, PNR);
            ResultSet rspnr = pq1.executeQuery();
            while (rspnr.next()) {
                vpnr = rspnr.getString(1);
            }
            System.out.println("Valid PNR=" + vpnr);
            System.out.println("PNR=" + PNR);
            HttpSession session = request.getSession();
            session.setAttribute("PNR", PNR);
            if (PNR.equals(vpnr)) {
                String ticket_type = "";
                int no_of_seats = 0;
                String query = "SELECT ticket_type, no_of_seats FROM booking_details WHERE PNR = ? ";
                PreparedStatement pq = connection.prepareStatement(query);
                pq.setString(1, PNR);
                ResultSet rq = pq.executeQuery();
                while (rq.next()) {
                    ticket_type = rq.getString(1);
                    no_of_seats = rq.getInt(2);
                }

                System.out.println("ticket_type= " + ticket_type);
                System.out.println("no_of_seats= " + no_of_seats);

                String flight_no = "";
                String query1 = "SELECT flight_no FROM booking_details WHERE PNR = ? ";
                PreparedStatement pq21 = connection.prepareStatement(query1);
                pq21.setString(1, PNR);
                ResultSet rq1 = pq21.executeQuery();
                while (rq1.next()) {
                    flight_no = rq1.getString(1);
                }
                System.out.println("flight_no= " + flight_no);

                if (null != ticket_type)
                    switch (ticket_type) {
                        case "Business Class":
                            System.out.println("Executing Cancellation operations for Business Class in flight_details");
                            int buss_class_seat_booked = 0, buss_class_seat_aval = 0;
                            String bs = "SELECT buss_class_seat_booked, buss_class_seat_aval FROM flight_details WHERE flight_id = ? ";
                            PreparedStatement pbs = connection.prepareStatement(bs);
                            pbs.setString(1, flight_no);
                            ResultSet rbs = pbs.executeQuery();
                            while (rbs.next()) {
                                buss_class_seat_booked = rbs.getInt(1);
                                buss_class_seat_aval = rbs.getInt(2);
                            }
                            System.out.println("buss_class_seat_booked= " + buss_class_seat_booked);
                            System.out.println("buss_class_seat_aval= " + buss_class_seat_aval);

                            buss_class_seat_booked = buss_class_seat_booked - no_of_seats;
                            buss_class_seat_aval = buss_class_seat_aval + no_of_seats;

                            System.out.println("After Correction");
                            System.out.println("buss_class_seat_booked= " + buss_class_seat_booked);
                            System.out.println("buss_class_seat_aval= " + buss_class_seat_aval);

                            String bsup = "UPDATE flight_details SET buss_class_seat_booked = ?, buss_class_seat_aval = ? WHERE flight_id= ?";
                            PreparedStatement pbsup = connection.prepareStatement(bsup);
                            pbsup.setInt(1, buss_class_seat_booked);
                            pbsup.setInt(2, buss_class_seat_aval);
                            pbsup.setString(3, flight_no);
                            int i1 = pbsup.executeUpdate();
                            if (i1 == 1) {
                                System.out.print("Update Seats Allingment Sucessfully For Business Class");
                            }

                            break;
                        case "Coach Class":
                            System.out.print("Executing Cancellation operations for Coach Class in flight_details");
                            int eco_class_seat_booked = 0, eco_class_seat_aval = 0;
                            String cs = "SELECT eco_class_seat_booked, eco_class_seat_aval FROM flight_details WHERE flight_id = ? ";
                            PreparedStatement pcs = connection.prepareStatement(cs);
                            pcs.setString(1, flight_no);
                            ResultSet rcs = pcs.executeQuery();
                            while (rcs.next()) {
                                eco_class_seat_booked = rcs.getInt(1);
                                eco_class_seat_aval = rcs.getInt(2);
                            }
                            System.out.println("eco_class_seat_booked= " + eco_class_seat_booked);
                            System.out.println("eco_class_seat_aval= " + eco_class_seat_aval);
                            eco_class_seat_booked = eco_class_seat_booked - no_of_seats;
                            eco_class_seat_aval = eco_class_seat_aval + no_of_seats;

                            System.out.println("After Correction");
                            System.out.println("eco_class_seat_booked= " + eco_class_seat_booked);
                            System.out.println("eco_class_seat_aval= " + eco_class_seat_aval);

                            String csup = "UPDATE flight_details SET eco_class_seat_booked = ?, eco_class_seat_aval = ? WHERE flight_id= ?";
                            PreparedStatement pcsup = connection.prepareStatement(csup);
                            pcsup.setInt(1, eco_class_seat_booked);
                            pcsup.setInt(2, eco_class_seat_aval);
                            pcsup.setString(3, flight_no);
                            int i2 = pcsup.executeUpdate();
                            if (i2 == 1) {
                                System.out.print("Update Seats Allingment Sucessfully For Coach Class");
                            }
                            break;
                        case "First Class":
                            System.out.print("Executing Cancellation operations for First Class in flight_details");
                            int first_class_seat_booked = 0, first_class_seat_aval = 0;
                            String fs = "SELECT first_class_seat_booked, first_class_seat_aval FROM flight_details WHERE flight_id = ? ";
                            PreparedStatement pfs = connection.prepareStatement(fs);
                            pfs.setString(1, flight_no);
                            ResultSet rfs = pfs.executeQuery();
                            while (rfs.next()) {
                                first_class_seat_booked = rfs.getInt(1);
                                first_class_seat_aval = rfs.getInt(2);
                            }
                            System.out.println("first_class_seat_booked= " + first_class_seat_booked);
                            System.out.println("first_class_seat_aval= " + first_class_seat_aval);

                            first_class_seat_booked = first_class_seat_booked - no_of_seats;
                            first_class_seat_aval = first_class_seat_aval + no_of_seats;

                            System.out.println("After Correction");
                            System.out.println("first_class_seat_booked= " + first_class_seat_booked);
                            System.out.println("first_class_seat_aval= " + first_class_seat_aval);
                            String fsup = "UPDATE flight_details SET first_class_seat_booked = ?, first_class_seat_aval = ? WHERE flight_id= ?";
                            PreparedStatement pfsup = connection.prepareStatement(fsup);
                            pfsup.setInt(1, first_class_seat_booked);
                            pfsup.setInt(2, first_class_seat_aval);
                            pfsup.setString(3, flight_no);
                            int i3 = pfsup.executeUpdate();
                            if (i3 == 1) {
                                System.out.print("Update Seats Allingment Sucessfully For Coach Class");
                            }
                            break;
                        default:
                            break;
                    }

                PreparedStatement ps1 = connection.prepareStatement("delete from payment_details where PNR=?");
                ps1.setString(1, PNR);
                int i1 = ps1.executeUpdate();
                if (i1 > 0) {
                    System.out.println("User successfully removed payment_details table...");
                }
                PreparedStatement ps2 = connection.prepareStatement("delete from booking_details where PNR=?");
                ps2.setString(1, PNR);
                int i2 = ps2.executeUpdate();
                if (i2 > 0) {
                    System.out.println("User successfully removed booking_details table...");
                }

                RequestDispatcher view = request.getRequestDispatcher("Cancellation_confirmed.jsp");
                view.forward(request, response);
                connection.close();
                System.out.println("Disconnected!");
            } else {
                RequestDispatcher error = request.getRequestDispatcher("Cacellation_failed.jsp");
                error.forward(request, response);
                connection.close();
                System.out.println("Disconnected!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("-------------------------------INSIDE CANCELLATION ----------------------");
    }

}