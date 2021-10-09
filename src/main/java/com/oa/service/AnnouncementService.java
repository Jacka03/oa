package com.oa.service;


import com.github.pagehelper.Page;
import com.oa.pojo.Announcement;

public interface AnnouncementService {

    public Page<Announcement> queryAnnouncement(Integer curPageNumber, Integer pageSize, String title);

    boolean deleteAnnouncement(Integer id);

    boolean add(Announcement announcement);

    Announcement queryAnnouncementById(Integer id);

    boolean updateAnnouncement(Announcement announcement);

    // public boolean addUser(User user);
    //
    // public User queryUserById(Integer userid);
    //
    // public Page<User> queryUser(Integer curPageNumber, Integer pageSize, String name);
    //
    // public User login(String loginname, String password);
    //
    //
    // boolean updateUser(User user);
    //
    // boolean deleteUser(Integer id);
}
