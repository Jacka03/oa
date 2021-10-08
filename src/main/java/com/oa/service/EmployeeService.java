package com.oa.service;

import com.github.pagehelper.Page;
import com.oa.pojo.Employee;


public interface EmployeeService {

    Page<Employee> queryEmployee(Integer curPageNumber, Integer pageSize);

    boolean addEmployee(Employee employee);
}
