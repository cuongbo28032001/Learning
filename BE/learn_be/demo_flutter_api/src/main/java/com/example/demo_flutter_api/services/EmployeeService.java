package com.example.demo_flutter_api.services;

import com.example.demo_flutter_api.configs.ResponseConfig;
import com.example.demo_flutter_api.models.Employee;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface EmployeeService {
    ResponseConfig getAll(Pageable pageEmp);
    ResponseConfig save(Employee employee);
    ResponseConfig update(Employee employee);
    ResponseConfig remove(long id);
}
