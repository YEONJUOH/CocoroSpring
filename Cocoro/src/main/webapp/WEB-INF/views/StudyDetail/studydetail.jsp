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
.trash { color:rgb(209, 91, 71); }
.flag { color:rgb(248, 148, 6); }
.panel-body { padding:0px; }
.panel-footer .pagination { margin: 0; }
.panel .glyphicon,.list-group-item .glyphicon { margin-right:5px; }
.panel-body .radio, .checkbox { display:inline-block;margin:0px; }
.panel-body input[type=checkbox]:checked + label { text-decoration: line-through;color: rgb(128, 144, 160); }
.list-group-item:hover, a.list-group-item:focus {text-decoration: none;background-color: rgb(245, 245, 245);}
.list-group { margin-bottom:0px; }
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
							jsonObj.content = json[i].plan_comment;
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
								if(confirm("삭제 하시겠습니까?")){
									$.ajax({
										url:'deleteschedule?plan_id='+calEvent.id,
										success: function(){
											alert("성공했어요");
										},
										error:function(){
											alert("실패햇어요");
										}
										
									});//a작스닫기
									$('#calendar').fullCalendar('removeEvents',calEvent.id);
								}else{
									if(confirm("수정하시겠습니까?")){
										calEvent.title = prompt("제목을 수정해주세요.");
										var content = prompt("내용용을 수정해주세요.");
										var date = prompt("날짜를 수정해주세요.");
 										calEvent.start = date; 
										$.ajax({
											url:'updateschedule?plan_id='+calEvent.id+'&plan_name='+calEvent.title+'&plan_comment='+content+'&plan_date='+date,
											success: function(){
				
											},
											error:function(){
											
											}
											
										});//a작스닫기
										 $('#calendar').fullCalendar('updateEvent', calEvent,true);
									}else{
										alert("아무것도 안할꺼야 흐힣흐힣");
									}
								}
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
	//스터디 멤버 강퇴하기
	function Forcedexit(j_id,index){
		$.ajax({
			url:'Forcedexit?j_id='+j_id,
			type:'get',
			success: function(){
				console.log("해결해결");
				var item = document.getElementById("Forcedexit_"+index);
				var parent = item.parentNode.parentNode;
				if(item != null){
					item.parentNode.parentNode.parentNode.removeChild(parent);
				}
			},
			error:function(){
				console.log("에러에러");
			}
			
		});//a작스닫기
	}
