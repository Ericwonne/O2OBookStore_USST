<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布信息管理</title>
<style type="text/css">
.h {
	width: 600px;
	font-size: 20px;
	border-color: red;
	padding-left: 10px;
	margin-top: 5px;
	height: 30px;
}

a{ text-decoration:none} 
a:hover{ text-decoration:underline} 

</style>
</head>
<body>
	<form>
		<h class="h">检索发布信息</h>
		<br> <br>
		<fieldset style="width: 600px;">
			<legend>发布者</legend>
			学号:<input id="st_num" type="text" style="width: 150px">&emsp;
			姓名:<input id="name" type="text" style="width: 180px"><br>
		</fieldset>
		<br>
		<fieldset style="width: 600px;">
			<legend>发布信息</legend>
			<br> 书名: <input id="bookName" type="text" style="width: 150px">&emsp;
			所属类别:<select id="tag">
				<option value="0">全部</option>
				<option value="1">工业技术类</option>
				<option value="2">数理科学类</option>
				<option value="3">文化科教类</option>
				<option value="4">航空航天类</option>
				<option value="5">语言文字类</option>
				<option value="6">艺术文学类</option>
			</select> <br> <br> 发布类型：<select id="type">
				<option value="1" selected="selected">出售</option>
				<option value="2">征求</option>
			</select> &emsp; 信息状态：<select id="state">
				<option value="1" selected="selected">正常</option>
				<option value="0">已下架</option>
			</select>&emsp; 是否为教材：<select id="isTextbookSelect"
				onChange="isTextbookChange();">
				<option value="1" selected="selected">是</option>
				<option value="0">否</option>
			</select><br> <br>
			<div id="isTextbookSpan" style="display:">
				年级:<select id="grade">
					<option value="" selected="selected">请选择</option>
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
				</select>&emsp; 学院:<select id="school" onchange="updateMajor();">
					<option value="">请选择</option>
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
				</select>&emsp; 专业:<select id="major">
					<option value="">请选择</option>
				</select>
			</div>
		</fieldset>
		<br> <input type="button" value="搜索" onclick="search()">
	</form>

	<span id="buyListSpan" style="display:none"><br>
		<table width="1000" border="1" cellspacing="0" cellpadding="0"
			bgcolor="Gainsboro" style="font-size: 12px;" id="buyTable">
			<tr align="left">
				<th colspan="1">ID</th>
				<th>书名</th>
				<th>版本</th>
				<th>出版社</th>
				<th>作者</th>
				<th>分类</th>
				<th>教材</th>
				<th>年级</th>
				<th>学院</th>
				<th>专业</th>
				<th>期待成色</th>
				<th>期待折扣</th>
				<th>学号</th>
				<th>姓名</th>
				<th>发布时间</th>
				<th>浏览次数</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
			<tbody id="buyList">
			</tbody>
		</table> <br><font size=1><span id="buyspanPre">上一页</span> &emsp;<span
			id="buyspanPageNum"></span>&emsp; <span id="buyspanNext">下一页 </span>&emsp;
			共 <span id="buyspanTotalPage"></span>页</font>
	</span>


	<span id="saleListSpan" style="display: none"> 
		<br>
		<table id="saleTable" style="border-collapse:collapse;">
			<tbody id="saleList">
			</tbody>
		</table> <br><font size=1><span id="buyspanPre1">上一页</span> &emsp;<span
			id="buyspanPageNum1"></span>&emsp; <span id="buyspanNext1">下一页
		</span>&emsp; 共 <span id="buyspanTotalPage1"></span>页</font>
	</span>
</body>

