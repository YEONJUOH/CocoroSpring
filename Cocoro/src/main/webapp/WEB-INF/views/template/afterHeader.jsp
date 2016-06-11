<%@page
	import="sun.reflect.ReflectionFactory.GetReflectionFactoryAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="/resources/css/login/login.css" rel="stylesheet">
<script src="/resources/js/login/login.js"></script>
 <link href="/resources/css/layout/header.css" rel="stylesheet">
<style type="text/css">
select{
display: inline-block;
}
</style>
</head>
<body>
	<input type="hidden" id="u_id" name = "u_id" value="${users.u_id}">
	<!-- 네비게이션바 -->
	<div class="header_nav">
		<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container" style="width: 100%; background-color: #3b5998">
			<div class="navbar-header" style="margin-left:0px; margin-right: 0px;"> 
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/users/afterMain" style="color: #fff;"><b>Cocoro</b></a>
			</div>
			<div id="navbar" class="collapse navbar-collapse" style="background-color: #3b5998">
				<!--  검색 -->
				<ul class="nav navbar-nav navbar-left" style="float: left; ">
					<li><a href="#"><input type="text" id="searchKey" class="form-control" style="width: 100%; height:28px; margin-left:10px; display: inline" placeholder="검색해주세요.."></a></li>
					<li><select class="form-control" style="margin-top:12px;"><option>인물</option><option>스터디</select></li>
				</ul>
				<ul class="nav navbar-nav navbar-right" style="float: right;">
					<li><a href="#" style="color: #fff;">Study</a></li>
					<!-- 메세지 보기 -->
					<li class="dropdown"><a href="#" class="dropdown-toggle" id="headerNewMassage" data-toggle="dropdown" role="button" aria-expanded="false" style="color: #fff;">
						Message </a>
					 <ul class="dropdown-menu extended inbox" style=" margin-top: 11px;" id="messageBox">
                            <li>
                                <p class="green">${users.u_name}의 쪽지함</p>
                            </li>
                            <li id ="headerMeesage">
                            </li>
                        </ul>
					  </li>
					   
					   <!-- 마이페이지 -->
					   	<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						<img src="/resources/img/${users.u_image}" class="img-circle" style="width: 35px; height: 30px;">
						<ul class="dropdown-menu" role="menu">
							<li>
							<img src="/resources/img/${users.u_image}" class="img-rounded" style="width: 200px;">
							</li>
							<li class="divider"></li>
							<li><a href="/users/mypage?u_id=${users.u_id}"><button class="btn-success" style="width:100%;">My Page</button></a></li>
							<li><a href="/users/logout"><button class="btn-primary" style="width:100%;">로그아웃</button></a></li>
						</ul>
					   </li>
				</ul>
			</div>
		</div>
		<!-- 자동완성 폼  -->
		<div style="position: absolute;width: 240px;height:auto;background-color: #fff;margin-left: 90px;" id ="autoForm" >
			<div  id ="autoSearch">
			</div>
		</div>
		</nav>
	</div>
	<script type="text/javascript" src="/resources/js/layout/afterHeader.js"></script>
</body>
</html>