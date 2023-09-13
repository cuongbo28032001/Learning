package com.example.learn_be.dtos;

import lombok.Data;

import java.util.List;

@Data
public class AuthResponeDTO {
    private String username;

    private String email;

    private String tokenType = "Bearer";

    private String token;

    private List<String> roles;

    public AuthResponeDTO(String token, String username, String email, List<String> roles) {
        this.username = username;
        this.email = email;
        this.token = token;
        this.roles = roles;
    }

    public AuthResponeDTO() {
    }

}