<script>
	var xmlHttp;
	var buycount; //记录搜索检索出的征求信息总数
	var salecount; //记录搜索检索出的出售信息总数

	/*****************这些变量用于表格分页显示**************************/
	var table;
	var totalPage;
	var pageNum ;
	var spanPre;
	var spanNext;
	var numberRowsInTable;
	var pageSize;
	var page = 1;
	/*****************用于表格分页显示**************************/

	/*****************是否为教材select变化**************************/
	function isTextbookChange() {
		var isTextbookSelect = document.getElementById("isTextbookSelect");
		var isTextbookIndex = isTextbookSelect.selectedIndex;
		var isTextbookValue = isTextbookSelect.options[isTextbookIndex].value;
		if (isTextbookValue == "1")
			document.getElementById("isTextbookSpan").style.display = "";
		if (isTextbookValue == "0")
			document.getElementById("isTextbookSpan").style.display = "none";

	}
	/*******************************************/

	function createXMLHttpRequest() {
		if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		}
	}

	/******************更新专业信息**********************/
	//更新专业信息
	function updateMajor() {
		createXMLHttpRequest();
		var schoolSelect = document.getElementById("school"); //
		var index = schoolSelect.selectedIndex;
		var school = schoolSelect.options[index].value;

		var url = "http://localhost:8080/Local/updateMajor?department="
				+ encodeURI(school);
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
	/******************更新专业信息**********************/

	/****************异步显示信息检索结果************************/
	var type;//发布信息类型

	function search() {

		createXMLHttpRequest();

		var st_num = document.getElementById("st_num").value;
		var name = document.getElementById("name").value;

		var bookname = document.getElementById("bookName").value;
		var tag = document.getElementById("tag").value;
		type = document.getElementById("type").value;
		var state = document.getElementById("state").value;
		var isTextbook = document.getElementById("isTextbookSelect").value;
		var grade = "";
		var school = "";
		var major = "";
		if (isTextbook == "1") {
			grade = document.getElementById("grade").value;
			school = document.getElementById("school").value;
			major = document.getElementById("major").value;
		}

		var url = "http://localhost:8080/Local/searchRecord?type=" + type
				+ "&st_num=" + st_num + "&name=" + name + "&bookname="
				+ bookname + "&tag=" + tag + "&state=" + state + "&isTextbook="
				+ isTextbook + "&grade=" + grade + "&school=" + school
				+ "&major=" + major;

		xmlHttp.open("GET", url, true);
		xmlHttp.onreadystatechange = handleSearch;
		xmlHttp.send(null);

	}

	function handleSearch() {
		var message;
		type=document.getElementById("type").value;
		if (xmlHttp.readyState == 4) { // 判断对象状态  
			if (xmlHttp.status == 200) { // 信息已经成功返回，开始处理信息  
				if (document.getElementById("type").value == "1"){
					updateSaleList();
					document.getElementById("buyListSpan").style.display = "none";}
				if (document.getElementById("type").value == "2") {
					updateBuyList();
					document.getElementById("saleListSpan").style.display = "none";
				}
			} else {
				alert("系统当前无法处理此请求.");
			}
		}
	}

	//更新并显示出售信息检索结果
	function updateSaleList() {
		
		document.getElementById("buyListSpan").style.display = "none";
		if (salecount > 0) {
			var saleTable = document.getElementById("saleTable");
				  var rowNum=saleTable.rows.length;
				     for (i=0;i<rowNum;i++)
				     {
				    	 saleTable.deleteRow(i);
				         rowNum=rowNum-1;
				         i=i-1;
				     }
			}

		var responseXML = xmlHttp.responseXML;
		var status = responseXML.getElementsByTagName("status")[0].firstChild.nodeValue;
		status = parseInt(status);
		if (status != 1) {
			document.getElementById("saleListSpan").style.display = "none";
			alert("没有找到相关记录.");
			salecount = 0;
			return;
		}
		var total = responseXML.getElementsByTagName("total")[0].firstChild.nodeValue;

		salecount = total;
		var tablehtml="";
		var books = responseXML.getElementsByTagName("salebook");
		for (var i = 0; i < parseInt(total); i++) {
			var b = books[i];
			var id=i+5000; 
			tablehtml=tablehtml+"<tr id='"+id+"' recordId='"+b.getAttribute("id")+"' style='border:1px solid #DDDDDD;'><td><a href='../recordManager?recordid="+b.getAttribute("id")+"'><img src='";
			var imageurl = b.getAttribute("imageurl");
			
			if(imageurl==""||imageurl=="null")
				imageurl="../image/default.png";
			
			
		
			
			var name = b.getAttribute("name");
			var version = b.getAttribute("version");
			if(version==""||version=="null")
				version="无版本信息";
			var publish = b.getAttribute("publish");
			var author = b.getAttribute("author");
			var discount = b.getAttribute("discount");
			var price = b.getAttribute("price");
			var age = b.getAttribute("age");
			
			var state=b.getAttribute("state");
			if(state=="1")
				state="上架中";
			else
				state="已下架";
			var tag = b.getAttribute("tag");
			if(tag==""||tag=="null")
			   tag="未分类";
			var if_course;
			if (b.getAttribute("if_course") == "1")
				if_course = "是";
			else {
				if_course = "否";
			}
			
			var grade = b.getAttribute("grade");
			var school = b.getAttribute("school");
			var major = b.getAttribute("major");
			
			var st_num = b.getAttribute("st_num");
			var username = b.getAttribute("username");
			
			var releasetime = b.getAttribute("releasetime");
			var glances = b.getAttribute("glances");
			
			tablehtml= tablehtml+imageurl+"' height='120' width='110' /></a></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td height='140' width='400'><a href='../recordManager?recordid="+b.getAttribute("id")+"'><font size=3 face='微软雅黑'color='blue'>"+name+"</font></a>"; 
			tablehtml= tablehtml+"<br>  <font size=2face='微软雅黑'>"+author+"(著)/"+publish+"/"+version+"<br>";
			tablehtml= tablehtml+"现价:¥"+(price*(parseFloat(discount)))/10+"/原价:¥"+price+"("+discount+"折)/"+age+"成新<br>";
			tablehtml= tablehtml+state+"/"+tag+"/教材:"+if_course+"<br>";
			if(if_course=="是")
				tablehtml= tablehtml+grade+"级/"+school+"/"+major+"<br>";
			tablehtml= tablehtml+"发布人:"+username+"/"+st_num+"<br>";
			tablehtml= tablehtml+"发布时间:"+releasetime+"/浏览:"+glances+"</font></td>";
			var changeStatusBtn;
			if(state=="上架中")
				changeStatusBtn="下架"
			else
				changeStatusBtn="上架";
			tablehtml= tablehtml+"<td height='140' width='100'><input type='button'  value='"+changeStatusBtn+"'> <br><br><input type='button' value='删除'></td></tr>";
		}

		document.getElementById("saleListSpan").style.display = "";

		var saleTable = document.getElementById("saleTable");
	    
		saleTable.innerHTML=tablehtml;
		
		paging("saleTable");
		

	}

	//更新并显示征求信息检索结果
	function updateBuyList() {
		
		document.getElementById("saleListSpan").style.display = "none";
		if (buycount > 0) {
			var buyList = document.getElementById("buyList");

			for (var i = 0; i < buycount; i++) {
				var tr = document.getElementById(i + 2000);
				buyList.removeChild(tr);
			}
		}
		var responseXML = xmlHttp.responseXML;
		var status = responseXML.getElementsByTagName("status")[0].firstChild.nodeValue;
		status = parseInt(status);
		if (status != 1) {
			document.getElementById("buyListSpan").style.display = "none";
			alert("没有找到相关记录.");
			buycount = 0;
			return;
		}
		var total = responseXML.getElementsByTagName("total")[0].firstChild.nodeValue;

		buycount = total;
		var books = responseXML.getElementsByTagName("buybook");
		for (var i = 0; i < parseInt(total); i++) {
			var b = books[i];
			var row = document.createElement("tr");
			row.setAttribute("id", i + 2000);
			var id = b.getAttribute("id");
			var name = b.getAttribute("name");
			var version = b.getAttribute("version");
			var publish = b.getAttribute("publish");
			var author = b.getAttribute("author");
			var tag = b.getAttribute("tag");
			var if_course;
			if (b.getAttribute("if_course") == "1")
				if_course = "是";
			else {
				if_course = "否";
			}

			var grade = b.getAttribute("grade");
			var school = b.getAttribute("school");
			var major = b.getAttribute("major");

			var expectAge = b.getAttribute("expectAge");
			var expectDiscount = b.getAttribute("expectDiscount");

			var st_num = b.getAttribute("st_num");
			var username = b.getAttribute("username");

			var releasetime = b.getAttribute("releasetime");
			var glances = b.getAttribute("glances");
			var state;
			if (b.getAttribute("state") == "1")
				state = "正常";
			else {
				state = "已下架";
			}

			row.appendChild(createCellWithText(id));
			row.appendChild(createCellWithText(name));
			row.appendChild(createCellWithText(version));
			row.appendChild(createCellWithText(publish));
			row.appendChild(createCellWithText(author));
			row.appendChild(createCellWithText(tag));
			row.appendChild(createCellWithText(if_course));
			row.appendChild(createCellWithText(grade));
			row.appendChild(createCellWithText(school));
			row.appendChild(createCellWithText(major));
			row.appendChild(createCellWithText(expectAge));
			row.appendChild(createCellWithText(expectDiscount));
			row.appendChild(createCellWithText(st_num));
			row.appendChild(createCellWithText(username));
			row.appendChild(createCellWithText(releasetime));
			row.appendChild(createCellWithText(glances));
			row.appendChild(createCellWithText(state));

			//添加并设置每行中的"管理"按钮
			var manageButton = document.createElement("input");
			manageButton.setAttribute("type", "button");
			manageButton.setAttribute("value", "管理");
			manageButton.onclick = function() {
				window.location.href = "../adminLogin";
			};
			cell = document.createElement("td");
			cell.appendChild(manageButton);
			row.appendChild(cell);
			document.getElementById("buyList").appendChild(row);
		}

		document.getElementById("buyListSpan").style.display = "";

		var buyTable = document.getElementById("buyTable");
		var trs = buyTable.rows;
		for (var i = 0, len = trs.length; i < len; i++) {
			var gradecell = trs[i].cells[7];
			var schoolcell = trs[i].cells[8];
			var majorcell = trs[i].cells[9];
			if (if_course == "否") {
				gradecell.style.display = "none";
				schoolcell.style.display = "none";
				majorcell.style.display = "none";
			}
			if (if_course == "是") {
				gradecell.style.display = "";
				schoolcell.style.display = "";
				majorcell.style.display = "";
			}
		}

		paging("buyList");

	}

	//创建一行中的每个td元素
	function createCellWithText(text) {
		var cell = document.createElement("td");
		cell.appendChild(document.createTextNode(text));
		return cell;
	}
	
	

	/****************异步显示征求信息检索结果************************/

	/*****************用于表格分页显示**************************/
	//分页入口
	function paging(tbody) {
		if(type=="2")
			{
			table = document.getElementById("buyList");
			totalPage = document.getElementById("buyspanTotalPage");
			pageNum = document.getElementById("buyspanPageNum");
			spanPre = document.getElementById("buyspanPre");
			spanNext = document.getElementById("buyspanNext");
			numberRowsInTable = table.rows.length;
			}
		if(type=="1")
		{
		table = document.getElementById("saleTable");
		totalPage = document.getElementById("buyspanTotalPage1");
		pageNum = document.getElementById("buyspanPageNum1");
		spanPre = document.getElementById("buyspanPre1");
		spanNext = document.getElementById("buyspanNext1");
		numberRowsInTable = table.rows.length;
		}
		numberRowsInTable = document.getElementById(tbody).rows.length;
		pageSize = 5;
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
			table.rows[i].style.display = '';
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
			table.rows[i].style.display = '';
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
			table.rows[i].style.display = 'none';
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
			table.rows[i].style.display = 'none';
		}
		page=1;
		totalPage.innerHTML = pageCount();
		pageNum.innerHTML = '1';
		if (numberRowsInTable <= pageSize) {
			preText();
			nextText();
		}
		else{
			preText();
			nextLink();
		}

	}
	/*****************用于表格分页显示**************************/
</script>
</html>