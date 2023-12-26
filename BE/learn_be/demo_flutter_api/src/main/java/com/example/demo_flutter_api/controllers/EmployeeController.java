package com.example.demo_flutter_api.controllers;
import com.example.demo_flutter_api.configs.ResponseConfig;
import com.example.demo_flutter_api.models.Employee;
import com.example.demo_flutter_api.services.EmployeeService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/employee")
@RequiredArgsConstructor
public class EmployeeController{
    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ResponseConfig search(Employee employee,Pageable page){return this.employeeService.search(employee,page);}

    @RequestMapping(value = "/multi-search", method = RequestMethod.GET)
    public ResponseConfig searchOnlyOneTextBox(@RequestParam(name = "value") String value,Pageable page){
        return this.employeeService.searchOnlyOneTextBox(value,page);
    }

    @RequestMapping(value = "/created", method = RequestMethod.POST)
    public ResponseConfig created(@RequestBody Employee employee)
    {
        return this.employeeService.save(employee);
    }

    @RequestMapping(value = "/updated", method = RequestMethod.PUT)
    public ResponseConfig updated(@RequestBody Employee employee){return this.employeeService.update(employee);}

    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    public ResponseConfig remove(@RequestParam(name = "id") long id){return this.employeeService.remove(id);};

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ResponseConfig getDetail(@RequestParam(name = "id") long id){return this.employeeService.getDetail(id);}
}
