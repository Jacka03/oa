package com.oa.controller;


import com.github.pagehelper.Page;
import com.oa.pojo.Job;
import com.oa.pojo.User;
import com.oa.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class JobController {

    @Autowired
    private JobService jobService;

    @Value("${pageSize}")
    private Integer pageSize;

    private String username;

    @GetMapping("/queryJob")
    public String queryJob(Model model,
                           @RequestParam(value="username",  required=false) String username,
                           @RequestParam(value="pn",  required=false) Integer curPageNumber) {

        this.username = username;
        if (curPageNumber == null) {
            curPageNumber = 1;
        }

        Page<Job> page = jobService.queryJob(curPageNumber, pageSize);


        model.addAttribute("username", username);
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
