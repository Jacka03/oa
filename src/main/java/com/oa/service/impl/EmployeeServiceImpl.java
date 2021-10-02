package com.oa.service.impl;

import com.github.pagehelper.Page;
import com.oa.dao.EmployeeDao;
import com.oa.pojo.Dept;
import com.oa.pojo.Employee;
import com.oa.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;

    @Override
    public Page<Employee> queryEmployee(Integer curPageNumber, Integer pageSize) {
        return employeeDao.findAll();
    }
}
