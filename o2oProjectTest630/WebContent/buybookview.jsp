<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/style.css">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<title>我要发布买书信息~</title>
		<style type="text/css">
			.disabled {
				background: #eee;
			}

			div .pos_fixed {
				position: auto;
				float: left;
				top: 30px;
				right: 5px;
			}

			#maining {
				height: 50px;
				display: flex;
				align-items: center;
				padding: 20px;
				align-content: center;
				text-align: center;
				position: auto;
			}

			#maining input {
				flex: 1;
			}
		</style>
	</head>

	<body>
		<div>
			<hr style="width: auto; color: aquamarine; height: auto; display: block" />
			<p style="text-align: center; font-size:x-large;font-family:'Times New Roman', Times, serif; font-weight:inherit;">请填写以下信息完成买书发布</p>
			<hr style="width: auto; color: aquamarine; height: auto; display: block" />
		</div>
		<div style="padding: 25px 450px 25px;">
			<form action="BuyBookServlet" method="get" class="bs-example bs-example-form">

				<div class="input-group"><span class="input-group-addon"> 书&nbsp;&nbsp;名 </span>
					<input type="text" class="form-control" name="bookname" size="10">
					<span class="input-group-addon"> ISBN </span>
					<input type="text" class="form-control" name="isbn" size="10">
				</div>
				<br/>
				<div class="input-group"><span class="input-group-addon"> 作&nbsp;&nbsp;者 </span>
					<input type="text" class="form-control" name="author" size="10">
					<span class="input-group-addon"> 版&nbsp;本 </span>
					<input type="text" class="form-control" name="version" size="10">
				</div>
				<br/>
				<div class="input-group"><span class="input-group-addon"> 出版社 </span>
					<input type="text" class="form-control" class="form-control" name="publish" size="10">
					<span class="input-group-addon"> 分&nbsp;&nbsp;类 </span>
					<select class="form-control" name="tag">
						<option value="0">全部</option>
						<option value="1">工业技术类</option>
						<option value="2">数理科学类</option>
						<option value="3">文化科教类</option>
						<option value="4">航空航天类</option>
						<option value="5">语言文字类</option>
						<option value="6">艺术文学类</option>
					</select>
				</div>
				<br/>
				<div class="input-group">
					<span class="input-group-addon"> 折扣期望 </span>
					<input type="text" class="form-control" name="expect_discount" id="checkexpect_discount" size="5">
				</div>
				<br/>
				<div class="input-group"><span class="input-group-addon"> 新旧程度期望 </span>
					<input type="text" class="form-control" name="expect_age" id="checkexpect_age" size="5">
				</div>
				<br/>
				<div id="g">
					<div class="input-group"><span class="input-group-addon"> 是否教材 </span>
						<input type="radio" name="if" checked id="yes" value="1">是
						<input type="radio" name="if" id="no" value="0">否
					</div>
				</div>
				<br/>

				<div class="input-group">
					<span class="input-group-addon"> 学&nbsp;&nbsp;院 </span>
					<select id="department" class="form-control" name="school" onchange="updateMajor();">
						<option value="">请选择</option>
						<option value="光电信息与计算机工程学院">光电信息与计算机工程学院</option>
						<option value="能源动力学院">能源动力学院</option>
						<option value="机械学院">机械学院</option>
						<option value="外语学院">外语学院</option>
						<option value="管理学院">管理学院</option>
						<option value="理学院">理学院</option>
					</select> <span class="input-group-addon"> 专&nbsp;&nbsp;业 </span>
					<select id="major" class="form-control" name="major">
						<option value="">请选择</option>
					</select>
				</div>
				<br/>

				<div class="input-group"><span class="input-group-addon"> 年&nbsp;&nbsp;级 </span>
					<select id="grade" class="form-control">
						<option value="">请选择</option>
						<option value="2014">2014</option>
						<option value="2015">2015</option>
						<option value="2016">2016</option>
						<option value="2017">2017</option>
					</select> <span class="input-group-addon"> 对应课程 </span>
					<input type="text" class="form-control" id="course_name" name="course_name" size="10">
				</div>
				<br/>

				<div class="input-group"><span class="input-group-addon"> 描&nbsp;&nbsp;述 </span>
					<input type="text" class="form-control" name="describe" size="100">
				</div>
				<br/>
				<br/>
				<div id="maining">
					<input type="submit" class="btn btn-info col-lg-3" style="color:black" value="提交"> &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" class="btn btn-info col-lg-3" style="color:black" value="重填">
				</div>
			</form>
		</div>

		<div>
			<hr style="width: auto; color: aquamarine; height: auto; display: block" />
			<jsp:include page="../footer.jsp" flush="true" />
			<hr style="width: auto; color: aquamarine; height: auto; display: block" />
		</div>
	</body>
	<script type="text/javascript">
		//<![CDATA[
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
		var get = function (el) { return typeof el == "string" ? document.getElementById(el) : el; }
		var btns = get('g').getElementsByTagName('input');
		for (var i = btns.length; i--;)
			btns[i].onclick = change;
		function change() {
			var dis = this.id == 'no', x = get('grade'), xx = get('course_name'), xxx = get('major'), xxxx = get('school');
			x.disabled = xx.disabled = xxx.disabled = xxxx.disabled = dis;
			x.className = xx.className = xxx.className = xxxx.className = dis ? 'disabled' : ''
			x.value = xx.value = xxx.value = xxxx.value = '';
		};
		//]]>

		//更新专业信息
		function updateMajor() {
			createXMLHttpRequest();
			var department = document.getElementById("department").value;
			var url = "UpdateMajorServlet?department=" + encodeURI(department);
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

		function checkNotNull(cell) {
			var value = document.getElementById(cell).value;
			if (value != "") return true;
			document.getElementById("check" + cell).innerHTML = "不能为空";
			return false;
		}
	</script>

	</html>