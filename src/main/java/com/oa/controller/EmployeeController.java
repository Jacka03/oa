package com.oa.controller;

import com.github.pagehelper.Page;
import com.oa.pojo.Dept;
import com.oa.pojo.Employee;
import com.oa.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @Value("${pageSize}")
    private Integer pageSize;

    @GetMapping("/queryEmployee")
    public String queryEmployee(Model model, @RequestParam(value = "pn", required = false) Integer curPageNumber) {

        if (curPageNumber == null) {
            curPageNumber = 1;
        }

        Page<Employee> page = employeeService.queryEmployee(curPageNumber, pageSize);
        List<Employee> result = page.getResult();
        for (Employee employee : result) {
            System.out.println(employee);
        }

        model.addAttribute("employeeList", page.getResult());
        model.addAttribute("pageInfo", page.toPageInfo());

        return "employeeIndex";
    }


}
