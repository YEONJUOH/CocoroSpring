<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- js -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="/resources/js/createStudy/sweetalert.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/carousel.js"></script>
<!-- css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="/resources/css/createStudy/createStudy2.css"
	rel="stylesheet" type="text/css" />
<link href="/resources/css/createStudy/style.css" rel="stylesheet"
	type="text/css" />
<link href="/resources/css/createStudy/sweetalert.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript">
	$(document).ready(function() {
		var offline_value = $('#s_online-1').val();
		$('#s_abil_check-0').click(function() {
			$('#s_abil').removeAttr('disabled');
		});
		$('#s_abil_check-1').click(function() {
			$('#s_abil').attr('disabled', 'true');
		});
		/* $('#s_confirm').click(function () {
		if(offline_value=="F")
			{
				$('#s_showAddress').attr('required','true');
			}
		else if(offline_value=="T")
			{
				$('#s_showAddress').attr('required','true');
			}
		System.out.println(offline_value);
		});  오프라인 컨트롤 */
	});
</script>
<script type="text/javascript">
	(function($) {
		$(function() {
			var dtNow = new Date();
			$("#from").datepicker(
					{
						dateFormat : 'yy-mm-dd', // 데이터는 yyyy-MM-dd로 나옴  
						closeText : '닫기',
						prevText : '이전달',
						nextText : '다음달',
						currentText : '오늘',
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
						weekHeader : 'Wk',
						firstDay : 0,
						isRTL : false,
						duration : 200,
						showAnim : 'show',
						defaultDate : dtNow,
						changeMonth : true,
						minDate : dtNow,
						numberOfMonths : 3,
						onClose : function(selectedDate) {
							$("#to").datepicker("option", "minDate",
									selectedDate);
						}
					});
			$("#to").datepicker(
					{
						dateFormat : 'yy-mm-dd', // 데이터는 yyyy-MM-dd로 나옴  
						closeText : '닫기',
						prevText : '이전달',
						nextText : '다음달',
						currentText : '오늘',
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ],
						dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
						dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
						defaultDate : dtNow,
						changeMonth : true,
						numberOfMonths : 3,
						onClose : function(selectedDate) {
							$("#from").datepicker("option", "maxDate",
									selectedDate);
						}
					});
		});
	})(jQuery);
