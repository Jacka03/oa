package com.oa.controller;

import com.github.pagehelper.Page;
import com.oa.pojo.*;
import com.oa.service.*;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
// import java.util.Date;
import java.net.URLEncoder;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/")
public class UserController {

    @Autowired
    private UserService userService;

    @Value("${pageSize}")
    private Integer pageSize;

    @Value("${filepath}")
    private String filepath;

    // 保存当前登录用户的信息
    private User nowUser;

    private Page<Dept> depts;
    private Page<Job> jobs;

    @GetMapping("/loginUser")
    public String login(Model model,
                        HttpServletRequest request,
                        @RequestParam("loginname") String loginname,
                        @RequestParam("password") String password) {

        User user = userService.login(loginname, password);
        this.nowUser = user;
        if (user != null) {
            String temPath = filepath + this.nowUser.getImgname();

            model.addAttribute("NowUser", user);
            model.addAttribute("filepath", temPath);

            depts = deptService.queryDeptList();
            jobs = jobService.queryJobList();
            model.addAttribute("deptList", depts.getResult());
            model.addAttribute("jobList", jobs.getResult());

            return "index";
        } else {
            // System.out.println("err");
            return null;
        }
    }

    @GetMapping("/queryUser")
    public String queryUser(Model model,
                            @RequestParam(value = "name", required = false) String name,
                            @RequestParam(value = "pn", required = false, defaultValue = "1") Integer curPageNumber) {

        Page<User> page = userService.queryUser(curPageNumber, pageSize, name);

        model.addAttribute("NowUser", this.nowUser);

        depts = deptService.queryDeptList();
        jobs = jobService.queryJobList();
        model.addAttribute("deptList", depts.getResult());
        model.addAttribute("jobList", jobs.getResult());

        model.addAttribute("userList", page.getResult());
        model.addAttribute("pageInfo", page.toPageInfo());

        return "userIndex";
    }


    /**
     * 增加用户
     *
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
                             @RequestParam(value = "loginname", required = false) String loginname,
                             @RequestParam(value = "password", required = false) String password,
                             @RequestParam(value = "status", required = false) Integer status,
                             @RequestParam(value = "username", required = false) String username,
                             @RequestPart(value = "filepart", required = false) MultipartFile filepart) {

        String imgname = filepart.getOriginalFilename();
        //创建user对象将数据进行封装
        User user = new User(username, password, loginname, status, imgname);
        // System.out.println(filepart);
        boolean flag = false;
        try {
            filepart.transferTo(new File(filepath + imgname));

            flag = userService.addUser(user);

        } catch (Exception e) {
            e.printStackTrace();
        }
        //2、调用业务层方法实现功能
        //3、作出响应--跳转页面
        if (flag) {
            //成功则跳转到首页
            return "redirect:queryUser.action";
        }
        //失败跳转回到登录页面
        // TODO

        return "error";
    }


    /**
     * 根据id查询将要修改的用户
     *
     * @param model
     * @param id
     * @return
     */
    @GetMapping("/toUpdateUser")
    public String toUpdateUser(Model model, @RequestParam(value = "id") Integer id) {

        //1、获取id，根据id查询user
        User user = userService.queryUserById(id);
        //2、保存user对象数据保存在属性作用
        model.addAttribute("user", user);
        //3、跳转UserUpdate.jsp页面
        // System.out.println(user);

        return "userUpdate";
    }


    /**
     * 更新用户
     *
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
                             @RequestParam(value = "id", required = false) Integer id,
                             @RequestParam(value = "loginname", required = false) String loginname,
                             @RequestParam(value = "password", required = false) String password,
                             @RequestParam(value = "status", required = false) Integer status,
                             @RequestParam(value = "username", required = false) String username,
                             @RequestPart(value = "filepart", required = false) MultipartFile filepart) {

        String imgname = filepart.getOriginalFilename();

        User user = new User(id, username, password, loginname, status, imgname);
        if (user.getId().equals(this.nowUser.getId())) {
            this.nowUser = user;
        }

        boolean flag = userService.updateUser(user);
        model.addAttribute("NowUser", this.nowUser);

        if (flag) {
            return "redirect:queryUser.action";
        }
        return "redirect:toUpdateUser.action?id=" + id;

    }

    /**
     * 删除用户
     *
     * @param model
     * @param id
     * @return
     */
    @GetMapping("/deleteUser")
    public String deleteUser(Model model, @RequestParam(value = "id") Integer id) {

        boolean flag = userService.deleteUser(id);
        if (flag) {
            return "redirect:queryUser.action";
        }
        return null;
    }


    @Autowired
    private DeptService deptService;


