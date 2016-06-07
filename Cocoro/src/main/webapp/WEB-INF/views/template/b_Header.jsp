<%@page import="sun.reflect.ReflectionFactory.GetReflectionFactoryAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<style type="text/css">
/* select {
	display: inline-block;
}

li input {
	width: 100%;
}

#loginBtn {
	margin-top: 35px;
} */
.navbar-right{
padding-left: 160px;
}

</style>
<script type="text/javascript">
$(function(){
	$('#loginForm').submit(function(e){
		event.preventDefault();
		var params = $('#loginForm').serialize();
		$.ajax({
			url: '/rest/usersLogin',
			type: 'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:params,
			dataType : 'json',
			success : function(data){
				alert('로그인 성공');
				location.href = "index";
			},
			error : function() {
                alert('로그인 실패');
			}
		})
	})
})
</script>
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
					
					<option selected="selected">
					
					 스터디
						</option>
					 
					<option selected="selected" value="인물">
					
					 인물
						</option>
					 	
					
						
					 	</select>
					 <div class="form-group">
						<input type="text" class="form-control" placeholder="Search"
							name="searchWord" value="${search.searchWord }" >
							
							
					</div>
					<button type="submit" class="btn btn-default">검색</button>
					
					 </form>
					 
					 
					 
					 <form class="navbar-form navbar-right" 
					 method="post" action="" id="loginForm">
					 	
					 <div class="form-group">
						<input type="text" name="u_email" required placeholder="아이디" class="form-control input-sm">
						<input type="password" name="u_pwd" required placeholder="비밀번호" class="form-control input-sm">
							
					</div>
					<button type="submit" class="btn btn-primary input-sm">로그인</button>
					<button  class="btn btn-default input-sm"><a href="joinPage">회원가입</a></button>
					 </form>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
			
              		
			<!-- 	<ul class="nav navbar-nav navbar-right">
					<li><a href="#">아이디<br><input type="text" name="u_email" required></a></li>
					<li><a href="#">비밀번호<br><input type="password" name="u_pwd" required></a></li>
					<li><button class="btn-primary" id="loginBtn" type="submit">로그인</button></li>
				</ul> -->
		



			</div> 
		</div> 
		</nav>
	</div> 
	<h3>hello</h3>
</body>
</html>