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
			alert("실패")
			
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
	//수정
	$('#modifyForm').submit(function(e){
		event.preventDefault();
		
		var formData = new FormData($(this)[0]);

		$.ajax({
			url: '/users/usersModify',
			type: 'post',
			contentType: false,
			processData: false,
			data: formData,
			success : function(data){
				alert('성공');
			},
		error :	function(){
			alert('수정완료');
			location.href = "/users/mypage?u_id=${users.u_id}"
		}
		})
	});
	
	//팔로우 보여주는 페이지의 높이가 316이넘었을때
	if($('#followYou').height() > 316){
		$('#followYou').css('height',316);
		$('#followYou').css('overflow','hidden');
	}
	if($('#followMe').height() > 316){
		$('#followMe').css('height',316);
		$('#followMe').css('overflow','hidden');
	}
	
	$("input[name=u_mento_check]").change(function() {
		var check = $(this).val();
		if(check == "T"){
			$('#mentoForm').slideDown();
		}else{
			$('#mentoForm').slideUp();
		}
	})
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
									<img align="left" class="fb-image-lg" src="/resources/img/${users.u_image}"
										alt="Profile image example" /> 
										<img align="left"class="fb-image-profile thumbnail" src="/resources/img/${users.u_bgimg}" alt="Profile image example" style="width: 180px; height: 170px;" />
									<div class="fb-profile-text">
										<h1>${users.u_name}</h1>
										<div role="tabpanel">
											<!--탭 메뉴 -->
											<ul class="nav nav-tabs" role="tablist" style="margin-left: 81%;">
												<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
												<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
												<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Modify</a></li>
											</ul>
											<!-- Home탭 메뉴 -->
											<div class="tab-content">
												<div role="tabpanel" class="tab-pane active" id="home">

													<!-- 기본소개 -->
													<div class="col-sm-5">
														<div class="panel panel-default">
															<div class="panel-body">
																<p class="lead">관심사</p>
																<p>${users.u_tag}</p>
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
														<div class="panel panel-default" id="followMe">
															<div class="panel-heading">
																<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" class="pull-right ">더보기</a>
																<h4>${users.u_name}님이 팔로우중인 사람들</h4>
															</div>
															<div class="panel-body">
																<div class="list-group col-md-12">
																<c:forEach var="followMe" items="${followMe}">
																	<div class="col-md-3">
																	<!-- ajax 처리를 위해 유저 값을 들고간다 -->
																	<a href="/users/friendPage?u_id=${followMe.u_id}&f_o_id=${users.u_id}"><img src="/resources/img/${followMe.u_image}" alt="..." class="img-rounded"width="90px"></a>
																	${followMe.u_name}
																	</div>
																</c:forEach>
																</div>
															</div>
														</div>


												<!--나를 팔로우하고있는 사람들 234px-->
														<div class="panel panel-default" id="followYou">
															<div class="panel-heading">
															    <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" class="pull-right ">더보기</a>
																<h4>${users.u_name}님을 팔로우중인 사람들</h4>
															</div>
															<div class="panel-body">
																<div class="list-group col-md-12">
																	<c:forEach var="followYou" items="${followYou}">
																	<div class="col-md-3">
																	<img src="/resources/img/${followYou.u_image}" alt="..." class="img-rounded" width="90px" height="60px;"> 
																	${followYou.u_name}
																	</div>
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
																<input type="hidden" name="u_id" value="${users.u_id}">
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
																<a href="#" title="Lorem ipsum" class="thumbnail"><img src="/resources/img/${users.u_image}" alt="Lorem ipsum" /></a>
																</div>
														<article class="search-result row">
															<div class="col-xs-12 col-sm-12 col-md-2" style="margin-top: 20px;">
																<ul class="meta-search">
																	<li><i class="glyphicon glyphicon-calendar"></i> 생년월일 : <span>${users.u_birth}</span></li>
																	<li><i class="glyphicon glyphicon-time"></i> 주소 : <span> ${users.u_address} </span></li>
																	<li><i class="glyphicon glyphicon-tags"></i> 관심사 : <span>${users.u_tag}</span></li>
																</ul>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-4 excerpet">
																<h3>자기소개</h3>
																<p>${users.u_intro}</p>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-3 excerpet">
																  <p>잔액: 1000</p>
                          										 <button class="btn btn-info btn-lg" href="#signup" data-toggle="modal" data-target=".u_account">계좌관리</button>
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
										<div class="row" style="background-color: #fff;">
									        <form class="form-horizontal" id ="modifyForm" method="post" enctype="multipart/form-data">
									        <input type="hidden" name="u_id" value="${users.u_id}">
									        <div class="col-md-6 text-center" style="margin-top: 40px;">
									        	<h3>현재 배경</h3>
									        	<div class="col-md-12 text-center" >
									        		<img src="/resources/img/${users.u_bgimg}" width="50%;" height="50%;">
													<input type="file" name="fileBack" style="display: inline-block;">
									        	</div><br>
									        	<h3>현재 프로필</h3>
												<div class="col-md-12">
									        		<img src="/resources/img/${users.u_image}" width="50%;" height="50%;">
													<input type="file" name="fileProfile" value="${users.u_image}" style="display: inline-block;">
									        	</div>									        
									  		</div>
									        <div class="col-md-6">
											 <div class="page-header">
									    	    <h1>${users.u_name} <small>Modify</small></h1>
									        </div>
									        <!-- 자기소개 -->
									        <div class="form-group">
									          <label class="col-sm-3 control-label" >자기소개</label>
									        <div class="col-sm-6">
									        	  <input type="text" id="u_intro" class="form-control" name="u_intro" placeholder="${users.u_intro}" value="${users.u_intro}">
									        </div>
									        </div>
									        <!-- 관심사 -->
									          <div class="form-group">
									              <label class="col-sm-3 control-label">관심사</label>
									             <div class="col-sm-6">
									           	  <input type="text" class="form-control" name="u_tag" placeholder="${users.u_tag}" value="${users.u_tag}">
												  </div>
									          </div>
									          <!-- 주소공개 여부 -->
									        <div class="form-group">
									            <label class="col-sm-3 control-label" for="inputName">주소공개</label>
									          <div class="col-sm-6">
									         	<label class="radio-inline">
												  <input type="radio" name="u_address_check" id="u_address_check" value="T" checked="checked"> 공개
												</label>
												<label class="radio-inline">
												  <input type="radio" name="u_address_check" id="u_address_check" value="F" > 비공개
												</label>	
									          </div>
									        </div>
									        <!-- 주소 -->
											<div class="form-group">
									          <label class="col-sm-3 control-label">주소</label>
									        <div class="col-sm-6">
									       	  <input type="text" class="form-control" name="u_address" placeholder="${users.u_address}" value="${users.u_address}">
											 </div>
									        </div>
									        <!-- 생년월일 -->
									        <div class="form-group">
									        	<label class="col-sm-3 control-label">생년월일 공개</label>
									       	 <div class="col-sm-6">
												 <h4 class="title">생년월일 : ${users.u_birth}</h4>
											 </div>
									        </div>
									        <!-- SNS -->
									         <div class="form-group">
									            <label class="col-sm-3 control-label">SNS</label>
									          <div class="col-sm-6">
									          	  <input type="text" class="form-control" name="u_sns_address" placeholder="${users.u_sns_address}" value="${users.u_sns_address}">
									          </div>
									        </div>
									        <!-- 멘토여부 -->
									         <div class="form-group">
									            <label class="col-sm-3 control-label">멘토여부</label>
									          <div class="col-sm-6">
									          <label class="radio-inline">
													  <input type="radio" name="u_mento_check" id="u_mento_check" value="T" onclick="mento_check"> 예
													</label>
													<label class="radio-inline">
													  <input type="radio" name="u_mento_check" id="u_mento_check" value="F" onclick="mento_check"> 아니오
													</label>
									          </div>
									        </div>
									        <!-- 멘토폼 -->
									         <div class="form-group" id="mentoForm">
									            <label class="col-sm-3 control-label">멘토분야</label>
									          <div class="col-sm-6">
									          	  <input type="text" class="form-control" name="m_major" placeholder="멘토링 분야를 쓰세요">
									          </div>
									        </div>
									        <div class="form-group">
									          <div class="col-sm-12 text-center">
									            <button class="btn btn-primary" type="submit">수정</button>
									          </div>
									        </div>
									        </div>
									        </form>
											</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 계좌관리 모달 -->
	<!-- Modal -->
