<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

var xmlHttp;
var emailValid=true;
var userNameValid=true;
function createXMLHttpRequest() {
	if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
	} else if (window.XMLHttpRequest) {
		xmlHttp = new XMLHttpRequest();
	}
}





    function  PageInit(){
      var str="${sessionScope.user.grade}";
      var obj=document.getElementById("grade");
      for(var i=0;i<obj.options.length;i++){
      if(obj.options[i].text==str){
        obj.options[i].selected=true;
        break;
      }
      }
    }
    function  PageInit1(){
        var str="${sessionScope.user.school}";
        var obj=document.getElementById("department");
        for(var i=0;i<obj.options.length;i++){
        if(obj.options[i].text==str){
          obj.options[i].selected=true;
          break;
        }
        }
      } 
    
    function  PageInit2(){
    	
    	
    	
    	
        var str="${sessionScope.user.major}";
        var obj=document.getElementById("major");
        for(var i=0;i<obj.options.length;i++){
        if(obj.options[i].text==str){
          obj.options[i].selected=true;
          break;
        }
        }
      }
    
  //验证邮箱的合法性
	function checkEmail(){
		var email = document.getElementById("email").value;
		var re = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/ ;
		var result = re.test(email);
		if(result){
			document.getElementById("checkemail").innerHTML = "邮箱合法";
		}else{
			document.getElementById("checkemail").innerHTML = "邮箱不合法";
			emailValid=false;
		}
	}
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
	function checkNotNull(cell){
		var value=document.getElementById(cell).value;
		if(value!="") return true;
		document.getElementById("check"+cell).innerHTML = "不能为空";
		return false;
	}
</script>
</head>
<body onload="PageInit()">
<form action="UserChangeServlet1" method="post">
<table>
			<tr>
				<td>学号：</td>
				<td>${sessionScope.user.st_num}</td>
				<td></td>
				
			</tr>
			<tr>
				<td>密码：</td>
				<td><input type="text" id="password" name="passwd" value="${sessionScope.user.passwd}"></td>
				<td id="checkpassword"></td>
			</tr>
			<tr>
				<td>姓名：</td>
				<td><input type="text" id="name" name="name" value="${sessionScope.user.name}"></td>
				<td id="checkname"></td>
			</tr>
			
			<tr>
				<td>年级：</td>
				<td>
					<select id="grade" name="grade">
						<option value="">请选择</option>
						<option value="2012">2012</option>
						<option value="2013">2013</option>
						<option value="2014">2014</option>
						<option value="2015">2015</option>
					</select>
				
				</td>
				
				<td id="checkgrade"></td>
			</tr>
			<tr>
				<td>学院：</td>
				<td><select id="department" name="school"
					onchange="updateMajor();">
						<option value="">请选择</option>
						<option value="光电信息与计算机工程学院">光电信息与计算机工程学院</option>
						<option value="能源动力学院">能源动力学院</option>
						<option value="机械学院">机械学院</option>
						<option value="外语学院">外语学院</option>
						<option value="管理学院">管理学院</option>
						<option value="理学院">理学院</option>
				</select>
				
				</td>
				
				<td id="checkdepartment"></td>
			</tr>

			<tr>
				<td>专业：</td>
				<td><select id="major" name="major">
						<option value="">请选择</option>
				</select>
				
				</td>
				
				<td id="checkmajor"></td>
			</tr>
			<tr>
				<td>email：</td>
				<td><input type="text" id="email"  name="email" value="${sessionScope.user.email}" onchange="checkEmail();"></td>
				
				<td id="checkemail"></td>
			</tr>
			<tr>
				<td>QQ：</td>
				<td><input type="text" id="qq" name="qq" value="${sessionScope.user.qq}"></td>
			</tr>
			<tr>
				<td>微信：</td>
				<td><input type="text" id="wechat" name="wechat" value="${sessionScope.user.wechat}"></td>
			</tr>
			<tr>
				<td>手机号：</td>
				<td><input type="text" id="phone" name="phone" value="${sessionScope.user.phone}"></td>
			</tr>
			
			<tr>
				<td>验证问题</td>
				<td><input type="text" id="valid_ques" name="valid_ques" value="${sessionScope.user.valid_ques}"></td>
			</tr>
			
			<tr>
				<td>验证问题答案</td>
				<td><input type="text" id="valid_ans" name="valid_ans" value="${sessionScope.user.valid_ans}"></td>
			</tr>
			
			
			<tr>
				<td><input type="submit"  value="保存"></td>
				
			</tr>
		</table>

</form>
</body>
</html>