package com.oa.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.oa.dao.UserDao;
import com.oa.pojo.User;
import com.oa.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public boolean addUser(User user) {
        return userDao.insert(user) > 0;
    }

    @Override
    public User queryUserById(Integer userid) {
        return userDao.queryUserById(userid);
    }

    @Override
    public Page<User> queryUser(Integer curPageNumber, Integer pageSize, String name) {

        PageHelper.startPage(curPageNumber, pageSize);
        Page<User> page = userDao.findAll(name);
        List<User> user1 = page.getResult();
        return page;

    }

    @Override
    public User login(String loginname, String password) {
        return userDao.queryUserByLoginnameAndPassword(loginname, password);
    }

    @Override
    public boolean updataUser(User user) {

        return userDao.update(user) > 0;
    }

    @Override
    public boolean deleteUser(Integer id) {
        return userDao.delete(id) > 0;
    }


}
