<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<script>
			function findPassword() {
				window.location.href = "findPassword.jsp";
			}

		</script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>登录</title>
	</head>

	<body>
		<div>
			<jsp:include page="../header.jsp" flush="true" />
		</div>
		<form method="post" action="/LoginServlet">
			<table>
				<tr>
					<td>用户名:</td>
					<td><input type="text" name="username" /></td>
				</tr>
				<tr>
					<td>密码:</td>
					<td><input type="password" name="password" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="登录"></td>
					<td><input type="reset" value="重置"></td>
					<td><input type="button" value="忘记密码" onclick="findPassword();"></td>
				</tr>
			</table>
		</form>
		<div>
			<jsp:include page="../footer.jsp" flush="true" />
		</div>
	</body>

	</html>