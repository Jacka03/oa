package com.oa.controller;


import com.github.pagehelper.Page;
import com.oa.pojo.Dept;
import com.oa.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/")
public class DeptController {

    @Autowired
    private DeptService deptService;

    @Value("${pageSize}")
    private Integer pageSize;

    private String username;

    @GetMapping("/queryDept")
    public String queryDept(Model model,
                            @RequestParam(value="username",  required=false) String username,
                            @RequestParam(value="pn",  required=false) Integer curPageNumber) {

        this.username = username;
        if (curPageNumber == null) {
            curPageNumber = 1;
        }

        Page<Dept> page = deptService.queryDept(curPageNumber, pageSize);

        model.addAttribute("username", username);
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

}
