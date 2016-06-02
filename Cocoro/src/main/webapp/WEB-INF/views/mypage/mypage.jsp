<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Faceboot - A Facebook style template for Bootstrap</title>
<meta name="generator" content="Bootply" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="/resources/css/mypage/mypage.css" rel="stylesheet">
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
										<img align="left"class="fb-image-profile thumbnail" src="/resources/img/${users.u_image}" alt="Profile image example" />
									<div class="fb-profile-text">
										<h1>${users.u_name}</h1>
										<div role="tabpanel">
											<!--탭 메뉴 -->
											<ul class="nav nav-tabs" role="tablist" style="margin-left: 70%;">
												<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
												<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
												<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Messages</a></li>
												<li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Settings</a></li>
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

														<div class="panel panel-default">
															<div class="panel-heading">
																<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" class="pull-right ">더보기</a>
																<h4>팔로우중인 친구</h4>
															</div>
															<div class="panel-body">
																<div class="list-group">
																	<img src="img.png" alt="..." class="img-rounded"
																		width="90px"> <img src="img.png" alt="..."
																		class="img-rounded" width="90px"> <img
																		src="img.png" alt="..." class="img-rounded"
																		width="90px"> <img src="img.png" alt="..."
																		class="img-rounded" width="90px">
																</div>
															</div>
														</div>


												<!--일단 쪽지함 -->
														<div class="panel panel-default">
															<div class="panel-heading">
																<a href="#" class="pull-right">View all</a>
																<h4>쪽지함</h4>
															</div>
															<div class="panel-body">
																<div class="clearfix"></div>
																There a load of new free Bootstrap 3 ready templates at
																Bootply. All of these templates are free and don't
																require extensive customization to the Bootstrap
																baseline.
															</div>
														</div>
													</div>

													<!-- 오른쪽 메뉴 부분  -->
													<div class="col-sm-7" style="overflow: hidden;">
														<div class="well">
															<form class="form">
																<div class="input-group text-center">
																	<input type="text" class="form-control input-lg"
																		placeholder="무슨생각을 가지고계세요?"> <span
																		class="input-group-btn"><button
																			class="btn btn-lg btn-primary" type="button">쓰기</button></span>
																</div>
															</form>
														</div>


														<!-- 후기 남기는부분 -->
														<div class="panel panel-default">
															<div class="panel-body">
																<img src="img.png" class="img-rounded" width="20px">
																짱구님이 글을 남겼습니다.
																<div class="clearfix"></div>
																<hr>
																<img src="img.png" alt="..." class="img-rounded"
																	width="487px" height="380px;">

																<p>
																	If you're looking for help with Bootstrap code, the
																	<code>twitter-bootstrap</code>
																	tag at <a
																		href="http://stackoverflow.com/questions/tagged/twitter-bootstrap">Stackoverflow</a>
																	is a good place to find answers.
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
																<a href="#" title="Lorem ipsum" class="thumbnail"><img src="img2.jpg" alt="Lorem ipsum" /></a>
																</div>
														<article class="search-result row">
															<div class="col-xs-12 col-sm-12 col-md-2"
																style="margin-top: 20px;">
																<ul class="meta-search">
																	<li><i class="glyphicon glyphicon-calendar"></i>
																		생년월일 : <span>02/15/2014</span></li>
																	<li><i class="glyphicon glyphicon-time"></i> 주소 :
																		<span> 안양 </span></li>
																	<li><i class="glyphicon glyphicon-tags"></i> 관심사 :
																		<span>#수영#토익</span></li>
																</ul>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
																<h3>자기소개</h3>
																<p>안녕하세요 저는 짱구입니다.</p>
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
													<div class="col-md-6">
																<div class="col-xs-6 col-sm-6 col-md-3">
																<a href="#" title="Lorem ipsum" class="thumbnail"><img src="img2.jpg" alt="Lorem ipsum" /></a>
																</div>
																<div class="col-xs-6 col-sm-6 col-md-3">주디</div>
																<div class="col-xs-6 col-sm-6 col-md-3">팔로우끊기</div>
															</div>
															<div class="col-md-6">
																<div class="col-xs-6 col-sm-6 col-md-3">
																<a href="#" title="Lorem ipsum" class="thumbnail"><img src="img2.jpg" alt="Lorem ipsum" /></a>
																</div>
																<div class="col-xs-6 col-sm-6 col-md-3">주디</div>
																<div class="col-xs-6 col-sm-6 col-md-3">팔로우끊기</div>
															</div>
															<div class="col-md-6">
																<div class="col-xs-6 col-sm-6 col-md-3">
																<a href="#" title="Lorem ipsum" class="thumbnail"><img src="img2.jpg" alt="Lorem ipsum" /></a>
																</div>
																<div class="col-xs-6 col-sm-6 col-md-3">주디</div>
																<div class="col-xs-6 col-sm-6 col-md-3">팔로우끊기</div>
															</div>
															<div class="col-md-6">
																<div class="col-xs-6 col-sm-6 col-md-3">
																<a href="#" title="Lorem ipsum" class="thumbnail"><img src="img2.jpg" alt="Lorem ipsum" /></a>
																</div>
																<div class="col-xs-6 col-sm-6 col-md-3">주디</div>
																<div class="col-xs-6 col-sm-6 col-md-3">팔로우끊기</div>
															</div>
																<div class="col-md-12">
																<h5 class="text-center">모두보기</h5>
															</div>
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
</body>
</html>
</html>