<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword"
          content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>DASHGUM - Bootstrap Admin Template</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet"/>

    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

</head>

<body>


<div id="login-page">
    <div class="container">

        <!-- 请求方式为post    enctype="multipart/form-data"-->
        <form method="post" action="updateEmployee" enctype="multipart/form-data">
            <!-- 设置请求方式为method     类型 enctype="multipart/form-data"  -->
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" id="button_close" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;
                        </button>
                        <h4 class="modal-title">修改员工信息</h4>
                    </div>

                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="modal-body col-md-5">
                            <p>员工名：</p>
                            <input type="hidden" name="id" value="${employee.id}"/>
                            <input type="text" name="name" placeholder="请输入员工名" value="${employee.name}"
                                   autocomplete="off" class="form-control placeholder-no-fix">
                        </div>
                        <div class="modal-body  col-md-5">
                            <p>密码：</p>
                            <input type="text" name="password" placeholder="请输入密码" value="${employee.password}"
                                   autocomplete="off" class="form-control placeholder-no-fix">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <div class="row">
                        <div class="col-md-1"></div>

                        <div class="modal-body col-md-5">
                            <p>身份证：</p>
                            <input type="text" name="cardId" placeholder="请输入身份证" value="${employee.cardId}"
                                   autocomplete="off" class="form-control placeholder-no-fix">
                        </div>

                        <div class="modal-body col-md-5">
                            <p>手机号码：</p>
                            <input type="text" name="phone" placeholder="请输入手机号码" value="${employee.phone}"
                                   autocomplete="off" class="form-control placeholder-no-fix">
                        </div>

                        <div class="col-md-1"></div>
                    </div>



                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="modal-body col-md-5">
                            <p>邮箱：</p>
                            <input type="text" name="email" placeholder="请输入邮箱" value="${employee.email}"
                                   autocomplete="off" class="form-control placeholder-no-fix">
                        </div>
                        <div class="modal-body col-md-5">
                            <p>性别：</p>
                            <select name="sex" class="form-control placeholder-no-fix">
                                <c:if test="${employee.sex==1}">
                                    <option value="1">男</option>
                                    <option value="2">女</option>
                                </c:if>
                                <c:if test="${employee.sex==2}">
                                    <option value="2">女</option>
                                    <option value="1">男</option>
                                </c:if>
                            </select>
                        </div>
                        <div class="col-md-1"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="modal-body col-md-5">
                            <p>部门：</p>

                            <select name="deptId" class="form-control placeholder-no-fix">
                                <option value="${employee.dept.id}">${employee.dept.name}</option>

                                <c:forEach items="${deptList}" var="deptItem">
                                    <option value="${deptItem.id}">${deptItem.name}</option>
                                </c:forEach>

                            </select>
                        </div>
                        <div class="modal-body col-md-5">
                            <p>岗位：</p>
                            <select name="jobId" class="form-control placeholder-no-fix">

                                <option value="${employee.job.id}">${employee.job.name}</option>

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
                            <input type="text" name="party" placeholder="请输入政治面貌" value="${employee.party}"
                                   autocomplete="off" class="form-control placeholder-no-fix">
                        </div>

                        <div class="modal-body col-md-5">
                            <p>民族：</p>
                            <input type="text" name="race" placeholder="请输入民族" value="${employee.race}"
                                   autocomplete="off" class="form-control placeholder-no-fix">
                        </div>

                        <div class="col-md-1"></div>
                    </div>


                    <div class="row">
                        <div class="col-md-1"></div>

                        <div class="modal-body col-md-5">
                            <p>学历：</p>
                            <input type="text" name="education" placeholder="请输入学历" value="${employee.education}"
                                   autocomplete="off" class="form-control placeholder-no-fix">
                        </div>

                        <div class="modal-body col-md-5">
                            <p>头像：${employee.imgname}</p>
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
        </form>

    </div>
</div>

<!-- js placed at the end of the document so the pages load faster -->
<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

<!--BACKSTRETCH-->
<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
<script type="text/javascript"
        src="assets/js/jquery.backstretch.min.js"></script>
<script>
    $.backstretch("assets/img/login-bg.jpg", {
        speed: 500
    });
    $('#button_close').click(function () {
        history.go(-1);
    });
</script>


</body>
</html>


