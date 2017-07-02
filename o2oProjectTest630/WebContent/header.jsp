<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div>
		<form action="SearchServlet" method="get">
			<table>
				<tr>
					<td><select name="searchType">
							<option value="name">商品名</option>
							<option value="author">作者</option>
							<option value="publish">出版社</option>
					</select></td>
					<td colspan="2"><input type="text" name="searchContent"></td>
					<td><input type="submit" value="Search"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="radio" name="bookType" value="buy" checked>买书记录</td>
					<td><input type="radio" name="bookType" value="sale">卖书记录</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>