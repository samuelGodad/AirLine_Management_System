package com.sami.airline_management_system_project.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Flight{
    private String flightId;
    private String flightNo;
    private String flightName;
    private String fromCity;
    private String toCity;
    private String dateOfFlight;
    private String flightArrivalTime;
    private String flightReachTime;
    private String duration;
    private int firstClassSeat;
    private int firstClassSeatBooked;
    private int firstClassSeatAval;
    private int bussClassSeat;
    private int bussClassSeatBooked;
    private int bussClassSeatAval;
    private int ecoClassSeat;
    private int ecoClassSeatBooked;
    private int ecoClassSeatAval;
    private double firstClassPrice;
    private double bussClassPrice;
    private double ecoClassPrice;


}
