package com.oa.dao;

import com.github.pagehelper.Page;
import com.oa.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {

    Integer insert(User user);

    User queryUserById(Integer userid);

    User queryUserByLoginnameAndPassword(@Param("loginname")String loginname, @Param("password")String password);

    Page<User> findAll(String name);

    Integer update(User user);

    Integer delete(Integer id);
}
