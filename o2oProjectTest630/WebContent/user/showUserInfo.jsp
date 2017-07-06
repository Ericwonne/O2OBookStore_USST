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
		<style>
			html {
  overflow-y: scroll;
}

:root {
  overflow-y: auto;
  overflow-x: hidden;
}

:root body {
  position: absolute;
}

body {
  width: 100vw;
  overflow: hidden;
}
		</style>
	</head>

	<body>
		<jsp:include page="../header.jsp" flush="true" />



		<div class="container">

			<div>
				<jsp:include page="../left.jsp" flush="true" />			
			</div>
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
								
									<label>商品名称：</label> ${book.name }<br/>
									<label>姓名：</label> ${user.name }<br/>
									<label>学号：</label>${user.st_num }<br/>
									<label>性别：</label>${user.sex }<br/>
									<label>年级：</label>${user.grade }<br/>
									<label>学院：</label>${user.school }<br/>
									<label>专业：</label>${user.major }<br/>
									<label>手机号：</label>${user.phone }<br/>
									<label>QQ号：</label>${user.qq }<br/>
									<label>微信号：</label>${user.wechat }<br/>
									<label>邮箱：</label>${user.email }<br/>
								
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


		<br/>
		<br/>
		<br/>
		<jsp:include page="../footer.jsp" flush="true" />
		<br/>
		<br/>
	</body>

	</html>