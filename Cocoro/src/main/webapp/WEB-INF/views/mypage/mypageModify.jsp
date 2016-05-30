<%@page import="cocoro.user.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>  
<%
	Users users = (Users)session.getAttribute("users");
%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script type="text/javascript">

//멘토링 체크
$(function(){
	$("input[name=u_mento_check]").change(function() {
		var check = $(this).val();
		if(check == "T"){
			$('#mentoBox').slideDown();
		}else{
			$('#mentoBox').slideUp();
		}
	})
	if($('#u_intro').val() == '다른회원에게 당신을 알려주세요'){
		alert('당신의 첫 로그인을 환영합니다');
	}
	
	$('#modifyOk').click(function(){
		if($(':radio[name="u_mento_check"]:checked').length < 1){
			alert('카테고리를 선택해주세요');
		}else{
		alert('수정이완료되었습니다');
		}
	})
});
</script>
</head>
<body>
<form action="../page/mypage/mypageModifyOk.jsp?u_id=${users.u_id}" method="post" enctype="multipart/form-data">
	<div class="container">
		<div class="row">
			<div class="content text-center">
			<div class="col-md-8 col-md-offset-2">
				<div class="table-container">
				</div>
					<table class="table table-filter">
						<tbody>
				<!-- 프로필 사진 수정 -->
					<tr><td>
							<div class="media" id="u_image">
								<div class="media-body">
									<h4 class="title block">프로필 업로드</h4>
									  <input type="file" class="" name="filename" align="center">
									  <input type="hidden" name="imgname" value="${users.u_image}"> 
								</div>
							</div>
					</td></tr>	
					<!-- 자기소개 -->
						<tr><td>
							<div class="media">
								<div class="media-body">
									<h4 class="title">자기소개</h4>
									  <input type="text" id="u_intro" class="form-control" name="u_intro" placeholder="${users.u_intro}" value="${users.u_intro}">
								</div>
							</div>
						</td></tr>
					<!-- 관심사 -->
						<tr><td>
							<div class="media">
								<div class="media-body">
									<h4 class="title">관심사</h4>
									  <input type="text" class="form-control" name="u_tag" placeholder="${users.u_tag}" value="${users.u_tag}">
								</div>
							</div>
						</td></tr>
					<!-- 주소 -->
					<tr><td>
							<div class="media">
								<div class="media-body">
							<!-- 주소 공개 체크 -->
									<h4 class="title">다른회원들에게 주소를 공개 하실건가요 ?</h4>
							<!-- 주소 공개를 원할때 -->
									<label class="radio-inline">
									  <input type="radio" name="u_address_check" id="u_address_check" value="T" checked="checked"> 예
									</label>
									<label class="radio-inline">
									  <input type="radio" name="u_address_check" id="u_address_check" value="F" > 아니오
									</label>
							<!-- 주소 -->	
									<h4 class="title">주소</h4>
									  <input type="text" class="form-control" name="u_address" placeholder="${users.u_address}" value="${users.u_address}">
								</div>
							</div>
						</td></tr>
					<!-- 생년월일 -->
						<tr><td>
							<div class="media">
								<div class="media-body">
								<!-- 생년월일 공개 체크 -->
								<h4 class="title">다른회원들에게 생년월일을 공개 하실건가요 ?</h4>
										<label class="radio-inline">
										  <input type="radio" name="u_brith_check"  value="T" checked="checked"> 예
										</label>
										<label class="radio-inline">
										  <input type="radio" name="u_brith_check"  value="F"> 아니오
										</label>
									<h4 class="title">생년월일</h4>
									<h5 class="title">${users.u_birth}</h5>
								</div>
							</div>
						</td></tr>	
					<!-- sns 주소 -->	
					<tr><td>
							<div class="media">
								<div class="media-body">
									<h4 class="title">SNS</h4>
									  <input type="text" class="form-control" name="u_sns_address" placeholder="${users.u_sns_address}" value="${users.u_sns_address}">
								</div>
							</div>
					</td></tr>	
				<!-- 멘토 체크여부 -->					
					<tr><td>
					<div class="media">
						<div class="media-body">
								<h4 class="title">멘토로 진행하실건가요 ?</h4>
								<label class="radio-inline">
								  <input type="radio" name="u_mento_check" id="u_mento_check" value="T" onclick="mento_check"> 예
								</label>
								<label class="radio-inline">
								  <input type="radio" name="u_mento_check" id="u_mento_check" value="F" onclick="mento_check"> 아니오
								</label>
								</div>
					</div>
					</td></tr>			
					<!-- 멘토여부 -->
					<tr><td>
							<div class="media" id="mentoBox">
								<div class="media-body">
									<h4 class="title">어떤 분야의 멘토를 진행하실건가요?</h4>
									  <input type="text" class="form-control" name="m_major" placeholder="멘토링 분야를 쓰세요">
								</div>
							</div>
					</td></tr>
					
					<tr><td>
							<div class="media" id="mentoBox">
					<button class ="btn btn-block btn-info" type="submit" id="modifyOk">수정하기</button>
							</div>
					</td></tr>
					</tbody>
					</table>
				</div>
			</div>
			</div>
		</div>
	</form>
</body>
</html>