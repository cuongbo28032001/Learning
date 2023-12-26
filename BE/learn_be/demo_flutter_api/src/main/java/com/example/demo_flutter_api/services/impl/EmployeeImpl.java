package com.example.demo_flutter_api.services.impl;

import com.example.demo_flutter_api.configs.ResponseConfig;
import com.example.demo_flutter_api.models.Employee;
import com.example.demo_flutter_api.repositories.EmployeeRepository;
import com.example.demo_flutter_api.services.EmployeeService;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.io.Serial;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static com.example.demo_flutter_api.configs.consts.StatusCode.Status.*;

@Service
public class EmployeeImpl implements EmployeeService {
    @Autowired
    private EmployeeRepository employeeRepository;

    @Override
    public ResponseConfig search(Employee employee, Pageable page) {
        ResponseConfig<Page<Employee>> responseConfig = new ResponseConfig<Page<Employee>>();
        try {
            Specification<Employee> specification = new Specification<Employee>() {
                @Serial
                private static final long serialVersionUID = 1L;
                @Override
                public Predicate toPredicate(@NotNull Root<Employee> root, @NotNull CriteriaQuery<?> query,
                                             CriteriaBuilder criteriaBuilder) {
                    List<Predicate> predicates = new ArrayList<>();
                    //add điều kiện tìm kiếm ở đây
                    if(employee.getName() != null){
                        predicates.add(criteriaBuilder.and(criteriaBuilder.like(root.get("name"), "%"+employee.getName()+"%")));
                    }
                    if(employee.getEmail() != null){
                        predicates.add(criteriaBuilder.and(criteriaBuilder.like(root.get("email"), "%"+employee.getEmail()+"%")));
                    }
                    return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
                }
            };
            responseConfig.setErrorCode(THANHCONG);
            responseConfig.setErrorMessage("Thành công");
            Page<Employee> page1 = employeeRepository.findAll(specification, page);
            responseConfig.setData(page1);
            return responseConfig;
        } catch (Exception e) {
            e.printStackTrace();
            responseConfig.setErrorCode(LOI);
        }
        return responseConfig;
    }

    @Override
    public ResponseConfig searchOnlyOneTextBox(String value, Pageable page) {
        ResponseConfig<Page<Employee>> responseConfig = new ResponseConfig<Page<Employee>>();
        try {
            Specification<Employee> specification = new Specification<Employee>() {
                @Serial
                private static final long serialVersionUID = 1L;
                @Override
                public Predicate toPredicate(@NotNull Root<Employee> root, @NotNull CriteriaQuery<?> query,
                                             CriteriaBuilder criteriaBuilder) {
                    List<Predicate> predicates = new ArrayList<>();
                    //add điều kiện tìm kiếm ở đây

                    if(value != null){
                        predicates.add(criteriaBuilder.or(criteriaBuilder.like(root.get("name"), "%"+value+"%"), criteriaBuilder.like(root.get("email"), "%"+value+"%")));
                    }
                    return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
                }
            };
            responseConfig.setErrorCode(THANHCONG);
            responseConfig.setErrorMessage("Thành công");
            Page<Employee> page1 = employeeRepository.findAll(specification, page);
            responseConfig.setData(page1);
            return responseConfig;
        } catch (Exception e) {
            e.printStackTrace();
            responseConfig.setErrorCode(LOI);
        }
        return responseConfig;
    }


    @Override
    public ResponseConfig save(Employee employee) {
        ResponseConfig responseConfig = new ResponseConfig();
        try{

            if(employeeRepository.existsByEmail(employee.getEmail()))
            {
                responseConfig.setErrorCode(KHONGTHANHCONG);
                responseConfig.setErrorMessage("Email đã tồn tại trên hệ thống!");
                return responseConfig;
            }
            responseConfig.setErrorCode(THANHCONG);
            responseConfig.setData(this.employeeRepository.save(employee));
            return responseConfig;
        }catch (Exception e)
        {
            e.printStackTrace();
            responseConfig.setErrorCode(LOI);
        }
        return responseConfig;
    }

    @Override
    public ResponseConfig update(Employee employee) {
        ResponseConfig<Employee> responseConfig = new ResponseConfig<>();
        Optional<Employee> optionalEmployee = employeeRepository.findById(employee.getId());
        try {
            if(!optionalEmployee.isPresent()){
                responseConfig.setErrorCode(KHONGTHANHCONG);
                responseConfig.setErrorMessage("Không tìm thấy bản ghi!");
                return responseConfig;
            }
            Employee employeeOld = optionalEmployee.get();
            if(employee.getName()!= null)
            {
                employeeOld.setName(employee.getName());
            }
            if(employee.getEmail()!= null)
            {
                employeeOld.setEmail(employee.getEmail());
            }

            employeeRepository.save(employeeOld);
            responseConfig.setErrorCode(THANHCONG);
            responseConfig.setErrorMessage("Thành công");
            responseConfig.setData(employeeOld);
            return responseConfig;

        }catch (Exception e)
        {
            e.printStackTrace();
            responseConfig.setErrorCode(LOI);
        }
        return responseConfig;
    }

    @Override
    public ResponseConfig remove(long id) {
        ResponseConfig responseConfig = new ResponseConfig();
        try{
            if(!employeeRepository.existsById(id)){
                responseConfig.setErrorCode(KHONGTHANHCONG);
                responseConfig.setErrorMessage("Không tìm thấy bản ghi!");
                return responseConfig;
            }
            employeeRepository.deleteById(id);
            responseConfig.setErrorCode(THANHCONG);
            responseConfig.setErrorMessage("Thành công");
            return responseConfig;
        }catch (Exception e){
            e.printStackTrace();
            responseConfig.setErrorCode(LOI);
        }
        return  responseConfig;
    }

    @Override
    public ResponseConfig getDetail(long id) {
        ResponseConfig responseConfig = new ResponseConfig();
        Optional<Employee> employeeOptional = employeeRepository.findById(id);
        try {
            if(!employeeOptional.isPresent())
            {
                responseConfig.setErrorCode(KHONGTHANHCONG);
                responseConfig.setErrorMessage("Không tìm thấy bản ghi!");
                return responseConfig;
            }
            responseConfig.setErrorCode(THANHCONG);
            responseConfig.setErrorMessage("Thành công");
            responseConfig.setData(employeeOptional.get());
            return responseConfig;

        }catch (Exception e)
        {
            e.printStackTrace();
            responseConfig.setErrorCode(LOI);
        }
        return responseConfig;
    }
}
