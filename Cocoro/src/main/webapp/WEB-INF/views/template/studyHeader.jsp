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
<style type="text/css">
select{
display: inline-block;
}
</style>
</head>
<body>
	<!-- 네비게이션바 -->
	<div class="header_nav">
		<nav class="navbar navbar-default navbar-top">
		<div class="container" style="width: 100%;">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="beforeMain"><b
					style="color: #fff;">Cocoro</b></a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right" style="float: right;">
					<li><a href="#">스터디</a></li>
					<li><a href="#" data-toggle="modal" data-target="#join-modal">회원가입</a></li>
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
					<li><a href="#" data-toggle="modal" data-target="#login-modal">로그인</a></li>
					<li>${users.u_name}님 안녕하세요</li>
				</ul>
			</div>
		</div>
		</nav>
	</div>
	
	
	<!-- 로그인 모달 -->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
				<h4>Cocoro</h4>
				</div>
                <!-- Begin # DIV Form -->
                <div id="div-forms">
                    <!--로그인폼-->
                    <form id="login-form" action="/users/insertUsers">
		                <div class="modal-body">
				    		<input id="login_username" name="u_email"class="form-control" type="text" placeholder="Username (type ERROR for error effect)" required>
				    		<input id="login_password" class="form-control" type="password" placeholder="Password" required>
        		    	</div>
				        <div class="modal-footer">
                            <div>
                                <button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
                            </div>
				    	    <div>
                                <button id="login_lost_btn" type="button" class="btn btn-link">비밀번호를 잊어버리셨어요?</button>
                            </div>
				        </div>
                    </form>
                    <!-- 비밀번호 찾기 폼 -->
                    <form id="lost-form" style="display:none;">
    	    		    <div class="modal-body">
		    				<input id="lost_email" class="form-control" type="text" placeholder="E-Mail (type ERROR for error effect)" required>
            			</div>
		    		    <div class="modal-footer">
                            <div>
                                <button type="submit" class="btn btn-primary btn-lg btn-block">Send</button>
                            </div>
                            <div>
                                <button id="lost_login_btn" type="button" class="btn btn-link">Log In</button>
                            </div>
		    		    </div>
                    </form>
                    <!-- End | Lost Password Form -->
                </div>
                <!-- End # DIV Form -->
			</div>
		</div>
	</div>
    <!-- END # MODAL LOGIN -->

<!-- 회원가입 폼 -->
<!-- BEGIN # MODAL LOGIN -->
<div class="modal fade" id="join-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
				<h4>Cocoro에 오신여러분을 환영합니다!</h4>
				</div>
                <!-- Begin # DIV Form -->
				    	  <form action="/users/insertUsers" id="insertForm" method="post">
                <div id="div-forms">
		                <div class="modal-body">
				    	    <div class='col-md-12'>
				    	    이메일<input id="u_email" name="u_email" class="form-control" type="text" placeholder="이메일" required>
				    		<div>중복된 이메일입니다.</div>
				    		</div>
				    		 <div class='col-md-12'>
				    		이름<input id="u_name" name="u_name" class="form-control" type="text" placeholder="이름" required>
				    		</div>
				    		 <div class='col-md-12'>
				    		비밀번호<input id="u_password" class="form-control" type="password" placeholder="비밀번호" required>
				    		</div>
				    		 <div class='col-md-12'>
				    		주소<input id="u_address" class="form-control" type="text" placeholder="주소" required>
				    		</div>
				    		<div class="col-md-12">
				    		생년월일<br>
				    		<select style="width: 74px; height: 32px;" id="birth1" name="birth1">
				    		<%for(int i=1;i<13;i++){ %>
				    			<option value="<%=i%>" ><%=i%></option>	
				    		<%} %>
				    		</select>
				    		<select style="width: 74px; height: 32px;" id="birth2" name="birth2">
				    		<%for(int i=1;i<13;i++){ %>
				    			<option value="<%=i%>" ><%=i%></option>	
				    		<%} %>
				    		</select>
				    		<select style="width: 74px; height: 32px;" id="birth3" name="birth3">
				    		<%for(int i=1;i<13;i++){ %>
				    			<option value="<%=i%>"><%=i%></option>	
				    		<%} %>
				    		</select>
							</div>
							  <div class="modal-footer">
				        </div>
                            <div>
                                <button id="submitBtn" type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
                            </div>
					</div>
        		   </div>
					   </form>
                </div>
                <!-- End # DIV Form -->
			</div>
		</div>
    <!-- END # MODAL LOGIN -->
</body>
</html>