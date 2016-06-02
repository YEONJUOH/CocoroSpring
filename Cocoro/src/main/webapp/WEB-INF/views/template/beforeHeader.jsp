<%@page import="sun.reflect.ReflectionFactory.GetReflectionFactoryAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
select {
	display: inline-block;
}

li input {
	width: 100%;
}

#loginBtn {
	margin-top: 35px;
}
</style>
<script type="text/javascript">
$(function(){
	$('#loginForm').submit(function(e){
		event.preventDefault();
		var params = $('#loginForm').serialize();
		$.ajax({
			url: '/users/usersLogin',
			type: 'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:params,
			dataType : 'json',
			success : function(data){
				alert('로그인 성공');
				location.href = "/users/afterMain";
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
		<div class="container" style="width: 100%;">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar">
					</span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="beforeMain"><b>Cocoro</b></a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<form action="" method="post" id="loginForm">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">아이디<br><input type="text" name="u_email" required></a></li>
					<li><a href="#">비밀번호<br><input type="password" name="u_pwd" required></a></li>
					<li><button class="btn-primary" id="loginBtn" type="submit">로그인</button></li>
				</ul>
				</form>
			</div>
		</div>
		</nav>
	</div>
</body>
</html>