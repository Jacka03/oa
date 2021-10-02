<%--jsp页面的命名空间  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>DASHGUM - Bootstrap Admin Template</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet"/>

    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<!-- **********************************************************************************************************************************************************
MAIN CONTENT
*********************************************************************************************************************************************************** -->

<div id="login-page">
    <div class="container">

        <form class="form-login" action="/oa/loginUser">
            <h2 class="form-login-heading">sign in now</h2>
            <div class="login-wrap">
                <input type="text" class="form-control" name="loginname" value="${loginname}"
                       placeholder="User LoginName" autofocus>
                <br>
                <input type="password" name="password" value="${password}" class="form-control" placeholder="Password">
                <label class="checkbox">
		                <span class="pull-right">
		                    <a data-toggle="modal" href="login.html#myModal"> Forgot Password?</a>

		                </span>
                </label>
                <button class="btn btn-theme btn-block" type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
                <%--      使用el表达式从作用域中根据key来获取value          --%>
                <h1>${message}</h1>
                <hr>

                <div class="login-social-link centered">
                    <p>or you can sign in via your social network</p>
                    <button class="btn btn-facebook" data-toggle="modal" href="#insertUserModal" type="button"><i
                            class="fa fa-facebook"></i> 注册
                    </button>
                    <button class="btn btn-twitter" type="reset"><i class="fa fa-twitter"></i> 重置</button>
                </div>
                <div class="registration">
                    Don't have an account yet?<br/>
                    <a class="" href="#">
                        Create an account
                    </a>
                </div>

            </div>
        </form>

        <!-- Modal enctype="multipart/form-data"-->
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
        <!-- modal -->


    </div>
</div>

<!-- js placed at the end of the document so the pages load faster -->
<script src="assets/js/jquery.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

<!--BACKSTRETCH-->
<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
<script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
<script>
    $.backstretch("assets/img/login-bg.jpg", {speed: 500});
</script>


</body>
</html>
