<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/style.css">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script>
			var xmlHttp;
			var emailValid = true;
			var userNameValid = true;
			function createXMLHttpRequest() {
				if (window.ActiveXObject) {
					xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
				} else if (window.XMLHttpRequest) {
					xmlHttp = new XMLHttpRequest();
				}
			}

			//验证学号是否重复
			function checkUsername() {
				createXMLHttpRequest();
				var userName = document.getElementById("userName").value;
				var url = "../CheckUsernameServlet?userName=" + userName;
				xmlHttp.open("GET", url, true);
				xmlHttp.onreadystatechange = handlecheckUsername;
				xmlHttp.send(null);
			}
			function handlecheckUsername() {
				var message;
				if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
					message = xmlHttp.responseXML.getElementsByTagName("message")[0].firstChild.data;
					document.getElementById("checkuserName").innerHTML = message;
					if (message == "学号重复")
						userNameValid = false;
				}
			}
			//验证邮箱的合法性
			function checkEmail() {
				var email = document.getElementById("email").value;
				var re = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/;
				var result = re.test(email);
				if (result) {
					document.getElementById("checkemail").innerHTML = "邮箱合法";
				} else {
					document.getElementById("checkemail").innerHTML = "邮箱不合法";
					emailValid = false;
				}
			}
			//更新专业信息
			function updateMajor() {
				createXMLHttpRequest();
				var department = document.getElementById("department").value;
				var url = "../UpdateMajorServlet?department=" + encodeURI(department);
				xmlHttp.open("GET", url, true);
				xmlHttp.onreadystatechange = handleUpdateMajor;
				xmlHttp.send(null);
			}
			function handleUpdateMajor() {
				if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
					var majors = xmlHttp.responseXML.getElementsByTagName("message");
					//清除专业列表现有内容
					while (document.getElementById("major").options.length >= 1) {
						document.getElementById("major").removeChild(
							document.getElementById("major").childNodes[0]);
					}
					var optionInit = document.createElement("OPTION");
					optionInit.text = "请选择";
					optionInit.value = "";
					document.getElementById("major").options.add(optionInit);
					//解析XML
					for (var i = 0; i < majors.length; i++) {
						var option = document.createElement("OPTION");
						option.text = majors[i].firstChild.data;
						option.value = majors[i].firstChild.data;
						document.getElementById("major").options.add(option);
					}
				}
			}

			//注册
			function register() {
				var array = new Array("userName", "password", "name", "gender",
					"grade", "department", "major", "email", "valid_ques",
					"valid_ans");
				var flag = true;
				for (var i = 0; i < array.length; i++) {
					flag = checkNotNull(array[i]);
					if (!flag)
						break;
				}
				if (flag && emailValid && userNameValid) {
					var userName = document.getElementById("userName").value;
					var password = document.getElementById("password").value;
					var name = document.getElementById("name").value;
					var gender = document.getElementById("gender").value;
					var grade = document.getElementById("grade").value;
					var department = document.getElementById("department").value;
					var major = document.getElementById("major").value;
					var email = document.getElementById("email").value;
					var valid_ques = document.getElementById("valid_ques").value;
					var qq = document.getElementById("qq").value;
					var wechat = document.getElementById("wechat").value;
					var phone = document.getElementById("phone").value;
					var valid_ans = document.getElementById("valid_ans").value;
					window.location.href = "../RegisterServlet?userName=" + userName
						+ "&password=" + password + "&name=" + name + "&gender="
						+ gender + "&grade=" + grade + "&department=" + department
						+ "&major=" + major + "&email=" + email + "&valid_ques="
						+ valid_ques + "&valid_ans=" + valid_ans + "&qq=" + qq
						+ "&wechat=" + wechat + "&phone=" + phone;
				}
			}
			function checkNotNull(cell) {
				var value = document.getElementById(cell).value;
				if (value != "")
					return true;
				document.getElementById("check" + cell).innerHTML = "不能为空";
				return false;
			}
			$(function () {
				$(":text").focus(function () {
					$(this).css('border-color', '#0f0');
				}).blur(function () {
					$(this).css('border-color', '');
				})
			});
		</script>

		<style>
			span {
				padding: 2px;
				width: 100%;
				display: block;
				float: left;
			}

			.bg-div {
				background: url(../image/bgImage/g.jpg) no-repeat;
				background-size: cover;
				font-size: 16px;
			}

			body {
				/*background: url(../image/bgImage/g.jpg) no-repeat;*/
			}

			.larger_words {
				font-size: 20px;
				color: darkslategray;
			}

			.alert_star {
				color: red;
			}

			.forbtn {
				border-radius: 4px;
				border-width: 1.5px;
				width: 100%;
				height: 40px;
				/*align-content: center;
			background-color: lightblue;
			border-style: groove;
			font-family: Arial;
			font-size: larger;
			width: 15%;*/
			}

			.make_it_center {
				align-content: center;
				text-align: center;
			}

			#maining {
				margin: 10px 350px;
				display: flex;
				align-items: left;
				padding: 0.5px 0.5px;
				align-content: left;
				text-align: left;
				position: auto;
			}

			#maining div {
				flex: 1;
			}
		</style>

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>注册</title>
	</head>

	<body>
		<!--<jsp:include page="../header.jsp" flush="true" />-->
		<hr style="width: auto; color: aquamarine; height: auto; display: block" />

		<div id="div1" class="form-group" style="align-content: center; text-align: center">

			<label style="color: black; font-size: 25px">欢迎注册上理二手书交易网站</label>
		</div>
		<hr style="width: auto; color: aquamarine; height: auto; display: block" />
		<br />
		<br />

		<form>

			<div id="maining" class="row">
				<div class="col-lg-4">
					<span><label>学号：</label></span> <input class="forbtn" type="text" id="userName" onchange="checkUsername();">
					<label id="checkuserName" class="alert_star">*</label>
				</div>
				<div class="col-lg-4">
					<span><label>姓名：</label> </span><input class="forbtn" type="text" id="name"> <label id="checkname" class="alert_star">*</label>
				</div>
			</div>

			<div id="maining" class="row">
				<div class="col-lg-4">
					<span><label>年级：</label></span> <select class="forbtn" id="grade">
								<option value="">请选择</option>
								<option value="大一">大一</option>
								<option value="大二">大二</option>
								<option value="大三">大三</option>
								<option value="大四">大四</option>
							</select>
					<label id="checkgrade" class="alert_star">*</label>
				</div>
				<div class="col-lg-4">
					<span style="padding:5px;"><label>性别：</label></span> &nbsp;&nbsp;&nbsp;&nbsp;男<input id="gender" type="radio" value="男"
					 checked> 女<input name="gender" type="radio" value="女"><label id="checkgender" class="alert_star">*</label>
				</div>

			</div>
		
			<div id="maining" class="row" style="align-items:center">
				<div class="col-lg-4">
					<span><label>学院：</label></span>
					<select class="forbtn" id="department" onchange="updateMajor();">
								<option value="">请选择</option>
								<option value="光电信息与计算机工程学院">光电信息与计算机工程学院</option>
								<option value="能源与动力工程学院">能源动力学院</option>
								<option value="机械工程学院">机械工程学院</option>
								<option value="外语学院">外语学院</option>
								<option value="管理学院">管理学院</option>
								<option value="环境与建筑学院">环境与建筑学院</option>
								<option value="医疗器械与食品学院">医疗器械与食品学院</option>
								<option value="出版印刷与艺术设计学院">出版印刷与艺术设计学院</option>
								<option value="材料科学与工程学院">材料科学与工程学院</option>
								<option value="理学院">理学院</option>
							</select> <label id="checkdepartment" class="alert_star">*</label>
				</div>
				<div class="col-lg-4">
					<span><label>专业：</label></span> <select class="forbtn" id="major" name="major">
								<option value="">请选择</option>
							</select> <label id="checkmajor" class="alert_star">*</label>
				</div>
			</div>

			<div id="maining" class="row">
				<div class="col-lg-4">
					<span><label>Email：</label></span> <input class="forbtn" type="text" id="email" onchange="checkEmail();"> <label id="checkemail"
					 class="alert_star">*</label>
				</div>
				<div class="col-lg-4">
					<span><label>QQ：</label></span> <input class="forbtn" type="text" id="qq">
				</div>
			</div>
		
			<div id="maining" class="row">
				<div class="col-lg-4">
					<span><label>微信：</label></span> <input class="forbtn" type="text" id="wechat">
				</div>
				<div class="col-lg-4">
					<span><label>手机号：</label></span> <input class="forbtn" type="text" id="phone">
				</div>
			</div>

			<div id="maining" class="row">
				<div class="col-lg-4">
					<span><label>身份验证问题：</label></span> <select class="forbtn" id="valid_ques">
								<option value="">请选择</option>
								<option value="你的生日是什么时候？">你的生日是什么时候？</option>
								<option value="你上的第一所学校？">你上的第一所学校？</option>
								<option value="你居住在哪里？">你居住在哪里？</option>
							</select> <label id="checkvalid_ques" class="alert_star">*</label>
				</div>
				<div class="col-lg-4">
					<span><label>身份验证答案：</label></span> <input class="forbtn" type="text" id="valid_ans"> <label id="checkvalid_ans" class="alert_star">*</label>
				</div>
			</div>

			<div id="maining" class="row">
				<div class="col-lg-4">
					<span><label>密码：</label> </span><input class="forbtn" type="text" id="password"> <label id="checkpassword" class="alert_star">*</label>
				</div>
			</div>
		
			<br />
			<div id="maining" style="padding:5px 10px;">
				<button type="submit" class="btn btn-info" style="width:100%;height:40px;">注册</button>
			</div>
		</form>
		<hr style="width: auto; color: aquamarine; height: auto; display: block" />
		<jsp:include page="../footer.jsp" flush="true" />
	</body>

	</html>