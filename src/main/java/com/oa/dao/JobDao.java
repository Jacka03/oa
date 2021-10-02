package com.oa.dao;


import com.github.pagehelper.Page;
import com.oa.pojo.Job;

public interface JobDao {

    Page<Job> findAll();

    Job queryJobById(Integer id);

    Integer update(Job job);

    Integer delete(Integer id);

    Integer add(Job job);
}
