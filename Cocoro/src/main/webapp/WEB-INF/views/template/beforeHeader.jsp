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
			url: '/rest/usersLogin',
			type: 'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:params,
			dataType : 'json',
			success : function(data){
				alert('로그인 성공');
				location.href = "/users/afterMain";
			},
			error : function() {
				alert('실패');
				$('#check').empty();
                $('#check').append('<div style="margin-left:15px; color:#ff00ff">아이디 비밀번호를 확인해주세요</div>');
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
		<div class="container" style="width: 100%; background-color: #3b5999">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar">
					</span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="beforeMain" style="color: #fff"><b>Cocoro</b></a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
			<!--  검색 -->
				<ul class="nav navbar-nav navbar-left" style="float: left; ">
					<li><a href="#"><input type="text"class="form-control" style="width: 100%; height:28px; margin-top: 22px; margin-left:10px; placeholder="검색해주세요.."></a></li>
					<li><select class="form-control" style="margin-top:34px;"><option>인물</option><option>스터디</select></li>
				</ul>
			<!-- 로그인 -->	
				<form action="" method="post" id="loginForm">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"  style="color: #fff">ID<br><input type="text" class="form-control" name="u_email" id="email" required></a><div id="check"></div></li>
					<li><a href="#"  style="color: #fff">PW<br><input type="password" class="form-control" name="u_pwd" id="pwd" required></a></li>
					<li><button class="btn-success" id="loginBtn" type="submit" style="width: 100%;">로그인</button></li>
					<li><button class="btn-danger" id="loginBtn" type="submit" style="width: 100%; margin-left: 4px">가입</button></li>
				</ul>
				</form>
			</div>
		</div>
		</nav>
	</div>
</body>
</html>