</script>
</head>
<body>
	<!-- 스터디 만들기  -->
	<div class="panel-body panel-light">
		<div></div>
		<div class="row space-2 space-top-2">
			<div class="col-sm-10 col-center text-center">
				<h2 class="space-2" id="title">스터디 만들기</h2>
				<p class="text-lead" id="subtitle">Cocoro에 스터디를 만들고 온라인 스터디를
					시작하세요.</p>
			</div>
		</div>
		<div></div>
	</div>


	<!-- 오프라인스터디 위치 설정  -->
	<div class="panel-body panel-medium" id="container">
		<div class="contents" id="contents">
			<div class="form-groups">
				<label class="col-xs-2 control-label" id="label_location"
					for="s_location">오프라인 모임 장소</label>
				<div class="col-xs-2" id="s_add">
					<input id="s_showAddress" name="s_showAddress" type="text"
						placeholder="" class="form-control input-sm">
				</div>
				<button type="button" id="s_location" name="s_location"
					class="btn btn-primary" data-toggle="modal" data-target=".mapModal">위치검색</button>
			</div>
			<!-- 여기부터 모달 -->
			<div class="modal fade mapModal" tabindex="-1" role="dialog"
				aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<!-- 여기부터 맵 api -->
						<div class="map_wrap">
							<div id="map"
								style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
							<p>
								<em>지도를 클릭해주세요!</em>
							</p>
							<div id="clickLatlng"></div>
							<div id="menu_wrap" class="bg_white">
								<div class="option">
									<p>
									<form onsubmit="searchPlaces(); return false;">
										키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15">
										<button type="submit">검색하기</button>
									</form>
									</p>
								</div>
								<hr>
								<ul id="placesList"></ul>
								<div id="pagination"></div>
							</div>
						</div>

						<script type="text/javascript"
							src="//apis.daum.net/maps/maps3.js?apikey=3cd0e2fbd6251c82935cf18a47f510a6&libraries=services"></script>
						<script>
							// 마커를 담을 배열입니다
							var markers = [];

							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center : new daum.maps.LatLng(37.566826,
										126.9786567), // 지도의 중심좌표
								level : 3
							// 지도의 확대 레벨
							};

							// 지도를 생성합니다    
							var map = new daum.maps.Map(mapContainer, mapOption);

							// 장소 검색 객체를 생성합니다
							var ps = new daum.maps.services.Places();

							// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
							var infowindow = new daum.maps.InfoWindow({
								zIndex : 1
							});

							// 키워드로 장소를 검색합니다
							searchPlaces();

							// 키워드 검색을 요청하는 함수입니다
							function searchPlaces() {

								var keyword = document
										.getElementById('keyword').value;

								if (!keyword.replace(/^\s+|\s+$/g, '')) {
									alert('키워드를 입력해주세요!');
									return false;
								}

								// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
								ps.keywordSearch(keyword, placesSearchCB);
							}

							// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
							function placesSearchCB(status, data, pagination) {
								if (status === daum.maps.services.Status.OK) {

									// 정상적으로 검색이 완료됐으면
									// 검색 목록과 마커를 표출합니다
									displayPlaces(data.places);

								} else if (status === daum.maps.services.Status.ZERO_RESULT) {

									alert('검색 결과가 존재하지 않습니다.');
									return;

								} else if (status === daum.maps.services.Status.ERROR) {

									alert('검색 결과 중 오류가 발생했습니다.');
									return;

								}
							}

							// 검색 결과 목록과 마커를 표출하는 함수입니다
							function displayPlaces(places) {

								var listEl = document
										.getElementById('placesList'), menuEl = document
										.getElementById('menu_wrap'), fragment = document
										.createDocumentFragment(), bounds = new daum.maps.LatLngBounds(), listStr = '';

								// 검색 결과 목록에 추가된 항목들을 제거합니다
								removeAllChildNods(listEl);

								// 지도에 표시되고 있는 마커를 제거합니다
								removeMarker();

								for (var i = 0; i < places.length; i++) {

									// 마커를 생성하고 지도에 표시합니다
									var placePosition = new daum.maps.LatLng(
											places[i].latitude,
											places[i].longitude), marker = addMarker(
											placePosition, i), itemEl = getListItem(
											i, places[i], marker); // 검색 결과 항목 Element를 생성합니다

									// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
									// LatLngBounds 객체에 좌표를 추가합니다
									bounds.extend(placePosition);

									// 마커와 검색결과 항목에 mouseover 했을때
									// 해당 장소에 인포윈도우에 장소명을 표시합니다
									// mouseout 했을 때는 인포윈도우를 닫습니다
									(function(marker, title) {
										daum.maps.event.addListener(marker,
												'mouseover', function() {
													displayInfowindow(marker,
															title);
												});

										daum.maps.event.addListener(marker,
												'mouseout', function() {
													infowindow.close();
												});

										itemEl.onmouseover = function() {
											displayInfowindow(marker, title);
										};

										itemEl.onmouseout = function() {
											infowindow.close();
										};
									})(marker, places[i].title);

									fragment.appendChild(itemEl);
								}

								// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
								listEl.appendChild(fragment);
								menuEl.scrollTop = 0;

								// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
								map.setBounds(bounds);
							}

							// 검색결과 항목을 Element로 반환하는 함수입니다
							function getListItem(index, places) {

								var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
										+ (index + 1)
										+ '"></span>'
										+ '<div class="info">'
										+ '   <h5>'
										+ places.title + '</h5>';

								if (places.newAddress) {
									itemStr += '    <span>' + places.newAddress
											+ '</span>'
											+ '   <span class="jibun gray">'
											+ places.address + '</span>';
								} else {
									itemStr += '    <span>' + places.address
											+ '</span>';
								}

								itemStr += '  <span class="tel">'
										+ places.phone + '</span>' + '</div>';

								el.innerHTML = itemStr;
								el.className = 'item';

								return el;
							}

							// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
							function addMarker(position, idx, title) {
								var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
								imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
								imgOptions = {
									spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
									spriteOrigin : new daum.maps.Point(0,
											(idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
									offset : new daum.maps.Point(13, 37)
								// 마커 좌표에 일치시킬 이미지 내에서의 좌표
								}, markerImage = new daum.maps.MarkerImage(
										imageSrc, imageSize, imgOptions), marker = new daum.maps.Marker(
										{
											position : position, // 마커의 위치
											image : markerImage
										});

								marker.setMap(map); // 지도 위에 마커를 표출합니다
								markers.push(marker); // 배열에 생성된 마커를 추가합니다

								return marker;
							}

							// 지도 위에 표시되고 있는 마커를 모두 제거합니다
							function removeMarker() {
								for (var i = 0; i < markers.length; i++) {
									markers[i].setMap(null);
								}
								markers = [];
							}

							// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
							// 인포윈도우에 장소명을 표시합니다
							function displayInfowindow(marker, title) {
								var content = '<div style="padding:5px;z-index:1;">'
										+ title + '</div>';

								infowindow.setContent(content);
								infowindow.open(map, marker);
							}

							// 검색결과 목록의 자식 Element를 제거하는 함수입니다
							function removeAllChildNods(el) {
								while (el.hasChildNodes()) {
									el.removeChild(el.lastChild);
								}
							}

							//지도를 클릭한 위치에 표출할 마커입니다
							var marker1 = new daum.maps.Marker({
								// 지도 중심좌표에 마커를 생성합니다 
								position : map.getCenter()
							});

							//지도에 마커를 표시합니다
							marker1.setMap(map);

							//주소-좌표 변환 객체를 생성합니다
							var geocoder = new daum.maps.services.Geocoder();

							// 지도에 클릭 이벤트를 등록합니다
							// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
							daum.maps.event
									.addListener(
											map,
											'click',
											function(mouseEvent) {

												// 클릭한 위도, 경도 정보를 가져옵니다 
												var latlng = mouseEvent.latLng;

												// 마커 위치를 클릭한 위치로 옮깁니다
												marker1.setPosition(latlng);

												var message = '클릭한 위치의 위도는 '
														+ latlng.getLat()
														+ ' 이고, ';
												message += '경도는 '
														+ latlng.getLng()
														+ ' 입니다';

												var location_x = latlng
														.getLat();
												var location_y = latlng
														.getLng();

												var resultDiv = document
														.getElementById('clickLatlng');
												resultDiv.innerHTML = message;

												searchDetailAddrFromCoords(
														mouseEvent.latLng,
														function(status, result) {
															if (status === daum.maps.services.Status.OK) {
																var detailAddr = !!result[0].roadAddress.name ? '<div>도로명주소 : '
																		+ result[0].roadAddress.name
																		+ '</div>'
																		: '';
																detailAddr += '<div>지번 주소 : '
																		+ result[0].jibunAddress.name
																		+ '</div>';

																var content = '<div class="bAddr">'
																		+ '<span class="title">법정동 주소정보</span>'
																		+ detailAddr
																		+ '</div>';
																var address = result[0].jibunAddress.name;

																// 얼럿창 띄우기
																swal(
																		{
																			title : "현재 위치로 결정 하시겠습니까?",
																			text : "",
																			type : "info",
																			showCancelButton : true,
																			closeOnConfirm : false,
																			showLoaderOnConfirm : true,
																		},
																		function() {
																			setTimeout(
																					function() {
																						showAddress(address); // input태그에  주소 표시
																						setLocation_x(location_x); // input hidden의 location_x value값에 위도 저장			
																						setLocation_y(location_y); // input hidden의 location_y value값에 경도 저장 
																						setAddress(address); // input hidden의 address value값에 address저장 */
																						swal("모임 위치가 저장되었습니다.");
																						$(
																								'.mapModal')
																								.hide();
																					},
																					1000);
																		});
															}
														});
											});

							function showAddress(address) {
								$('#s_showAddress')
										.attr('placeholder', address);
							}
							function setAddress(address) {
								$('#s_address').attr('value', address);
							}

							function setLocation_x(location_x) {
								$('#s_location_x').attr('value', location_x);
							}

							function setLocation_y(location_y) {
								$('#s_location_y').attr('value', location_y);
							}

							function searchDetailAddrFromCoords(coords,
									callback) {
								// 좌표로 법정동 상세 주소 정보를 요청합니다
								geocoder.coord2detailaddr(coords, callback);
							}
						</script>

					</div>
				</div>
			</div>

			<form class="form-horizontal" action="createOk.jsp" method="post">
				<fieldset>

					<!-- 스터디 기간 -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="s_start">스터디 기간</label>
						<div class="col-md-4" style="padding-top: 5px; left: 1px;">
							<label for="from"></label> <input type="text" id="from"
								name="s_start"> <label for="to">~</label> <input
								type="text" id="to" name="s_end">
						</div>
					</div>

					<br>

					<!-- 스터디 장소  -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="s_online">스터디
							장소</label>
						<div class="col-md-4" required="">
							<div class="radio">
								<label for="s_online-0">
								 <input type="radio" name="online" id="s_online-1" value="T" checked="checked">
									온라인
								</label>
							</div>
							<div class="radio">
								<label for="s_online-1"> 
								<input type="radio" name="online" id="s_online-1" value="F"> 오프라인
								</label>
							</div>
							<div class="radio">
								<label for="s_online-1"> 
								<input type="radio" name="online" id="s_online-1" value="B"> 온라인과
									오프라인 병행
								</label>
							</div>
						</div>
					</div>
					<br>



					<!-- 출석체크 기능 -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="s_attend_check">출석체크
							기능</label>
						<div class="col-md-4">
							<label class="radio-inline" for="s_attend_check-0"> <input
								type="radio" name="s_attend_check" id="s_attend_check-0"
								value="T" checked="checked"> 사용함
							</label> <label class="radio-inline" for="s_attend_check-1"> <input
								type="radio" name="s_attend_check" id="s_attend_check-1"
								value="F"> 사용안함
							</label>
						</div>
					</div>

					<br>

					<!-- 실력 조건 설정 -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="s_abil_check">실력조건
							설정</label>
						<div class="col-md-2">
							<label class="radio-inline" for="s_abil_check-0"> 
								<input type="radio" name="s_abil_check" id="s_abil_check-0" value="-1" checked="checked"> 
								사용함
							</label> 
							<label class="radio-inline" for="s_abil_check-1"> 
								<input type="radio" name="s_abil_check" id="s_abil_check-1" value="0">
								사용안함
							</label>
						</div>
						<div class="col-md-1" style="left: -40px;">
							<select class="form-control" id="s_abil" name="s_abil"
								required="">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
							</select>
						</div>
					</div>
					<br>
					<br>


					<!-- 인풋 히든 보내기 -->
					<input type="hidden" id="s_address" name="s_address" value=null>
					<input type="hidden" id="s_location_x" name="s_location_x" value=0>
					<input type="hidden" id="s_location_y" name="s_location_y" value=0>
					
					
					
					<!-- 확인 or 취소 -->
					<div class="form-group" id="confirm">
						<label class="col-md-4 control-label" for="s_confirm"></label>
						<div class="col-md-8">
							<input type="submit" id="s_confirm" name="s_confirm"
								class="btn btn-success" value="확인">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset"
								id="s_cancel" name="s_cancel" class="btn btn-danger" value="취소">
						</div>
					</div>

				</fieldset>

			</form>
		</div>
</body>
</html>