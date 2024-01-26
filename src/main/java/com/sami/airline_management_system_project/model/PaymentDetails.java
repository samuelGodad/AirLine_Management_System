package com.sami.airline_management_system_project.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PaymentDetails {
    private String pnr;
    private String transactionId;
    private String address;
    private String payment_getway;
    private int  fare;
    private String coupon;
    private String payment_id;
    private int discount;
    private int actual_fare;
    public PaymentDetails() {
    }

}
