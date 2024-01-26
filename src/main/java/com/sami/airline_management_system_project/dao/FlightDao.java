package com.sami.airline_management_system_project.dao;

import com.sami.airline_management_system_project.db.DataBaseConnector;
import com.sami.airline_management_system_project.model.Flight;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FlightDao {
    private Connection conn;

    public FlightDao() throws SQLException {
	this.conn = DataBaseConnector.getConnection();
    }

    private Flight extractFlightFromResultSet(ResultSet rs) throws SQLException {
	Flight flight = new Flight();
	flight.setFlightId(rs.getString("flight_id"));
	flight.setFlightName(rs.getString("flight_name"));
	flight.setFlightNo(rs.getString("flight_no"));
	flight.setFromCity(rs.getString("from_city"));
	flight.setToCity(rs.getString("to_city"));
	flight.setDateOfFlight(rs.getString("date_of_flight"));
	flight.setFlightArrivalTime(rs.getString("flight_arrival_time"));
	flight.setFlightReachTime(rs.getString("flight_reach_time"));
	flight.setDuration(rs.getString("duration"));
	flight.setFirstClassSeat(rs.getInt("first_class_seat"));
	flight.setFirstClassSeatBooked(rs.getInt("first_class_seat_booked"));
	flight.setFirstClassSeatAval(rs.getInt("first_class_seat_aval"));
	flight.setBussClassSeat(rs.getInt("buss_class_seat"));
	flight.setBussClassSeatBooked(rs.getInt("buss_class_seat_booked"));
	flight.setBussClassSeatAval(rs.getInt("buss_class_seat_aval"));
	flight.setEcoClassSeat(rs.getInt("eco_class_seat"));
	flight.setEcoClassSeatBooked(rs.getInt("eco_class_seat_booked"));
	flight.setEcoClassSeatAval(rs.getInt("eco_class_seat_aval"));
	flight.setFirstClassPrice(rs.getDouble("first_class_price"));
	flight.setBussClassPrice(rs.getDouble("buss_class_price"));
	flight.setEcoClassPrice(rs.getDouble("eco_class_price"));
	return flight;

    }

    private void setFlightParameters(PreparedStatement stmt, Flight flight) throws SQLException {
	stmt.setString(1, flight.getFlightNo());
	stmt.setString(2, flight.getFlightName());
	stmt.setString(3, flight.getFromCity());
	stmt.setString(4, flight.getToCity());
	stmt.setString(5, flight.getDateOfFlight());
	stmt.setString(6, flight.getFlightArrivalTime());
	stmt.setString(7, flight.getFlightReachTime());
	stmt.setString(8, flight.getDuration());
	stmt.setInt(9, flight.getFirstClassSeat());
	stmt.setInt(10, flight.getFirstClassSeatBooked());
	stmt.setInt(11, flight.getFirstClassSeatAval());
	stmt.setInt(12, flight.getBussClassSeat());
	stmt.setInt(13, flight.getBussClassSeatBooked());
	stmt.setInt(14, flight.getBussClassSeatAval());
	stmt.setInt(15, flight.getEcoClassSeat());
	stmt.setInt(16, flight.getEcoClassSeatBooked());
	stmt.setInt(17, flight.getEcoClassSeatAval());
	stmt.setDouble(18, flight.getFirstClassPrice());
	stmt.setDouble(19, flight.getBussClassPrice());
	stmt.setDouble(20, flight.getEcoClassPrice());
	stmt.setString(21, flight.getFlightId());
    }

    public boolean updateFlights(List<Flight> flights) {
	String sql = "UPDATE flight_details SET " +
		"flight_no = ?, " +
		"flight_name = ?, " +
		"from_city = ?, " +
		"to_city = ?, " +
		"date_of_flight = ?, " +
		"flight_arrival_time = ?, " +
		"flight_reach_time = ?, " +
		"duration = ?, " +
		"first_class_seat = ?, " +
		"first_class_seat_booked = ?, " +
		"first_class_seat_aval = ?, " +
		"buss_class_seat = ?, " +
		"buss_class_seat_booked = ?, " +
		"buss_class_seat_aval = ?, " +
		"eco_class_seat = ?, " +
		"eco_class_seat_booked = ?, " +
		"eco_class_seat_aval = ?, " +
		"first_class_price = ?, " +
		"buss_class_price = ?, " +
		"eco_class_price = ? WHERE flight_id = ?";

	try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	    for (Flight flight : flights) {
		setFlightParameters(stmt, flight);
		stmt.addBatch();
	    }

	    int[] rowsAffectedArray = stmt.executeBatch();

	    // Check if any rows were affected
	    for (int rowsAffected : rowsAffectedArray) {
		if (rowsAffected <= 0) {
		    return false; // At least one batch update failed
		}
	    }

	    return true; // All batch updates were successful
	} catch (SQLException e) {
	    e.printStackTrace();
	    return false;
	}
    }

    public boolean addFlight(Flight flight) {
	String sql = "INSERT INTO flight_details (flight_no, flight_name, from_city, to_city, date_of_flight, flight_arrival_time, flight_reach_time, duration, first_class_seat, first_class_seat_booked, first_class_seat_aval, buss_class_seat, buss_class_seat_booked, buss_class_seat_aval, eco_class_seat, eco_class_seat_booked, eco_class_seat_aval, first_class_price, buss_class_price, eco_class_price, flight_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	    setFlightParameters(stmt, flight);
	    int rowsAffected = stmt.executeUpdate();
	    return rowsAffected > 0;
	} catch (SQLException e) {
	    e.printStackTrace();
	    return false;
	}
    }



    public boolean updateFlight(Flight flight) {
	String sql = "UPDATE flight_details SET flight_no = ?, flight_name = ?, from_city = ?, to_city = ?, date_of_flight = ?, flight_arrival_time = ?, flight_reach_time = ?, duration = ?, first_class_seat = ?, first_class_seat_booked = ?, first_class_seat_aval = ?, buss_class_seat = ?, buss_class_seat_booked = ?, buss_class_seat_aval = ?, eco_class_seat = ?, eco_class_seat_booked = ?, eco_class_seat_aval = ?, first_class_price = ?, buss_class_price = ?, eco_class_price = ? WHERE flight_id = ?";
	try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	    setFlightParameters(stmt, flight);
	    stmt.setString(21, flight.getFlightId());
	    int rowsAffected = stmt.executeUpdate();
	    return rowsAffected > 0;
	} catch (SQLException e) {
	    e.printStackTrace();
	    return false;
	}
    }

    public List<Flight> getFlightById(String flightId) {
	List<Flight> flights = new ArrayList<>();
	try {

	    Connection conn = DataBaseConnector.getConnection();
	    PreparedStatement ps = conn.prepareStatement("SELECT * FROM flight_details WHERE flight_id = ?");
	    ps.setString(1, flightId);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		flights.add(extractFlightFromResultSet(rs));
	    }

	} catch (Exception e) {
	    e.printStackTrace();
	}
	return flights;
    }

    public List<Flight> getAllFlights() {
	List<Flight> flights = new ArrayList<>();
	try {
	    Connection conn = DataBaseConnector.getConnection();
	    PreparedStatement ps = conn.prepareStatement("SELECT * FROM flight_details");
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		flights.add(extractFlightFromResultSet(rs));
	    }

	} catch (Exception e) {
	    e.printStackTrace();
	}
	return flights;
    }

    public List<Flight> getFlightByFlightName(String flightName) {
	List<Flight> flights = new ArrayList<>();
	try {

	    Connection conn = DataBaseConnector.getConnection();
	    PreparedStatement ps = conn.prepareStatement("SELECT * FROM flight_details WHERE flight_name = ?");
	    ps.setString(1, flightName);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		flights.add(extractFlightFromResultSet(rs));

	    }

	} catch (Exception e) {
	    e.printStackTrace();
	}
	return flights;
    }

    public List<Flight> getFlightByFlightNo(String flightNo) {
	List<Flight> flights = new ArrayList<>();
	try {
	    Connection conn = DataBaseConnector.getConnection();
	    PreparedStatement ps = conn.prepareStatement("SELECT * FROM flight_details WHERE flight_no = ?");
	    ps.setString(1, flightNo);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		flights.add(extractFlightFromResultSet(rs));
	    }
	} catch (Exception e) {
	    e.printStackTrace();
	}
	return flights;
    }


    public List<Flight> getFlightByFromAndToCity(String fromCity, String toCity) {
	List<Flight> flights = new ArrayList<>();
	try {
	    Connection conn = DataBaseConnector.getConnection();
	    PreparedStatement ps = conn.prepareStatement("SELECT * FROM flight_details WHERE from_city = ? AND to_city = ?");
	    ps.setString(1, fromCity);
	    ps.setString(2, toCity);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		flights.add(extractFlightFromResultSet(rs));

	    }

	} catch (Exception e) {
	    e.printStackTrace();
	}
	return flights;

    }

}