<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>显示用户个人信息</title>
</head>
<body>
	<table style="text-align: center;">
		<tr>
			<td>姓名：</td>
			<td>${user.name }</td>
		</tr>
		<tr>
			<td>学号：</td>
			<td>${user.st_num }</td>
		</tr>
		<tr>
			<td>性别：</td>
			<td>${user.sex }</td>
		</tr>
		<tr>
			<td>年级：</td>
			<td>${user.grade }</td>
		</tr>
		<tr>
			<td>学院：</td>
			<td>${user.school }</td>
		</tr>
		<tr>
			<td>专业：</td>
			<td>${user.major }</td>
		</tr>
		<tr>
			<td>手机号：</td>
			<td>${user.phone }</td>
		</tr>
		<tr>
			<td>QQ号：</td>
			<td>${user.qq }</td>
		</tr>
		<tr>
			<td>微信号：</td>
			<td>${user.wechat }</td>
		</tr>
		<tr>
			<td>邮箱：</td>
			<td>${user.email }</td>
		</tr>
	</table>
</body>
</html>