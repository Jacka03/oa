package com.oa.service;

import com.github.pagehelper.Page;
import com.oa.pojo.Employee;


public interface EmployeeService {

    Page<Employee> queryEmployee(Integer curPageNumber, Integer pageSize, String name, Integer deptId);

    boolean addEmployee(Employee employee);

    boolean deleteEmployee(Integer id);

    Employee queryEmployeeById(Integer id);

    boolean updateEmployee(Employee employee);
}
