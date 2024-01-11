package com.sami.airline_management_system_project.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ContactUs {
    private String name;
    private String email;
    private String message;
    private String subject;

    public ContactUs() {
    }

    public ContactUs(String name, String email, String message, String subject) {
	this.name = name;
	this.email = email;
	this.message = message;
	this.subject = subject;

    }

}
