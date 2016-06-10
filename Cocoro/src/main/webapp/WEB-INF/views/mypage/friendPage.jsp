<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Cocoro</title>
<meta name="generator" content="Bootply" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<body id="body">
	<div class="wrapper">
		<div class="box">
			<div>
				<div class="column col-sm-12 col-xs-12" id="main">
					<div class="padding">
						<div class="col-sm-12">
							<div class="row">
								<!-- 프로필 -->
								<div class="fb-profile">
								<!-- 쪽지를 위한 정보 -->
								<input type="hidden" id="f_o_id" name="f_o_id" value="${fUsers.u_id}">
								<input type="hidden" id="u_id" name="u_id" value="${users.u_id}">
								<input type="hidden" id="users_image" name="users_image" value="${users.u_image}">
								<input type="hidden" id="fUsers_image" name="fUsers_image" value="${fUsers.u_image}">
								<input type="hidden" id="fUsers_name" name="fUsers_name" value="${fUsers.u_name}">
								<input type="hidden" id="users_name" name="users_name" value="${users.u_name}">
									<img align="left" class="fb-image-lg" src="/resources/img/${fUsers.u_bgimg}" alt="Profile image example" /> 
										<img align="left"class="fb-image-profile thumbnail" src="/resources/img/${fUsers.u_image}" alt="Profile image example" style="width: 180px; height: 170px;" />
									<div class="fb-profile-text">
										<h1>${fUsers.u_name}</h1>
										<!-- 팔로우하기 -->
										<div>
										<c:if test="${follow == null}">
										<form  method="post" id="followSend">
											<input type="hidden" id="f_o_id" name="f_o_id" value="${fUsers.u_id}">
											<input type="hidden" id="u_id" name="u_id" value="${users.u_id}">
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
										<button class="btn-primary" id="addClass" style="float: left;">쪽지</button>
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
																<img src="/resources/img/${cList.c_img}" alt="..." class="img-rounde" width="100%" height="380px;"><br><br>
																</c:if>
																<p>
																	${cList.c_comment}
																</p>
																<hr>
																<form id="cu_commentForm" method="post">
																	<div class="input-group">
																		<input type="hidden" id="c_id" name="c_id" value="${cList.c_id}">
																		<input type="hidden" id="u_id" name="u_id" value="${fUsers.u_id}">
																		<input type="text" id="cu_comment" class="form-control" name="cu_comment" placeholder="댓글을 달아보세요.">
																		<input type="hidden" value="${users.u_name}" id="name">
																		<input type="hidden" value="${users.u_image}" id="image">
																		<div class="input-group-btn">
																			<button class="btn btn-default" type="submit" id="commentUsersBtn">댓글</button>
																		</div>
																	</div>
																</form>
																<br>
																<!-- 후기출력 -->
																<div class="input-group" id="commentUsers">
																		<div class="col-md-12">
																		<c:if test="${commentAllList != null}">
								         										<c:forEach var="commentAllList" items="${commentAllList}">
																			<c:if test="${commentAllList.c_id == cList.c_id}">
																				<c:forEach var="usersList" items="${usersList}">
																					<c:if test="${usersList.u_id ==  commentAllList.u_id}">
																					<img src="/resources/img/${usersList.u_image}" style="width:7%; height:37px; float: left;">
																					&nbsp&nbsp${usersList.u_name}  <p>&nbsp&nbsp${commentAllList.cu_comment}</p>
																					</c:if>
																				</c:forEach>
																			</c:if>
																		</c:forEach>
																		</c:if>
																		</div>																				
																</div>
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
															<c:forEach var="followYou" items="${followYou}">
															<div class="col-md-6">
																<div class="col-xs-6 col-sm-6 col-md-3">
																<a href="#" title="Lorem ipsum" class="thumbnail"><img src="/resources/img/${followYou.u_image}" alt="Lorem ipsum" /></a>
																</div>
																<div class="col-xs-6 col-sm-6 col-md-3">${followYou.u_name}</div>
																<c:choose>
																	<c:when test="${followYou.u_id == users.u_id}">
																	<a href="mypage?u_id=${users.u_id}">
																		<button class="btn-primary">친구페이지로</button>
																	</a>
																	</c:when>
																	<c:otherwise>
																	<a href="friendPage?f_o_id=${followYou.u_id}&u_id=${users.u_id}">
																	<button class="btn-primary">친구페이지로</button>
																	</a>
																	</c:otherwise>
																</c:choose>
															</div>
															</c:forEach>				
															</div>
													</div>		
														<!-- 나를 팔로우중인 -->
														<div class="panel panel-default">
															<div class="panel-heading">
																<h4>나를 팔로우중인 친구</h4>
															</div>
															<div class="search-result row" style="margin-top: 20px;">
															<c:forEach var="followMe" items="${followMe}">
															<div class="col-md-6">
																<div class="col-xs-6 col-sm-6 col-md-3">
																<a href="#" title="Lorem ipsum" class="thumbnail"><img src="/resources/img/${followMe.u_image}" alt="Lorem ipsum" /></a>
																</div>
																<div class="col-xs-6 col-sm-6 col-md-3">${followMe.u_name}</div>
																<div class="col-xs-6 col-sm-6 col-md-3">
																<c:choose>
																	<c:when test="${followMe.u_id == users.u_id}">
																	<a href="mypage?u_id=${users.u_id}">
																		<button class="btn-primary">친구페이지로</button>
																	</a>
																	</c:when>
																	<c:otherwise>
																	<a href="friendPage?f_o_id=${followMe.u_id}&u_id=${users.u_id}">
																	<button class="btn-primary">친구페이지로</button>
																	</a>
																	</c:otherwise>
																</c:choose>
																</div>
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
	
