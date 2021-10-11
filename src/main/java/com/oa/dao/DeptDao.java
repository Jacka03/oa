package com.oa.dao;

import com.github.pagehelper.Page;
import com.oa.pojo.Dept;
import com.oa.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface DeptDao {

    Page<Dept> findAll(String name);

    Dept queryDeptById(Integer id);

    boolean update(Dept dept);

    boolean delete(Integer id);

    boolean add(Dept dept);
}
