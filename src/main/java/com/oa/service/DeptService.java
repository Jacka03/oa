package com.oa.service;


import com.github.pagehelper.Page;
import com.oa.pojo.Dept;

public interface DeptService {

    Page<Dept> queryDept(Integer curPageNumber, Integer pageSize);

    Dept queryDeptById(Integer id);

    boolean updateDept(Dept dept);

    boolean deleteDept(Integer id);

    boolean addDept(Dept dept);
}
