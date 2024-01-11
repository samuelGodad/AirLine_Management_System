package com.sami.airline_management_system_project.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Coupon {
    private int coupon_id;
    private String coupon_code;
    private int coupon_discount;

    public Coupon(int coupon_id, String coupon_code, int coupon_discount) {
	this.coupon_id = coupon_id;
	this.coupon_code = coupon_code;
	this.coupon_discount = coupon_discount;
    }

    public Coupon() {
    }

}