    @GetMapping("/queryDept")
    public String queryDept(Model model,
                            @RequestParam(value = "pn", required = false, defaultValue = "1") Integer curPageNumber) {

        Page<Dept> page = deptService.queryDept(curPageNumber, pageSize);

        model.addAttribute("NowUser", this.nowUser);
        depts = deptService.queryDeptList();
        jobs = jobService.queryJobList();
        model.addAttribute("deptList", depts.getResult());
        model.addAttribute("jobList", jobs.getResult());

        model.addAttribute("deptResult", page.getResult());
        model.addAttribute("pageInfo", page.toPageInfo());

        return "deptIndex";
    }


    /**
     * 增加用户
     *
     * @param model
     * @return
     */
    @PostMapping("/insertDept")
    public String insertDept(Model model,
                             @RequestParam(value = "name", required = false) String name,
                             @RequestParam(value = "remark", required = false) String remark) {

        Dept dept = new Dept(name, remark);

        //2、调用业务层方法实现功能
        boolean flag = deptService.addDept(dept);

        //3、作出响应--跳转页面
        if (flag) {//成功则跳转到首页

            depts = deptService.queryDeptList();
            model.addAttribute("deptList", depts.getResult());

            return "redirect:queryDept.action";
        }//失败跳转回到登录页面
        // TODO
        return "login";
    }


    /**
     * 根据id查询将要修改的用户
     *
     * @param model
     * @param id
     * @return
     */
    @GetMapping("/toUpdateDept")
    public String toUpdateDept(Model model, @RequestParam(value = "id") Integer id) {

        //1、获取id，根据id查询user
        Dept dept = deptService.queryDeptById(id);
        //2、保存user对象数据保存在属性作用
        model.addAttribute("dept", dept);
        //3、跳转UserUpdate.jsp页面

        return "deptUpdate";
    }

    /**
     * 更新用户
     *
     * @param model
     * @param id
     * @return
     */
    @PostMapping("/updateDept")
    public String updateDept(Model model,
                             @RequestParam(value = "id", required = false) Integer id,
                             @RequestParam(value = "name", required = false) String name,
                             @RequestParam(value = "remark", required = false) String remark) {

        Dept dept = new Dept(id, name, remark);

        boolean flag = deptService.updateDept(dept);


        if (flag) {
            return "redirect:queryDept.action";
        }
        return "redirect:toUpdateDept.action?id=" + id;

    }

    /**
     * 删除用户
     *
     * @param model
     * @param id
     * @return
     */
    @GetMapping("/deleteDept")
    public String deleteDept(Model model, @RequestParam(value = "id") Integer id) {

        boolean flag = deptService.deleteDept(id);
        if (flag) {
            return "redirect:queryDept.action";
        }
        return null;

    }

    @Autowired
    private JobService jobService;

    @GetMapping("/queryJob")
    public String queryJob(Model model,
                           @RequestParam(value = "pn", required = false, defaultValue = "1") Integer curPageNumber) {


        Page<Job> page = jobService.queryJob(curPageNumber, pageSize);


        model.addAttribute("NowUser", this.nowUser);
        depts = deptService.queryDeptList();
        jobs = jobService.queryJobList();
        model.addAttribute("deptList", depts.getResult());
        model.addAttribute("jobList", jobs.getResult());

        model.addAttribute("jobResult", page.getResult());
        model.addAttribute("pageInfo", page.toPageInfo());

        return "jobIndex";
    }


    /**
     * 增加用户
     *
     * @param model
     * @return
     */
    @PostMapping("/insertJob")
    public String insertJob(Model model,
                            @RequestParam(value = "name", required = false) String name,
                            @RequestParam(value = "remark", required = false) String remark) {

        Job job = new Job(name, remark);

        //2、调用业务层方法实现功能
        boolean flag = jobService.addJob(job);

        //3、作出响应--跳转页面
        if (flag) {//成功则跳转到首页
            jobs = jobService.queryJobList();
            model.addAttribute("jobList", jobs.getResult());
            return "redirect:queryJob.action";
        }//失败跳转回到登录页面
        // TODO
        return "login";
    }


    /**
     * 根据id查询将要修改的用户
     *
     * @param model
     * @param id
     * @return
     */
    @GetMapping("/toUpdateJob")
    public String toUpdateJob(Model model, @RequestParam(value = "id") Integer id) {

        //1、获取id，根据id查询user
        Job job = jobService.queryJobById(id);
        //2、保存user对象数据保存在属性作用
        model.addAttribute("job", job);
        //3、跳转UserUpdate.jsp页面

        return "jobUpdate";
    }

