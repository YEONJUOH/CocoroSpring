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
<style type="text/css">
.form-control{
	position: inherit;
}
</style>
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
									<img align="left" class="fb-image-lg" src="/resources/img/${users.u_bgimg}"
										alt="Profile image example" /> 
										<img align="left"class="fb-image-profile thumbnail" src="/resources/img/${users.u_image}" alt="Profile image example" style="width: 180px; height: 170px;" />
									<div class="fb-profile-text">
										<h1>${users.u_name}
										<c:if test="${mento != null}">
										(멘토)
										</c:if>
										</h1>
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
																<p class="lead"><i class="glyphicon glyphicon-heart"></i>&nbsp 관심사</p>
																<p>${users.u_tag}</p>
															</div>
														</div>
														<c:if test="${mento != null }">
														<div class="panel panel-default">
															<div class="panel-body">
																<p class="lead"><i class="glyphicon glyphicon-pencil"></i>&nbsp진행중인 멘토링</p>
																<p>${mento.m_major}</p>
															</div>
														</div>
														</c:if>
														<!--참여중인 스터디 -->
														<div class="panel panel-default">
															<div class="panel-heading">
														<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" class="pull-right" id="more"></a>
																<h4>
																	<i class="glyphicon glyphicon-search"></i>&nbsp 참여중인 스터디
																</h4>
															</div>
															<div class="panel-body">
																<div class="list-group">
																	<c:if test="${studyList != null }">
																	<c:forEach var="studyList" items="${studyList}">
																		<a href="/StudyDetail/studydetail?s_id=${studyList.s_id}" class="list-group-item">${studyList.s_name} <h5 class="pull-right">${studyList.s_last_login}</h5></a>
																	</c:forEach>
																	</c:if>
																	<c:if test="${studyList == '[]' }">
																		가입 된 스터디가 없습니다.
																	</c:if>
																</div>
															</div>
																<div class="panel-heading">
																<h4>
																   목표달성률 : ${users.u_goal_ration}% 
														               <div class="progress">
														                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="background-color:#ffb819; width: ${users.u_goal_ration}%">
														               </div>
														               </div>
																</h4>
															</div>
														</div>
														<!-- 팔로우 중인친구 -->
														<div class="panel panel-default" id="followYou">
															<div class="panel-heading">
																<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" class="pull-right" id="more"></a>
																<h4><i class="glyphicon glyphicon-thumbs-up"></i>&nbsp ${users.u_name}님이 팔로우중인 사람들</h4>
															</div>
															<div class="panel-body">
																<div class="list-group col-md-12">
																<c:forEach var="followYou" items="${followYou}">
																	<div class="col-md-3">
																	<!-- ajax 처리를 위해 유저 값을 들고간다 -->
																	<a href="/users/friendPage?f_o_id=${followYou.u_id}&u_id=${users.u_id}"><img src="/resources/img/${followYou.u_image}" alt="..." class="img-rounded" width="90px" height="60px;"></a>
																	${followYou.u_name}
																	</div>
																</c:forEach>
																</div>
															</div>
														</div>


												<!--나를 팔로우하고있는 사람들 234px-->
														<div class="panel panel-default" id="followMe">
															<div class="panel-heading">
															    <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" class="pull-right" id="more"></a>
																<h4><i class="glyphicon glyphicon-eye-open"></i>&nbsp ${users.u_name}님을 팔로우중인 사람들</h4>
															</div>
															<div class="panel-body">
																<div class="list-group col-md-12">
																	<c:forEach var="followMe" items="${followMe}">
																	<div class="col-md-3">
																	<a href="/users/friendPage?f_o_id=${followMe.u_id}&u_id=${users.u_id}"><img src="/resources/img/${followMe.u_image}" alt="..." class="img-rounded" width="90px" height="60px;"></a> 
																	${followMe.u_name}
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
																<input type="hidden" id="p_c_id" name="p_c_id" value="${cList.c_id}">
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
																		<input type="hidden" id="u_id" name="u_id" value="${users.u_id}">
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
																<a href="#" title="Lorem ipsum" class="thumbnail"><img src="/resources/img/${users.u_image}" alt="Lorem ipsum" /></a>
																</div>
														<article class="search-result row">
															<div class="col-xs-12 col-sm-12 col-md-2" style="margin-top: 20px;">
																<ul class="meta-search">
																	<c:choose>
																		<c:when test="${users.u_birth_check == 'F'}">
																			<li><i class="glyphicon glyphicon-calendar"></i> 생년월일 : <span> 비공개 </span></li>
																		</c:when>
																		<c:otherwise>
																			<li><i class="glyphicon glyphicon-calendar"></i> 생년월일 : <span>${users.u_birth}</span></li>
																		</c:otherwise>
																	</c:choose>
																	<c:choose>
																		<c:when test="${users.u_address_check == 'F'}">
																			<li><i class="glyphicon glyphicon-home"></i> 주소 : <span> 비공개 </span></li>
																		</c:when>
																		<c:otherwise>
																			<li><i class="glyphicon glyphicon-home"></i> 주소 : <span> ${users.u_address} </span></li>
																		</c:otherwise>
																	</c:choose>
																	<li><i class="glyphicon glyphicon-tags"></i> 관심사 : <span>${users.u_tag}</span></li>
																	<li><i class="glyphicon glyphicon-send"></i> SNS : <span>${users.u_sns_address}</span></li>
																</ul>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-4 excerpet">
																<h3>자기소개</h3>
																<p>${users.u_intro}</p>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-3 excerpet">
																  <h3>계좌관리</h3>
																  <c:choose>
																  <c:when test="${usersAccount != null}">
																  <p>계좌번호: ${usersAccount.u_account}</p>
																  <p id="accountMoney">잔액: ${usersAccount.u_balance}</p>
                          										 <button class="btn btn-primary btn-lg" href="#signup" data-toggle="modal" data-target=".u_account">계좌관리</button>
																 </c:when>	
																 <c:otherwise>
																 	<p>계좌가 없습니다</p>
																 </c:otherwise>	
																  </c:choose>
															</div>
															<span class="clearfix borda"></span>
														</article>
													</div>									
												<!-- 친구 목록 -->
												<div class="panel panel-default">
															<div class="panel-heading">
																<h4><i class="glyphicon glyphicon-thumbs-up"></i>&nbsp 팔로우중인 친구</h4>
															</div>
															<div class="search-result row" id="followYouDiv" style="margin-top: 20px;">
															<c:forEach var="followYou" items="${followYou}">
															<div class="col-md-6">
																<div class="col-xs-6 col-sm-6 col-md-3">
																<a href="#" title="Lorem ipsum" class="thumbnail"><img src="/resources/img/${followYou.u_image}" width="90px" height="30px" alt="Lorem ipsum" /></a>
																</div>
																<div class="col-xs-6 col-sm-6 col-md-3">${followYou.u_name}</div>
																	<input type="hidden" name="u_id" value="${users.u_id}">
																	<input type="hidden" name="f_o_id" value="${followYou.u_id}">
																	<div class="col-xs-6 col-sm-6 col-md-3">
																	<a href="friendPage?f_o_id=${followYou.u_id}&u_id=${users.u_id}">
																	<button class="btn-primary">친구페이지로</button>
																	</a>										
											       					</div>
															</div>
															</c:forEach>				
															</div>
													</div>	
													
													<!-- 나를 팔로우중인 -->
														<div class="panel panel-default">
															<div class="panel-heading">
																<h4><i class="glyphicon glyphicon-eye-open"></i>&nbsp 나를 팔로우중인 친구</h4>
															</div>
															<div class="search-result row" style="margin-top: 20px;">
															<c:forEach var="followMe" items="${followMe}">
															<div class="col-md-6">
																<div class="col-xs-6 col-sm-6 col-md-3">
																<a href="#" title="Lorem ipsum" class="thumbnail"><img src="/resources/img/${followMe.u_image}" width="90px" height="30px" alt="Lorem ipsum" /></a>
																</div>
																<div class="col-xs-6 col-sm-6 col-md-3">${followMe.u_name}</div>
																<div class="col-xs-6 col-sm-6 col-md-3">
																<a href="friendPage?f_o_id=${followMe.u_id}&u_id=${users.u_id}">
																<button class="btn-primary">친구페이지로</button>
																</a>
																</div>
															</div>
															</c:forEach>				
															</div>
													</div>		
													<!-- 가입중인 스터디 목록  298px-->
													<div class="panel panel-default">
															<div class="panel-heading">
																<h4><i class="glyphicon glyphicon-pencil"></i>&nbsp 활동중인 스터디</h4>
															</div>
															<div class="search-result row" id="ingStudy" style="margin-top: 20px;">
																<c:if test="${studyList != null }">
																	<c:forEach var="studyList" items="${studyList}">
																	   <div class="col-md-6">
																			<div class="col-xs-6 col-sm-6 col-md-3">
																			<a href="/StudyDetail/studydetail?s_id=${studyList.s_id}"  title="Lorem ipsum" class="thumbnail"><img src="/resources/img/default.jpg" alt="Lorem ipsum" /></a>
																			</div>
																			<div class="col-xs-6 col-sm-6 col-md-3">${studyList.s_name}</div>
																			<div class="col-xs-6 col-sm-6 col-md-3">${studyList.s_last_login}</div>
																		</div>
																	</c:forEach>
																	</c:if>
																	<c:if test="${studyList == '[]' }">
																		가입 된 스터디가 없습니다.
																	</c:if>
															</div>
													</div>								
												</div>
												<!-- 세번째 메뉴  -->
									<div role="tabpanel" class="tab-pane" id="messages">
										<div class="row" style="background-color: #fff;">
									        <input type="hidden" name="u_id" value="${users.u_id}">
									        <div class="col-md-6 text-center" style="margin-top: 40px;">
									       <!-- 배경이미지 변경 -->
									        <form id="fileBack" method="post" action="/users/usersBg" enctype="multipart/form-data">
									        	<h3>현재 배경</h3>
									        	<div class="col-md-12 text-center" >
									        		<img src="/resources/img/${users.u_bgimg}" width="50%;" height="50%;">
													<input type="file" name="fileBack" style="display: inline-block;">
													<input type="hidden" name="u_id" value="${users.u_id}">
									        	</div><br>
									        	<button class="btn-primary" type="submit">배경 변경</button>
									        </form>
									        <!-- 프로필사진변경 -->
									         <form id="fileProfile" method="post" action="/users/usersProfile" enctype="multipart/form-data">	
									        	<h3>현재 프로필</h3>
												<div class="col-md-12">
									        		<img src="/resources/img/${users.u_image}" width="50%;" height="50%;">
													<input type="file" name="fileProfile" style="display: inline-block;">
													<input type="hidden" name="u_id" value="${users.u_id}">
									        	</div>
									        		<button class="btn-primary" type="submit">프로필변경</button>
									        </form>									        
									  		</div>
									  		<!-- 수정 -->
									        <form class="form-horizontal" id ="modifyForm" method="post">
									        <input type="hidden" name="u_id" value="${users.u_id}">
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
									           <!-- 주소 -->
											<div class="form-group">
									          <label class="col-sm-3 control-label">주소</label>
									        <div class="col-sm-6">
									       	  <input type="text" class="form-control" name="u_address" placeholder="${users.u_address}" value="${users.u_address}">
											 </div>
									        </div>
									          <!-- 주소공개 여부 -->
									        <div class="form-group">
									            <label class="col-sm-3 control-label" for="inputName">주소공개 여부</label>
									          <div class="col-sm-6">
									         	<label class="radio-inline">
												  <input type="radio" name="u_address_check" id="u_address_check" value="T" checked="checked"> 공개
												</label>
												<label class="radio-inline">
												  <input type="radio" name="u_address_check" id="u_address_check" value="F" > 비공개
												</label>	
									          </div>
									        </div>
									        <!-- 생년월일 -->
									        <div class="form-group">
									        	<label class="col-sm-3 control-label">생년월일</label>
									       	 <div class="col-sm-6">
												 <h4 class="title"> ${users.u_birth}</h4>
											 </div>
									        </div>
									        <div class="form-group">
									            <label class="col-sm-3 control-label" for="inputName">생년월일 공개여부</label>
									          <div class="col-sm-6">
									         	<label class="radio-inline">
												  <input type="radio" name="u_birth_check" id="u_birth_check" value="T" checked="checked"> 공개
												</label>
												<label class="radio-inline">
												  <input type="radio" name="u_birth_check" id="u_birth_check" value="F" > 비공개
												</label>	
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
													<small style="margin-left: 18%; color:#fd0606;">*필수체크요소입니다</small>
									          </div>
									        </div>
									        <!-- 멘토폼 -->
									         <div class="form-group" id="mentoForm">
									            <label class="col-sm-3 control-label">멘토분야</label>
									          <div class="col-sm-6">
									          	  <c:choose>
									          	  <c:when test="${mento != null }">
									          	  <input type="text" class="form-control" name="m_major" placeholder="현재진행중인 멘토링 : ${mento.m_major}">
									          	  </c:when>
									          	  <c:otherwise>
									          	  <input type="text" class="form-control" name="m_major" placeholder="멘토링 분야를 쓰세요">
									          	  </c:otherwise>
									          	  </c:choose>
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
            <form class="form-horizontal" id="inputForm" method="post">
            <fieldset>
            <div class="control-group">
              <label class="control-label" for="u_balance">입금액:</label>
              <div class="controls">
                <input id="u_balance" name="u_balance" type="text" class="form-control" placeholder="입금액을 적어주세요" class="input-medium" required>
                 <input type="hidden" name="u_id" value="${users.u_id}">
              </div>
            </div>

            <!-- 입금버튼 -->
            <div class="control-group">
              <label class="control-label" for="signin"></label>
              <div class="controls">
                <button type="submit" id="signin" name="signin" class="btn btn-success" style="width: 40%; height: 50%;"  required>입금하기</button>
              </div>
            </div>
            </fieldset>
            </form>
            
            <!-- 출금폼 -->
               <form class="form-horizontal" id="outputForm" method="post">
            <fieldset>
            <div class="control-group">
              <label class="control-label" for="u_balance">출금액:</label>
              <div class="controls">
                <input id="u_balance" name="u_balance" type="text" class="form-control" placeholder="입금액을 적어주세요" class="input-medium" required>
                 <input type="hidden" name="u_id" value="${users.u_id}">
              </div>
            </div>

            <!-- 출금버튼 -->
            <div class="control-group">
              <label class="control-label" for="signin"></label>
              <div class="controls">
                <button type="submit" id="signin" name="signin" class="btn btn-success" style="width: 40%; height: 50%;"  required>출금하기</button>
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
<link href="/resources/css/mypage/mypage.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/mypage/mypage.js"></script>
</body>
</html>
</html>