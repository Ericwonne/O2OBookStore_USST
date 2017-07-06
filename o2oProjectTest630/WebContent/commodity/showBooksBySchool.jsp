<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${school}</title>
</head>
<body>
	<h1>2016级</h1>
	<h2>买书记录</h2>
	<a href="ShowAllSchoolBooks?type=买书记录&school=${school}&grade=2016">查看更多</a>
	<table>
		<c:forEach items="${requestScope.buyBook1s}" var="book">
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
				<td><a
					href="ShowUserInfoServlet?st_num=${book.st_num }&bookId=${book.id}&type=0">${book.userName }</a></td>
				<td>发布时间：</td>
				<td>${book.release_time }</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><br /></td>
			</tr>
		</c:forEach>
	</table>
	<h2>卖书记录</h2>
	<a href="ShowAllSchoolBooks?type=卖书记录&school=${school}&grade=2016">查看更多</a>
	<table>
		<c:forEach items="${requestScope.sellBook1s}" var="book">
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
				<td><a
					href="ShowUserInfoServlet?st_num=${book.st_num }&bookId=${book.id}&type=1">${book.userName }</a></td>
				<td>发布时间：</td>
				<td>${book.release_time }</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><br /></td>
			</tr>
		</c:forEach>
	</table>
	<h1>2015级</h1>
	<h2>买书记录</h2>
	<a href="ShowAllSchoolBooks?type=买书记录&school=${school}&grade=2015">查看更多</a>
	<table>
		<c:forEach items="${requestScope.buyBook2s}" var="book">
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
				<td><a
					href="ShowUserInfoServlet?st_num=${book.st_num }&bookId=${book.id}&type=0">${book.userName }</a></td>
				<td>发布时间：</td>
				<td>${book.release_time }</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><br /></td>
			</tr>
		</c:forEach>
	</table>
	<h2>卖书记录</h2>
	<a href="ShowAllSchoolBooks?type=卖书记录&school=${school}&grade=2015">查看更多</a>
	<table>
		<c:forEach items="${requestScope.sellBook2s}" var="book">
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
				<td><a
					href="ShowUserInfoServlet?st_num=${book.st_num }&bookId=${book.id}&type=1">${book.userName }</a></td>
				<td>发布时间：</td>
				<td>${book.release_time }</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><br /></td>
			</tr>
		</c:forEach>
	</table>
	<h1>2014级</h1>
	<h2>买书记录</h2>
	<a href="ShowAllSchoolBooks?type=买书记录&school=${school}&grade=2014">查看更多</a>
	<table>
		<c:forEach items="${requestScope.buyBook3s}" var="book">
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
				<td><a
					href="ShowUserInfoServlet?st_num=${book.st_num }&bookId=${book.id}&type=0">${book.userName }</a></td>
				<td>发布时间：</td>
				<td>${book.release_time }</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><br /></td>
			</tr>
		</c:forEach>
	</table>
	<h2>卖书记录</h2>
	<a href="ShowAllSchoolBooks?type=卖书记录&school=${school}&grade=2014">查看更多</a>
	<table>
		<c:forEach items="${requestScope.sellBook3s}" var="book">
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
				<td><a
					href="ShowUserInfoServlet?st_num=${book.st_num }&bookId=${book.id}&type=1">${book.userName }</a></td>
				<td>发布时间：</td>
				<td>${book.release_time }</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><br /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>