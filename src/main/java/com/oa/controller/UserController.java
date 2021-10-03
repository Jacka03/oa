package com.oa.controller;

import com.github.pagehelper.Page;
import com.oa.pojo.Dept;
import com.oa.pojo.Job;
import com.oa.pojo.User;
import com.oa.service.DeptService;
import com.oa.service.JobService;
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
    public String login(Model model,
                        @RequestParam("loginname") String loginname,
                        @RequestParam("password") String password){

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
    public String queryUser(Model model,
                            @RequestParam(value="name",  required=false) String name,
                            @RequestParam(value="pn",  required=false, defaultValue = "1") Integer curPageNumber) {

        Page<User> page = userService.queryUser(curPageNumber, pageSize, name);
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
        System.out.println(user);

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


    @Autowired
    private DeptService deptService;


    @GetMapping("/queryDept")
    public String queryDept(Model model,
                            @RequestParam(value="pn",  required=false, defaultValue = "1") Integer curPageNumber) {

        Page<Dept> page = deptService.queryDept(curPageNumber, pageSize);

        model.addAttribute("NowUser", this.nowUser);
        model.addAttribute("deptList", page.getResult());
        model.addAttribute("pageInfo", page.toPageInfo());

        return "deptIndex";
    }


    /**
     * 增加用户
     * @param model
     * @return
     */
    @PostMapping("/insertDept")
    public String insertDept(Model model,
                             @RequestParam(value="name",  required=false) String name,
                             @RequestParam(value="remark",  required=false) String remark) {

        Dept dept = new Dept(name, remark);

        //2、调用业务层方法实现功能
        boolean flag = deptService.addDept(dept);

        //3、作出响应--跳转页面
        if (flag) {//成功则跳转到首页
            return "redirect:queryDept.action";
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
    @GetMapping("/toUpdateDept")
    public String toUpdateDept(Model model, @RequestParam(value="id") Integer id) {

        //1、获取id，根据id查询user
        Dept dept = deptService.queryDeptById(id);
        //2、保存user对象数据保存在属性作用
        model.addAttribute("dept", dept);
        //3、跳转UserUpdate.jsp页面

        return "deptUpdate";
    }

    /**
     * 更新用户
     * @param model
     * @param id
     * @return
     */
    @PostMapping("/updateDept")
    public String updateDept(Model model,
                             @RequestParam(value="id",  required=false) Integer id,
                             @RequestParam(value="name",  required=false) String name,
                             @RequestParam(value="remark",  required=false) String remark) {

        Dept dept = new Dept(id, name, remark);

        boolean flag = deptService.updateDept(dept);


        if(flag) {
            return "redirect:queryDept.action";
        }
        return "redirect:toUpdateDept.action?id="+id;

    }

    /**
     * 删除用户
     * @param model
     * @param id
     * @return
     */
    @GetMapping("/deleteDept")
    public String deleteDept(Model model, @RequestParam(value="id") Integer id) {

        boolean flag = deptService.deleteDept(id);
        if(flag) {
            return "redirect:queryDept.action";
        }
        return null;

    }

    @Autowired
    private JobService jobService;

    @GetMapping("/queryJob")
    public String queryJob(Model model,
                           @RequestParam(value="pn",  required=false, defaultValue = "1") Integer curPageNumber) {


        Page<Job> page = jobService.queryJob(curPageNumber, pageSize);


        model.addAttribute("NowUser", this.nowUser);
        model.addAttribute("jobList", page.getResult());
        model.addAttribute("pageInfo", page.toPageInfo());

        return "jobIndex";
    }


    /**
     * 增加用户
     * @param model
     * @return
     */
    @PostMapping("/insertJob")
    public String insertJob(Model model,
                            @RequestParam(value="name",  required=false) String name,
                            @RequestParam(value="remark",  required=false) String remark) {

        Job job = new Job(name, remark);

        //2、调用业务层方法实现功能
        boolean flag = jobService.addJob(job);

        //3、作出响应--跳转页面
        if (flag) {//成功则跳转到首页
            return "redirect:queryJob.action";
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
    @GetMapping("/toUpdateJob")
    public String toUpdateJob(Model model, @RequestParam(value="id") Integer id) {

        //1、获取id，根据id查询user
        Job job = jobService.queryJobById(id);
        //2、保存user对象数据保存在属性作用
        model.addAttribute("job", job);
        //3、跳转UserUpdate.jsp页面

        return "jobUpdate";
    }

    /**
     * 更新用户
     * @param model
     * @param id
     * @return
     */
    @PostMapping("/updateJob")
    public String updateJob(Model model,
                            @RequestParam(value="id",  required=false) Integer id,
                            @RequestParam(value="name",  required=false) String name,
                            @RequestParam(value="remark",  required=false) String remark) {

        Job job = new Job(id, name, remark);

        boolean flag = jobService.updateJob(job);


        if(flag) {
            return "redirect:queryJob.action";
        }
        return "redirect:toUpdateJob.action?id="+id;

    }

    /**
     * 删除用户
     * @param model
     * @param id
     * @return
     */
    @GetMapping("/deleteJob")
    public String deleteJob(Model model, @RequestParam(value="id") Integer id) {

        boolean flag = jobService.deleteJob(id);
        if(flag) {
            return "redirect:queryJob.action";
        }
        return null;

    }




}
