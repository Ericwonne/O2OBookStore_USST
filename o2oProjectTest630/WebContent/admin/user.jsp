<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<style>
			.right {
				position: inherit;
				right: 10%;
				width: 100%;
				text-align: center;
				background-color: #b0e0e6;
				font-size: 1.5px;
			}
		</style>
		<title>用户管理</title>
	</head>

	<body>

		<div class="container" style="padding: 20px 50px 10px;">

			<form class="bs-example bs-example-form">
				<fieldset>
					<legend>-- 检索用户 --</legend>

					<div class="input-group" style="max-width:50%;">
						<span class="input-group-addon"> 年级 </span>
						<select id="grade" class="form-control">
						<option value="0" selected="selected">全部</option>
						<option value="${grade[0]}">${grade[0]}</option>
						<option value="${grade[1]}">${grade[1]}</option>
						<option value="${grade[2]}">${grade[2]}</option>
						<option value="${grade[3]}">${grade[3]}</option>
						<option value="${grade[4]}">${grade[4]}</option>
						<option value="${grade[5]}">${grade[5]}</option>
						<option value="${grade[6]}">${grade[6]}</option>
						<option value="${grade[7]}">${grade[7]}</option>
						<option value="${grade[8]}">${grade[8]}</option>
						<option value="${grade[9]}">${grade[9]}</option>
					</select>
						<span class="input-group-addon"> 学院 </span>
						<select id="school" class="form-control">
						<option value="0">全部</option>
						<option value="1">能源动力与工程学院</option>
						<option value="2">光电信息与计算机工程学院</option>
						<option value="3">管理学院</option>
						<option value="4">机械工程学院</option>
						<option value="5">外语学院</option>
						<option value="6">环境与建筑学院</option>
						<option value="7">医疗器械与食品学院</option>
						<option value="8">出版印刷与艺术设计学院</option>
						<option value="9">理学院</option>
						<option value="10">材料科学与工程学院</option>
					</select>
					</div>
					<br />

					<div class="input-group"  style="max-width: 50%;">
						<span class="input-group-addon"> 学号 </span>
						<input id="st_num" class="form-control" type="text">
						<span class="input-group-addon"> 姓名 </span>
						<input id="name" class="form-control" type="text">
					</div>
					<br />

					<div class="input-group" style="max-width: 60%;">
						<span class="input-group-addon"> 联系方式 </span>
						<select id="contacts" class="form-control" style="width:20%;">
						<option value="1">邮箱</option>
						<option value="2">手机</option>
						<option value="3">微信</option>
						<option value="4">QQ</option>
						<input id="contact" class="form-control" type="text" style="max-width:62%;">
					</select>
					</div>
					<br />
					<input type="button" class="form-control" style="max-width:50%;" value="搜索" onclick="userSearch()">
				</fieldset>
			</form>


		</div>

		<br>
		<div class="container" style="padding: 20px 50px 10px;">
			<legend>-- 检索结果 --</legend>
			<p>
				<span id="userListSpan" style="display: none"> 为您检索到的用户:
		</p>
		<table id="userTable" class="table table-hover"
			style="word-break: keep-all; max-height: 600px;">
			<thead>
				<tr>
					<th>ID</th>
					<th>学号</th>
					<th>姓名</th>
					<th>学院</th>
					<th>专业</th>
					<th colspan="1">操作</th>
				</tr>
			</thead>

			<tbody id="userList">

			</tbody>
		</table>
		<br />
		<div class="right">
			<span id="spanPre">上一页</span> &emsp; <span id="spanPageNum"></span>&emsp;
				<span id="spanNext">下一页 </span> &emsp; 共 <span id="spanTotalPage"></span>页
		</div>
		</div>

		<br />
		<br />
		<br />
		<br />
	</body>

	<script>
		var xmlHttp;
		var total; //记录搜索检索出的用户总数

		/*****************这些变量用于表格分页显示**************************/
		var theTable = document.getElementById("userList");
		var totalPage = document.getElementById("spanTotalPage");
		var pageNum = document.getElementById("spanPageNum");
		var spanPre = document.getElementById("spanPre");
		var spanNext = document.getElementById("spanNext");
		var numberRowsInTable = theTable.rows.length;
		var pageSize;
		var page = 1;
		/*****************用于表格分页显示**************************/

		/****************异步显示用户检索结果************************/
		function createXMLHttpRequest() {
			if (window.ActiveXObject) {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			} else if (window.XMLHttpRequest) {
				xmlHttp = new XMLHttpRequest();
			}
		}

		function userSearch() {

			createXMLHttpRequest();

			var gradeSelect = document.getElementById("grade"); //
			var index1 = gradeSelect.selectedIndex;
			var grade = gradeSelect.options[index1].value;

			var schoolSelect = document.getElementById("school"); //
			var index2 = schoolSelect.selectedIndex;
			var school = schoolSelect.options[index2].value;

			var st_num = document.getElementById("st_num").value;
			var name = document.getElementById("name").value;

			var contactSelect = document.getElementById("contacts"); //
			var index3 = contactSelect.selectedIndex;
			var contacts = contactSelect.options[index3].value;

			var contact = document.getElementById("contact").value;

			var url = "http://localhost:8080/o2oProjectTest/searchUser?grade=" + grade
				+ "&school=" + school + "&st_num=" + st_num + "&name=" + name
				+ "&contacts=" + contacts + "&contact=" + contact;

			xmlHttp.open("GET", url, true);
			xmlHttp.onreadystatechange = handleSearch;
			xmlHttp.send(null);

		}

		function handleSearch() {
			var message;
			if (xmlHttp.readyState == 4) { // 判断对象状态  
				if (xmlHttp.status == 200) { // 信息已经成功返回，开始处理信息  
					updateUserList();

				} else {
					alert("系统当前无法处理此请求.");
				}
			}
		}

		//更新并显示用户检索结果
		function updateUserList() {

			if (total > 0) {
				var userList = document.getElementById("userList");

				for (var i = 0; i < total; i++) {
					var tr = document.getElementById(i + 5000);
					userList.removeChild(tr);
				}
			}
			var responseXML = xmlHttp.responseXML;
			var status = responseXML.getElementsByTagName("status")[0].firstChild.nodeValue;
			status = parseInt(status);
			if (status != 1) {
				document.getElementById("userListSpan").style.display = "none";
				alert("没有找到相关记录.");
				total = 0;
				return;
			}
			total = responseXML.getElementsByTagName("total")[0].firstChild.nodeValue;
			var users = responseXML.getElementsByTagName("user");
			for (var i = 0; i < parseInt(total); i++) {
				var user = users[i];
				var row = document.createElement("tr");
				row.setAttribute("id", i + 5000);
				id = user.getAttribute("id");
				st_num = user.getAttribute("st_num");
				name = user.getAttribute("name");
				school = user.getAttribute("school");
				major = user.getAttribute("major");

				row.appendChild(createCellWithText(id));
				row.appendChild(createCellWithText(st_num));
				row.appendChild(createCellWithText(name));
				row.appendChild(createCellWithText(school));
				row.appendChild(createCellWithText(major));
				//添加并设置每行中的"管理"按钮
				var manageButton = document.createElement("input");
				manageButton.setAttribute("type", "button");
				manageButton.setAttribute("value", "管理");
				manageButton.onclick = function () {
					window.location.href = "../adminLogin";
				};
				cell = document.createElement("td");
				cell.appendChild(manageButton);

				row.appendChild(cell);
				document.getElementById("userList").appendChild(row);
			}
			document.getElementById("userListSpan").style.display = "";
			paging();

		}

		//创建一行中的每个td元素
		function createCellWithText(text) {
			var cell = document.createElement("td");
			cell.appendChild(document.createTextNode(text));
			return cell;
		}
		/****************异步显示用户检索结果************************/

		/*****************用于表格分页显示**************************/
		//分页入口
		function paging() {
			numberRowsInTable = document.getElementById("userList").rows.length;
			pageSize = 10;
			page = 1;
			unit();

		}

		//下一页   
		function next() {

			hideTable();
			currentRow = pageSize * page;
			maxRow = currentRow + pageSize;
			if (maxRow > numberRowsInTable)
				maxRow = numberRowsInTable;
			for (var i = currentRow; i < maxRow; i++) {
				theTable.rows[i].style.display = '';
			}
			page++;

			if (maxRow == numberRowsInTable) {
				nextText();
			}
			showPage();
			preLink();
		}

		//上一页   
		function pre() {
			hideTable();
			page--;
			currentRow = pageSize * page;
			maxRow = currentRow - pageSize;
			if (currentRow > numberRowsInTable)
				currentRow = numberRowsInTable;
			for (var i = maxRow; i < currentRow; i++) {
				theTable.rows[i].style.display = '';
			}
			if (maxRow == 0) {
				preText();
			}
			showPage();
			nextLink();
		}

		//隐藏表格
		function hideTable() {
			for (var i = 0; i < numberRowsInTable; i++) {
				theTable.rows[i].style.display = 'none';
			}
		}
		function showPage() {
			pageNum.innerHTML = page;
		}

		//获取总页数   
		function pageCount() {
			var count = 0;
			if (numberRowsInTable % pageSize != 0)
				count = 1;
			return parseInt(numberRowsInTable / pageSize) + count;
		}

		//显示链接   
		function preLink() {
			spanPre.innerHTML = "<a href='javascript:pre();'>上一页</a>";
		}
		function preText() {
			spanPre.innerHTML = "上一页";
		}
		function nextLink() {
			spanNext.innerHTML = "<a href='javascript:next();'>下一页</a>";
		}
		function nextText() {
			spanNext.innerHTML = "下一页";
		}

		//开始显示表格首页   
		function unit() {
			for (var i = pageSize; i < numberRowsInTable; i++) {
				theTable.rows[i].style.display = 'none';
			}

			totalPage.innerHTML = pageCount();
			pageNum.innerHTML = '1';
			if (numberRowsInTable > pageSize) {
				nextLink();
				preText();
			}
			else {
				preText();
				nextText();
			}

		}
/*****************用于表格分页显示**************************/
	</script>

	</html>