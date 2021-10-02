package com.oa.dao;


import com.github.pagehelper.Page;
import com.oa.pojo.Employee;

public interface EmployeeDao {

    Page<Employee> findAll();

}
