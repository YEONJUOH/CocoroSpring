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
<script>
$(function(){
	  function statusChangeCallback(response) {
	    if (response.status === 'connected') {
	    	console.log('로그인 성공3');
	      testAPI();
	    } else if (response.status === 'not_authorized') {
	       	console.log('로그인 성공');
	    } else {
	    	console.log('로그인 성공2');
	    }
	  }

	  function checkLoginState() {
	    FB.getLoginStatus(function(response) {
	      statusChangeCallback(response);
	    });
	  }
	  
	  window.fbAsyncInit = function() {
	  FB.init({
	    appId      : '257802867918704',
	    cookie     : true,  // enable cookies to allow the server to access
	    xfbml      : true,  // parse social plugins on this page
	    version    : 'v2.2' // use version 2.2
	  });
	  
	  FB.getLoginStatus(function(response) {
	    statusChangeCallback(response);
	  })
	  };

	  // Load the SDK asynchronously
	  (function(d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = "//connect.facebook.net/en_US/sdk.js";
	    fjs.parentNode.insertBefore(js, fjs);
	  }(document, 'script', 'facebook-jssdk'));

	  function testAPI() {
	    FB.api('/me?fields=name,email,gender', function(response) {
	        console.log(response.name + '---'+response.email+'---'+response.gender+'---');

	    	var u_name = response.name;
	    	var u_email = response.email;
	    	var u_gender = response.gender;
	    	
	    	FB.logout(function(response) {
	    	});
	    	
	    	location.href = "/users/insertFacebook?u_name="+u_name+"&u_email="+u_email+"&u_sex="+u_gender+"";
	    });
	  }
	  //중복값 체크
		$('#u_email').keyup(function(){
			var u_email = $('#u_email').val();
			
		   $('#checkform').empty();
			console.log(u_email);
			
			$.getJSON('/rest/joinOverlap',{u_email:$('#u_email').val()},function(data){
				div = '<div style="color: #3b5999" id="Check"><b>중복된 아이디가 있습니다</b></div>';
				$('#checkform').append(div);
		})
	})
})


</script>
<link rel="stylesheet" href="/resources/css/layout/style.css" media="screen" title="no title" charset="utf-8">
</head>
<body>
	<!-- 첫번째 메뉴 -->
	<div class="row col-md-12" style="margin-top: 50px;">
		<div class="col-md-6 text-center">
		</div>
		
		<div class="col-md-6">
			<div class="page-header">
				<h1>
					Cocoro <small>회원가입</small>
				</h1>
			</div>
			<form class="form-horizontal" action="/users/insertUsers" method="post">
				<div class="form-group">
					<label class="col-md-4 control-label" for="inputEmail">이메일</label>
					<div class="col-md-8" id="emailForm">
						<input class="form-control" id="u_email" name ="u_email" type="email" placeholder="이메일" required>
						<div id="checkform"></div>
					</div>
					
				</div>
				
				<div class="form-group">
					<label class="col-md-4 control-label" for="inputPassword">비밀번호</label>
					<div class="controls col-md-8" id="pwd-container">
						<input id="password" name="u_pwd"  class="form-control input-large" type="password" placeholder="********" required>
						<div class="pwstrength_viewport_progress"></div>
						<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
					</div>

				</div>
				<div class="form-group">
					<label class="col-md-4 control-label" for="inputPasswordCheck">비밀번호
						확인</label>
					<div class="controls col-md-8">
						<input id="reenterpassword" class="form-control input-large" type="password" placeholder="********" required> <em id="emPwd"></em>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label" for="inputName">이름</label>
					<div class="col-md-8">
						<input class="form-control" id="inputName" name="u_name" type="text" placeholder="이름" required>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-4 control-label" for="inputName">주소</label>
					<div class="col-md-8">
						<input class="form-control" name="u_address" id="inputName" type="text" placeholder="지역만 적어주세요" required>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-4 control-label" for="inputNumber">생년월일</label>
					<div class="controls col-md-8">
						<input id="birth" class="form-control input-xs" name="u_birth" type="text" placeholder="1995-04-20" required>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-4 control-label" for="inputNumber">성별</label>
					<div class="controls col-md-8">
						<label class="radio-inline"> <input type="radio" value="남" name="u_sex">남 </label>
					    <label class="radio-inline"><input type="radio" value="여" name="u_sex">여 </label>
					</div>
				</div>
				
					</div>
					<br /> <br /> <br />

					<div class="form-group">
						<div class="col-sm-6 text-center" style="float: right;">
							<button class="btn-lg btn-success" type="submit" style="margin-left: 15%; height: 40px">회원가입</button>
							<div class="fb-login-button" style="display: inline-table; position: absolute;" data-max-rows="1" data-size="xlarge" data-show-faces="false" data-auto-logout-link="true"></div>
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
	<link rel="stylesheet" type="text/css" href="/resources/css/join/jquery.timepicker.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/join/bootstrap-datepicker.css" />
	<script type="text/javascript" src="/resources/js/join/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="/resources/js/join/jquery.timepicker.js"></script>
	<script type="text/javascript" src="/resources/js/join/datepair.js"></script>
	<script type="text/javascript" src="/resources/js/join/loginStart.js"></script>
</body>
</html>