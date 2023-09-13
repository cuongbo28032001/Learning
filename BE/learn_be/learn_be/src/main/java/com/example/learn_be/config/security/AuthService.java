package com.example.learn_be.config.security;

import com.example.learn_be.commons.enums.Enums.Gender;
import com.example.learn_be.commons.enums.Role;
import com.example.learn_be.config.jwt.JwtService;
import com.example.learn_be.dtos.AuthResponeDTO;
import com.example.learn_be.models.User;
import com.example.learn_be.payload.AuthRequestDTO;
import com.example.learn_be.payload.RegisterRequestDTO;
import com.example.learn_be.services.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AuthService {

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private JwtService jwtService;

    @Autowired
    private AuthenticationManager authenticationManager;

    public AuthResponeDTO register(RegisterRequestDTO dto) {
        User person = new User();
        person.setUsername(dto.getUsername());
        person.setPassword(passwordEncoder.encode(dto.getPassword()));
        person.setGender(Gender.MALE);
        person.addRole(Role.ADMIN);
        person = userService.create(person);
        return new AuthResponeDTO(jwtService.generateToken(person.getUsername()), person.getUsername(), person.getEmail(), person.getRolesString());
    }

    public AuthResponeDTO authenticate(AuthRequestDTO dto) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        dto.getUsername(),
                        dto.getPassword()));
        final User person = userService.findByUserName(dto.getUsername());
        String token = jwtService.generateToken(person.getUsername());
        return new AuthResponeDTO(token, person.getUsername(), person.getEmail(), person.getRolesString());
    }
}
