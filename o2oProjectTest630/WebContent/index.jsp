<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://www.htmleaf.com/templets/default/css/common.css">
        <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            body {
                background: url(../image/bg.jpg) no-repeat;
                background-size: cover;
                font-size: 16px;
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






            <nav class="navbar navbar-default navbar-fixed-top bootsnav">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
                        <i class="fa fa-bars"></i>
                        </button>
                        <a class="navbar-brand-mc" href="http://www.htmleaf.com/"><img src="http://www.htmleaf.com/images/logo.svg" class="logo" alt="jQuery之家-自由分享jQuery、html5、css3的插件库"></a>
                    </div>
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav navbar-right nav-actions">
                            <li><a href="http://weibo.com/jqueryzhijia" data-toggle="tooltip" data-placement="bottom" title="关注jQuery之家的新浪微博"
                                    target="_blank"> <i class="fa fa-weibo"></i> <span class="hidden-md hidden-lg" style="font-size: 0.6em;">关注新浪微博</span></a></li>
                            <li><a href="http://koubei.baidu.com/s/htmleaf.com" data-toggle="tooltip" data-placement="bottom"
                                    title="请为jQuery之家在百度口碑上点个赞吧！" target="_blank"> <i class="fa fa-paw"></i> <span class="hidden-md hidden-lg" style="font-size: 0.6em;">百度口碑</span></a></li>
                            <li><a href="http://www.htmleaf.com/about/Contact_Us.html" data-toggle="tooltip" data-placement="bottom"
                                    title="联系我们"> <i class="fa fa-envelope-o"></i> <span class="hidden-md hidden-lg" style="font-size: 0.6em;">联系我们</span></a></li>
                        </ul>
                        <form name="formsearch" action="http://www.htmleaf.com/plus/search.php" rel="nofollow" id="global_search_form" method="post"
                            class="navbar-form-mc navbar-right" role="search">
                            <div class="input-group input-group-nav">
                                <input type="text" name="q" autocomplete="off" id="input-search" class="form-control" placeholder="搜索从这里开始..." maxlength="60">
                                <span class="input-group-btn">
	<a role="button" class="btn" aria-label="search button" id="search-btn">
	<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                </a>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
            </nav>


<!--

            <nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
                <div class="container topnav">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header navbar-left">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
                        <a class="navbar-brand topnav" href="#" style="font-size:20px">上理二手书O2O平台</a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#about" style="font-size:20px">关于</a>
                            </li>
                            <li>
                                <a data-toggle="modal" data-target="#login_admin" href="#services" style="font-size:20px">管理员</a>
                            </li>
                            <li>
                                <a href="#contact" style="font-size:20px">联系我们</a>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container -->
            </nav>-->


            <div class="intro-header">
                <div class="container">
                    <div class="row">
                        <br/><br/><br/>
                        <br/><br/><br/>
                        <div class="col-lg-7">

                        </div>
                        <div class="col-md-5">
                            <div class="signup-header wow fadeInUp">
                                <h2 class="form-title text-center">加入我们</h2>
                                <br/>
                                <form class="form-header" action="http://moxdesign.us10.list-manage.com/subscribe/post" role="form" method="POST" id="#">
                                    <input type="hidden" name="u" value="503bdae81fde8612ff4944435">
                                    <input type="hidden" name="id" value="bfdba52708">
                                    <div class="form-group">
                                        <input class="form-control input-lg" name="username" type="text" placeholder="学号" required>
                                    </div><br>
                                    <div class="form-group">
                                        <input class="form-control input-lg" name="password" type="password" placeholder="密码" required>
                                    </div><br/>
                                    <div class="form-group last">
                                        <input type="submit" class="btn btn-warning btn-block btn-lg" value="登录">
                                    </div>
                                    <br/>
                                    <br/>
                                    <p class="privacy text-center" style="font-size:16px;text-align:right;">还没有账号？马上 <a href="user/register.jsp">注册</a>或是<a href="user/findPassword.jsp">忘记密码</a></p>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>


            <jsp:include page="footer.jsp" flush="true" />
    </body>

    </html>