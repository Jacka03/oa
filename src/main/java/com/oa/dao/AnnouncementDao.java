package com.oa.dao;


import com.github.pagehelper.Page;
import com.oa.pojo.Announcement;
import org.apache.ibatis.annotations.Param;

public interface AnnouncementDao {

    // Integer insert(User user);
    //
    // User queryUserById(Integer userid);
    //
    // User queryUserByLoginnameAndPassword(@Param("loginname")String loginname, @Param("password")String password);
    //
    Page<Announcement> findAll(String title);

    boolean deleteAnnouncementById(Integer id);

    boolean insert(Announcement announcement);

    Announcement queryAnnouncementById(@Param("id") Integer id);

    boolean update(Announcement announcement);
    //
    // Integer update(User user);
    //
    // Integer delete(Integer id);
}
