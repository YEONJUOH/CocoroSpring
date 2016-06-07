<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Faceboot - A Facebook style template for Bootstrap</title>
<meta name="generator" content="Bootply" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="/resources/css/mypage/mypage.css" rel="stylesheet">
<script type="text/javascript">
$(function(){
	//후기
	$('#commentForm').submit(function(e){
		event.preventDefault();
		
		var formData = new FormData($(this)[0]);
		var name = $('#name').val();
		var comment = $('#comment').val();
		var image = $('#image').val();
		
		$.ajax({
			url: '/users/usersAfter',
			type: 'post',
			contentType: false,
			processData: false,
			data: formData,
			success : function(data){
			},
		error :	function(){
			
			var div = '<div class="panel panel-default">';
			div += '<div class="panel-body">';
			div += '<img src="/resources/img/'+image+'" class="img-rounded" width="20px">';
			div += ''+name+' 님이 글을 남겼습니다.';
			div += '<div class="clearfix"></div><hr>';
			if(file != ""){
			div += '<img src="/resources/img/sorry.jpg" alt="..." class="img-rounde" width="487px" height="380px;">';
			}
			div += '<p> '+comment+'</p><hr>';
			div += '<form><div class="input-group">';
			div += '<input type="text" class="form-control" placeholder="Add a comment..">';
			div += '<div class="input-group-btn"><button class="btn btn-default">댓글</button>';
			div +=	'</div></div></form></div></div>';
			
			$('#test').append(div);
		}
		})
	});
	//팔로우 버튼
	$('#followSend').submit(function(e){
		event.preventDefault();
		
		var params = $('#followSend').serialize();
		
		$.ajax({
			url: '/users/follow',
			type:'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:params,
			dataType:'html',
			success: function(data){
			},
			error : function(){
				alert('팔로우 성공');
				location.href = "/users/friendPage?u_id=${users.u_id}&f_o_id=${fUsers.u_id}";
			}
		})	
	});
	
	//팔로우 취소
	$('#unFollwForm').submit(function(e){
		event.preventDefault();
		
		var params = $('#unFollwForm').serialize();
		
		$.ajax({
			url: '/users/unFollow',
			type:'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:params,
			dataType:'html',
			success: function(data){
			},
			error : function(){
				alert('팔로우 취소');
				location.href = "/users/friendPage?u_id=${users.u_id}&f_o_id=${fUsers.u_id}";
				}
		})	
	});
	//좋아요 버튼
	$('#likesForm').submit(function(e){
		event.preventDefault();
		
		var params = $('#likesForm').serialize();
		
		$.ajax({
			url: '/users/usersLikes',
			type:'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:params,
			dataType:'html',
			success: function(data){
			},
			error : function(){
				alert('좋아요');
				location.href = "/users/friendPage?u_id=${users.u_id}&f_o_id=${fUsers.u_id}";
				}
		})	
	});
	//싫어요 버튼
	$('#unLikesForm').submit(function(e){
		event.preventDefault();
		
		var params = $('#unLikesForm').serialize();
		
		$.ajax({
			url: '/users/usersUnLikes',
			type:'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:params,
			dataType:'html',
			success: function(data){
			},
			error : function(){
				alert('싫어요');
				location.href = "/users/friendPage?u_id=${users.u_id}&f_o_id=${fUsers.u_id}";
				}
		})	
	});
	
	//쪽지 보내기
	$('#mSendForm').submit(function(e){
		event.preventDefault();
		
		var params = $('#mSendForm').serialize();
		
		$.ajax({
			url: '/users/unFollow',
			type:'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data:params,
			dataType:'html',
			success: function(data){
				alert('성공');
			},
			error : function(){
				alert('실패 ');
			}
		})
	})
	
	//팔로우 보여주는 페이지의 높이가 316이넘었을때
	if($('#followYou').height() > 316){
		$('#followYou').css('height',316);
		$('#followYou').css('overflow','hidden');
	}
	if($('#followMe').height() > 316){
		$('#followMe').css('height',316);
		$('#followMe').css('overflow','hidden');
	}
})
</script>
</head>
<body>
	<div class="wrapper">
		<!-- /container -->
		<div class="box">
			<div>
				<!-- main right col -->
				<div class="column col-sm-12 col-xs-12" id="main">
					<div class="padding">
						<div class="col-sm-12">
							<div class="row">

								<!-- 프로필 -->
								<div class="fb-profile">
									<img align="left" class="fb-image-lg" src="/resources/img/img2.jpg"
										alt="Profile image example" /> 
										<img align="left"class="fb-image-profile thumbnail" src="/resources/img/img2.jpg" alt="Profile image example" style="width: 180px; height: 170px;" />
									<div class="fb-profile-text">
										<h1>${fUsers.u_name}</h1>
										<!-- 팔로우하기 -->
										<div>
										<c:if test="${follow == null}">
										<form  method="post" id="followSend">
											<input type="hidden" name="f_o_id" value="${fUsers.u_id}">
											<input type="hidden" name="u_id" value="${users.u_id}">
											<button class="btn-primary" type="submit" id="followBtn" style="float: left;">팔로우</button>
										</form>
										</c:if>
										<c:if test="${follow != null}">
										<!-- 팔로우취소 -->
										<form method="post" id="unFollwForm">
											<input type="hidden" name="f_o_id" value="${fUsers.u_id}">
											<input type="hidden" name="u_id" value="${users.u_id}">
											<button class="btn-primary" type="submit" id="followBtn" style="float: left;">팔로우취소</button>
										</form>
										</c:if>
										<!-- 좋아요 -->
										<c:if test="${likes == null}">
										<form  method="post" id="likesForm">
											<input type="hidden" name="l_o_id" value="${fUsers.u_id}">
											<input type="hidden" name="u_id" value="${users.u_id}">
											<button class="btn-primary" type="submit" style="float: left;">좋아요</button>
										</form>
										</c:if>
										<c:if test="${likes != null}">
										<!-- 좋아요취소 -->
										<form method="post" id="unLikesForm">
											<input type="hidden" name="l_o_id" value="${fUsers.u_id}">
											<input type="hidden" name="u_id" value="${users.u_id}">
											<button class="btn-primary" type="submit" style="float: left;">좋아요취소</button>
										</form>
										</c:if>
										<!--쪽지보내기 -->
										<button type="button" class="btn btn-success" data-toggle="modal" data-target=".mSend">쪽지</button>
										</div>
										<div role="tabpanel">
											<!--탭 메뉴 -->
											<ul class="nav nav-tabs" role="tablist" style="margin-left: 87%;">
												<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
												<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
											</ul>
											<!-- Home탭 메뉴 -->
											<div class="tab-content">
												<div role="tabpanel" class="tab-pane active" id="home">
													<!-- 기본소개 -->
													<div class="col-sm-5">
														<div class="panel panel-default">
															<div class="panel-body">
																<p class="lead">관심사</p>
																<p>${fUsers.u_tag}</p>
															</div>
														</div>

														<!--참여중인 스터디 -->
														<div class="panel panel-default">
															<div class="panel-heading">
														<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" class="pull-right ">더보기</a>
																<h4>
																	<i class="glyphicon glyphicon-search"></i>참여중인 스터디
																</h4>
															</div>
															<div class="panel-body">
																<div class="list-group">
																	<a href="" class="list-group-item">취준생들의 쉼터</a>
																	<h5 class="pull-right">2016-5-31</h5>
																	<a href="" class="list-group-item">신토익 스터디</a> <a
																		href="" class="list-group-item">경복궁관람</a>
																</div>
															</div>
														</div>
														<!-- 팔로우 중인친구 -->
														<div class="panel panel-default" id="followYou">
															<div class="panel-heading">
																<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" class="pull-right ">더보기</a>
																<h4>${fUsers.u_name}님이 팔로우중인 사람들</h4>
															</div>
															<div class="panel-body">
																<div class="list-group col-md-12">
																<c:forEach var="followYou" items="${followYou}">
																		<c:choose>
																		<c:when test="${users.u_id == followYou.u_id}">
																		<div class="col-md-3">
																			<a href="/users/mypage?u_id=${users.u_id}"><img src="/resources/img/${followYou.u_image}" alt="..." class="img-rounded"width="90px" height="60px;"></a> 
																			${followYou.u_name}
																			</div>
																		</c:when>
																		<c:otherwise>
																			<div class="col-md-3">
																			<a href="/users/friendPage?u_id=${users.u_id}&f_o_id=${followYou.u_id}"><img src="/resources/img/${followYou.u_image}" alt="..." class="img-rounded"width="90px" height="60px;"></a> 
																			${followYou.u_name}
																			</div>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
																</div>
															</div>
														</div>


												<!--나를 팔로우하고있는 사람들 -->
														<div class="panel panel-default" id="followMe">
															<div class="panel-heading">
																<a href="#" class="pull-right">더보기</a>
																<h4>${fUsers.u_name}님을 팔로우중인 사람들</h4>
															</div>
															<div class="panel-body">
																<div class="list-group col-md-12" id="followYouBody">
																<!-- 만약에 팔로우하는 사람이 나라면 마이페이지로 이동 -->
																	<c:forEach var="followMe" items="${followMe}">
																	<c:choose>
																		<c:when test="${users.u_id == followMe.u_id}">
																		<div class="col-md-3">
																			<a href="/users/mypage?u_id=${users.u_id}"><img src="/resources/img/${followMe.u_image}" alt="..." class="img-rounded"width="90px" height="60px;"></a> 
																			${followMe.u_name}
																			</div>
																		</c:when>
																		<c:otherwise>
																			<div class="col-md-3">
																			<a href="/users/friendPage?u_id=${users.u_id}&f_o_id=${followMe.u_id}"><img src="/resources/img/${followMe.u_image}" alt="..." class="img-rounded"width="90px" height="60px;"></a> 
																			${followMe.u_name}
																			</div>
																		</c:otherwise>
																	</c:choose>
																	</c:forEach>
																</div>
															</div>
														</div>
													</div>

													<!-- 오른쪽 메뉴 부분  -->
													<div class="col-sm-7" style="overflow: hidden;">
														<div class="well">
															<form action="/users/usersAfter" id="commentForm" enctype="multipart/form-data" method="post">
																<div class="input-group text-center">
																	<input type="text" id="comment" name="c_comment" class="form-control input-lg" placeholder="무슨생각을 가지고계세요?"> <span class="input-group-btn">
																	<button class="btn btn-lg btn-primary" type="submit">쓰기</button></span>
																</div>
																<div><input type="file" name="file" id="file"></div>
																<input type="hidden" name="c_o_id" value="${users.u_id}">
																<input type="hidden" name="u_id" value="${fUsers.u_id}">
																<input type="hidden" name="u_name" value="${users.u_name}" id="name">
																<input type="hidden" name="u_name" value="${users.u_image}" id="image">
															</form>
														</div>
														<div id="test">
														</div>

														<!-- 후기 남기는부분 -->
														<c:forEach var="cList" items="${cList}" >
															    <c:forEach var="uList" items="${uList}">
															    <c:if test="${cList.c_o_id == uList.u_id}">
														<div class="panel panel-default">
															<div class="panel-body">
																<img src="/resources/img/${uList.u_image}" class="img-rounded" width="20px">
																${uList.u_name} 님이 글을 남겼습니다.
																<div class="clearfix"></div>
																<hr>
																<c:if test="${cList.c_img != null}">
																<img src="/resources/upload/${cList.c_img}" alt="..." class="img-rounde" width="100%" height="380px;"><br><br>
																</c:if>
																<p>
																	${cList.c_comment}
																</p>
																<hr>
																<form>
																	<div class="input-group">
																		<input type="text" class="form-control"
																			placeholder="Add a comment..">
																		<div class="input-group-btn">
																			<button class="btn btn-default">댓글</button>
																		</div>
																	</div>
																</form>
															</div>
														</div>
														</c:if>
															</c:forEach>
															</c:forEach>
													</div>
												</div>
												<!-- 두번쨰 메뉴 -->
												<div role="tabpanel" class="tab-pane" id="profile">
											<!-- Profile -->	
												<div class="panel panel-default">
															<div class="panel-heading">
																<h4>정보</h4>
															</div>
																<div class="col-xs-6 col-sm-6 col-md-3">
																<a href="#" title="Lorem ipsum" class="thumbnail"><img src="/resources/img/${fUsers.u_image}" alt="Lorem ipsum" /></a>
																</div>
														<article class="search-result row">
															<div class="col-xs-12 col-sm-12 col-md-2"
																style="margin-top: 20px;">
																<ul class="meta-search">
																	<li><i class="glyphicon glyphicon-calendar"></i>
																		생년월일 : <span>${fUsers.u_birth}</span></li>
																	<li><i class="glyphicon glyphicon-time"></i> 주소 :
																		<span> ${fUsers.u_address} </span></li>
																	<li><i class="glyphicon glyphicon-tags"></i> 관심사 :
																		<span>${fUsers.u_tag}</span></li>
																</ul>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
																<h3>자기소개</h3>
																<p>${fUsers.u_intro}</p>
															</div>
															<span class="clearfix borda"></span>
														</article>
													</div>									
												<!-- 친구 목록 -->
												<div class="panel panel-default">
															<div class="panel-heading">
																<h4>팔로우중인 친구</h4>
															</div>
															<div class="search-result row" style="margin-top: 20px;">
															<c:forEach var="followMe" items="${followMe}">
															<div class="col-md-6">
																<div class="col-xs-6 col-sm-6 col-md-3">
																<a href="#" title="Lorem ipsum" class="thumbnail"><img src="/resources/img/${followMe.u_image}" alt="Lorem ipsum" /></a>
																</div>
																<div class="col-xs-6 col-sm-6 col-md-3">${followMe.u_name}</div>
																<div class="col-xs-6 col-sm-6 col-md-3"><button>팔로우끊기</button></div>
															</div>
															</c:forEach>				
															</div>
													</div>		
													<!-- 가입중인 스터디 목록 -->
													<div class="panel panel-default">
															<div class="panel-heading">
																<h4>활동중인 스터디</h4>
															</div>
															<div class="search-result row" style="margin-top: 20px;">
													<div class="col-md-6">
																<div class="col-xs-6 col-sm-6 col-md-3">
																<a href="#" title="Lorem ipsum" class="thumbnail"><img src="img.png" alt="Lorem ipsum" /></a>
																</div>
																<div class="col-xs-6 col-sm-6 col-md-3">토익만세</div>
																<div class="col-xs-6 col-sm-6 col-md-3">탈퇴</div>
															</div>
															<div class="col-md-6">
																<div class="col-xs-6 col-sm-6 col-md-3">
																<a href="#" title="Lorem ipsum" class="thumbnail"><img src="img.png" alt="Lorem ipsum" /></a>
																</div>
																<div class="col-xs-6 col-sm-6 col-md-3">수영을 하자</div>
																<div class="col-xs-6 col-sm-6 col-md-3">탈퇴</div>
															</div>
															<div class="col-md-6">
																<div class="col-xs-6 col-sm-6 col-md-3">
																<a href="#" title="Lorem ipsum" class="thumbnail"><img src="img.png" alt="Lorem ipsum" /></a>
																</div>
																<div class="col-xs-6 col-sm-6 col-md-3">웅쨩의하루</div>
																<div class="col-xs-6 col-sm-6 col-md-3">탈퇴</div>
															</div>
															<div class="col-md-6">
																<div class="col-xs-6 col-sm-6 col-md-3">
																<a href="#" title="Lorem ipsum" class="thumbnail"><img src="img.png" alt="Lorem ipsum" /></a>
																</div>
																<div class="col-xs-6 col-sm-6 col-md-3">댄스동아리</div>
																<div class="col-xs-6 col-sm-6 col-md-3">탈퇴</div>
															</div>
																<div class="col-md-12">
																<h5 class="text-center">모두보기</h5>
															</div>
															</div>
													</div>								
												</div>
												<!-- 세번째 메뉴  -->
												<div role="tabpanel" class="tab-pane" id="messages">
												
												
												
												
												
												
												
												</div>
												<div role="tabpanel" class="tab-pane" id="settings">...</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--/row-->
						</div>
						<!-- /col-9 -->
					</div>
					<!-- /padding -->
				</div>
				<!-- /main -->
			</div>
		</div>
	</div>
	
	
		<!-- 쪽지 보내기 모달 -->
	
	 <div class="modal fade mSend" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="width: 350px;">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      	<h3 class="text-center">메세지보내기</h3>
	      	<form method="post" id="mSendForm">
				<textarea rows="10" cols="39" style="width: 100%;" name="message_comment"></textarea>
				 <input type="hidden" name="message_o_id" value="${users.u_id}">	
				 <input type="hidden" name="message_u_id" value="${fUsers.u_id}">	
				 <input type="hidden" id="messageInfo" name="messageInfo" value="insert">
	             <button type="submit" class="btn-block btn-primary" id="mBtn">메세지 보내기</button>
	    	</form>
	    </div>
	  </div>
	</div>
</body>
</html>
</html>