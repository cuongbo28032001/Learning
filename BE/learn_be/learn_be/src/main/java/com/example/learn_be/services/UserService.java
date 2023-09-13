package com.example.learn_be.services;

import com.example.learn_be.models.User;

import java.util.List;

public interface UserService {

    User save(User person);

    List<User> findAll();

    void delete(Long id);

    User findByID(Long id);

    User findByUserName(String userName);

    User create(User person);
}