</script>
</head>
<body>
	<!-- 스터디의 정보 표시 및 설정-->
	<div class="bg-success" style="margin-left: 100px; margin-right: 100px; margin-top:50px;">
	  		<div style="float: left;"><img src="/resources/img/${leaderuser.u_image }" alt="..." class="img-thumbnail" style="height:140px;"></div>
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
			<button type="button" class="btn btn-default" aria-label="Left Align" data-toggle="modal" data-target="#studyMemberlist">
 				 <span class="glyphicon glyphicon-list" aria-hidden="true"></span>
			</button>
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
					<!-- 현재 가입된 스터디 멤버를 표시해주기 위한 모달모달 -->
					<!--    Modal -->
					<div class="modal fade" id="studyMemberlist" role="dialog">
						<div class="modal-dialog">
							<!--  Modal content -->
							<div class="modal-content">
								<div class="modal-header">
									<h2>스터디 멤버 리스트 </h2>
								</div>
								<div class="modal-body">
										<table class="table table-hover">
											<tr>
												<th>J_ID</th>
												<th>이미지</th>
												<th>사용자명</th>
												<th>성별</th>
												<th>실력</th>
												<th>스터디 가입일</th>
												<th>스터디 접속일</th>
												<c:if test="${study.s_leader_id == users.u_id}"><th>강퇴</th></c:if>
											</tr> 
											<c:if test="${Memberlist.size() != 0}">
												<c:forEach  var="o" begin="0" end="${Memberlist.size()-1}" step="1">
															<tr>
																<td>${Memberlist.get(o).j_id }</td> 
																<td><a href="/users/friendPage?u_id=${users.u_id }&f_o_id=${Memberlist.get(o).u_id}"><img src="/resources/img/${Memberlist.get(o).u_image}" class="img-circle" style="width: 35px; height: 30px;"></a></td>
																<td>${Memberlist.get(o).u_name}</td>
																<td>${Memberlist.get(o).u_sex}</td>
																<td>${Memberlist.get(o).a_rank}</td>
																<td>${Memberlist.get(o).j_date}</td>
																<td>${Memberlist.get(o).s_last_login}</td>
																<c:if test="${study.s_leader_id == users.u_id}"><td><button id="Forcedexit_${o}" type="button" class="btn btn-danger" onclick="Forcedexit(${Memberlist.get(o).j_id},${o})">강퇴</button></td></c:if>
															</tr>
												</c:forEach>
											</c:if>
											<c:if test="${Memberlist.size() == 0 }">
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
			<div class="container"  style="width:500px">
					    <div class="row">
					        <div>
					            <div class="panel panel-primary">
					                <div class="panel-heading">
					                    <span class="glyphicon glyphicon-list"></span>이전 계획
					                    <div class="pull-right action-buttons">
					                        <div class="btn-group pull-right">
					                            <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
					                                <span class="glyphicon glyphicon-cog" style="margin-right: 0px;"></span>
					                            </button>
					                            <ul class="dropdown-menu slidedown">
					                                <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-pencil"></span>Edit</a></li>
					                                <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-trash"></span>Delete</a></li>
					                                <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-flag"></span>Flag</a></li>
					                            </ul>
					                        </div>
					                    </div>
					                </div>
					                <div class="panel-body">
					                    <ul class="list-group">
					                        <li class="list-group-item">
					                            <div class="checkbox">
					                                <input type="checkbox" id="checkbox" />
					                                <label for="checkbox">
					                                    List group item heading
					                                </label>
					                            </div>
					                            <div class="pull-right action-buttons">
					                                <a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-pencil"></span></a>
					                                <a href="http://www.jquery2dotnet.com" class="trash"><span class="glyphicon glyphicon-trash"></span></a>
					                                <a href="http://www.jquery2dotnet.com" class="flag"><span class="glyphicon glyphicon-flag"></span></a>
					                            </div>
					                        </li>
					                        <li class="list-group-item">
					                            <div class="checkbox">
					                                <input type="checkbox" id="checkbox2" />
					                                <label for="checkbox2">
					                                    List group item heading 1
					                                </label>
					                            </div>
					                           <div class="pull-right action-buttons">
					                                <a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-pencil"></span></a>
					                                <a href="http://www.jquery2dotnet.com" class="trash"><span class="glyphicon glyphicon-trash"></span></a>
					                                <a href="http://www.jquery2dotnet.com" class="flag"><span class="glyphicon glyphicon-flag"></span></a>
					                            </div>
					                        </li>
					                        <li class="list-group-item">
					                            <div class="checkbox">
					                                <input type="checkbox" id="checkbox5" />
					                                <label for="checkbox5">
					                                    List group item heading 2
					                                </label>
					                            </div>
					                           <div class="pull-right action-buttons">
					                                <a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-pencil"></span></a>
					                                <a href="http://www.jquery2dotnet.com" class="trash"><span class="glyphicon glyphicon-trash"></span></a>
					                                <a href="http://www.jquery2dotnet.com" class="flag"><span class="glyphicon glyphicon-flag"></span></a>
					                            </div>
					                        </li>
					                    </ul>
					                </div>
					                <div class="panel-footer">
					                    <div class="row">
					                        <div class="col-md-6">
					                            <h6>
					                                Total Count <span class="label label-info">25</span></h6>
					                        </div>
					                        <div class="col-md-6">
					                            <ul class="pagination pagination-sm pull-right">
					                                <li class="disabled"><a href="javascript:void(0)">«</a></li>
					                                <li class="active"><a href="javascript:void(0)">1 <span class="sr-only">(current)</span></a></li>
					                                <li><a href="http://www.jquery2dotnet.com">2</a></li>
					                                <li><a href="http://www.jquery2dotnet.com">3</a></li>
					                                <li><a href="http://www.jquery2dotnet.com">4</a></li>
					                                <li><a href="http://www.jquery2dotnet.com">5</a></li>
					                                <li><a href="javascript:void(0)">»</a></li>
					                            </ul>
					                        </div>
					                    </div>
					                </div>
					            </div>
					        </div>
					    </div>
					</div><!-- 미드미아 -->
					<div class="container" style="width:500px">
					    <div class="row">
					        <div>
					            <div class="panel panel-primary">
					                <div class="panel-heading">
					                    <span class="glyphicon glyphicon-list"></span>예정 계획
					                    <div class="pull-right action-buttons">
					                        <div class="btn-group pull-right">
					                            <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
					                                <span class="glyphicon glyphicon-cog" style="margin-right: 0px;"></span>
					                            </button>
					                            <ul class="dropdown-menu slidedown">
					                                <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-pencil"></span>Edit</a></li>
					                                <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-trash"></span>Delete</a></li>
					                                <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-flag"></span>Flag</a></li>
					                            </ul>
					                        </div>
					                    </div>
					                </div>
					                <div class="panel-body">
					                    <ul class="list-group">
					                        <li class="list-group-item">
					                            <div class="checkbox">
					                                <input type="checkbox" id="checkbox" />
					                                <label for="checkbox">
					                                    List group item heading
					                                </label>
					                            </div>
					                            <div class="pull-right action-buttons">
					                                <a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-pencil"></span></a>
					                                <a href="http://www.jquery2dotnet.com" class="trash"><span class="glyphicon glyphicon-trash"></span></a>
					                                <a href="http://www.jquery2dotnet.com" class="flag"><span class="glyphicon glyphicon-flag"></span></a>
					                            </div>
					                        </li>
					                        <li class="list-group-item">
					                            <div class="checkbox">
					                                <input type="checkbox" id="checkbox2" />
					                                <label for="checkbox2">
					                                    List group item heading 1
					                                </label>
					                            </div>
					                           <div class="pull-right action-buttons">
					                                <a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-pencil"></span></a>
					                                <a href="http://www.jquery2dotnet.com" class="trash"><span class="glyphicon glyphicon-trash"></span></a>
					                                <a href="http://www.jquery2dotnet.com" class="flag"><span class="glyphicon glyphicon-flag"></span></a>
					                            </div>
					                        </li>
					                        <li class="list-group-item">
					                            <div class="checkbox">
					                                <input type="checkbox" id="checkbox5" />
					                                <label for="checkbox5">
					                                    List group item heading 2
					                                </label>
					                            </div>
					                           <div class="pull-right action-buttons">
					                                <a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-pencil"></span></a>
					                                <a href="http://www.jquery2dotnet.com" class="trash"><span class="glyphicon glyphicon-trash"></span></a>
					                                <a href="http://www.jquery2dotnet.com" class="flag"><span class="glyphicon glyphicon-flag"></span></a>
					                            </div>
					                        </li>
					                    </ul>
					                </div>
					                <div class="panel-footer">
					                    <div class="row">
					                        <div class="col-md-6">
					                            <h6>
					                                Total Count <span class="label label-info">25</span></h6>
					                        </div>
					                        <div class="col-md-6">
					                            <ul class="pagination pagination-sm pull-right">
					                                <li class="disabled"><a href="javascript:void(0)">«</a></li>
					                                <li class="active"><a href="javascript:void(0)">1 <span class="sr-only">(current)</span></a></li>
					                                <li><a href="http://www.jquery2dotnet.com">2</a></li>
					                                <li><a href="http://www.jquery2dotnet.com">3</a></li>
					                                <li><a href="http://www.jquery2dotnet.com">4</a></li>
					                                <li><a href="http://www.jquery2dotnet.com">5</a></li>
					                                <li><a href="javascript:void(0)">»</a></li>
					                            </ul>
					                        </div>
					                    </div>
					                </div>
					            </div>
					        </div>
					    </div>
					</div><!-- 미드미아 -->
