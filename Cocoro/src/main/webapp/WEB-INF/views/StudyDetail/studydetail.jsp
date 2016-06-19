<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				var o;
				var date = new Date();
				var d = date.getDate();
				var m = date.getMonth();
				var y = date.getFullYear();
				var temp = "${s_id}";
				//로드될때 해당 스터디의 일정을 검색해서 바인딩 시키는 부분
				$.ajax({
 					url:'../StudyDetailJson/json-events22?s_id='+temp, 
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
									location.href ="studydetail?s_id="+temp;
								}
								$('#calendar').fullCalendar('unselect');
							},
							editable: true,
							eventLimit: true, // allow "more" link when too many events
							eventClick:function(calEvent, jsEvent, view) {
								if(confirm("삭제 하시겠습니까?")){
									$.ajax({
										url:'../StudyDetailJson/deleteschedule?plan_id='+calEvent.id,
										success: function(){
											alert("성공");
										},
										error:function(){
											alert("실패");
										}
										
									});//a작스닫기
									$('#calendar').fullCalendar('removeEvents',calEvent.id);
									location.href ="studydetail?s_id="+temp;
								}else{
									if(confirm("수정하시겠습니까?")){
										calEvent.title = prompt("제목을 수정해주세요.");
										var content = prompt("내용용을 수정해주세요.");
										var date = prompt("날짜를 수정해주세요.");
 										calEvent.start = date; 
										$.ajax({
											url:'../StudyDetailJson/updateschedule?plan_id='+calEvent.id+'&plan_name='+calEvent.title+'&plan_comment='+content+'&plan_date='+date,
											success: function(){
												console.log("날짜수정 성공");
											},
											error:function(){
												console.log("날짜수정 실패");
											}
											
										});//a작스닫기
										 $('#calendar').fullCalendar('updateEvent', calEvent,true);
										 location.href ="studydetail?s_id="+temp;
										
									}else{
										console.log("캘린더수정삭제 안할경우");
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
			url:'../StudyDetailJson/applygogo?apply_id='+apply_id,
			type:'get',
			dataType : 'json',
			success: function(){
				console.log("가입지원자 허가");
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
			url:'../StudyDetailJson/applygogoyesdepoist?apply_id='+apply_id,
			type:'get',
			dataType : 'json',
			success: function(){
				console.log("가입지원자 발생함수");
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
			url:'../StudyDetailJson/rejectgogo?apply_id='+apply_id,
			type:'get',
			dataType : 'json',
			success: function(){
				console.log("ㅎㅎ0거부거부");
			},
			error:function(){
				console.log("지원자 거부거부");
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
			url:'../StudyDetailJson/Attend?plan_id='+plan_id+'&j_id='+j_id,
			type:'get',
			dataType : 'json',
			success: function(){
				console.log("출석체크 성공");
			},
			error:function(){
				console.log("출석체크 실패");
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
			url:'../StudyDetailJson/penaltyinput?p_name='+pn+'&p_price='+pv+'&s_id='+s_id,
			type:'get',
			dataType : 'json',
			success: function(data){
				$("#penaltytable").add
				console.log("페널티 설정 성공");
			},
			error:function(){
				console.log("페널티 에러부분");
			}
		});//ajax 닫기
	}
	//스터디 멤버 강퇴하기
	function Forcedexit(j_id,index){
		$.ajax({
			url:'../StudyDetailJson/Forcedexit?j_id='+j_id,
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
	function boardDetail(seq,s_id){
		$.ajax({
			url:'../StudyDetailJson/boardDetail?seq='+seq+"&s_id="+s_id,
			type:'get',
			dataType : 'json',
			success: function(data){
				$("#seq").val(data.seq);
				$("#title").val(data.title);
				$("#writer").val(data.writer);
				$("#regdate").val(data.regdate);
				$("#contents").val(data.contents);
			},
			error:function(){
				console.log("에러에러");
			}
			
		});//a작스닫기
	}
	function boardinput(s_id){
		var title = $("#title2").val();
		var contents = $("#contents2").val();
		var writer = $("#writer2").val();
		$.ajax({
			url:'../StudyDetailJson/boardinput?title='+title+"&contents="+contents+"&writer="+writer+"&s_id="+s_id,
			type:'get',
			dataType : 'json',
			success: function(data){
				location.href ="studydetail?s_id="+s_id;
// 				var item = document.getElementById("Forcedexit_"+index);
// 				var parent = item.parentNode.parentNode;
// 				if(item != null){
// 					item.parentNode.parentNode.parentNode.removeChild(parent);
// 				}

			},
			error:function(){
				location.href ="studydetail?s_id="+s_id;
			}
			
		});//a작스닫기
	}
	function noticeDelete(seq,s_id){
		alert("탔니");
		$.ajax({
			url:'../StudyDetailJson/noticeDelete?seq='+seq,
			type:'get',
			dataType : 'json',
			success: function(){
				console.log("ㅎㅎ");
// 				alert("끝");
				location.href ="studydetail?s_id="+s_id;
// 				var item = document.getElementById("Forcedexit_"+index);
// 				var parent = item.parentNode.parentNode;
// 				if(item != null){
// 					item.parentNode.parentNode.parentNode.removeChild(parent);
// 				}
			},
			error:function(){
				console.log("ㅅㅅ");
// 				alert("끝1");
				location.href ="studydetail?s_id="+s_id;
			}
		});//a작스닫기
	}
	function studydeadLine(s_id){
		$.ajax({
			url:'../StudyDetailJson/studydeadLine?s_id='+s_id,
			type:'get',
			dataType : 'json',
			success: function(data){
				console.log("마감 성공");
				location.href ="studydeadLine?s_id="+s_id;
				
			},
			error:function(){
				location.href ="studydetail?s_id="+s_id;
				console.log("마감 실패");
			}
			
		});a작스닫기
	}
</script>
</head>
<body>
	<!-- 스터디의 정보 표시 및 설정-->
	<div style="margin-left: 100px;margin-right: 100px;margin-top:50px;background-color: #f5f5f5;">
	  		<div style="float: left;"><img src="/resources/img/${leaderuser.u_image }" alt="..." class="img-thumbnail" style="height:140px;"></div>
	  		<div class="top" style="padding-top:10px; padding-left:170px">
	  		<p style="float: left;"><h3>${study.s_name }</h3></p>
	  		
	  		<c:if test="${study.s_online == 'T' }"><button type="button" class="btn btn-danger" onclick="javasciprt:StudyRoomjoin()">스터디룸 입장</button></c:if>
	  		
	  		<c:if test="${study.s_attend_check=='T' }"><c:if test="${plan != null }"><c:if test="${Attend == null}"><button type="button" class="btn btn-default" id="attendbtn" onclick="Attendcheck(${plan.plan_id},${studyactivitiy.j_id})">출석체크</button></c:if></c:if></c:if>

	  		<c:if test="${study.s_leader_id == users.u_id}">
	  		<c:if test="${study.s_fix_member== 'F' }">
		  		<button type="button" class="btn btn-info" aria-label="Left Align" onclick="studydeadLine(${study.s_id})">
	 				 모집 완료
				</button>
			</c:if>
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
			<div style="float:left;margin-left: 60px;margin-top: 25px;">
			<div  style="width:500px">
					    <div class="row">
					        <div>
					            <div class="panel panel-primary">
					                <div class="panel-heading">
					                    <span class="glyphicon glyphicon-list"></span>이전 일정
					                    <div class="pull-right action-buttons">
					                        <div class="btn-group pull-right">
					                            <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
					                                <span class="glyphicon glyphicon-cog" style="margin-right: 0px;"></span>
					                            </button>
					                            <ul class="dropdown-menu slidedown">
					                                <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-flag"></span>Flag</a></li>
					                            </ul>
					                        </div>
					                    </div>
					                </div>
					                <div class="panel-body">
					                    <ul class="list-group">
						                    <c:if test="${beforedate != '[]' }">
						                        <c:forEach var="o" begin="0" end="${beforedate.size()-1}" step="1" >
						                        <li class="list-group-item">
						                                <label>
						                                   ${beforedate.get(o).plan_name }&nbsp;${beforedate.get(o).plan_comment }&nbsp; ${fn:substring(beforedate.get(o).plan_date,0,10) }
						                                </label>
						                            <div class="pull-right action-buttons">
						                                <a href="http://www.jquery2dotnet.com" class="flag"><span class="glyphicon glyphicon-flag"></span></a>
						                            </div>
						                        </li>
						                        </c:forEach>
						                    </c:if>
						                    <c:if test="${beforedate == '[]' }">
						                    	<li class="list-group-item">
						                    		<label>이전 일정이 없습니다.</label>
						                    	</li>
						                    </c:if>
					                    </ul>
					                </div>
					                <div class="panel-footer">
					                    <div class="row">
					                        <div class="col-md-12">
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
					<div style="width:500px">
					    <div class="row">
					        <div>
					            <div class="panel panel-primary">
					                <div class="panel-heading">
					                    <span class="glyphicon glyphicon-list"></span>미래 일정
					                    <div class="pull-right action-buttons">
					                        <div class="btn-group pull-right">
					                            <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
					                                <span class="glyphicon glyphicon-cog" style="margin-right: 0px;"></span>
					                            </button>
					                            <ul class="dropdown-menu slidedown">
					                                <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-flag"></span>Flag</a></li>
					                            </ul>
					                        </div>
					                    </div>
					                </div>
					                <div class="panel-body">
					                    <ul class="list-group">
					                    	<c:if test="${afterdate != '[]' }"> 
					                    	<c:forEach  var="o" begin="0" end="${afterdate.size()-1}" step="1">
						                        <li class="list-group-item">
						                                <label>
						                                    ${afterdate.get(o).plan_name } &nbsp; ${afterdate.get(o).plan_comment } &nbsp;${fn:substring(afterdate.get(o).plan_date,0,10) }
						                                </label>
						                        </li>
					                        </c:forEach>
					                        </c:if>
					                        <c:if test="${afterdate =='[]' }">
					                        	<li class="list-group-item">
						                    		<label>이후 일정이 없습니다.</label>
						                    	</li>
					                        </c:if>
					                    </ul>
					                </div>
					                <div class="panel-footer">
					                    <div class="row">
					                        <div class="col-md-12">
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
					</div><!-- 왼쪽 사이트 블럭 -->
				<div style="margin-top: 5px;margin-right: 30px;float: right;">
					<div id='calendar' style="width: 500px; height: 450px;"></div>
				</div>
			</div>
			<div class="foot" style="height: 250px;width: 100%;border-top:10px solid white">
			<center>
				<div class="container">
				    <div style="width: 70%;">
				    <table class="table table-striped custab" style="margin-top: 0px;margin-bottom: 0px;">
				    <thead>
				    <div><h3 class="btn btn-primary" style="float: left;width: 100%;">공지사항</h3></div>
				        <tr>
				            <th>번호</th>
				            <th>제목</th>
				            <th>작성자</th>
				            <th colspan="2">작성일</th>
				        </tr>
				    </thead>
				    		<c:if test="${Board != '[]' }">
				    		<c:forEach  var="o" begin="0" end="${Board.size()-1}" step="1">
					            <tr>
					                <td>${Board.get(o).seq }</td>
					                <td><a onclick="javascript:boardDetail(${Board.get(o).seq},${Board.get(o).s_id })"  data-toggle="modal" data-target="#BoardModal">${Board.get(o).title } </a></td>
					                <td>${Board.get(o).writer }</td>
					                <td>${Board.get(o).regdate }</td>
					                <td class="text-center"><button onclick="noticeDelete(${Board.get(o).seq},${study.s_id})" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</button></td>
					            </tr>
				            </c:forEach>
				            </c:if>
				            <c:if test="${Board == null }">
					            <tr>
					                <td colspan="6">공지사항이 없습니다.</td>
					            </tr>
				            </c:if>
				    </table>
				    	<c:if test="${study.s_leader_id == users.u_id}"><p><button data-toggle="modal" data-target="#BoardwriterModal" class="btn btn-primary btn-xs pull-right" onclick=""><b>+</b> 글쓰기</button></p></c:if>
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
		<!-- 공지사항 읽기를 위한  모달모달 -->
					<!--    Modal -->
					<div class="modal fade" id="BoardModal" role="dialog">
						<div class="modal-dialog">
							<!--  Modal content -->
							<div class="modal-content">
								<div class="modal-header">
									<h2>공지글 읽기 </h2>
								</div>
								<div class="modal-body">
										<table class="table table-hover" id="penaltytable">
											<tr>
												<th>글번호</th>
												<td><input type="text" id="seq" readonly="readonly" /></td>
											</tr>
											<tr>
												<th>작성자</th>
												<td><input type="text" id="writer" readonly="readonly" /></td>
											</tr>
											<tr>
												<th>작성일</th>
												<td><input type="text" id="regdate" readonly="readonly" /></td>
											</tr>
											<tr>
												<th>제목</th>
												<td><input type="text" id="title"  readonly="readonly"/></td>
											</tr>
											<tr>
												<th>내용</th>
												<td><textarea id="contents" readonly="readonly"></textarea></td>
											</tr>
										</table>
										<hr />
								</div>
							</div>
						</div>
					</div>
					<!-- 공지사항 쓰기를 위한  모달모달 -->
					<!--    Modal -->
					<div class="modal fade" id="BoardwriterModal" role="dialog">
						<div class="modal-dialog">
							<!--  Modal content -->
							<div class="modal-content">
								<div class="modal-header">
									<h2>공지글 쓰기 </h2>
								</div>
								<div class="modal-body">
										<table class="table table-hover" id="penaltytable">
											<tr>
												<th>작성자</th>
												<td><input type="text" id="writer2" readonly="readonly" value="${users.u_name }" /></td>
											</tr>
											<tr>
												<th>제목</th>
												<td><input type="text" id="title2"  name="title2"/></td>
											</tr>
											<tr>
												<th>내용</th>
												<td><textarea id="contents2" name="contents2"></textarea></td>
											</tr>
										</table>
										<hr />
										<button type="button" class="btn btn-default" name="boardbtn" aria-label="Right Align" onclick="boardinput(${study.s_id})" >
							 				 글쓰기
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