<!--  쪽지  -->	
<link href="/resources/css/mypage/chat.css" rel="stylesheet">	
<div class="popup-box chat-popup" id="qnimate">
    		  <div class="popup-head">
				<div class="popup-head-left pull-left"><img src="/resources/img/${fUsers.u_image}" alt="iamgurdeeposahan"> ${fUsers.u_name}</div>
					  <div class="popup-head-right pull-right">
						<div class="btn-group">
						</div>						
						<button data-widget="remove" id="removeClass" class="chat-header-button pull-right" type="button">X</button>
                      </div>
			  </div>
			<div class="popup-messages">
			<div class="direct-chat-messages">           
			<c:if test="${oneMyList == null}">
				메세지함이 비었습니다.
			</c:if>					
				<c:if test="${oneMyList != null}">
				<c:forEach var="oneMyList" items="${oneMyList}">
				<!--내말-->
				<c:choose>
					<c:when test="${oneMyList.message_o_id == users.u_id}">
                    <div class="direct-chat-msg doted-border">
                      <div class="direct-chat-info clearfix">
                        <span class="direct-chat-name pull-left">${users.u_name}<small>(나)</small></span>
                      </div>
                      <img alt="iamgurdeeposahan" src="/resources/img/${users.u_image}" class="direct-chat-img"><!-- /.direct-chat-img -->
                      <div class="direct-chat-text">
                      	${oneMyList.message_comment}
                      </div>
	                      <c:choose>
		                      <c:when test="${oneMyList.message_check == 'T'}">
		                     <span><small style="float: right;">읽음</small></span>
		                     </c:when>
		                     <c:otherwise>
		                     <span><small style="float: right;">읽지않음</small></span>
		                     </c:otherwise>
                    	 </c:choose>
                    </div>
                    </c:when>
                    
                	<c:otherwise>
                    <div class="direct-chat-msg doted-border">
                      <div class="direct-chat-info clearfix" style="margin-left: 140px;">
                        <span class="direct-chat-name pull-left">${fUsers.u_name}</span>
                      </div>
                      <img alt="iamgurdeeposahan" src="/resources/img/${fUsers.u_image}"  style="float: right;"class="direct-chat-img">
                      <div class="direct-chat-text" style="background-color: #ffc6c6; display: table-cell; width:1%;">
                     	${oneMyList.message_comment}
                      </div>
                    </div>
                    </c:otherwise>
                    </c:choose>
                    </c:forEach>
                 </c:if>   
             </div>
			</div>
			<div class="popup-messages-footer">
			 <div class="btn-footer">
			 	<form method="post" id="mSendForm">
			     <input type="text" id ="message_comment" class="form-control" name="message_comment" width="100%;"  required>
				 <input type="hidden"  name="message_o_id" value="${users.u_id}">	
				 <input type="hidden" name="message_u_id" value="${fUsers.u_id}">
				 <input type="hidden" id ="name"  name="name" value="${users.u_name}">
				 <input type="hidden" id ="image" name="image" value="${users.u_image}">
				<button class="bg_none pull-right" type="submit" >보내기</button>
	    	</form>
			</div>
			</div>
	  </div>
	  <link href="/resources/css/mypage/mypage.css" rel="stylesheet">
	<script type="text/javascript" src="/resources/js/mypage/friendPage.js"></script>
</body>
</html>
</html>