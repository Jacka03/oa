<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--   prefix表示为前缀  uri表示加载库的地址   --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>DASHGUM - FREE Bootstrap Admin Template</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css"/>
    <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">

    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <script src="assets/js/chart-master/Chart.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<section id="container">
    <!-- **********************************************************************************************************************************************************
    TOP BAR CONTENT & NOTIFICATIONS
    *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
        </div>
        <!--logo start-->
        <a href="index.html" class="logo"><b>DASHGUM FREE</b></a>
        <!--logo end-->
        <div class="nav notify-row" id="top_menu">
            <!--  notification start -->
            <ul class="nav top-menu">
                <!-- settings start -->
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                        <i class="fa fa-tasks"></i>
                        <span class="badge bg-theme">4</span>
                    </a>
                    <ul class="dropdown-menu extended tasks-bar">
                        <div class="notify-arrow notify-arrow-green"></div>
                        <li>
                            <p class="green">You have 4 pending tasks</p>
                        </li>
                        <li>
                            <a href="index.html#">
                                <div class="task-info">
                                    <div class="desc">DashGum Admin Panel</div>
                                    <div class="percent">40%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                        <span class="sr-only">40% Complete (success)</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <div class="task-info">
                                    <div class="desc">Database Update</div>
                                    <div class="percent">60%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        <span class="sr-only">60% Complete (warning)</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <div class="task-info">
                                    <div class="desc">Product Development</div>
                                    <div class="percent">80%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                        <span class="sr-only">80% Complete</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <div class="task-info">
                                    <div class="desc">Payments Sent</div>
                                    <div class="percent">70%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                                        <span class="sr-only">70% Complete (Important)</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="external">
                            <a href="#">See All Tasks</a>
                        </li>
                    </ul>
                </li>
                <!-- settings end -->
                <!-- inbox dropdown start-->
                <li id="header_inbox_bar" class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                        <i class="fa fa-envelope-o"></i>
                        <span class="badge bg-theme">5</span>
                    </a>
                    <ul class="dropdown-menu extended inbox">
                        <div class="notify-arrow notify-arrow-green"></div>
                        <li>
                            <p class="green">You have 5 new messages</p>
                        </li>
                        <li>
                            <a href="index.html#">
                                <span class="photo"><img alt="avatar" src="assets/img/ui-zac.jpg"></span>
                                <span class="subject">
                                    <span class="from">Zac Snider</span>
                                    <span class="time">Just now</span>
                                    </span>
                                <span class="message">
                                        Hi mate, how is everything?
                                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <span class="photo"><img alt="avatar" src="assets/img/ui-divya.jpg"></span>
                                <span class="subject">
                                    <span class="from">Divya Manian</span>
                                    <span class="time">40 mins.</span>
                                    </span>
                                <span class="message">
                                     Hi, I need your help with this.
                                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <span class="photo"><img alt="avatar" src="assets/img/ui-danro.jpg"></span>
                                <span class="subject">
                                    <span class="from">Dan Rogers</span>
                                    <span class="time">2 hrs.</span>
                                    </span>
                                <span class="message">
                                        Love your new Dashboard.
                                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <span class="photo"><img alt="avatar" src="assets/img/ui-sherman.jpg"></span>
                                <span class="subject">
                                    <span class="from">Dj Sherman</span>
                                    <span class="time">4 hrs.</span>
                                    </span>
                                <span class="message">
                                        Please, answer asap.
                                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">See all messages</a>
                        </li>
                    </ul>
                </li>
                <!-- inbox dropdown end -->
            </ul>
            <!--  notification end -->
        </div>
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout" href="login.html">Logout</a></li>
            </ul>
        </div>
    </header>
    <!--header end-->

    <!-- **********************************************************************************************************************************************************
    MAIN SIDEBAR MENU
    *********************************************************************************************************************************************************** -->

    <!--sidebar start-->
    <aside>
        <div id="sidebar"  class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">

                <p class="centered"><a href="profile.html"><img src="assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
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

    <div class="copyrights">Collect from <a href="http://www.cssmoban.com/">网页模板</a></div>

    <!-- **********************************************************************************************************************************************************
    MAIN CONTENT
    *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">

            <div class="row">
                <!-- /col-lg-9 END SECTION MIDDLE -->
                <div class="col-lg-9 main-chart">
                    <!-- input -->
                    <div style="margin-top: 45px;">
                        <h4 class="mb">
                            <i class="fa fa-angle-right"></i> Inline Form
                        </h4>
                        <form  class="form-inline" role="form"
                               action="queryUser">
                            <%--<input id="page" name="pageNo" type="hidden" value="1" />--%>
                            <div class="form-group">
                                <label class="sr-only">Email
                                    address</label> <input type="text" class="form-control" placeholder="User Name" name="name"
                                                           value="${username}">
                            </div>
                            <button type="submit" class="btn btn-theme">Submit</button>
                        </form>
                    </div>
                    <!-- input -->

                    <div class="row mt">
                        <div class="col-md-12">
                            <div class="content-panel">
                                <table class="table table-striped table-advance table-hover">
                                    <h4><i class="fa fa-angle-right"></i> Advanced Table</h4>
                                    <hr>
                                    <thead>
                                    <!-- table中标题 -->
                                    <tr>
                                        <th><i class="fa fa-bullhorn"></i> 管理员id</th>
                                        <th class="hidden-phone"><i class="fa fa-question-circle"></i> 登录名</th>
                                        <th><i class="fa fa-bookmark"></i> 密码</th>
                                        <th><i class=" fa fa-edit"></i> 管理员名称</th>
                                        <th><i class=" fa fa-edit"></i> 创建时间</th>
                                        <th><i class=" fa fa-edit"></i> Status</th>
                                        <th><i class=" fa fa-edit"></i> 头像</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <!-- 使用JSTL中foreach进行遍历 -->
                                    <c:forEach var="Item" items="${userList}">
                                        <tr>
                                            <td><a href="basic_table.html#">${Item.id}</a></td>
                                            <td class="hidden-phone">${Item.loginname}</td>
                                            <td>${Item.password}</td>
                                            <td><span class="label label-info label-mini">${Item.username}</span>
                                            </td>
                                            <td>${Item.createdate}</td>
                                            <td>
                                                <c:if test="${Item.status==1}">超级管理员</c:if>
                                                <c:if test="${Item.status==0}">普通管理员</c:if>
                                            </td>
                                            <td>${Item.imgname}</td>
                                            <td>
                                                <button class="btn btn-primary btn-xs">
                                                    <a href="toUpdateUser?id=${Item.id}"
                                                       style="color: white;">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>
                                                </button>
                                                <button class="btn btn-danger btn-xs">
                                                    <a href="deleteUser?id=${Item.id}"
                                                       style="color: white;">
                                                        <i style="color: white;"> <i
                                                                class="fa fa-trash-o "></i>
                                                        </i>
                                                    </a>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <!-- 使用thymeleaf中foreach进行遍历 -->

                                    </tbody>
                                </table>
                            </div><!-- /content-panel -->
                        </div><!-- /col-md-12 -->
                    </div><!-- /row -->

                    <!-- 分页html标签 -->
                    <div class="card-body">
                        <nav aria-label="Page navigation example"
                             style="margin-left: 330px;">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="#">【${pageInfo.pageNum}/${pageInfo.pages}，共${pageInfo.total}条记录】
                                </a></li>
                                <li class="page-item"><a class="page-link"
                                                         href="javascript:jumpPage(1)">首页</a></li>
                                <c:if test="${pageInfo.prePage!=0}">
                                    <li class="page-item"><a class="page-link"
                                                             href="javascript:jumpPage(${pageInfo.prePage})">上一页</a></li>
                                </c:if>
                                <li class="page-item"><a class="page-link"
                                                         href="javascript:jumpPage(${pageInfo.pageNum})">${pageInfo.pageNum}</a></li>
                                <c:if test="${pageInfo.nextPage!=0}">
                                    <li class="page-item"><a class="page-link"
                                                             href="javascript:jumpPage(${pageInfo.nextPage})">下一页</a></li>
                                </c:if>
                                <li class="page-item"><a class="page-link"
                                                         href="javascript:jumpPage(${pageInfo.pages})">尾页</a></li>
                            </ul>
                        </nav>
                    </div>
                    <!-- 分页html标签 -->

                    <!-- 分页提交的请求表单 -->
                    <form class="search" id="form_query" action="queryUser">
                        <div class="input-group">
                            <!-- 隐藏域的页码  不显示 -->
                            <input id="page" name="pn" type="hidden" value="1"/>
                        </div>
                    </form>
                    <!-- 分页提交的请求表单 -->


                </div>
                <!-- /col-lg-9 END SECTION MIDDLE -->

                <!-- /col-lg-3 -->
                <div class="col-lg-3 ds">
                    <!--COMPLETED ACTIONS DONUTS CHART-->
                    <h3>NOTIFICATIONS</h3>

                    <!-- First Action -->
                    <div class="desc">
                        <div class="thumb">
                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                        </div>
                        <div class="details">
                            <p>
                                <muted>2 Minutes Ago</muted>
                                <br/>
                                <a href="#">James Brown</a> subscribed to your newsletter.<br/>
                            </p>
                        </div>
                    </div>
                    <!-- Second Action -->
                    <div class="desc">
                        <div class="thumb">
                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                        </div>
                        <div class="details">
                            <p>
                                <muted>3 Hours Ago</muted>
                                <br/>
                                <a href="#">Diana Kennedy</a> purchased a year subscription.<br/>
                            </p>
                        </div>
                    </div>
                    <!-- Third Action -->
                    <div class="desc">
                        <div class="thumb">
                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                        </div>
                        <div class="details">
                            <p>
                                <muted>7 Hours Ago</muted>
                                <br/>
                                <a href="#">Brandon Page</a> purchased a year subscription.<br/>
                            </p>
                        </div>
                    </div>
                    <!-- Fourth Action -->
                    <div class="desc">
                        <div class="thumb">
                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                        </div>
                        <div class="details">
                            <p>
                                <muted>11 Hours Ago</muted>
                                <br/>
                                <a href="#">Mark Twain</a> commented your post.<br/>
                            </p>
                        </div>
                    </div>
                    <!-- Fifth Action -->
                    <div class="desc">
                        <div class="thumb">
                            <span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                        </div>
                        <div class="details">
                            <p>
                                <muted>18 Hours Ago</muted>
                                <br/>
                                <a href="#">Daniel Pratt</a> purchased a wallet in your store.<br/>
                            </p>
                        </div>
                    </div>

                    <!-- USERS ONLINE SECTION -->
                    <h3>TEAM MEMBERS</h3>
                    <!-- First Member -->
                    <div class="desc">
                        <div class="thumb">
                            <img class="img-circle" src="assets/img/ui-divya.jpg" width="35px" height="35px" align="">
                        </div>
                        <div class="details">
                            <p><a href="#">DIVYA MANIAN</a><br/>
                                <muted>Available</muted>
                            </p>
                        </div>
                    </div>
                    <!-- Second Member -->
                    <div class="desc">
                        <div class="thumb">
                            <img class="img-circle" src="assets/img/ui-sherman.jpg" width="35px" height="35px" align="">
                        </div>
                        <div class="details">
                            <p><a href="#">DJ SHERMAN</a><br/>
                                <muted>I am Busy</muted>
                            </p>
                        </div>
                    </div>
                    <!-- Third Member -->
                    <div class="desc">
                        <div class="thumb">
                            <img class="img-circle" src="assets/img/ui-danro.jpg" width="35px" height="35px" align="">
                        </div>
                        <div class="details">
                            <p><a href="#">DAN ROGERS</a><br/>
                                <muted>Available</muted>
                            </p>
                        </div>
                    </div>
                    <!-- Fourth Member -->
                    <div class="desc">
                        <div class="thumb">
                            <img class="img-circle" src="assets/img/ui-zac.jpg" width="35px" height="35px" align="">
                        </div>
                        <div class="details">
                            <p><a href="#">Zac Sniders</a><br/>
                                <muted>Available</muted>
                            </p>
                        </div>
                    </div>
                    <!-- Fifth Member -->
                    <div class="desc">
                        <div class="thumb">
                            <img class="img-circle" src="assets/img/ui-sam.jpg" width="35px" height="35px" align="">
                        </div>
                        <div class="details">
                            <p><a href="#">Marcel Newman</a><br/>
                                <muted>Available</muted>
                            </p>
                        </div>
                    </div>

                    <!-- CALENDAR-->
                    <div id="calendar" class="mb">
                        <div class="panel green-panel no-margin">
                            <div class="panel-body">
                                <div id="date-popover" class="popover top"
                                     style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                                    <div class="arrow"></div>
                                    <h3 class="popover-title" style="disadding: none;"></h3>
                                    <div id="date-popover-content" class="popover-content"></div>
                                </div>
                                <div id="my-calendar"></div>
                            </div>
                        </div>
                    </div><!-- / calendar -->

                </div>
                <!-- /col-lg-3 -->

            </div>
        </section>
    </section>

    <!--main content end-->
    <!--footer start-->
    <footer class="site-footer">
        <div class="text-center">
            2014 - Alvarez.is - More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a>
            - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
            <a href="index.html#" class="go-top">
                <i class="fa fa-angle-up"></i>
            </a>
        </div>
    </footer>
    <!--footer end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<script src="assets/js/jquery.js"></script>
