<!--BELOW DEBUG NEEDED-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>

		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
			<link rel="stylesheet" href="css/style.css">
			<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
			<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			<title>书籍搜索结果</title>
		</head>

		<body>



			<div class="container">
				<h2>搜索结果</h2>
				<p>所有满足条件的结果如下：</p>
				<table class="table table-hover" style="word-break:keep-all;">
					<!--A TAG HERE SET TO DEBUG ABOUT forEach-->
					<thead>
						<tr>
							<th>样图</th>
							<th>ISBN</th>
							<th>书名</th>
							<th>作者</th>
							<th>出版社</th>
							<th>版本</th>
							<th>适用课程</th>
							<th>适用年级</th>
							<th>适用专业</th>
							<th>适用学院</th>
							<th>标签</th>
							<th>新旧程度</th>
							<th>是否教材</th>
							<th>价格</th>
							<th>折扣(折)</th>
							<th>描述</th>
							<th>发布者学号</th>
							<th>发布者姓名</th>
							<th>发布时间</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td colspan="4"><img src="${book.imageurl}" alt="此处有图片" /></td>
							<td>${book.isbn }</td>
							<td><a href="ShowBookServlet?id=${book.id }&type=sell">${book.name }</a></td>
							<td>${book.autdor }</td>
							<td>${book.publish }</td>
							<td>${book.version }</td>
							<td>${book.course_name }</td>
							<td>${book.grade }</td>
							<td>${book.major }</td>
							<td>${book.school }</td>
							<td>${book.tag }</td>
							<td>${book.age }</td>
							<td>${book.if_course }</td>
							<td>${book.price }</td>
							<td>${book.discount}</td>
							<td>${book.describe }</td>
							<td>${book.st_num }</td>
							<td><a href="ShowUserInfoServlet?st_num=${book.st_num }">${book.userName }</a></td>
							<td>${book.release_time }</td>
						</tr>
					</tbody>
					<!--A TAG HERE SET TO DEBUG ABOUT forEach-->
				</table>
			</div>


			<!--BELOW ARE UNDER DEBUGGING-->
			<!--<table>
				<c:forEach items="${requestScope.books}" var="book">
				<tr>
					<td colspan="4"><img src="${book.imageurl}" alt="此处有图片" /></td>
				</tr>
				<tr>
					<td></td>
					<td>${book.isbn }</td>
					<td>书名：</td>
					<td><a href="ShowBookServlet?id=${book.id }&type=sell">${book.name }</a></td>
					<td>作者：</td>
					<td>${book.author }</td>
					<td>出版社：</td>
					<td>${book.publish }</td>
					<td>版本：</td>
					<td>${book.version }</td>
				</tr>
				<tr>
					<td>新旧程度：</td>
					<td>${book.age }</td>
					<td>是否教材：</td>
					<td>${book.if_course }</td>
					<td>价格：</td>
					<td>${book.price }</td>
					<td>折扣：</td>
					<td>${book.discount}折</td>
					<td>描述：</td>
					<td>${book.describe }</td>
				</tr>
				<tr>
					<td>适用课程：</td>
					<td>${book.course_name }</td>
					<td>适用年级：</td>
					<td>${book.grade }</td>
					<td>适用专业：</td>
					<td>${book.major }</td>
					<td>适用学院：</td>
					<td>${book.school }</td>
					<td>标签：</td>
					<td>${book.tag }</td>
				</tr>
				<tr>
					<td>发布者学号：</td>
					<td>${book.st_num }</td>
					<td>发布者姓名：</td>
					<td><a href="ShowUserInfoServlet?st_num=${book.st_num }">${book.userName }</a></td>
					<td>发布时间：</td>
					<td>${book.release_time }</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td><br/></td>
				</tr>
				</c:forEach>
			</table>-->

			<div>
				<c:forEach var="i" begin="1" end="${pageCount}" step="1">
					<a href="SearchServlet?pageNow=${i}&searchContent=${searchContent}&searchType=${searchType}&bookType=${bookType}">第${i}页</a>
				</c:forEach>
			</div>


		</body>

		</html>