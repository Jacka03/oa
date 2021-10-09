package com.oa.dao;


import com.github.pagehelper.Page;
import com.oa.pojo.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeDao {

    Page<Employee> findAll(@Param("name")String name, @Param("deptId")Integer deptId);

    boolean insert(Employee employee);

    boolean delete(Integer id);

    Employee queryEmployeeById(Integer id);

    Integer update(Employee employee);
}
