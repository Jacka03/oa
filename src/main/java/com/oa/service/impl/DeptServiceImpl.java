package com.oa.service.impl;


import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.oa.dao.DeptDao;
import com.oa.pojo.Dept;
import com.oa.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {


    @Autowired
    private DeptDao deptDao;

    @Override
    public Page<Dept> queryDept(Integer curPageNumber, Integer pageSize) {

        PageHelper.startPage(curPageNumber, pageSize);
        Page<Dept> page = deptDao.findAll();
        List<Dept> user1 = page.getResult();
        return page;
    }

    @Override
    public Dept queryDeptById(Integer id) {
        return deptDao.queryDeptById(id);
    }

    @Override
    public boolean updateDept(Dept dept) {
        return deptDao.update(dept);
    }

    @Override
    public boolean deleteDept(Integer id) {
        return deptDao.delete(id);
    }

    @Override
    public boolean addDept(Dept dept) {
        return deptDao.add(dept);
    }
}
