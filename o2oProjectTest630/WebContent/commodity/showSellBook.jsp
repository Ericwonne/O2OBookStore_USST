<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="../css/style.css">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

		<div class="row clearfix" style="margin-top:5px;">
			<div class="col-md-12 column">
				<div class="panel panel-default">
					<div class="panel-heading" style="border-width:1px;border-style:solid;background-color:darkslategray">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" style="text-decoration:underline;color:antiquewhite">
					点击查看书籍详细信息列表
				</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse">
						<!--<div id="collapseOne" class="panel-collapse collapse in"> LIKE THIS ONE ADDED IN WILL FAIL-->
						<div class="panel-body">
							<table class="table table-hover" style="margin:0.2px 2px;font-size:7px;">
								<thead>
									<tr>
										<th>ISBN</th>
										<th>书名</th>
										<th>作者</th>
										<th>出版社</th>
										<th>版本</th>
										<th>预期新旧程度</th>
										<th>是否教材</th>
										<th>价格</th>
										<th>折扣</th>
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
										<td>${book.expect_age }<span>%</span></td>
										<td>${book.if_course }</td>
										<td>${book.price }</td>
										<td>${book.expect_discount}折</td>
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
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div style="margin-left:auto;margin-right:auto;margin-top:20;border-width:1px;border-top-style:dotted;border-bottom-style:dotted;">
			<div class="container jumbotron">
				<div class="row clearfix">
					<div class="col-md-6 column">
						<div class="row">
							<div class="col-lg-5">
								<div>
									<img alt="300x200" class="img-responsive" width="auto" height="auto" src="../image/12.jpg" />
									<div class="caption">
										<p style="text-align:right">
											<a class="btn" href="javascript:void(0);">查看大图</a>
										</p>
										<label style="text-align:right">全新版大学英语</label><br/> 来自XXX，是当代学生的必备教材。
										</p>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 column">
						<div>
							<p>

								书籍价格：


								<h2>100元.</h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn" href="javascript:void(0);">更多</a>
							</p>

							<p>

								书籍价格：


								<h2>100元</h2>.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn" href="javascript:void(0);">更多</a>
							</p>
							<p>
								<h2>
									联系卖家：
								</h2>

								15316831783.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn" href="javascript:void(0);">更多</a>
							</p>
						</div>
					</div>
				</div>
				<div style="margin-top:60px">
					<fieldset>
						<legend>
							书籍描述
						</legend>
						块元素是一个元素，占用了全宽，前后都是换行符。<a class="btn" href="javascript:void(0);">查看详情</a>
					</fieldset>
				</div>
			</div>
		</div>



		<div style="max-width:50%;margin:20px auto;">
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


	</body>

	</html>