package com.sami.airline_management_system_project.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserBooking {
    private String username;
    private String flight_no;
    private String date_of_flight;
    private int no_of_seats;
    private String ticket_type;
    private int adults;
    private int child;
    private String pnr;

    public UserBooking() {
    }

    public UserBooking(String username, String flight_no, String date_of_flight, int no_of_seats, String ticket_type, int adults, int child, String pnr) {
	this.username = username;
	this.flight_no = flight_no;
	this.date_of_flight = date_of_flight;
	this.no_of_seats = no_of_seats;
	this.ticket_type = ticket_type;
	this.adults = adults;
	this.child = child;
	this.pnr = pnr;


    }


}