    /**
     * 更新用户
     *
     * @param model
     * @param id
     * @return
     */
    @PostMapping("/updateJob")
    public String updateJob(Model model,
                            @RequestParam(value = "id", required = false) Integer id,
                            @RequestParam(value = "name", required = false) String name,
                            @RequestParam(value = "remark", required = false) String remark) {

        Job job = new Job(id, name, remark);

        boolean flag = jobService.updateJob(job);


        if (flag) {
            return "redirect:queryJob.action";
        }
        return "redirect:toUpdateJob.action?id=" + id;

    }

    /**
     * 删除用户
     *
     * @param model
     * @param id
     * @return
     */
    @GetMapping("/deleteJob")
    public String deleteJob(Model model, @RequestParam(value = "id") Integer id) {

        boolean flag = jobService.deleteJob(id);
        if (flag) {
            return "redirect:queryJob.action";
        }
        return null;

    }

    // -----------------------------------------
    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/queryEmployee")
    public String queryEmployee(Model model,
                                // HttpServletRequest request,
                                // HttpServletResponse response,
                                @RequestParam(value = "pn", required = false, defaultValue = "1") Integer curPageNumber,
                                @RequestParam(value = "name", required = false) String name,
                                @RequestParam(value = "deptId", required = false, defaultValue = "0") Integer deptId) {

        Page<Employee> page = employeeService.queryEmployee(curPageNumber, pageSize, name, deptId);
        List<Employee> result = page.getResult();

        model.addAttribute("NowUser", this.nowUser);

        model.addAttribute("employeeList", result);
        model.addAttribute("pageInfo", page.toPageInfo());
        model.addAttribute("Employeename", "test name");
        model.addAttribute("deptList", depts.getResult());
        model.addAttribute("jobList", jobs.getResult());

        return "employeeIndex";

    }


    @PostMapping("/insertEmployee")
    public String insertEmployee(Model model,
                                 @RequestParam(value = "name", required = false) String name,
                                 @RequestParam(value = "password", required = false) String password,
                                 @RequestParam(value = "cardId", required = false) String cardId,
                                 @RequestParam(value = "phone", required = false) String phone,
                                 @RequestParam(value = "email", required = false) String email,
                                 @RequestParam(value = "sex", required = false) Integer sex,
                                 @RequestParam(value = "deptId", required = false) Integer deptId,
                                 @RequestParam(value = "jobId", required = false) Integer jobId,
                                 @RequestParam(value = "party", required = false) String party,
                                 @RequestParam(value = "race", required = false) String race,
                                 @RequestParam(value = "education", required = false) String education,
                                 @RequestPart(value = "filepart", required = false) MultipartFile filepart) {

        String imgname = filepart.getOriginalFilename();
        //创建user对象将数据进行封装
        // System.out.println(filepart);
        try {
            filepart.transferTo(new File(filepath + imgname));

        } catch (IOException e) {
            e.printStackTrace();
        }

        Employee employee = new Employee();
        employee.setName(name);
        employee.setPassword(password);
        employee.setCardId(cardId);
        employee.setPhone(phone);
        employee.setEmail(email);
        employee.setSex(sex);
        employee.setDeptId(deptId);
        employee.setJobId(jobId);
        employee.setImgname(imgname);
        employee.setParty(party);
        employee.setRace(race);
        employee.setEducation(education);

        boolean flag = employeeService.addEmployee(employee);

        //3、作出响应--跳转页面
        if (flag) {//成功则跳转到首页

            return "redirect:queryEmployee.action";
        }//失败跳转回到登录页面
        // TODO
        return "login";
    }

    @GetMapping("/deleteEmployee")
    public String deleteEmployee(Model model, @RequestParam(value = "id") Integer id) {

        boolean flag = employeeService.deleteEmployee(id);

        if (flag) {
            // System.out.println("delete success");
            return "redirect:queryEmployee.action";
        }
        // System.out.println("delete false");
        return null;
    }

    @GetMapping("/toUpdateEmployee")
    public String toUpdateEmployee(Model model, @RequestParam(value = "id") Integer id) {

        //1、获取id，根据id查询user
        Employee employee = employeeService.queryEmployeeById(id);
        //2、保存user对象数据保存在属性作用
        model.addAttribute("employee", employee);

        model.addAttribute("deptList", depts.getResult());
        model.addAttribute("jobList", jobs.getResult());
        //3、跳转UserUpdate.jsp页面
        // System.out.println(employee);

        return "employeeUpdate";
    }


