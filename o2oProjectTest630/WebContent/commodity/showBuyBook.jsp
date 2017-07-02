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
		</head>

		<body>
			<table>
				<tr>
					<td>ISBN：</td>
					<td>${book.isbn }</td>
					<td>书名：</td>
					<td><a href="ShowBookServlet?id=${book.id }&type=buy">${book.name }</a></td>
					<td>作者：</td>
					<td>${book.author }</td>
					<td>出版社：</td>
					<td>${book.publish }</td>
					<td>版本：</td>
					<td>${book.version }</td>
				</tr>
				<tr>
					<td>预期新旧程度：</td>
					<td>${book.expect_age }<span>%</span></td>
					<td>是否教材：</td>
					<td>${book.if_course }</td>
					<td>预期折扣：</td>
					<td>${book.expect_discount}折</td>
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

				</tr>
			</table>

			<form action="AddMessageServlet" method="get">
				<table>
					<tr>
						<td><textarea rows="5" cols="20" name="content"></textarea></td>
						<td><input type="submit" value="留言"></td>
						<td><input type="hidden" name="sender" value="${loginUser.id}"></td>
						<td><input type="hidden" name="recordId" value="${book.id}"></td>
						<td><input type="hidden" name="type" value="0"></td>
						<td><input type="hidden" name="accepter" value="${book.userId }"></td>
				</table>
			</form>
			<table>
				<tr>
					<td>留言者</td>
					<td>留言时间</td>
					<td>留言内容</td>
				</tr>
				<c:forEach var="message" items="${messages }">
					<tr>
						<td><a href="ShowUserInfoServlet?st_num=${message.senderSt_num}">${message.senderName }</a></td>
						<td>${message.release_time}</td>
						<td>${message.content }</td>
					</tr>
				</c:forEach>
			</table>
		</body>

		</html>