<!-- 				<div style="height: 440px;float: left;"> -->
<!-- 					<div> -->
<%-- 						<c:if test="${beforedate != '[]' }"> --%>
<%-- 							<c:forEach var="o" begin="0" end="${beforedate.size()-1}" step="1" > --%>
<!-- 							<h3>이전 계획</h3> -->
<!-- 								<ul> -->
<%-- 									<li>${beforedate.get(o).plan_name }</li> --%>
<%-- 									<li>${beforedate.get(o).plan_comment }</li> --%>
<%-- 									<li id="${beforedate.get(o).plan_id }">${beforedate.get(o).plan_date }</li> --%>
<!-- 								</ul>															 -->
<%-- 							</c:forEach> --%>
<%-- 						</c:if> --%>
<%-- 						<c:if test="${afterdate != '[]' }"> --%>
<!-- 							<h3> 예정 계획</h3> -->
<%-- 							<c:forEach  var="o" begin="0" end="${afterdate.size()-1}" step="1"> --%>
<!-- 								<ul> -->
<%-- 									<li>${afterdate.get(o).plan_name }</li> --%>
<%-- 									<li>${afterdate.get(o).plan_comment }</li> --%>
<%-- 									<li id="${afterdate.get(o).plan_id }">${afterdate.get(o).plan_date }</li> --%>
<!-- 								</ul>															 -->
<%-- 							</c:forEach> --%>
<%-- 						</c:if> --%>
<!-- 					</div> -->
<!-- 				</div> -->
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