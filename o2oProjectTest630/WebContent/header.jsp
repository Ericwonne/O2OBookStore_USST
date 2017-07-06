<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/style.css">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>

		<nav class="navbar navbar-default top-navbar" role="navigation">
			<div class="container topnav">
				<div class="row">
					<div class="nav navbar-nav navbar-left">
						<ul>
							<li>
								<h1 class="glyphicon glyphicon-book" style="font-size:24px;font-family: " Source Sans Pro ", Arial, sans-serif;">
									上理二手书O2O平台</h1>
							</li>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse navbar-right">
						<div class="row">
							<ul class="nav navbar-nav navbar-right">
								<li>
									<button type="button" class="btn btn-default btn-md">
					    <span class="glyphicon glyphicon-user"></span>
					</button>
								</li>
								<li>
									<button type="button" class="btn btn-default btn-md">
					    <span class="glyphicon glyphicon-star"></span>
					</button>
								</li>
								<li>
									<button type="button" class="btn btn-default btn-md">
					    <span class="glyphicon glyphicon-envelope"></span>
					</button>
								</li>
							</ul>
						</div>
						<div class="row">
							<div class="collapse navbar-collapse navbar-right">
								<form action="SearchServlet" method="get">
									<table>
										<tr>
											<td><select name="searchType" class="form-control selectpicker">
					<option value="name">商品名</option>
					<option value="author">作者</option>
					<option value="publish">出版社</option>
				</select></td>
											<td colspan="2"><input type="text" name="searchContent" class="form-control" placeholder="输入"></td>
											<td><input type="submit" value="搜索" class="btn btn-default"></td>
										</tr>
										<tr style="align:right">
											<td></td>
											<td><input type="radio" name="bookType" value="buy" checked>买书记录</td>
											<td><input type="radio" name="bookType" value="sale">卖书记录</td>
										</tr>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</nav>

	</html>