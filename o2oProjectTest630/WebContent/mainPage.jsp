<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上理二手书O2O平台</title>
</head>
<body>


	<div class="col-lg-3" style="margin: 0">
		<ul class="nav navbar-default navbar-side navbar-inverse"
			data-offset-top="125">
			<div class="col-lg-12 col-md-3 col-sm-4">
				<li><a href="ShowSchoolBooks?school=能源与动力工程学院">能源与动力工程学院&nbsp;&nbsp;&nbsp;</a></li>
			</div>
			<div class="col-lg-12 col-md-3 col-sm-4">
				<li><a href="ShowSchoolBooks?school=光电信息与计算机工程学院">光电信息与计算机工程学院</a></li>
			</div>
			<div class="col-lg-12 col-md-3 col-sm-4">
				<li><a href="ShowSchoolBooks?school=管理学院">管理学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			</div>
			<div class="col-lg-12 col-md-3 col-sm-4">
				<li><a href="ShowSchoolBooks?school=机械工程学院">机械工程学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			</div>
			<div class="col-lg-12 col-md-3 col-sm-4">
				<li><a href="ShowSchoolBooks?school=外语学院">外语学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			</div>
			<div class="col-lg-12 col-md-3 col-sm-4">
				<li><a href="ShowSchoolBooks?school=环境与建筑学院">环境与建筑学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			</div>
			<div class="col-lg-12 col-md-3 col-sm-4">
				<li><a href="ShowSchoolBooks?school=医疗器械与食品学院">医疗器械与食品学院&nbsp;&nbsp;&nbsp;</a></li>
			</div>
			<div class="col-lg-12 col-md-3 col-sm-4">
				<li><a href="ShowSchoolBooks?school=出版印刷与艺术设计学院">出版印刷与艺术设计学院&nbsp;</a></li>
			</div>
			<div class="col-lg-12 col-md-3 col-sm-4">
				<li><a href="ShowSchoolBooks?school=理学院">理学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
			</div>
			<div class="col-lg-12 col-md-3 col-sm-4">
				<li><a href="ShowSchoolBooks?school=材料科学与工程学院">材料科学与工程学院&nbsp;&nbsp;&nbsp;</a></li>
			</div>
			<div class="col-lg-12 col-md-3 col-sm-4">
				<li><a href="ShowSchoolBooks?school=材料科学与工程学院">材料科学与工程学院&nbsp;&nbsp;&nbsp;</a></li>
			</div>
			<div class="col-lg-12 col-md-3 col-sm-4">
				<li><a href="ShowSchoolBooks?school=非教材类书籍">非教材类书籍&nbsp;&nbsp;&nbsp;</a></li>
			</div>
		</ul>
	</div>
	<h1>与我相关推荐</h1>
	<h2>买书记录</h2>
	<table>
		<c:forEach items="${requestScope.relatedBuyBooks}" var="book">
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
	<table>
		<c:forEach items="${requestScope.relatedSellBooks}" var="book">
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
	<h1>热门推荐</h1>
	<h2>买书记录</h2>
	<table>
		<c:forEach items="${requestScope.hotBuyBooks}" var="book">
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
	<table>
		<c:forEach items="${requestScope.hotSellBooks}" var="book">
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