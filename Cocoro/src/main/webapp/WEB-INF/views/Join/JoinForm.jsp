<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<style type="text/css">
#main_img {
	max-width: 100%;
	height: auto;
}

.grid-divider {
	text-align: center;
}
</style>
<link rel="stylesheet" href="/resources/css/layout/style.css" media="screen" title="no title" charset="utf-8">
  
<script type="text/javascript">
	$(function() {
		$('#submitbtn').click(
				function() {
					alert($('#name').val());
					if ($('#password').val = "" || $('#name').val == ""
							|| $('#reenterpassword').val == ""
							|| $('#searchTextField').val == ""
							|| $('#birth').val == "") {
						alert("nono");
					} else {
						$('#Joinform').submit();
					}
				})
	})
</script>
</head>
<body>
	<!-- 첫번째 메뉴 -->
	<div class="row" style="margin-top: 50px;">
		<div class="col-md-6 text-center">
			<form action="insertUsers" method="post">
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <input
					type="submit" value="입력">ㅁㄴㅇ
			</form>

		</div>
		<div class="col-md-6">

			<div class="page-header">
				<h1>
					Cocoro <small>회원가입</small>
				</h1>
			</div>
			<form class="form-horizontal" action="/insertUsers" method="post"
				id="Joinform">
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputEmail">이메일</label>
					<div class="col-sm-6">
						<input class="form-control" id="inputEmail" type="email"
							placeholder="이메일">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
					<div class="controls col-sm-6" id="pwd-container">
						<input id="password" name="password"
							class="form-control input-large" type="password"
							placeholder="********">
						<div class="pwstrength_viewport_progress"></div>
						<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
					</div>

					<!-- <div class="col-sm-6">
						<input class="form-control" id="inputPassword" type="password"
							placeholder="비밀번호">
						<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
					</div> -->

				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호
						확인</label>
					<div class="controls col-sm-6">
						<input id="reenterpassword" class="form-control input-large"
							name="u_pwd" type="password" placeholder="********"> <em
							id="emPwd"></em>
					</div>
					<!-- <div class="col-sm-6">
						<input class="form-control" id="inputPasswordCheck"
							type="password" placeholder="비밀번호 확인">
						<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
					</div> -->
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputName">이름</label>
					<div class="col-sm-6">
						<input class="form-control" id="inputName" type="text"
							placeholder="이름" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputName">주소</label>
					<div class="col-sm-6">
						<input class="form-control" id="inputName" type="text"
							placeholder="이름">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label" for="inputNumber">생년월일</label>
					<div class="controls col-sm-6">
						<input id="birth" class="form-control input-xs" name="u_birth"
							type="text" placeholder="1995-04-20">

					</div>
					<!-- <div class="col-sm-6">
						<input id="birth" class="form-control input-xs" name="u_birth"
							type="text" placeholder="1995-04-20">
					</div> -->

					<br /> <br /> <br />

					<div class="form-group">
						<div class="col-sm-12 text-center">
							<button class="btn btn-success" type="submitbtn">회원가입</button>
						</div>
					</div>
			</form>
		</div>
	</div>
<script type="text/javascript" src="/resources/js/join/jQuery.js"></script>
	<script type="text/javascript" src="/resources/js/join/pwstrength.js"></script>
	<script type="text/javascript" src="/resources/js/join/checkPassword.js"></script>
	<script type="text/javascript" src="/resources/js/join/checkId.js"></script>
	<script type="text/javascript" src="/resources/js/join/checkName.js"></script>
	<script type="text/javascript" src="/resources/js/join/submit.js"></script>
	<script
		src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"
		type="text/javascript"></script>
	<link rel="stylesheet" type="text/css"
		href="/resources/css/join/jquery.timepicker.css" />
	<link rel="stylesheet" type="text/css"
		href="/resources/css/join/bootstrap-datepicker.css" />
	<script type="text/javascript"
		src="/resources/js/join/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="/resources/js/join/jquery.timepicker.js"></script>

	<script type="text/javascript" src="/resources/js/join/datepair.js"></script>
	<script type="text/javascript" src="/resources/js/join/loginStart.js"></script>

</body>
</html>