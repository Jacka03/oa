<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <!--sidebar start-->
        <aside>
            <div id="sidebar"  class="nav-collapse ">
                <!-- sidebar menu start-->
                <ul class="sidebar-menu" id="nav-accordion">

                    <p class="centered"><a href="profile.html"><img src="assets/img/${NowUser.imgname}" class="img-circle" width="60"></a></p>
                    <h5 class="centered">${NowUser.username}</h5>

                    <li class="sub-menu"><a href="javascript:;"> <i
                            class="fa fa-desktop"></i> <span>管理员模块</span>
                    </a>
                        <ul class="sub">
                            <li><a href="queryUser">管理员信息</a></li>
                            <li><a data-toggle="modal" href="#insertUserModal">添加管理员</a></li>
                        </ul>
                    </li>

                    <li class="sub-menu"><a href="javascript:;"> <i
                            class="fa fa-cogs"></i> <span>员工模块</span>
                    </a>
                        <ul class="sub">
                            <li><a href="queryEmployee">员工信息</a></li>
                            <li><a data-toggle="modal" href="#insertEmployeeModal">添加员工</a></li>
                        </ul>
                    </li>
                    <li class="sub-menu"><a href="javascript:;"> <i
                            class="fa fa-book"></i> <span>部门模块</span>
                    </a>
                        <ul class="sub">
                            <li><a href="queryDept">部门信息</a></li>
                            <li><a data-toggle="modal"  href="#insertDeptModal">添加部门</a></li>
                        </ul>
                    </li>
                    <li class="sub-menu"><a href="javascript:;"> <i
                            class="fa fa-tasks"></i> <span>岗位模块</span>
                    </a>
                        <ul class="sub">
                            <li><a href="queryJob">岗位信息</a></li>
                            <li><a data-toggle="modal" href="#insertJobModal">添加岗位</a></li>
                        </ul>
                    </li>
                    <li class="sub-menu"><a href="javascript:;"> <i
                            class="fa fa-tasks"></i> <span>公告模块</span>
                    </a>
                        <ul class="sub">
                            <li><a href="queryAnnouncement">公告信息</a></li>
                            <li><a data-toggle="modal" href="#insertAnnouncementModal">添加公告</a></li>
                        </ul>
                    </li>
                </ul>
                <!-- sidebar menu end-->
            </div>
        </aside>
        <!--sidebar end-->


        <%--  user--%>
        <form method="post" action="/oa/insertUser" enctype="multipart/form-data">
            <!-- 模态框Modal -->
            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
                 tabindex="-1" id="insertUserModal" class="modal fade">
                <!-- 设置请求方式为method     类型 enctype="multipart/form-data"  -->
                <div class="modal-dialog">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;
                            </button>
                            <h4 class="modal-title">添加管理员</h4>
                        </div>
                        <div class="modal-body">
                            <p>登录名：</p>
                            <input type="text" name="loginname" placeholder="请输入登录名"
                                   autocomplete="off" class="form-control placeholder-no-fix">

                        </div>
                        <div class="modal-body">
                            <p>用户名：</p>
                            <input type="text" name="username" placeholder="请输入用户名"
                                   autocomplete="off" class="form-control placeholder-no-fix">

                        </div>
                        <div class="modal-body">
                            <p>密码：</p>
                            <input type="text" name="password" placeholder="请输入密码"
                                   autocomplete="off" class="form-control placeholder-no-fix">

                        </div>
                        <div class="modal-body">
                            <p>状态：</p>
                            <select name="status" class="form-control placeholder-no-fix">
                                <option value="1">超级管理员</option>
                                <option value="0">普通管理员</option>
                            </select>
                        </div>
                        <div class="modal-body">
                            <p>头像：</p>
                            <input type="file" name="filepart" autocomplete="off"
                                   class="form-control placeholder-no-fix">
                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                            <button class="btn btn-theme" type="submit">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <!-- employee-->
        <form method="post" id="insertEmployee" action="/oa/insertEmployee"
              enctype="multipart/form-data">
            <!-- 模态框Modal -->
            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
                 tabindex="-1" id="insertEmployeeModal" class="modal fade">
                <!-- 设置请求方式为method     类型 enctype="multipart/form-data"  -->
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;
                            </button>
                            <h4 class="modal-title">添加员工</h4>
                        </div>

                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="modal-body col-md-5">
                                <p>员工名：</p>
                                <input type="text" name="name" placeholder="请输入员工名"
                                       autocomplete="off" class="form-control placeholder-no-fix">
                            </div>
                            <div class="modal-body  col-md-5">
                                <p>密码：</p>
                                <input type="text" name="password" placeholder="请输入密码"
                                       autocomplete="off" class="form-control placeholder-no-fix">
                            </div>
                            <div class="col-md-1"></div>
                        </div>
                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="modal-body col-md-5">
                                <p>身份证：</p>
                                <input type="text" name="cardId" placeholder="请输入身份证"
                                       autocomplete="off" class="form-control placeholder-no-fix">
                            </div>
                            <div class="modal-body col-md-5">
                                <p>手机号码：</p>
                                <input type="text" name="phone" placeholder="请输入手机号码"
                                       autocomplete="off" class="form-control placeholder-no-fix">
                            </div>
                            <div class="col-md-1"></div>
                        </div>


                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="modal-body col-md-5">
                                <p>邮箱：</p>
                                <input type="text" name="email" placeholder="请输入邮箱"
                                       autocomplete="off" class="form-control placeholder-no-fix">
                            </div>
                            <div class="modal-body col-md-5">
                                <p>性别：</p>
                                <select name="sex" class="form-control placeholder-no-fix">
                                    <option value="1">男</option>
                                    <option value="2">女</option>
                                </select>
                            </div>
                            <div class="col-md-1"></div>
                        </div>

                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="modal-body col-md-5">
                                <p>部门：</p>
                                <select name="deptId" class="form-control placeholder-no-fix">
                                    <c:forEach items="${deptList}" var="deptItem">
                                        <option value="${deptItem.id}">${deptItem.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="modal-body col-md-5">
                                <p>岗位：</p>
                                <select name="jobId" class="form-control placeholder-no-fix">
                                    <c:forEach items="${jobList}" var="jobItem">
                                        <option value="${jobItem.id}">${jobItem.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-1"></div>
                        </div>
                        <div class="row">
                            <div class="col-md-1"></div>

                            <div class="modal-body col-md-5">
                                <p>政治面貌：</p>
                                <input type="text" name="party" placeholder="请输入政治面貌"
                                       autocomplete="off" class="form-control placeholder-no-fix">
                            </div>

                            <div class="modal-body col-md-5">
                                <p>民族：</p>
                                <input type="text" name="race" placeholder="请输入民族"
                                       autocomplete="off" class="form-control placeholder-no-fix">
                            </div>

                            <div class="col-md-1"></div>
                        </div>


                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="modal-body col-md-5">
                                <p>学历：</p>
                                <input type="text" name="education" placeholder="请输入学历"
                                       autocomplete="off" class="form-control placeholder-no-fix">
                            </div>


                            <div class="modal-body col-md-5">
                                <p>头像：</p>
                                <input type="file" name="filepart" autocomplete="off"
                                       class="form-control placeholder-no-fix">
                            </div>
                            <div class="col-md-1"></div>
                        </div>
                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                            <button class="btn btn-theme" type="submit">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- employee"-->

        <%--  dept--%>
        <form method="post" action="/oa/insertDept" enctype="multipart/form-data">
            <!-- 模态框Modal -->
            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
                 tabindex="-1" id="insertDeptModal" class="modal fade">
                <!-- 设置请求方式为method     类型 enctype="multipart/form-data"  -->
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;
                            </button>

                            <h4 class="modal-title">增加部门</h4>
                        </div>
                        <div class="modal-body">
                            <p>name：</p>
                            <input type="hidden" name="id" value="${dept.id}"/>
                            <input
                                    type="text" name="name" value="${dept.name}"
                                    placeholder="请输入部门名" autocomplete="off"
                                    class="form-control placeholder-no-fix">

                        </div>
                        <div class="modal-body">
                            <p>remark：</p>
                            <input type="text" name="remark" value="${dept.remark}"
                                   placeholder="请输入remark" autocomplete="off"
                                   class="form-control placeholder-no-fix">
                        </div>

                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                            <button class="btn btn-theme" type="submit">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <%--  job--%>
        <form method="post" action="/oa/insertJob" enctype="multipart/form-data">
            <!-- 模态框Modal -->
            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
                 tabindex="-1" id="insertJobModal" class="modal fade">
                <!-- 设置请求方式为method     类型 enctype="multipart/form-data"  -->
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;
                            </button>

                            <h4 class="modal-title">增加岗位</h4>
                        </div>
                        <div class="modal-body">
                            <p>name：</p>
                            <input type="hidden" name="id" value="${job.id}"/>
                            <input
                                    type="text" name="name" value="${job.name}"
                                    placeholder="请输入部门名" autocomplete="off"
                                    class="form-control placeholder-no-fix">

                        </div>
                        <div class="modal-body">
                            <p>remark：</p>
                            <input type="text" name="remark" value="${job.remark}"
                                   placeholder="请输入remark" autocomplete="off"
                                   class="form-control placeholder-no-fix">
                        </div>

                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                            <button class="btn btn-theme" type="submit">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <%-- announcement--%>
        <form method="post" action="/oa/insertAnnouncement" enctype="multipart/form-data">
            <!-- 模态框Modal -->
            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog"
                 tabindex="-1" id="insertAnnouncementModal" class="modal fade">
                <!-- 设置请求方式为method     类型 enctype="multipart/form-data"  -->
                <div class="modal-dialog">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">&times;
                            </button>
                            <h4 class="modal-title">添加公告</h4>
                        </div>
                        <div class="modal-body">
                            <p>title：</p>
                            <input type="text" name="title" placeholder="请输入title"
                                   autocomplete="off" class="form-control placeholder-no-fix">

                        </div>
                        <div class="modal-body">
                            <p>content：</p>
                            <input type="text" name="content" placeholder="请输入content"
                                   autocomplete="off" class="form-control placeholder-no-fix">

                        </div>
                        <div class="modal-body">
                            <p>create_time：</p>
                            <input type="text" name="create_time" placeholder="请输入create_time"
                                   autocomplete="off" class="form-control placeholder-no-fix">
                        </div>
                        <div class="modal-body">
                            <p>uid：</p>
                            <input type="text" name="uid" placeholder="请输入uid"
                                   autocomplete="off" class="form-control placeholder-no-fix">
                        </div>

                        <div class="modal-footer">
                            <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                            <button class="btn btn-theme" type="submit">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>


    </body>
</html>

    </body>
</html>