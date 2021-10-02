package com.oa.service;

import com.oa.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserServiceTest {
    @Autowired
    private UserService userService;

    @Test
    public void test1() {
        User user = userService.queryUserById(1);
        // System.out.println(user);
    }

    @Test
    public void test2() {
        User user = userService.login("admin", "123456");
        System.out.println(user);
    }

}
