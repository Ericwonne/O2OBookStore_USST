<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	function findPassword(){
		window.location.href="findPassword.jsp";
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
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
	<form method="post" action="../LoginServlet">
		<table>
			<tr>
				<td>用户名:</td>
				<td><input type="text" name="username" value=<%=value1 %>></td>
			</tr>
			<tr>
				<td>密码:</td>
				<td><input type="password" name="password" value=<%=value2 %>></td>
			</tr>
			<tr>
				<td><input type="submit" value="登录"></td>
				<td><input type="button" value="忘记密码" onclick="findPassword();"></td>
				<td><input type="checkBox" name="remember" value="1">记住密码</td>
			</tr>
		</table>
	</form>
</body>
</html>