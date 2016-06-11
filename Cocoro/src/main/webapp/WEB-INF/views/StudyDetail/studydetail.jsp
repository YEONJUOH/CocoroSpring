<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.custab{
    border: 1px solid #ccc;
    padding: 5px;
    margin: 5% 0;
    box-shadow: 3px 3px 2px #ccc;
    transition: 0.5s;
    }
.custab:hover{
    box-shadow: 3px 3px 0px transparent;
    transition: 0.5s;
    }
</style>
<link href='/resources/js/calendar/fullcalendar.css' rel='stylesheet' />
<link href='/resources/js/calendar/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='/resources/js/calendar/moment.min.js'></script>
<script src='/resources/js/calendar/jquery.min.js'></script>
<script src='/resources/js/calendar/fullcalendar.min.js'></script>
<script type="text/javascript">//src='../js/calender/ca.js'
(function($){
	$(document).ready(function() {
				var list=[];
				var date = new Date();
				var d = date.getDate();
				var m = date.getMonth();
				var y = date.getFullYear();
				var temp = "${s_id}";
				//로드될때 해당 스터디의 일정을 검색해서 바인딩 시키는 부분
				$.ajax({
 					url:'json-events22?s_id='+temp, 
					type:'post',
					dataType:'json',
					success:function(json){
						console.log("ajax성공");
						for(var i=0; i<json.length;i++){
							var jsonObj={};
							jsonObj.id = json[i].plan_id;
							jsonObj.title=json[i].plan_name;
							jsonObj.start=json[i].plan_date ;
							list.push(jsonObj);
						}
						$('#calendar').fullCalendar({
							height: 430,
							header: {
								left: 'prev,next today',
								center: 'title',
							},
							defaultDate: date,
							editable: true,
							eventLimit: true, // allow "more" link when too many events
							events : list,
							selectable: true,
							select : function(start){
								var title = prompt('Event title');
								var content = prompt('Event content');
								if(title){
								      console.log((start)._d);
						               console.log(start);
						               console.log(this);
						               eventData = {
						                  title: title,
						                  start: start
						               };
						           var full = (start)._d.getFullYear()+"-"+((start)._d.getUTCMonth()+1)+"-"+(start)._d.getDate();
									$.ajax({
										url:'insertschedule?plan_name='+title+"&plan_comment="+content+"&plan_date="+full+"&s_id="+temp,
										type:'get',
										dataType : 'json',
										success: function(){
										},
										error:function(){
										}
										
									});//a작스닫기
									
									$('#calendar').fullCalendar('renderEvent',eventData,true);
								}
								$('#calendar').fullCalendar('unselect');
							},
							editable: true,
							eventLimit: true, // allow "more" link when too many events
							eventClick:function(calEvent, jsEvent, view) {
								
								alert('Event: ' + calEvent.title);
						        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
						        alert('View: ' + view.name);
				
						        // change the border color just for fun
						        $(this).css('border-color', 'red');
						        
								var title = prompt("뭐 넣을래?");
								calEvent.title = title;
						        
				
						        $('#calendar').fullCalendar('updateEvent', event,true);
				
						    }//이벤트클릭 끝
						});//캘린더 끝
						},//success end
					error:function(request,status,error,jqXHR, textStatus, errorThrown){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error+"\n"+"jqXHR:"+jqXHR+"\n"+"textStatus:"+textStatus+"\n"+"thrown:"+errorThrown);
					}//에러끝
				});//ajax 끝
	});
})(jQuery);
</script>
<script type="text/javascript">
	//가입 지원자의 지원을 허가 할때 발생하는 함수(디파짓 사용)
	function applygogo(apply_id,index){
		$.ajax({
			url:'applygogo?apply_id='+apply_id,
			type:'get',
			dataType : 'json',
			success: function(){
				alert("꺼죨");
			},
			error:function(){
				var item = document.getElementById("btnreject_"+index);
				var parent = item.parentNode.parentNode;
				if(item != null){
					item.parentNode.parentNode.parentNode.removeChild(parent);
				}
			}
			
		});//a작스닫기
	}
	////가입 지원자의 지원을 허가 할때 발생하는 함수(디파짓 사용안함)
	function applygogoyesdepoist(apply_id,index){
		$.ajax({
			url:'applygogoyesdepoist?apply_id='+apply_id,
			type:'get',
			dataType : 'json',
			success: function(){
				alert("꺼죨");
			},
			error:function(){
				var item = document.getElementById("btnreject_"+index);
				var parent = item.parentNode.parentNode;
				if(item != null){
					item.parentNode.parentNode.parentNode.removeChild(parent);
				}
			}
			
		});//a작스닫기
	}
	//가입지원자를 거부하였을때 발생하는 함수
	function rejectgogo(apply_id,index){
		$.ajax({
			url:'rejectgogo?apply_id='+apply_id,
			type:'get',
			dataType : 'json',
			success: function(){
				console.log("ㅎㅎ0거부거부");
			},
			error:function(){
				var item = document.getElementById("btnreject_"+index);
				var parent = item.parentNode.parentNode;
				if(item != null){
					item.parentNode.parentNode.parentNode.removeChild(parent);
				}
			}
			
		});//a작스닫기
	}
	//스터디룸에 입장하기버튼을 눌렀을때 가는 함수
	function StudyRoomjoin(){
		location.href="/StudyDetail/StudyRoom";
	}
	//출석체크
	function Attendcheck(plan_id,j_id){
		$.ajax({
			url:'Attend?plan_id='+plan_id+'&j_id='+j_id,
			type:'get',
			dataType : 'json',
			success: function(){
				console.log("ㅎㅎ0거부거부");
			},
			error:function(){
				var k =document.getElementById("attendbtn");
				var oo = k.parentNode;
				oo.removeChild(k);
			}
		});//ajax 닫기
	}
	//패널티 설정
	function penaltyinput(s_id){
		var pn = $("#penaltyname").val();
		var pv= $("#penaltyvalue").val();
		$.ajax({
			url:'penaltyinput?p_name='+pn+'&p_price='+pv+'&s_id='+s_id,
			type:'get',
			dataType : 'json',
			success: function(data){
				$("#penaltytable").add
			},
			error:function(){
				alert("에러에러");
			}
		});//ajax 닫기
	}
