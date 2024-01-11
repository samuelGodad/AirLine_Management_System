package com.sami.airline_management_system_project.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter

public class NewsLetters {
    private int id;
    private String email;

    public NewsLetters(int id, String email) {
	this.id = id;
	this.email = email;
    }

    public NewsLetters() {
    }

}
