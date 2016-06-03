<%-- <%@page import="cocoro.studygroup.service.StudyCRUDService"%> --%>
<%-- <%@page import="cocoro.studygroup.model.StudyGroup"%> --%>
<%-- <%@page import="cocoro.studygroup.model.Applydata"%> --%>
<%-- <%@page import="cocoro.studygroup.model.Apply"%> --%>
<%-- <%@page import="java.util.List"%> --%>
<%-- <%@page import="cocoro.studygroup.service.StudyDetailService"%> --%>
<%-- <%@page import="cocoro.studygroup.dao.StudyDetailDao"%> --%>
<%-- <%@page import="cocoro.studygroup.service.StudyActivityService"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
// 	StudyDetailService service = StudyDetailService.getInstance();
// 	int s_id =4;
// 	request.setAttribute("s_id", s_id);
// 	List<Applydata> list =  service.applyList(s_id);
// 	System.out.println(list.size()+"리스트사이즈");
// 	request.setAttribute("list", list);
// 	StudyGroup stg = service.selectStudy(s_id);
// 	System.out.println(stg);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href='../js/calender/fullcalendar.css' rel='stylesheet' />
<link href='../js/calender/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='../js/calender/moment.min.js'></script>
<script src='../js/calender/jquery.min.js'></script>
<script src='../js/calender/fullcalendar.min.js'></script>
<script type="text/javascript">//src='../js/calender/ca.js'
(function($){
	$(document).ready(function() {
				var list=[];
				var date = new Date();
				var d = date.getDate();
				var m = date.getMonth();
				var y = date.getFullYear();
<%-- 				var temp = "<%=s_id%>"; --%>
				//로드될때 해당 스터디의 일정을 검색해서 바인딩 시키는 부분
				$.ajax({
<%-- 					url:'../test/json-events22.jsp?s_id=<%=s_id%>', --%>
					type:'post',
					dataType:'json',
					success:function(json){
						console.log("ajax성공");
						alert("찍혀야지");
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
							formatDate:'yyyy-MM-dd',
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
//									location.href='calenderInsert.jsp?plan_name='+title+"&plan_comment="+content+"&plan_date="+full;
									$.ajax({
										url:'insertschedule.jsp?plan_name='+title+"&plan_comment="+content+"&plan_date="+full+"&s_id="+temp,
										type:'get',
										dataType : 'json',
										success: function(){
											alert("꺼죨");
										},
										error:function(){
											alert("안꺼죨");
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
				
						    }
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
	function applygogo(apply_id,index){
		$.ajax({
			url:'../test/applygogo.jsp?apply_id='+apply_id,
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
	function rejectgogo(apply_id,index){
		$.ajax({
			url:'../test/rejectgogo.jsp?apply_id='+apply_id,
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
</script>
</head>
<body>
	<div class="bg-success" style="margin-left: 30px; margin-right: 30px;">
	  		<div style="float: left;"><img src="ab.PNG" alt="..." class="img-thumbnail"></div>
	  		<div class="top" style="padding-top:10px; padding-left:170px">
	  		<p style="float: left;"><h3>${study.s_name }</h3></p>
	  		<button type="button" class="btn btn-danger">스터디룸 입장</button>
	  		<button type="button" class="btn btn-default" aria-label="Left Align">
 				 <span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
			</button>
			<button type="button" class="btn btn-default" aria-label="Left Align" data-toggle="modal" data-target="#myModal">
 				 <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
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
<!-- 									<form class="form-horizontal" action="calenderInsert.jsp"method="post"> -->
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
															<td><button type="button" id="btn_${o}" class="btn btn-danger" onclick="applygogo(${list.get(o).apply_id},${o})">가입</button>&nbsp;&nbsp;<button id="btnreject_${o}" type="button" class="btn btn-danger" onclick="rejectgogo(${list.get(o).apply_id},${o})">거부</button></td>
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
<!-- 									</form> -->
								</div>
							</div>
						</div>
					</div>
			<br />
			<p>영어를 정복하기 위한 김정복씨와 함께하는 영어 스터디</p>
			<br />
			</div>
			<div class="mid" style="height: 500px;width: 100%;border-top:5px solid white;">
				<div style="height: 500px;float: left;">
					<div>list 값</div>
				</div>
				<div style="float: right;">
					<div id='calendar' style="width: 700px; height: 450px;"></div>
				</div>
			</div>
			<div class="foot" style="border-top:5px solid white">
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			스판스판<br />
			</div>
	</div>
	
</body>
<script src='../js/calender/fullcalendar.min.js'></script>
<link href='../js/calender/fullcalendar.css' rel='stylesheet' />
<link href='../js/calender//fullcalendar.print.css' rel='stylesheet' media='print' />
</html>