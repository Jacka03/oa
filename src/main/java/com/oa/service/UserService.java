package com.oa.service;

import com.github.pagehelper.Page;
import com.oa.pojo.User;

public interface UserService {

    public boolean addUser(User user);

    public User queryUserById(Integer userid);

    public Page<User> queryUser(Integer curPageNumber, Integer pageSize);

    public User login(String loginname, String password);


    boolean updataUser(User user);

    boolean deleteUser(Integer id);
}
