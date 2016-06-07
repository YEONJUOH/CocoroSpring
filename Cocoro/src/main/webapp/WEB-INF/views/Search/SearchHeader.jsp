<%@page import="cocoro.search.domain.Search"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- <script src="/resources/SearchResult/bootstrap.min.js"></script> -->
<style type="text/css">
</style>
</head>
<body>
	 <!-- 네비게이션바 -->
	<div class="header_nav">
		<nav class="navbar navbar-default navbar-fixed-top">
 		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/index">Cocoro</a>


 				<form class="navbar-form navbar-left" role="search"
					 method="get" action="/search/searchMain">
					 	<select class="form-control" id="searchCtg" name="searchCtg">
					 <c:choose>
					<c:when test='${search!=null&& search.getSearchCtg().equals("스터디")}'>
					<option selected="selected"></c:when>
					<c:otherwise>	
					<option>
					</c:otherwise>
					
					 </c:choose>
					 스터디
						</option>
					  <c:choose>
					<c:when test='${search!=null&& search.getSearchCtg().equals("인물")}'>
					<option selected="selected" value="인물"></c:when>
					<c:otherwise>	
					<option>
					</c:otherwise>
					
					 </c:choose>
					 인물
						</option>
					 	
					
						
					 	</select>
					 <div class="form-group">
						<input type="text" class="form-control" placeholder="Search"
							name="searchWord" value="${search.searchWord }" >
							
							
					</div>
					<button type="submit" class="btn btn-default">검색</button>
					 </form>
			</div>
			<div id="navbar" class="collapse navbar-collapse">




				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">스터디</a></li>
					<li><a href="#about">회원가입</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">도움말<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
					<li><a href="#contact">로그인</a></li>
				</ul>
			</div> 
		</div> 
		</nav>
	</div> 
	<h3>hello</h3>
</body>
</html>