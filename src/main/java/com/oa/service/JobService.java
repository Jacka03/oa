package com.oa.service;


import com.github.pagehelper.Page;
import com.oa.pojo.Job;

public interface JobService {

    Page<Job> queryJob(Integer curPageNumber, Integer pageSize);

    Job queryJobById(Integer id);

    boolean updateJob(Job job);

    boolean deleteJob(Integer id);

    boolean addJob(Job job);

    Page<Job> queryJobList();
}