<div class="modal fade u_account" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content" style="width: 60%; margin-left: 22%; ">
        <br>
       <!--  모달메뉴 -->
        <div class="bs-example bs-example-tabs">
            <ul id="myTab" class="nav nav-tabs">
              <li class="active"><a href="#signin" data-toggle="tab">계좌관리</a></li>
            </ul>
        </div>
       <!-- 입금폼 -->
      <div class="modal-body">
        <div id="myTabContent" class="tab-content">
          <div class="modal-body">
        <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade active in" id="signin">
           <!-- 입금버튼  -->
            <form class="form-horizontal" action="../page/mypage/mypageAccountOk.jsp?u_id=${users.u_id}" method="post">
            <fieldset>
            <div class="control-group">
              <label class="control-label" for="u_balance">입금액:</label>
              <div class="controls">
                <input id="u_balance" name="u_balance" type="text" class="form-control" placeholder="입금액을 적어주세요" class="input-medium" required="">
                 <input type="hidden" name="check" value="true"> 
              </div>
            </div>

            <!-- 입금버튼 -->
            <div class="control-group">
              <label class="control-label" for="signin"></label>
              <div class="controls">
                <button type="submit" id="signin" name="signin" class="btn btn-success" style="margin-left: 40%;">입금하기</button>
              </div>
            </div>
            </fieldset>
            </form>
            
            <!-- 출금폼 -->
             <form class="form-horizontal" action="../page/mypage/mypageAccountOk.jsp?u_id=${users.u_id}" method="post">
            <fieldset>
            <div class="control-group">
              <label class="control-label" for="u_balance">출금액:</label>
              <div class="controls">
                <input id="u_balance" name="u_balance" type="text" class="form-control" placeholder="출금액을 적어주세요" class="input-medium" required="">
                 <input type="hidden" name="check" value="false"> 
              </div>
            </div>

            <!-- 출금버튼 -->
            <div class="control-group">
              <label class="control-label" for="signin"></label>
              <div class="controls">
                <button type="submit" id="signin" name="signin" class="btn btn-success" style="margin-left: 40%;">출금하기</button>
              </div>
            </div>
            </fieldset>
            </form>
        </div>
        
    </div>
      </div>
      <div class="modal-footer">
      <center>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </center>
      </div>
    </div>
  </div>
</div>      
</div>
</div>
</body>
</html>
</html>