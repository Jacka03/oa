package com.oa.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.oa.dao.AnnouncementDao;
import com.oa.pojo.Announcement;
import com.oa.service.AnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnnouncementServiceImpl implements AnnouncementService {

    @Autowired
    private AnnouncementDao announcementDao;

    @Override
    public Page<Announcement> queryAnnouncement(Integer curPageNumber, Integer pageSize, String title) {
        PageHelper.startPage(curPageNumber, pageSize);
        Page<Announcement> page = announcementDao.findAll(title);
        return page;
    }

    @Override
    public boolean deleteAnnouncement(Integer id) {
        return announcementDao.deleteAnnouncementById(id);
    }

    @Override
    public boolean add(Announcement announcement) {
        return announcementDao.insert(announcement);
    }

    @Override
    public Announcement queryAnnouncementById(Integer id) {
        return announcementDao.queryAnnouncementById(id);
    }

    @Override
    public boolean updateAnnouncement(Announcement announcement) {
        return announcementDao.update(announcement);
    }
}
