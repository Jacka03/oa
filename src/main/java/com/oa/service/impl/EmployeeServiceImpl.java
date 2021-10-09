package com.oa.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
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
    public Page<Employee> queryEmployee(Integer curPageNumber, Integer pageSize, String name, Integer deptId) {

        PageHelper.startPage(curPageNumber, pageSize);
        Page<Employee> employees = employeeDao.findAll(name, deptId);
        return employees;
    }

    @Override
    public boolean addEmployee(Employee employee) {
        return employeeDao.insert(employee);
    }

    @Override
    public boolean deleteEmployee(Integer id) {
        return employeeDao.delete(id);
    }

    @Override
    public Employee queryEmployeeById(Integer id) {
        return employeeDao.queryEmployeeById(id);
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        return employeeDao.update(employee) > 0;
    }
}