    @PostMapping("/updateEmployee")
    public String updateEmployee(Model model,
                                 @RequestParam(value = "id", required = false) Integer id,
                                 @RequestParam(value = "name", required = false) String name,
                                 @RequestParam(value = "password", required = false) String password,
                                 @RequestParam(value = "cardId", required = false) String cardId,
                                 @RequestParam(value = "phone", required = false) String phone,
                                 @RequestParam(value = "party", required = false) String party,
                                 @RequestParam(value = "race", required = false) String race,
                                 @RequestParam(value = "education", required = false) String education,
                                 @RequestParam(value = "email", required = false) String email,
                                 @RequestParam(value = "sex", required = false) Integer sex,
                                 @RequestParam(value = "deptId", required = false) Integer deptId,
                                 @RequestParam(value = "jobId", required = false) Integer jobId,
                                 @RequestPart(value = "filepart", required = false) MultipartFile filepart) {

        String imgname = filepart.getOriginalFilename();

        // User user = new User(id, username, password, loginname, status, imgname);
        Employee employee = new Employee(id, name, password, cardId, phone, party, race, education, email, sex, deptId, jobId, imgname);

        // System.out.println(employee);

        boolean flag = employeeService.updateEmployee(employee);
        // model.addAttribute("NowUser", this.nowUser);

        if (flag) {
            return "redirect:queryEmployee.action";
        }
        return "redirect:toUpdateEmployee.action?id=" + id;

    }


    // -------------------------------------------

    @Autowired
    private AnnouncementService announcementService;

    @GetMapping("/queryAnnouncement")
    public String queryAnnouncement(Model model,
                                    @RequestParam(value = "title", required = false, defaultValue = "") String title,
                                    @RequestParam(value = "pn", required = false, defaultValue = "1") Integer curPageNumber) {

        // Page<Dept> page = deptService.queryDept(curPageNumber, pageSize);

        Page<Announcement> page = announcementService.queryAnnouncement(curPageNumber, pageSize, title);
        // for (Announcement announcement : page.getResult()) {
        //     System.out.println(announcement);
        // }

        model.addAttribute("NowUser", this.nowUser);
        depts = deptService.queryDeptList();
        jobs = jobService.queryJobList();
        model.addAttribute("deptList", depts.getResult());
        model.addAttribute("jobList", jobs.getResult());

        model.addAttribute("announcementList", page.getResult());
        model.addAttribute("pageInfo", page.toPageInfo());


        return "announcementIndex";

        // return "index";
    }

    @GetMapping("/deleteAnnouncement")
    public String deleteAnnouncement(Model model, @RequestParam(value = "id") Integer id) {
        boolean flag = announcementService.deleteAnnouncement(id);
        if (flag) {
            return "redirect:queryAnnouncement.action";
        }

        return null;
    }

    @PostMapping("/insertAnnouncement")
    public String insertAnnouncement(Model model,
                                     @RequestParam(value = "title", required = false) String title,
                                     @RequestParam(value = "content", required = false) String content,
                                     @RequestParam(value = "uid", required = false) Integer uid) {

        // User user = userService.queryUserById(uid);
        //
        // if (user == null) {
        //     System.out.println("uid err");
        //     return null;
        // }
        // System.out.println(uid);
        // System.out.println(this.nowUser.getId());

        Announcement announcement = new Announcement();
        announcement.setTitle(title);
        announcement.setContent(content);
        // announcement.setCreateTime(new Date(System.currentTimeMillis()));
        announcement.setUid(uid);
        boolean flag = announcementService.add(announcement);

        if (flag) {
            //成功则跳转到首页
            return "redirect:queryAnnouncement.action";
        }
        //失败跳转回到登录页面
        // TODO

        return "error";
    }

    @GetMapping("/toUpdateAnnouncement")
    public String toUpdateAnnouncement(Model model, @RequestParam(value = "id") Integer id) {

        //1、获取id，根据id查询user
        Announcement announcement = announcementService.queryAnnouncementById(id);
        //2、保存user对象数据保存在属性作用
        model.addAttribute("announcement", announcement);
        //3、跳转UserUpdate.jsp页面
        // System.out.println(announcement);

        return "announcementUpdate";
    }

    @PostMapping("/updateAnnouncement")
    public String updateAnnouncement(Model model,
                                     @RequestParam(value = "uid", required = false) Integer uid,
                                     @RequestParam(value = "title", required = false) String title,
                                     @RequestParam(value = "content", required = false) String content) {
        // User user = userService.queryUserById(uid);
        //
        // if (user == null) {
        //     System.out.println("uid err");
        //     return null;
        // }

        Announcement announcement = new Announcement();
        announcement.setTitle(title);
        announcement.setContent(content);
        announcement.setUid(uid);


        boolean flag = announcementService.updateAnnouncement(announcement);

        if (flag) {
            return "redirect:queryAnnouncement.action";
        }
        return "redirect:toUpdateAnnouncement.action?id=";

    }


