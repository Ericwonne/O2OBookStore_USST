<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>

		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
			<link rel="stylesheet" href="css/style.css">
			<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
			<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			<title>显示商品详情</title>
			<style>
				#comment_comments_ {
					height: 50px;
					display: flex;
					align-items: center;
					padding: 20px;
					align-content: center;
					text-align: center;
					position: auto;
				}
				/*#comment_comments input {
					flex: 1;
				}*/
			</style>
		</head>

		<body>
			<br/>
			<br/>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" style="text-decoration:underline;color:blue">
					点击查看书籍详细信息列表
				</a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse">
					<!--<div id="collapseOne" class="panel-collapse collapse in"> LIKE THIS ONE ADDED IN WILL FAIL-->
					<div class="panel-body">
						<table class="table table-hover" style="margin:0.2px 2px;font-size:7px;">
							<thead>
								<tr>
									<th>ISBN：</th>
									<th>书名：</th>
									<th>作者：</th>
									<th>出版社：</th>
									<th>版本：</th>
									<th>预期新旧程度：</th>
									<th>是否教材：</th>
									<th>预期折扣：</th>
									<th>描述：</th>
									<th>适用课程：</th>
									<th>适用年级：</th>
									<th>适用专业：</th>
									<th>适用学院：</th>
									<th>标签：</th>
									<th>发布者学号：</th>
									<th>发布者姓名：</th>
									<th>发布时间：</th>

								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${book.isbn }</td>
									<td><a href="ShowBookServlet?id=${book.id }&type=buy">${book.name }</a></td>
									<td>${book.author }</td>
									<td>${book.expect_age }<span>%</span></td>
									<td>${book.publish }</td>
									<td>${book.version }</td>
									<td>${book.if_course }</td>
									<td>${book.expect_discount}折</td>
									<td>${book.describe }</td>
									<td>${book.course_name }</td>
									<td>${book.grade }</td>
									<td>${book.major }</td>
									<td>${book.school }</td>
									<td>${book.tag }</td>
									<td>${book.st_num }</td>
									<td><a href="ShowUserInfoServlet?st_num=${book.st_num }">${book.userName }</a></td>
									<td>${book.release_time }</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div style="margin:10px 300px;">
				<div class="container" style="margin-left:20px">
					<img src="../image/bgImage/a.jpg" class="img-thumbnail img-responsive" alt="Check it out" width="236" height="304">
				</div>
				<strong><input type="button"></strong>


			</div>
			<br/>
			<br/>
			<br/>


			<div id="comment_comments" style="margin:40px;padding:20px 250px;align-content:center;align-items:center;">


				<div class="container">
					<table class="table table-hover">
						<tr>
							<th>留言者</th>
							<th>留言内容</th>
							<th>留言时间</th>
						</tr>
						<c:forEach var="message" items="${messages }">
							<tr>
								<td><a href="ShowUserInfoServlet?st_num=${message.senderSt_num}">${message.senderName }</a></td>
								<td>${message.content }</td>
								<td>${message.release_time}</td>
							</tr>
						</c:forEach>
					</table>
				</div>


				<div class="input-group">
					<form action="AddMessageServlet" method="get">
						<tr>
							<td><input class="form-control" width="100%" name="content" /></td>
							<td><input class="form-control" type="submit" width="100%" value="留言"></td>
							<td><input class="form-control" type="hidden" width="100%" name="sender" value="${loginUser.id}"></td>
							<td><input class="form-control" type="hidden" width="100%" name="recordId" value="${book.id}"></td>
							<td><input class="form-control" type="hidden" width="100%" name="type" value="0"></td>
							<td><input class="form-control" type="hidden" width="100%" name="accepter" value="${book.userId }"></td>
						</tr>
					</form>
				</div>

			</div>
		</body>

		</html>