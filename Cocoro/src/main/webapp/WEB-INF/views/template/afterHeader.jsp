<%@page
	import="sun.reflect.ReflectionFactory.GetReflectionFactoryAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String realPath = request.getContextPath();
	System.out.print(realPath);
%>
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
	<!-- 네비게이션바 -->
	<div class="header_nav">
		<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container" style="width: 100%;">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="beforeMain"><b>Cocoro</b></a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right" style="float: right;">
					<li><a href="#">Study</a></li>
					<!-- 메세지 보기 -->
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						Message<span class="badge">42</span></a>
					 <ul class="dropdown-menu extended inbox" id="messageBox">
                            <div class="notify-arrow notify-arrow-green"></div>
                            <li>
                                <p class="green">You have 5 new messages</p>
                            </li>
                            <li>
                                <a href="index.html#">
                                    <span class="photo"><img alt="avatar" src="assets/img/ui-zac.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Zac Snider</span>
                                    <span class="time">Just now</span>
                                    </span>
                                    <span class="message">
                                        Hi mate, how is everything?
                                    </span>
                                </a>
                            </li>

                        </ul>
					  </li>
					   
					   
					   
					   
					   <!-- 마이페이지 -->
					   	<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
						<img src="/resources/img/${users.u_image}" class="img-rounded" style="width: 20px;">
						<ul class="dropdown-menu" role="menu">
							<li>
							<img src="/resources/img/${users.u_image}" class="img-rounded" style="width: 200px;">
							</li>
							<li class="divider"></li>
							<li><a href="/users/mypage?u_id=${users.u_id}"><button class="btn-success" style="width:100%;">My Page</button></a></li>
							<li><a href="#"><button class="btn-primary" style="width:100%;">로그아웃</button></a></li>
						</ul>
					   </li>
				</ul>
			</div>
		</div>
		</nav>
	</div>
</body>
</html>