</script>
</head>
<body>
	<div class="bg-success" style="margin-left: 100px; margin-right: 100px; margin-top:50px;">
	  		<div style="float: left;"><img src="/resources/js/calendar/ab.PNG" alt="..." class="img-thumbnail" style="height:140px;"></div>
	  		<div class="top" style="padding-top:10px; padding-left:170px">
	  		<p style="float: left;"><h3>${study.s_name }</h3></p>
	  		
	  		<c:if test="${study.s_online == 'T' }"><button type="button" class="btn btn-danger" onclick="javasciprt:StudyRoomjoin()">스터디룸 입장</button></c:if>
	  		
	  		<c:if test="${study.s_attend_check=='T' }"><c:if test="${plan != null }"><c:if test="${Attend == null}"><button type="button" class="btn btn-default" id="attendbtn" onclick="Attendcheck(${plan.plan_id},${studyactivitiy.j_id})">출석체크</button></c:if></c:if></c:if>

	  		<c:if test="${study.s_leader_id == users.u_id}">
	  		<c:if test="${study.s_deposit>0 }">
		  		<button type="button" class="btn btn-default" aria-label="Left Align" data-toggle="modal" data-target="#positModal">
	 				 <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
				</button>
			</c:if>
			<button type="button" class="btn btn-default" aria-label="Left Align" data-toggle="modal" data-target="#myModal">
 				 <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
			</button>
			</c:if>
			<!-- 가입신청한 사람들을 표시해주기 위한 모달모달 -->
					<!--    Modal -->
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<!--  Modal content -->
							<div class="modal-content">
								<div class="modal-header">
									<h2>가입 희망자 </h2>
								</div>
								<div class="modal-body">
										<table class="table table-hover">
											<tr>
												<th>A_ID</th>
												<th>사용자명</th>
												<th>실력</th>
												<th></th>
											</tr> 
											<c:if test="${list.size() != 0}">
												<c:forEach  var="o" begin="0" end="${list.size()-1}" step="1">
													<c:if test="${list.get(o).apply_id !=null }">
														<tr id=btn_>
															<td>${list.get(o).apply_id }</td> 
															<td>${list.get(o).u_name }</td>
															<td><c:if test="${list.get(o).rank_for_apply !=null }">${list.get(o).rank_for_apply }</c:if></td>
															<td><c:if test="${study.s_deposit >0 }"><button type="button" id="btn_${o}" class="btn btn-danger" onclick="applygogoyesdepoist(${list.get(o).apply_id},${o})">가입</button></c:if>
																  <c:if test="${study.s_deposit <0 }"><button type="button" id="btn_${o}" class="btn btn-danger" onclick="applygogo(${list.get(o).apply_id},${o})">가입</button></c:if>
																	&nbsp;&nbsp;
																  <button id="btnreject_${o}" type="button" class="btn btn-danger" onclick="rejectgogo(${list.get(o).apply_id},${o})">거부</button>
															</td>
														</tr>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${list.size() == 0 }">
												<tr>
													<td colspan='3'>가입 희망자가 없습니다.</td>
												</tr>
											</c:if>
										</table>
								</div>
							</div>
						</div>
					</div>
			<br />
			<p>${study.s_intro}</p>
			<br />
			</div>
			<div class="mid" style="height: 450px;width: 100%;border-top:10px solid white;">
				<div style="height: 440px;float: left;">
					<div>
						<c:if test="${beforedate != '[]' }">
							<c:forEach var="o" begin="0" end="${beforedate.size()-1}" step="1" >
							<h3>이전 계획</h3>
								<ul>
									<li>${beforedate.get(o).plan_name }</li>
									<li>${beforedate.get(o).plan_comment }</li>
									<li id="${beforedate.get(o).plan_id }">${beforedate.get(o).plan_date }</li>
								</ul>															
							</c:forEach>
						</c:if>
						<c:if test="${afterdate != '[]' }">
							<h3> 예정 계획</h3>
							<c:forEach  var="o" begin="0" end="${afterdate.size()-1}" step="1">
								<ul>
									<li>${afterdate.get(o).plan_name }</li>
									<li>${afterdate.get(o).plan_comment }</li>
									<li id="${afterdate.get(o).plan_id }">${afterdate.get(o).plan_date }</li>
								</ul>															
							</c:forEach>
						</c:if>
					</div>
				</div>
				<div style="float: right;">
					<div id='calendar' style="width: 500px; height: 450px;"></div>
				</div>
			</div>
			<div class="foot" style="height: 250px;width: 100%;border-top:10px solid white">
			<center>
				<div class="container">
				    <div class="row col-md-6 col-md-offset-2 custyle">
				    <table class="table table-striped custab">
				    <thead>
				    <div><p>공지사항</p><p><a href="#" class="btn btn-primary btn-xs pull-right"><b>+</b> 글쓰기</a></p></div>
				        <tr>
				            <th>번호</th>
				            <th>제목</th>
				            <th>작성자</th>
				            <th>작성일</th>
				            <th colspan="2">조회수</th>
				        </tr>
				    </thead>
				            <tr>
				                <td>1</td>
				                <td>News</td>
				                <td>Breaking</td>
				                <td>Published</td>
				                <td>Citizen</td>
				                <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-edit"></span> Edit</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td>
				            </tr>
				            <tr>
				                <td>1</td>
				                <td>News</td>
				                <td>Breaking</td>
				                <td>Published</td>
				                <td>Citizen</td>
				                <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-edit"></span> Edit</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td>
				            </tr>
				             <tr>
				                <td>1</td>
				                <td>News</td>
				                <td>Breaking</td>
				                <td>Published</td>
				                <td>Citizen</td>
				                <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-edit"></span> Edit</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td>
				            </tr>
				    </table>
				    </div>
				</div>
			</center>
			</div> <!-- foot div end -->
	</div>
	<!-- 디파짓 설정을 위한  모달모달 -->
					<!--    Modal -->
					<div class="modal fade" id="positModal" role="dialog">
						<div class="modal-dialog">
							<!--  Modal content -->
							<div class="modal-content">
								<div class="modal-header">
									<h2>Penalty 설정 </h2>
								</div>
								<div class="modal-body">
										<table class="table table-hover" id="penaltytable">
											<tr>
												<th>No.</th>
												<th>Name</th>
												<th colspan="2">Value</th>
											</tr> 
											<c:if test="${Penaltylist.size() != 0}">
												<c:forEach  var="o" begin="0" end="${Penaltylist.size()-1}" step="1">
													<c:if test="${Penaltylist.get(o).p_id !=null }">
														<tr>
															<td>${o+1}</td> 
															<td>${Penaltylist.get(o).p_name }</td>
															<td>${Penaltylist.get(o).p_price }</td>
															<td><button id="btnreject_${o}" type="button" class="btn btn-danger" onclick="rejectgogo(${Penaltylist.get(o).p_id},${o})">X</button></td>
														</tr>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${Penaltylist.size() == 0 }">
												<tr>
													<td colspan='3'>디파짓 내용이 없습니다.</td>
												</tr>
											</c:if>
										</table>
										<hr />
										<input type="text" id="penaltyname"/> &nbsp;&nbsp; Name &nbsp;&nbsp; <input type="text" id="penaltyvalue"/> &nbsp; Value &nbsp;
										<button type="button" class="btn btn-default" name="depositbtn" aria-label="Left Align" onclick="penaltyinput(${study.s_id})" >
							 				 추가
										</button>
								</div>
							</div>
						</div>
					</div>
</body>
<script src='/resources/js/calendar/fullcalendar.min.js'></script>
<link href='/resources/js/calendar/fullcalendar.css' rel='stylesheet' />
<link href='/resources/js/calendar/fullcalendar.print.css' rel='stylesheet' media='print' />
</html>