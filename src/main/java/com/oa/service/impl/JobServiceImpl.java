package com.oa.service.impl;


import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.oa.dao.JobDao;
import com.oa.pojo.Job;
import com.oa.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobServiceImpl implements JobService {


    @Autowired
    private JobDao jobDao;

    @Override
    public Page<Job> queryJob(Integer curPageNumber, Integer pageSize) {

        PageHelper.startPage(curPageNumber, pageSize);
        Page<Job> page = jobDao.findAll();
        return page;
    }

    @Override
    public Job queryJobById(Integer id) {
        return jobDao.queryJobById(id);
    }

    @Override
    public boolean updateJob(Job job) {
        return jobDao.update(job) > 0;
    }

    @Override
    public boolean deleteJob(Integer id) {
        return jobDao.delete(id) > 0;
    }

    @Override
    public boolean addJob(Job job) {
        return jobDao.add(job) > 0;
    }

    @Override
    public Page<Job> queryJobList() {
        return jobDao.findAll();
    }
}