    // ------------------------------------------------

    @Autowired
    private DocumentService documentService;

    @GetMapping("/queryDocument")
    public String queryDocument(Model model,
                                @RequestParam(value = "filename", required = false) String filename,
                                @RequestParam(value = "pn", required = false, defaultValue = "1") Integer curPageNumber) {

        // Page<User> page = userService.queryUser(curPageNumber, pageSize, name);

        model.addAttribute("NowUser", this.nowUser);
        depts = deptService.queryDeptList();
        jobs = jobService.queryJobList();
        model.addAttribute("deptList", depts.getResult());
        model.addAttribute("jobList", jobs.getResult());


        Page<Document> page = documentService.queryDocument(curPageNumber, pageSize, filename);
        // for (Document document : page.getResult()) {
        //     System.out.println(document);
        // }

        model.addAttribute("documentList", page.getResult());
        model.addAttribute("pageInfo", page.toPageInfo());

        return "documentIndex";
    }

    @GetMapping("/deleteDocument")
    public String deleteDocument(Model model,
                                 @RequestParam(value = "id") Integer id,
                                 @RequestParam(value = "filename") String filename) {
        //1、删除数据
        // System.out.println(filename);

        boolean flag = documentService.deleteDocument(id);
        if (!flag) {
            return null;
        }
        File file = new File(filepath + filename);
        // System.out.println(filepath + filename);
        boolean delete = file.delete();

        if(delete){
            return "redirect:queryDocument.action";
        }
        return null;
    }

    @PostMapping("/insertDocument")
    public String insertDocument(Model model,
                                 // @RequestParam(value = "filename", required = false) String filename,
                                 @RequestParam(value = "remark", required = false) String remark,
                                 @RequestParam(value = "uploader", required = false) String uploader,
                                 @RequestPart(value = "filepart", required = false) MultipartFile filepart) {


        String imgname = filepart.getOriginalFilename();

        // System.out.println(imgname);
        //创建user对象将数据进行封装
        Document document = new Document();
        document.setFilename(imgname);
        document.setRemark(remark);
        document.setUploader(uploader);
        // document.setCreateDate(new Date(System.currentTimeMillis()));
        // System.out.println(document);

        boolean flag = false;
        try {
            filepart.transferTo(new File(filepath + imgname));
            flag = documentService.addDocument(document);

        } catch (Exception e) {
            e.printStackTrace();
        }
        //2、调用业务层方法实现功能
        //3、作出响应--跳转页面
        if (flag) {
            //成功则跳转到首页
            return "redirect:queryDocument.action";
        }
        //失败跳转回到登录页面
        // TODO

        return "error";
    }

    @GetMapping("/toUpdateDocument")
    public String toUpdateDocument(Model model, @RequestParam(value = "id") Integer id) {

        //1、获取id，根据id查询user
        Document document = documentService.queryDocumentById(id);
        //2、保存user对象数据保存在属性作用
        model.addAttribute("document", document);
        //3、跳转UserUpdate.jsp页面
        // System.out.println(document);

        return "documentUpdate";
    }

    @PostMapping("/updateDocument")
    public String updateDocument(Model model,
                                 @RequestParam(value = "id", required = false) Integer id,
                                 @RequestParam(value = "oldFilename", required = false) String oldFilename,
                                 @RequestParam(value = "filename", required = false) String filename,
                                 @RequestParam(value = "remark", required = false) String remark) {

        if (!Objects.equals(oldFilename, filename)) {
            String path = filepath + oldFilename;
            // System.out.println(path);
            File file = new File(path);
            file.renameTo(new File(filepath+filename));
        }

        Document document = new Document();
        document.setId(id);
        document.setRemark(remark);
        document.setFilename(filename);
        // document.setUploader(uploader);
        // document.setCreateDate(createDate);
        // System.out.println(document);

        boolean flag = documentService.updateDocument(document);

        if (flag) {
            return "redirect:queryDocument.action";
        }
        return "redirect:toUpdateDocument.action?id=" + id;

    }

    @GetMapping("/downloadDocument")
    public ResponseEntity<byte[]> downloadDocument(Model model,
                                 @RequestParam(value = "filename") String filename) throws IOException {

        // System.out.println(filename);
        if("".equals(filename)) {
            return null;
        }

        File file = new File(filepath + filename);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachment", URLEncoder.encode(filename, "utf-8"));

        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);

        // return null;

    }


}
