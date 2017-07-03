<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="../css/bootstrap-table.min.css">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<title>用户个人信息</title>
	</head>

	<body>
		<jsp:include page="../header.jsp" flush="true" />



		<div class="container">

			<jsp:include page="../left.jsp" flush="true" />

			<div class="container" style="margin:30px auto">
				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">个人信息管理</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" style="border-width:1px;border-style:dotted; width:inherit">
							<div class="panel-body">
								<ul class="list-group">
									<li class="list-group-item"><label>商品名称：</label> ${book.name }</li>
									<li class="list-group-item"><label>姓名：</label> ${user.name }</li>
									<li class="list-group-item"><label>学号：</label>${user.st_num }</li>
									<li class="list-group-item"><label>性别：</label>${user.sex }</li>
									<li class="list-group-item"><label>年级：</label>${user.grade }</li>
									<li class="list-group-item"><label>学院：</label>${user.school }</li>
									<li class="list-group-item"><label>专业：</label>${user.major }</li>
									<li class="list-group-item"><label>手机号：</label>${user.phone }</li>
									<li class="list-group-item"><label>QQ号：</label>${user.qq }</li>
									<li class="list-group-item"><label>微信号：</label>${user.wechat }</li>
									<li class="list-group-item"><label>邮箱：</label>${user.email }</li>
								</ul>
							</div>
							<div class="panel-body">

								<form action="AddMessageServlet" method="get" class="bs-example bs-example-form">
									<div class="container" style="border-width:1px;border-style:dotted; width:inherit">

										<input type="text" name="content" class="form-control" placeholder="发送私信给[TA]..." style="width:95%;margin:10px auto">

										<div style="margin:20px;text-align:right;">

											<input type="submit" value="发送私信" class="btn btn-info" style="width:20%;margin-right:10px">
											<input type="hidden" name="sender" value="${loginUser.id }">
											<input type="hidden" name="accepter" value="${book.userId }">
											<input type="hidden" name="recordId" value="${book.id }">
											<input type="hidden" name="type" value="${book.type }">
											<input type="hidden" name="if_private" value="1">
										</div>
									</div>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>


		</div>






		</div>
		<!--<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapseQne">
					点击我进行展开，再次点击我进行折叠。第 1 部分
				</a>
					</h4>
				</div>
				<div id="collapseQne" class="panel-collapse collapse in">
					<div class="panel-body">


						<ul class="list-group">
							<li class="list-group-item">免费域名注册</li>
							<li class="list-group-item">免费 Window 空间托管</li>
							<li class="list-group-item">图像的数量</li>
							<li class="list-group-item">24*7 支持</li>
							<li class="list-group-item">每年更新成本</li>
						</ul>
					</div>
					<div class="panel-body">


						<ul class="list-group">
							<li class="list-group-item">免费域名注册</li>
							<li class="list-group-item">免费 Window 空间托管</li>
							<li class="list-group-item">图像的数量</li>
							<li class="list-group-item">24*7 支持</li>
							<li class="list-group-item">每年更新成本</li>
						</ul>
					</div>
				</div>
			</div>-->


		<jsp:include page="../footer.jsp" flush="true" />
	</body>

	</html>