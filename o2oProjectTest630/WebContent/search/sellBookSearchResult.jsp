<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/style.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
	</style>
	<title>搜索结果</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="container">
<div class="row">
	<div class="col-lg-3" style="margin:0">
        <ul class="nav navbar-default navbar-side navbar-inverse"  data-offset-top="125">
            <div class="col-lg-12 col-md-3 col-sm-4"><li><a href="#section-2">能源与动力工程学院&nbsp;&nbsp;&nbsp;</a></li></div>
            <div class="col-lg-12 col-md-3 col-sm-4"><li><a href="#section-3">光电信息与计算机工程学院</a></li></div>
            <div class="col-lg-12 col-md-3 col-sm-4"><li><a href="#section-4">管理学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li></div>
            <div class="col-lg-12 col-md-3 col-sm-4"><li><a href="#section-5">机械工程学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li></div>
            <div class="col-lg-12 col-md-3 col-sm-4"><li><a href="#section-5">外语学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li></div>
            <div class="col-lg-12 col-md-3 col-sm-4"><li><a href="#section-5">环境与建筑学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li></div>
            <div class="col-lg-12 col-md-3 col-sm-4"><li><a href="#section-5">医疗器械与食品学院&nbsp;&nbsp;&nbsp;</a></li></div>
            <div class="col-lg-12 col-md-3 col-sm-4"><li><a href="#section-5">出版印刷与艺术设计学院&nbsp;</a></li></div>
            <div class="col-lg-12 col-md-3 col-sm-4"><li><a href="#section-5">理学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li></div>
            <div class="col-lg-12 col-md-3 col-sm-4"><li><a href="#section-5">材料科学与工程学院&nbsp;&nbsp;&nbsp;</a></li></div>
        </ul>
    </div>
    <h3 style="font-weight:bold;">待售书信息</h3>
   	<hr size="2" color="#ff9966" style="filter:alpha(opacity=10,finishopacity=100,style=1,startX=0,startY=0,finishX=100,finishY=100);width:490;"> 
    <table>
  	<div class="col-lg-9" style="background-color:#F5F5F5">
	    <br/>
	    <c:forEach items="${requestScope.books}" var="book">
		<div  style="background:#FFFFFF">
		<div class="row">
		<div class="col-lg-2 col-md-2 col-sm-2" align="center">
		<img class="img-responsive" src="${book.imageurl}">
		</div>
		<div class="col-lg-10 col-md-10 col-sm-10">
		<div class="row">
		<div class="col-lg-9 col-md-9 col-sm-9">
			 <h4><a href="ShowBookServlet?id=${book.id }&type=sell">${book.name }</a></h4>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-3" style="vertical-align:bottom;">
			<p style=" vertical-algin:bottom;color:#CD5C5C;">价格：${book.price}<p>
		</div>
		</div>
		</p>
			<p>
			<c:if test="${fn:length(book.describe)>72}">  
	                ${fn:substring(book.describe, 0, 72)}...  
	          </c:if>  
	         <c:if test="${fn:length(book.describe)<=72 }">  
	                ${book.describe }  
	          </c:if>  	
	          </p>
	          <P></P>
	    <div class="row">
	    <div class="col-lg-3 col-md-3 col-sm-3">作者：${book.author}</div>
	    <div class="col-lg-2 col-md-2 col-sm-2">教材:
	    	<c:if test="${book.if_course==1}">是</c:if>
	    	<c:if test="${book.if_course==0}">否</c:if>	
	    </div>
	    <div class="col-lg-2 col-md-2 col-sm-2">浏览：${book.glances}</div>
	    <div class="col-lg-5 col-md-5 col-sm-5">发布时间：${book.release_time.split(" ")[0]}</div>
	    </div>
		</div>
		</div>
		</div>
    <br/>
	</c:forEach>
	<div>
		<c:forEach var="i" begin="1" end="${pageCount}" step="1">
			<a href="SearchServlet?pageNow=${i}&searchContent=${searchContent}&searchType=${searchType}&bookType=${bookType}">第${i}页</a>
		</c:forEach>
	</div>
	</div>
</table>
</div>

        </div>
<%@ include file="../footer.jsp" %>
</body>
</html>