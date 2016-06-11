<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link href="/resources/css/createStudy/previewStudy.css"
	rel="stylesheet" type="text/css" />
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css"
	rel="stylesheet">
<!-- js -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/carousel.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {

				var chartLabels = [];
				var chartData = [];

				$.ajax({
					url : "rankAjax?s_id=${studygroup.s_id}",
					type : "POST",
					dataType : "json",
					success : function(data) {
						$.each(data, function(inx, obj) {
							chartLabels.push(data[inx].u_name);
							chartData.push(data[inx].a_rank);

						});
						createChart();
					},
					error : function() {
						alert("error");
					}

				});
			function createChart(){
				var ctx = document.getElementById("myChart");
				var myChart = new Chart(ctx, {
					type : 'bar',
					data : {
						labels : chartLabels,
						datasets : [ {
							label : '스터디멤버 실력정보',
							data : chartData,
							backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)' ],
							borderColor : [ 'rgba(255,99,132,1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)' ],
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true
								}
							} ]
						}
					}
				});
			}
			});
</script>
</head>
<body>
	<div class="container">
		<div class="fb-profile">
			<img align="left" class="fb-image-lg"
				src="http://tafebytes.com.au/wp-content/uploads/2012/11/study-group.jpg"
				alt="Profile image example" /> <img align="left"
				class="fb-image-profile thumbnail"
				src="/resources/img/${leaderInfo.u_image}"
				alt="Profile image example" style="width: 180px; height: 170px;"/>
			<div class="fb-profile-text">
				<h3>스터디 리더 : ${leaderInfo.u_name}</h3>
				<p>${leaderInfo.u_email}</p>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="well profile col-lg-12">
					<div class="col-sm-12">

						<div class="col-xs-6 col-sm-6" id="first">
							<h2>${studygroup.s_name}</h2>
							<p>
								<strong>스터디 소개: </strong> ${studygroup.s_intro}
							</p>
							<p>
								<strong>스터디 키워드: </strong> ${studygroup.s_tag}
							</p>
							<p>
								<strong>모집 인원 </strong> <span class="fa fa-user">:</span>
								${studygroup.s_max_member}
							</p>
							<p>
								<strong>실력: </strong>
								<c:if test="${studygroup.s_abil_check > 0}">
									<c:forEach var="k" begin="1" end="${studygroup.s_abil_check}">
										<span class="fa fa-star"></span>
									</c:forEach>


									<button type="button" class="btn btn-primary"
										data-toggle="modal" data-target=".bs-example-modal-sm">
										<i class="fa fa-search"></i>
									</button>
									<div class="modal fade bs-example-modal-sm" tabindex="-1"
										role="dialog" aria-labelledby="mySmallModalLabel"
										aria-hidden="true">
										<div class="modal-dialog modal-sm">
											<div class="modal-content">
												<canvas id="myChart" width="400" height="400"></canvas>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${studygroup.s_abil_check < 1}">
									<span>실력 정보 없음</span>
								</c:if>
							</p>
							<p>
								<strong>디파짓:</strong>
								<c:if test="${studygroup.s_deposit!=-1}">
									<label>${studygroup.s_deposit}원</label>
								</c:if>
								<c:if test="${studygroup.s_deposit==-1}">
									<label>&nbsp;사용안함</label>
								</c:if>
							</p>
							<p>
								<strong>출석체크: </strong>
								<c:if test="${studygroup.s_attend_check=='T'}">
									<input type="checkbox" name="s_attend_check"
										id="s_attend_check-0" value="T" checked="" disabled="">사용함
                    	<input type="checkbox" name="s_attend_check"
										id="s_attend_check-1" value="F" disabled="">사용안함
    				</c:if>
								<c:if test="${studygroup.s_attend_check=='F'}">
									<input type="checkbox" name="s_attend_check"
										id="s_attend_check-0" value="T" disabled="">사용함
    					<input type="checkbox" name="s_attend_check"
										id="s_attend_check-1" value="F" checked="" disabled="">사용안함
    				</c:if>
							</p>
							<p>
								<strong>스터디 장소: </strong>
								<c:if test="${studygroup.s_online=='T'}">
									<input type="checkbox" name="s_online" id="s_online-0"
										value="T" checked="" disabled="">온라인
    				</c:if>
								<c:if test="${studygroup.s_offline=='T'}">
									<input type="checkbox" name="s_offline" id="s_online-1"
										value="T" checked="" disabled="">오프라인
                    </c:if>
							</p>
							<p>
								<strong>스터디 성격: </strong>
								<c:if test="${studygroup.s_mento_check=='T'}">
									<input type="checkbox" name="s_mento_check"
										id="s_mento_check-0" value="T" checked="" disabled="">튜터링
                    	<input type="checkbox" name="s_mento_check"
										id="s_mento_check-1" value="S" disabled="">스터디
    				</c:if>
								<c:if test="${studygroup.s_mento_check=='S'}">
									<input type="checkbox" name="s_mento_check"
										id="s_mento_check-0" value="T" disabled="">튜터링
    					<input type="checkbox" name="s_mento_check"
										id="s_mento_check-1" value="S" checked="" disabled="">스터디
                    </c:if>
							</p>
							<p>
								<strong>스터디 종류: </strong>
								<c:if test="${studygroup.s_kind_check=='T'}">
									<input type="checkbox" name="s_kind_check" id="s_kind_check-0"
										value="T" checked="" disabled="">개방형
    					<input type="checkbox" name="s_kind_check" id="s_kind_check-1"
										value="F" disabled="">폐쇄형
    				</c:if>
								<c:if test="${studygroup.s_kind_check=='F'}">
									<input type="checkbox" name="s_kind_check" id="s_kind_check-0"
										value="T" disabled="">개방형
    					<input type="checkbox" name="s_kind_check" id="s_kind_check-1"
										value="F" checked="" disabled="">폐쇄형
    				</c:if>
							</p>
						</div>


						<div class="col-xs-6 col-sm-6" id="second">

							<p style="margin-top: 40px"></p>
							<p>
								<strong>오프라인 모임 위치: </strong>
								<c:if test="${studygroup.s_address!='null'}">
									<label>${studygroup.s_address}</label>
								</c:if>
								<c:if test="${studygroup.s_address=='null'}">
									<label>오프라인 모임 없음</label>
								</c:if>


								<!-- 인풋히든 -->
								<input type="hidden" id="s_location_x" name="s_location_x"
									value="${studygroup.s_location_x}"> <input
									type="hidden" id="s_location_y" name="s_location_y"
									value="${studygroup.s_location_y}">


								<!-- 맵 API -->
							<p style="margin-top: 4px"></p>

							<div id="map" style="width: 100%; height: 200px;"></div>

							<p id="infoDiv"></p>
							<script type="text/javascript"
								src="//apis.daum.net/maps/maps3.js?apikey=3cd0e2fbd6251c82935cf18a47f510a6&libraries=services"></script>
							<script>
								var s_location_x = $('#s_location_x').val();
								var s_location_y = $('#s_location_y').val();
								var mapContainer = document
										.getElementById('map'), // 지도를 표시할 div 
								mapOption = {
									center : new daum.maps.LatLng(s_location_x,
											s_location_y), // 지도의 중심좌표
									level : 3
								// 지도의 확대 레벨
								};

								var map = new daum.maps.Map(mapContainer,
										mapOption); // 지도를 생성합니다

								// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
								var mapTypeControl = new daum.maps.MapTypeControl();

								// 지도 타입 컨트롤을 지도에 표시합니다
								map.addControl(mapTypeControl,
										daum.maps.ControlPosition.TOPRIGHT);

								var infoDiv = document
										.getElementById('infoDiv');
							</script>

						</div>


						<c:set var="start_year"
							value="${fn:substring(studygroup.s_start,0, 4)}"></c:set>
						<c:set var="start_month"
							value="${fn:substring(studygroup.s_start,5, 7)}"></c:set>
						<c:set var="start_day"
							value="${fn:substring(studygroup.s_start,8, 10)}"></c:set>
						<c:set var="end_year"
							value="${fn:substring(studygroup.s_end,0, 4)}"></c:set>
						<c:set var="end_month"
							value="${fn:substring(studygroup.s_end,5, 7)}"></c:set>
						<c:set var="end_day"
							value="${fn:substring(studygroup.s_end,8, 10)}"></c:set>
						<p style="margin-top: 20px"></p>
						<p>
							<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;스터디 기간: </strong> <label>${start_year}년&nbsp;${start_month}월&nbsp;${start_day}일</label>
							<label>~</label> <label>${end_year}년&nbsp;${end_month}월&nbsp;${end_day}일</label>
						</p>


						<p>
							<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;스터디 시간: </strong>
							<c:if test="${studygroup.s_t_start<750}">
								<label>오전&nbsp;${start_hour}시 </label>
							</c:if>
							<c:if test="${studygroup.s_t_start>750}">
								<label>오후&nbsp;${start_hour-12}시 </label>
							</c:if>
							<c:if test="${studygroup.s_t_start%60!=0}">
								<label>&nbsp;${start_min}분 </label>
							</c:if>
							<label>~</label>
							<c:if test="${studygroup.s_t_end<750}">
								<label>오전&nbsp;${end_hour}시 </label>
							</c:if>
							<c:if test="${studygroup.s_t_end>750}">
								<label>오후&nbsp;${end_hour-12}시 </label>
							</c:if>
							<c:if test="${studygroup.s_t_end%60!=0}">
								<label>${end_min}분</label>
							</c:if>

						</p>





					</div>
					<div class="col-xs-12 text-center">
						<div class="col-xs-12 col-sm-4 emphasis">
							<c:if test="${studygroup.s_kind_check =='F'}">
								<c:if test="${studygroup.s_abil_check > 0}">
									<button type="button" class="btn btn-success btn-block"
										data-toggle="modal" data-target=".rank_for_apply">
										<span class="fa fa-plus-circle"></span> 가입신청
									</button>

									<div class="modal fade rank_for_apply" tabindex="-1"
										role="dialog" aria-labelledby="mySmallModalLabel"
										aria-hidden="true">
										<div class="modal-dialog modal-sm">
											<div class="modal-content">
												<strong><label>해당 스터디와 관련된 당신의 스킬레벨을 입력해주세요</label></strong>
												<select class="form-control" id="rank_for_apply_check"
													name="rank_for_apply_check" value="" required="">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
												</select>
												<button class="btn btn-success btn-block" id="rank_confirm">
													확인</button>


											</div>
										</div>
									</div>
								</c:if>
							</c:if>
							<!-- 스터디 종류가 폐쇄형이면 가입신청, 개방형이면 입장하기 버튼 -->
							<c:if test="${studygroup.s_kind_check =='F'}">
								<c:if test="${studygroup.s_abil_check < 1}">
									<button type="button" class="btn btn-success btn-block"
										onclick="fn_applyOk(0)">
										<span class="fa fa-plus-circle"></span> 가입신청
									</button>
								</c:if>
							</c:if>
							<c:if test="${studygroup.s_kind_check =='T'}">
								<button class="btn btn-success btn-block" onclick="fn_enter()">
									<span class="fa fa-plus-circle"></span> 입장하기
								</button>
							</c:if>
							<!-- 가입신청 버튼 클릭시 가입신청자가 클릭한 실력정보를 apply 테이블에 입력 -->
							<script type="text/javascript">
								$(document).ready(
										function() {
											var rank = 0;
											$('#rank_for_apply_check').change(
													function() {
														rank = $(this).val();
													});
											$('#rank_confirm').click(
													function() {
														$('.rank_for_apply')
																.hide();

														fn_applyOk(rank);
													});

										});
								function fn_applyOk(rank) {
									alert("가입신청이 완료 되었습니다.");
									location.href = "/study/applyStudy?u_id=${users.u_id}&s_id=${studygroup.s_id}&rank_for_apply="
											+ rank;
								}
								function fn_enter() {
									alert("스터디 세부페이지로 이동합니다.")
									location.href = "/study/enterStudy?u_id=${users.u_id}&s_id=${studygroup.s_id}"
								};
							</script>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>