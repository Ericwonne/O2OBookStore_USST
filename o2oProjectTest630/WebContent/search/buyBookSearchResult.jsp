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
							<th>ISBN</th>
							<th>书名</th>
							<th>作者</th>
							<th>出版社</th>
							<th>版本</th>
							<th>预期新旧程度</th>
							<th>是否教材</th>
							<th>预期折扣</th>
							<th>描述</th>
							<th>适用课程</th>
							<th>适用年级</th>
							<th>适用专业</th>
							<th>适用学院</th>
							<th>标签</th>
							<th>发布者学号</th>
							<th>发布者姓名</th>
							<th>发布时间</th>

						</tr>
					</thead>

					<tbody>
						<tr>

							<td>${book.isbn }</td>
							<td><a href="ShowBookServlet?id=${book.id }&type=buy">${book.name }</a></td>
							<td>${book.author }</td>
							<td>${book.publish }</td>
							<td>${book.version }</td>
							<td>${book.expect_age }<span></span></td>
							<td>${book.if_course }</td>
							<td>${book.expect_discount}</td>
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
					<!--A TAG HERE SET TO DEBUG ABOUT forEach-->
				</table>
			</div>

			<div>
				<c:forEach var="i" begin="1" end="${pageCount}" step="1">
					<a href="SearchServlet?pageNow=${i}&searchContent=${searchContent}&searchType=${searchType}&bookType=${bookType}">第${i}页</a>
				</c:forEach>
			</div>
		</body>

		</html>