<script src="assets/js/jquery-1.8.3.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="assets/js/jquery.scrollTo.min.js"></script>
<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="assets/js/jquery.sparkline.js"></script>


<!--common script for all pages-->
<script src="assets/js/common-scripts.js"></script>

<script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="assets/js/gritter-conf.js"></script>

<!--script for this page-->
<script src="assets/js/sparkline-chart.js"></script>
<script src="assets/js/zabuto_calendar.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        var unique_id = $.gritter.add({
            // (string | mandatory) the heading of the notification
            title: 'Welcome to Dashgum!',
            // (string | mandatory) the text inside the notification
            text: 'Hover me to enable the Close Button. You can hide the left sidebar clicking on the button next to the logo. Free version for <a href="" target="_blank" style="color:#ffd777">BlackTie.co</a>.',
            // (string | optional) the image to display on the left
            image: 'assets/img/ui-sam.jpg',
            // (bool | optional) if you want it to fade out on its own or just sit there
            sticky: true,
            // (int | optional) the time you want it to be alive for before fading out
            time: '',
            // (string | optional) the class name you want to apply to that specific message
            class_name: 'my-sticky-class'
        });

        return false;
    });
</script>

<script type="application/javascript">
    $(document).ready(function () {
        $("#date-popover").popover({html: true, trigger: "manual"});
        $("#date-popover").hide();
        $("#date-popover").click(function (e) {
            $(this).hide();
        });

        $("#my-calendar").zabuto_calendar({
            action: function () {
                return myDateFunction(this.id, false);
            },
            action_nav: function () {
                return myNavFunction(this.id);
            },
            ajax: {
                url: "show_data.php?action=1",
                modal: true
            },
            legend: [
                {type: "text", label: "Special event", badge: "00"},
                {type: "block", label: "Regular event",}
            ]
        });
    });


    function myNavFunction(id) {
        $("#date-popover").hide();
        var nav = $("#" + id).data("navigation");
        var to = $("#" + id).data("to");
        console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }

    //跳转页面的操作   1、表单  2、页面
    function jumpPage(page) {//入参跳转的页码
        //要修改访问的页码
        //获取page的输入框，把当前的page赋值到input中
        document.getElementById("page").value = page;
        //获取form的节点对象，使用submit方法来提交请求
        document.getElementById("form_query").submit();
    }

    //删除的操作
    function deleteUser(id) {//入参跳转的页码
        $.post('deleteUser', {"id": id}, function (result) {
            if (result == true) {
                alert('删除成功');
                window.location.reload();
            } else {
                alert('删除失败，请重新操作');
            }
        });
    }

</script>


</body>
</html>


