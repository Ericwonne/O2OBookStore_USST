<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上理二手书O2O平台管理系统</title>
</head>
<body>

	<form action="#">
	 <fieldset>
       <legend>请登录</legend>
       <br>
       <input  id="account" placeholder="帐号"  type="text" style="width:150px; border:solid 1px black" onblur="accountBlur()">
	   <span ><font size=2 color="red">&emsp; </span><br><br>
       <input id="passwd"   placeholder="密码"  type="password" style="width:150px;border:solid 1px black"" onblur="passwdBlur()">
       <span ><font size=2 color="red">&emsp; </span><br><br>
	   <input type="button" value="登录" onclick="login()">&emsp;<a href="findPasswd.jsp"><font size=2 >找回密码</font></a>
	 </fieldset>
	</form>
</body>

<script>

    function accountBlur(){
    	var account=document.getElementById("account").value; 
   	    if(account==""){  
   	    	document.getElementById("account").style.border='solid 2px red';  
   		 }
   	    else
   	    { 
   	    	document.getElementById("account").style.border='solid 1px black';
   	    }
  
    }
    function passwdBlur(){
    	var passwd=document.getElementById("passwd").value; 
   	    if(passwd==""){  
   	    	document.getElementById("passwd").style.border='solid 2px red';  
   		 }
   	    else
   	    { 
   	    	document.getElementById("passwd").style.border='solid 1px black';
   	    }
  
    }
   
    function login(){
 	
 	   var account=document.getElementById("account").value; 
 	   var passwd=document.getElementById("passwd").value;
 	   if(account==""||passwd==""){
 		   accountBlur();
 		   passwdBlur();
 	   }
 	   else{
 		
 		  window.location.href="../adminLogin?account="+account+"&passwd="+passwd;
 	   }
 		 
    }
 
</script>

</html>
