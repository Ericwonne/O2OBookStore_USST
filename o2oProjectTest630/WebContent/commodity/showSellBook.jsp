<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>

		<head>
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="../css/bootstrap-table.min.css">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<!--<script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table-locale-all.min.js"></script>-->
		<script src="../js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<!--<script src="assets/bootstrap2.3/js/bootstrap.min.js"></script>-->
		<script src="../js/tableExport.js"></script>
		<script src="../js/jquery.base64.js"></script>
		<script src="../js/bootstrap-table.js"></script>
		<script src="../js/bootstrap-table-export.js"></script>
			<title>显示商品详情-卖书</title>
			<style>
				#comment_comments_ {
					height: 50px;
					display: flex;
					align-items: center;
					padding: 20px;
					align-content: center;
					text-align: center;
					position: auto;
				}

				#comment_comments_ div {
					flex: 1;
				}
			</style>
		</head>

		<body>

			<div class="container jumbotron" style="padding:15px 30px;">
				<div class="container jumbotron" style="padding:15px 30px;border-style:dotted;border-width:0.5px;border-color:blue;">
					<div class="row clearfix">
						<div class="col-lg-6 column">
							<div class="row" style="padding:15px 30px;border-style:dotted;border-width:0.5px;border-color:blue;border:none">
								<header style="background-color:aquamarine;color:black;width:100%;margin:0%;font-family:Arial, Helvetica, sans-serif">&nbsp;&nbsp;图书样图</header>
								<div class="col-lg-5" style="width:100%;height:100%">
									<div>
										<img alt="300x200" class="img-responsive" style="width:90%;height:100%;border-style:groove;" src="../image/12.jpg" />
										<div class="caption">
											<header style="background-color:aquamarine;color:black;width:100%;margin-top:10px;font-family:Arial, Helvetica, sans-serif">&nbsp;&nbsp;图书特点</header>
											<p style="margin-top:10px;">
												<label style="text-align:right">全新版大学英语</label><br/> 来自XXX，是当代学生的必备教材。
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
							<div class="col-lg-6 column">
							<div style="padding:15px 30px;border-style:dotted;border-width:0.5px;border-color:blue;border:none">
								<header style="background-color:aquamarine;color:black;width:100%;margin:0%;font-family:Arial, Helvetica, sans-serif">&nbsp;&nbsp;图书基本信息</header>
								<div style="font-size:75%;margin-top:10px;">
									书籍价格：<br/>
									<font size="6" style="font-weight:lighter" face="arial" color="black">${book.price }元.</font>
								</div>
								<br/>
								<div style="font-size:50%">
									书籍折扣：<br/>
									<font size="6" style="font-weight:lighter" face="arial" color="black">${book.discount}折.</font>（原书籍价格：150元）
								</div>
								<br/>
								<div style="font-size:50%">
									联系卖家：<br/>
									<div class="panel panel-default" style="font-size:inherit; background-color:inherit;;border:inherit;">
										<div class="panel-heading" style="font-size:inherit;">
											<h4 class="panel-title" style="font-size:inherit;">
												<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
													<font size="6" style="font-weight:lighter" face="arial" color="black">${book.phone }</font>（电话号码）</a>
											</h4>
										</div>
										<div id="collapseOne" class="panel-collapse collapse" style="font-size:inherit;">
											<div class="panel-body">
												<!--<ul class="list-group">
													<li class="list-group-item">免费域名注册</li>
													<li class="list-group-item">免费 Window 空间托管</li>
												</ul>-->
												<font size="6" style="font-weight:lighter" face="arial" color="black">${book.wechat }</font> （微信号码）
												<br/>
												<font size="6" style="font-weight:lighter" face="arial" color="black">${book.QQ }</font> （QQ号码）
											</div>
										</div>
									</div>
									<a class="add-on" href="">.点击查看卖家详细信息</a>
								</div>
							</div>
							<br/><br/>
							<div style="margin-top:20px">
								<p style="text-align: center">
									<a class="btn btn-info" style="font-size:100%;color:black;text-align:center" href="">添加到我的收藏</a>
								</p>
							</div>
						</div>
					</div>

					<div style="margin-top:25px;padding-top:20px;">
						<header style="background-color:aquamarine;color:black;width:100%;margin:0%;font-family:Arial, Helvetica, sans-serif">&nbsp;&nbsp;更多信息</header>
						<div class="row clearfix" style="margin-top:5px;">
							<div class="col-md-12 column">
								<div class="panel panel-default">
									<div class="panel-heading" style="border-width:1px;border-style:solid;background-color:grey">
										<h4 class="panel-title">
											<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" style="text-decoration:underline;color:antiquewhite;font-weight:lighter">
											点击查看书籍详细信息列表
											</a>
										</h4>
									</div>
									<div id="collapseOne" class="panel-collapse collapse">
										<!--<div id="collapseOne" class="panel-collapse collapse in"> LIKE THIS ONE ADDED IN WILL FAIL-->
										<div class="panel-body">
											<table class="table table-hover" style="margin:2px 2px;font-size:8px;padding:5px">
												<thead>
													<tr>
														<th>ISBN：</th>
														<th>书名：</th>
														<th>作者：</th>
														<th>出版社：</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>${book.isbn }</td>
														<td><a href="ShowBookServlet?id=${book.id }&type=buy">${book.name }</a></td>
														<td>${book.author }</td>
														<td>${book.expect_age }<span>%</span></td>
													</tr>
												</tbody>

												<thead>
													<th>版本：</th>
													<th>预期新旧程度：</th>
													<th>是否教材：</th>
													<th>预期折扣：</th>


												</thead>
												<tbody>
													<td>${book.publish }</td>
													<td>${book.version }</td>
													<td>${book.if_course }</td>
													<td>${book.expect_discount}折</td>
												</tbody>

												<thead>
													<th>描述：</th>
													<th>适用课程：</th>
													<th>适用年级：</th>
													<th>适用专业：</th>
												</thead>
												<tbody>
													<td>${book.describe }</td>
													<td>${book.course_name }</td>
													<td>${book.grade }</td>
													<td>${book.major }</td>
												</tbody>

												<thead>
													<th>适用学院：</th>
													<th>标签：</th>
													<th>发布者学号：</th>
													<th>发布者姓名：</th>
												</thead>

												<tbody>
													<td>${book.school }</td>
													<td>${book.tag }</td>
													<td>${book.st_num }</td>
													<td><a href="ShowUserInfoServlet?st_num=${book.st_num }">${book.userName }</a></td>
												</tbody>

												<thead>
													<th>发布时间：</th>
												</thead>
												<tbody>
													<td>${book.release_time }</td>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div style="max-width:80%;margin:20px auto;">
					<div>
						<table class="table table-hover">
							<thead>
								<tr>
									<th style="font-size:25px;font-weight:lighter;font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif">关于这本书的留言</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div class="row" style="font-size:18px;font-family:Georgia, 'Times New Roman', Times, serif">
											<div style="display: inline">
												<a href="javascript:void()" type="btn">李其准</a>：
											</div>
											<div style="font-size:85%;display: inline">
												我觉得这本书很好，大家可以买来看看，总之上课是够用了。我觉得这本书很好，大家可以买来看看，总之上课是够用了。我觉得这本书很好，大家可以买来看看，总之上课是够用了。 我觉得这本书很好，大家可以买来看看，总之上课是够用了。我觉得这本书很好，大家可以买来看看，总之上课是够用了。我觉得这本书很好，大家可以买来看看，总之上课是够用了。
											</div>
											<div style="font-size:75%;display: inline;color:darkblue">
												2017.05.03
											</div>
										</div>
									</td>
								</tr>

								<tr>
									<td>
										<div class="row" style="font-size:18px;font-family:Georgia, 'Times New Roman', Times, serif">
											<div style="display: inline">
												<a href="javascript:void()" type="btn">李其准</a>：
											</div>
											<div style="font-size:85%;display: inline">
												我觉得这本书很好，大家可以买来看看，总之上课是够用了。我觉得这本书很好，大家可以买来看看，总之上课是够用了。我觉得这本书很好，大家可以买来看看，总之上课是够用了。我觉得这本书很好，大家可以买来看看，总之上课是够用了。我觉得这本书很好，大家可以买来看看，总之上课是够用了。
											</div>
											<div style="font-size:75%;display: inline;color:darkblue">
												2017.05.03
											</div>
										</div>
									</td>
								</tr>

								<tr>
									<td>
										<div class="row" style="font-size:18px;font-family:Georgia, 'Times New Roman', Times, serif">
											<div style="display: inline">
												<a href="javascript:void()" type="btn">李其准</a>：
											</div>
											<div style="font-size:85%;display: inline">
												我觉得这本书很好，大家可以买来看看，总之上课是够用了。我觉得这本书很好，大家可以买来看看，总之上课是够用了。我觉得这本书很好，大家可以买来看看，总之上课是够用了。
											</div>
											<div style="font-size:75%;display: inline;color:darkblue">
												2017.05.03
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<c:forEach var="message" items="${messages }">

											<div class="row" style="font-size:19px;font-family:Georgia, 'Times New Roman', Times, serif">
												<div style="display: inline">
													<a href="ShowUserInfoServlet?st_num=${message.senderSt_num}">${message.senderName }</a>
												</div>
												<div style="font-size:85%;display: inline">
													:${message.content}
												</div>
												<div style="font-size:75%;display: inline;color:darkblue">
													${message.release_time}
												</div>
											</div>

										</c:forEach>
									</td>
								</tr>
								<tbody>
						</table>
					</div>


					<div style="max-width:75%;padding-top:60px;margin-left:auto;">
						<form action="AddMessageServlet" method="get">
							<div>
								<input class="form-control" width="100%" name="content" placeholder="输入你对本书的看法..." />
							</div>
							<div style="text-align:right; padding-top:5px">
								<input class="btn btn-info" type="submit" width="100%" value="留言">
								<input class="form-control" type="hidden" width="100%" name="sender" value="${loginUser.id}">
								<input class="form-control" type="hidden" width="100%" name="recordId" value="${book.id}">
								<input class="form-control" type="hidden" width="100%" name="type" value="0">
								<input class="form-control" type="hidden" width="100%" name="accepter" value="${book.userId }">
							</div>


						</form>
					</div>
				</div>
			</div>





		</body>

		</html>