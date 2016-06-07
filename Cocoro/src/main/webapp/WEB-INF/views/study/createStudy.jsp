<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 3.3.4 -->
<script src="/resources/js/bootstrap.min.js"></script>
<!-- jQuery 2.1.4 -->
<script src="/resources/jQuery/jQuery-2.1.4.min.js"></script>
<!-- carousel -->
<!-- css -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha256-k2/8zcNbxVIh5mnQ52A0r3a6jAgMGxFJFE2707UxGCk= sha512-ZV9KawG2Legkwp3nAlxLIVFudTauWuBpC10uEafMHYL0Sarrz5A7G79kXh5+5+woxQ5HM559XX2UZjMJ36Wplg=="
	crossorigin="anonymous">
<link href="/resources/css/createStudy/createStudy.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- js -->
<script src="/resources/js/createStudy/createStudy.js"></script>
<script src="/resources/js/carousel.js"></script>
</head>
<body>

	<form class="form-horizontal" action="createStudy" method="post">
		<fieldset>

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

			<!-- 스터디 명  -->
			<div class="panel-body panel-medium" id="container">
				<div class="contents" id="contents">
					<div class="form-group">
						<label class="col-md-4 control-label" for="s_name">스터디 명</label>
						<div class="col-md-5">
							<input id="s_name" name="s_name" type="text"
								placeholder="예) 토익 성애자들의 모임" class="form-control input-md"
								required="">
						</div>
					</div>
					<br>

					<!-- 스터디 소개  -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="s_intro">스터디 소개</label>
						<div class="col-md-7">
							<input id="s_intro" name="s_intro" type="text"
								placeholder="예) 토익 만점 목표, 토익 800이상 가입가능"
								class="form-control input-md" required="">
						</div>
					</div>
					<br>


					<!-- 키워드 설정 -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="s_tag">키워드 설정</label>
						<div class="col-md-7">
							<input id="s_tag" name="s_tag" type="text"
								placeholder="예) #토익 #성애자 #TOEIC #토익시험"
								class="form-control input-md" required=""> <span
								class="help-block">이 키워드는 스터디 검색 시 사용됩니다.</span>
						</div>
					</div>


					<!-- 스터디 종류  -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="s_mento_check">스터디
							종류</label>
						<div class="col-md-4">
							<div class="radio">
								<label for="s_mento_check-0"> <input type="radio"
									name="s_mento_check" id="s_mento_check-0" value="S"
									checked="checked"> 스터디
								</label>
							</div>
							<div class="radio">
								<label for="s_mento_check-1"> <input type="radio"
									name="s_mento_check" id="s_mento_check-1" value="T">
									튜터링
								</label>
							</div>
						</div>
					</div>
					<br>

					<!-- 스터디 성격  -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="s_kind_check">스터디
							성격</label>
						<div class="col-md-4">
							<div class="radio">
								<label for="s_kind_check-0"> <input type="radio"
									name="s_kind_check" id="s_kind_check-0" value="T"
									checked="checked"> 개방형
								</label>
							</div>
							<div class="radio">
								<label for="s_kind_check-1"> <input type="radio"
									name="s_kind_check" id="s_kind_check-1" value="F"> 폐쇄형
								</label>
							</div>
						</div>
					</div>
					<br>


					<!-- 모집 인원  -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="s_max_member">모집
							인원</label>
						<div class="col-md-2">
							<input id="s_max_member" name="s_max_member" type="text"
								placeholder="예) 5명" class="form-control input-md" required="">

						</div>
					</div>
					<br>

					<!-- 스터디 시간 설정 -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="s_time_check">스터디
							시간 설정</label>
						<div class="col-md-4">
							<label class="radio-inline" for="s_time_check-0"> <input
								type="radio" name="s_time_check" id="s_time_check-0" value="T"
								checked="checked"> 사용함
							</label> <label class="radio-inline" for="s_time_check-1"> <input
								type="radio" name="s_time_check" id="s_time_check-1" value="F">
								사용안함
							</label>

						</div>
						<div class="col-md-2 padding-zero" style="margin-left: -250px;">
							<select class="form-control" id="t_start" name="t_start">
								<option>00:00am</option>
								<option>00:30am</option>
								<option>01:00am</option>
								<option>01:30am</option>
								<option>02:00am</option>
								<option>02:30am</option>
								<option>03:00am</option>
								<option>03:30am</option>
								<option>04:00am</option>
								<option>04:30am</option>
								<option>05:00am</option>
								<option>05:30am</option>
								<option>06:00am</option>
								<option>06:30am</option>
								<option>07:00am</option>
								<option>07:30am</option>
								<option>08:00am</option>
								<option>08:30am</option>
								<option>09:00am</option>
								<option>09:30am</option>
								<option>10:00am</option>
								<option>10:30am</option>
								<option>11:00am</option>
								<option>11:30am</option>
								<option>12:00pm</option>
								<option>12:30pm</option>
								<option>13:00pm</option>
								<option>13:30pm</option>
								<option>14:00pm</option>
								<option>14:30pm</option>
								<option>15:00pm</option>
								<option>15:30pm</option>
								<option>12:00pm</option>
								<option>12:30pm</option>
								<option>13:00pm</option>
								<option>13:30pm</option>
								<option>14:00pm</option>
								<option>14:30pm</option>
								<option>15:00pm</option>
								<option>15:30pm</option>
								<option>16:00pm</option>
								<option>16:30pm</option>
								<option>17:00pm</option>
								<option>17:30pm</option>
								<option>18:00pm</option>
								<option>18:30pm</option>
								<option>19:00pm</option>
								<option>19:30pm</option>
								<option>20:00pm</option>
								<option>20:30pm</option>
								<option>21:00pm</option>
								<option>21:30pm</option>
								<option>22:00pm</option>
								<option>22:30pm</option>
								<option>23:00pm</option>
								<option>23:30pm</option>
							</select>
						</div>
						<div class="col-md-1">
							<label for="to" id="comeon">~</label>
						</div>
						<div class="col-md-2 padding-zero" style="margin-left: -140px;">
							<select class="form-control" id="t_end" name="t_end">
								<option>00:00am</option>
								<option>00:30am</option>
								<option>01:00am</option>
								<option>01:30am</option>
								<option>02:00am</option>
								<option>02:30am</option>
								<option>03:00am</option>
								<option>03:30am</option>
								<option>04:00am</option>
								<option>04:30am</option>
								<option>05:00am</option>
								<option>05:30am</option>
								<option>06:00am</option>
								<option>06:30am</option>
								<option>07:00am</option>
								<option>07:30am</option>
								<option>08:00am</option>
								<option>08:30am</option>
								<option>09:00am</option>
								<option>09:30am</option>
								<option>10:00am</option>
								<option>10:30am</option>
								<option>11:00am</option>
								<option>11:30am</option>
								<option>12:00pm</option>
								<option>12:30pm</option>
								<option>13:00pm</option>
								<option>13:30pm</option>
								<option>14:00pm</option>
								<option>14:30pm</option>
								<option>15:00pm</option>
								<option>15:30pm</option>
								<option>12:00pm</option>
								<option>12:30pm</option>
								<option>13:00pm</option>
								<option>13:30pm</option>
								<option>14:00pm</option>
								<option>14:30pm</option>
								<option>15:00pm</option>
								<option>15:30pm</option>
								<option>16:00pm</option>
								<option>16:30pm</option>
								<option>17:00pm</option>
								<option>17:30pm</option>
								<option>18:00pm</option>
								<option>18:30pm</option>
								<option>19:00pm</option>
								<option>19:30pm</option>
								<option>20:00pm</option>
								<option>20:30pm</option>
								<option>21:00pm</option>
								<option>21:30pm</option>
								<option>22:00pm</option>
								<option>22:30pm</option>
								<option>23:00pm</option>
								<option>23:30pm</option>
							</select>

						</div>
					</div>
					<br>

					<!-- 디파짓 기능 -->

					<div class="form-group">
						<label class="col-md-4 control-label" for="s_deposit">디파짓
							기능</label>
						<div class="col-md-4">
							<label class="radio-inline" for="s_deposit-0"> <input
								type="radio" name="deposit_check" id="s_deposit-0" value=0
								checked="checked"> 사용함
							</label> <label class="radio-inline" for="s_deposit-1"> <input
								type="radio" name="deposit_check" id="s_deposit-1" value=-1>
								사용안함
							</label>
						</div>
						<div class="col-md-4">
							<div class="col-md-7">
								<input type="text" id="s_deposit_set" name="s_deposit"
									class="form-control" value="" placeholder="디파짓 액수를 입력하세요">
							</div>
							<label class="input-inline col-md-5" id="won" for="s_deposit_set">원</label>
						</div>
					</div>

					<br> <br>

					<!-- 히든인풋 -->
					<input type="hidden" name="s_leader_id" value="${users.u_id}">
					<!-- 계속 버튼  -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="s_next"></label>
						<div class="col-md-4">
							<input type="submit" id="s_next" name="s_next"
								class="btn btn-primary" value="계속">
						</div>
					</div>
				</div>
			</div>
		</fieldset>
	</form>
</body>
</html>