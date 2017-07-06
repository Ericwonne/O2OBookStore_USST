<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
  <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  	a{
  		font-size:20px;
  	}
  </style>
  <title>上理二手书O2O平台</title>
</head>
<body>
<%
		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;
		String value1 ="";
		String value2 ="";
		if(cookies!=null){
			for(int i=0;i<cookies.length;i++){
				cookie = cookies[i];
				if(cookie.getName().equals("username")){
					value1 = cookie.getValue();
				}
				if(cookie.getName().equals("password")){
					value2 = cookie.getValue();
				}
			}
		}
		
	%>
<nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
    <div class="container topnav">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="nav navbar-nav navbar-left">
        <ul class="nav navbar-nav navbar-left">
          <li>
        	<a href="#" class="glyphicon glyphicon-book"style="font-size:24px;font-family: "Source Sans Pro", Arial, sans-serif;">
          	上理二手书O2O平台</a>
          </li>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-right">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#about">关于</a>
                </li>
                <li>
                    <a data-toggle="modal" data-target="#login_admin">管理员</a>
                </li>
                <li>
                    <a href="#contact">联系我们</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="intro-header" style="background-image: url(image/material/index_bg.jpg);">
    <div class="container">
        <div class="row">
        <div class="col-lg-3"></div>
        <div class="col-lg-6 text-center"><br/><br /><br /><br/><br /><br /><br/><br /><br /><br/><br/>
            <div class="signup-header wow fadeInUp">
            <h1 class="form-title text-center" style="color:#FFFFFF">
                	知识不因被使用而失去价值
                </h1>
                <hr class="intro-divider">
                <br /><br />
                <form class="form-header" action="LoginServlet" role="form" method="post">
                    <input type="hidden" name="u" value="503bdae81fde8612ff4944435">
                    <input type="hidden" name="id" value="bfdba52708">
                    <div class="form-group">
                        <input class="form-control input-lg" name="username" type="text" placeholder="学号" required>
                    </div><br>
                    <div class="form-group">
                        <input class="form-control input-lg" name="password" type="password" placeholder="密码" required>
                    </div><br/><br/>
                    <div class="form-group">
                        <input type="submit" class="btn-info btn-block btn-lg" value="登录">
                    </div>
                    <br/>
                    <p class="privacy text-center" style="font-size:20px;text-align:center;">
                    	<a href="user/findPassword.jsp" style="font-weight:bold">忘记密码</a>
                    	或是还没有账号？马上 <a href="user/register.jsp"style="font-weight:bold">注册</a>
                    </p>
                </form>
            </div><br /><br/><br/><br/><br /><br />
        </div>
        <div class="col-lg-3"></div>
        </div>
    </div>
</div>

<div id="login_admin" class="modal fade">
        <div class="modal-dialog " style="width: 400px;">
            <div class="modal-content">
                <div class="modal-body">
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-title">
                    <h2 class="text-center">管理员登录</h2>
                </div>
                <div class="modal-body">
                    <form class="form-group" action="/admin/admin_land" method="post">
                        <div class="form-group">
                            <label for="admin_num">账号</label>
                            <input class="form-control" type="text" id="account" onblur="accountBlur()">
                        </div>
                        <div class="form-group">
                            <label for="admin_passwd">密码</label>
                            <input class="form-control" type="password" id="passwd"  onblur="passwdBlur()">
                        </div>
                        <div class="text-right">
                            <button class="btn btn-primary" type="submit" onclick="login()">登录</button>
                            <button class="btn btn-danger" data-dismiss="modal">取消</button>
                        </div>
                         </form>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="footer.jsp" flush="true" />
</body>
</html>