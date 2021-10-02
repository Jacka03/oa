package com.oa.controller;

import com.github.pagehelper.Page;
import com.oa.pojo.User;
import com.oa.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("/")
public class UserController {

    @Autowired
    private UserService userService;

    @Value("${pageSize}")
    private Integer pageSize;

    private User nowUser;

    @GetMapping("/loginUser")
    public String login(Model model, @RequestParam("loginname") String loginname, @RequestParam("password") String password){
        // System.out.println(pageSize);
        User user = userService.login(loginname, password);
        this.nowUser = user;
        if(user != null) {
            model.addAttribute("NowUser", user);
            return  "index";
        }else {
            return null;
        }
    }

    @GetMapping("/queryUser")
    public String queryUser(Model model, @RequestParam(value="pn",  required=false) Integer curPageNumber) {

        if (curPageNumber == null) {
            curPageNumber = 1;
        }

        Page<User> page = userService.queryUser(curPageNumber, pageSize);
        model.addAttribute("NowUser", this.nowUser);
        model.addAttribute("userList", page.getResult());
        model.addAttribute("pageInfo", page.toPageInfo());

        return "userIndex";
    }


    /**
     * 增加用户
     * @param model
     * @param loginname
     * @param password
     * @param status
     * @param username
     * @param filepart
     * @return
     */
    @PostMapping("/insertUser")
    public String insertUser(Model model,
                              @RequestParam(value="loginname",  required=false) String loginname,
                              @RequestParam(value="password",  required=false) String password,
                              @RequestParam(value="status",  required=false) Integer status,
                              @RequestParam(value="username",  required=false) String username,
                              @RequestPart(value="filepart",  required=false) MultipartFile filepart) {

        String imgname = filepart.getOriginalFilename();
        //创建user对象将数据进行封装
        User user = new User(username, password, loginname, status, imgname);
        System.out.println(filepart);
        try {
            filepart.transferTo(new File("E:/code/实训/file/"+imgname));
        } catch (IOException e) {
            e.printStackTrace();
        }

        //2、调用业务层方法实现功能
        boolean flag = userService.addUser(user);

        //3、作出响应--跳转页面
        if (flag) {//成功则跳转到首页
            return "redirect:queryUser.action";
        }//失败跳转回到登录页面
        // TODO
        return "login";
    }


    /**
     * 根据id查询将要修改的用户
     * @param model
     * @param id
     * @return
     */
    @GetMapping("/toUpdateUser")
    public String toUpdateUser(Model model, @RequestParam(value="id") Integer id) {

        //1、获取id，根据id查询user
        User user = userService.queryUserById(id);
        //2、保存user对象数据保存在属性作用
        model.addAttribute("user", user);
        //3、跳转UserUpdate.jsp页面

        return "userUpdate";
    }


    /**
     * 更新用户
     * @param model
     * @param id
     * @param loginname
     * @param password
     * @param status
     * @param username
     * @param filepart
     * @return
     */
    @PostMapping("/updateUser")
    public String updateUser(Model model,
                                @RequestParam(value="id",  required=false) Integer id,
                                @RequestParam(value="loginname",  required=false) String loginname,
                                @RequestParam(value="password",  required=false) String password,
                                @RequestParam(value="status",  required=false) Integer status,
                                @RequestParam(value="username",  required=false) String username,
                                @RequestPart(value="filepart",  required=false) MultipartFile filepart) {

        String imgname = filepart.getOriginalFilename();

        // System.out.println(imgname);
        User user = new User(id, username, password, loginname, status, imgname);
        if(user.getId().equals(this.nowUser.getId())) {
            this.nowUser = user;
        }

        boolean flag = userService.updataUser(user);
        model.addAttribute("NowUser", this.nowUser);

        if(flag) {
            return "redirect:queryUser.action";
        }
        return "redirect:toUpdateUser.action?id="+id;

    }

    /**
     * 删除用户
     * @param model
     * @param id
     * @return
     */
    @GetMapping("/deleteUser")
    public String deleteUser(Model model, @RequestParam(value="id") Integer id) {

        boolean flag = userService.deleteUser(id);
        if(flag) {
            return "redirect:queryUser.action";
        }
        return null;

    }

}
