<%@page import="cocoro.user.model.Message"%>
<%@page import="java.util.HashMap"%>
<%@page import="cocoro.user.model.Follow"%>
<%@page import="cocoro.user.model.Likes"%>
<%@page import="java.util.Random"%>
<%@page import="cocoro.user.model.UsersAccount"%>
<%@page import="org.apache.ibatis.executor.ReuseExecutor"%>
<%@page import="cocoro.user.model.Comment"%>
<%@page import="java.util.List"%>
<%@page import="cocoro.user.service.UsersActivityService"%>
<%@page import="cocoro.user.model.Mento"%>
<%@page import="cocoro.user.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%
          request.setCharacterEncoding("UTF-8");
          response.setContentType("text/html;charset=UTF-8");

          UsersActivityService activityService = UsersActivityService.getInstance();
          //유저 친구
          Users users = null;
          Users fUsers = null;
          //좋아요 , 팔로우 판단
          Likes likes_check = null;
          Follow follow_check = null;
          List<Follow> usersFolloCheck = null;
          HashMap<String,Integer> usersFollowCheck = new HashMap<String, Integer>();
          HashMap<String,Integer> usersLikeCheck = new HashMap<String, Integer>();
          //멘토여부판단    
             Mento mento = null;
          //목표 친구일때 나일때 나눠주기위해
             int goal = 0;
             
          //m_check 값이 넘어 온다는 것은 헤더에서 마이페이지를 눌렀단 소리 친구 세션삭제
             if(request.getParameter("m_check") != null){
          session.removeAttribute("fUsers");
          System.out.println("마이페이지 check 가 넘어왔어요");
             }
          
          //기본 정보 불러오기(자기자신일때)
             if(session.getAttribute("fUsers") == null){
             users = (Users)session.getAttribute("users");
             //만약에 유저가 멘토라면   
              mento = activityService.usersMentoCheck(users.getU_id());
             if(mento != null){
          request.setAttribute("mento", mento);
          System.out.println("멘토시군용!!");
             }
          //팔로우 정보불러오기   
             List<Users> follow = activityService.usersFollowList(users.getU_id());
             request.setAttribute("follow", follow);
          //후기 
             List<Comment> comment = activityService.usersAfterInfo(users.getU_id());
             //회원에게 후기를 남긴 유저들의 목록
             List<Users> commentUsers = activityService.usersAfterUsersInfo(users.getU_id());
             
             session.setAttribute("comment", comment);
             session.setAttribute("commentUsers", commentUsers);
          //계좌
             UsersAccount usersAccountInfo = activityService.usersAccountInfo(users.getU_id());
             //만약에 계좌가 없으면
             if(usersAccountInfo == null){
          //계좌번호 난수생성
          Random random = new Random();
          int account = random.nextInt(9999)+1;
          
          //계좌번호생성
          UsersAccount usersAccount = new UsersAccount();
          usersAccount.setU_id(users.getU_id());
          usersAccount.setU_account(account);
          
          activityService.usersAccount(usersAccount);
             }else{
          request.setAttribute("usersAccountInfo", usersAccountInfo);
             }
             
             //프로그레스바에서 값쓰기위해 int로 goal 선언 
             goal = users.getU_goal_ration();
             System.out.println("본인이시군요");
             
         //받은 메세지 목록
     	    List<Message> receiveMessage = activityService.receiveMessage(users.getU_id());
     	    request.setAttribute("receiveMessage", receiveMessage);
     	
     	 //받은 메세지를 보낸 친구의 정보
     	    List<Users> receiveInfo = activityService.receiveInfo(users.getU_id());
     	 	request.setAttribute("receiveInfo", receiveInfo);
     	 	
     	 //보낸 메세지 목록
     	    List<Message> postMessage = activityService.postMessage(users.getU_id());
     	    request.setAttribute("postMessage", postMessage);
     	    System.out.println(postMessage.size());
     	
     	 //보낸 메세지를 받은 친구의 정보
     	    List<Users> postInfo = activityService.postInfo(users.getU_id());
     	 	request.setAttribute("postInfo", postInfo);
     	 	System.out.println(postInfo.toString());
     	 	//친구일떄
             }else{
          fUsers =  (Users)session.getAttribute("fUsers");
          goal = fUsers.getU_goal_ration();
          System.out.println("친구 시군요");
          //친구 후기 
          //후기 작성을위해 로그인되어있는 회원정보도 받아옴
          users =  (Users)session.getAttribute("users");
          //친구의 모든 후기 목록
          List<Comment> fComment = activityService.usersAfterInfo(fUsers.getU_id());
          
          //친구에게 후기를 남긴 유저들의 목록
          List<Users> fCommentUsers = activityService.usersAfterUsersInfo(fUsers.getU_id());
          
          //팔로워 목록
          List<Users> fFollow = activityService.usersFollowList(fUsers.getU_id());
          request.setAttribute("fFollow", fFollow);
          
          request.setAttribute("fComment", fComment);
          request.setAttribute("fCommentUsers", fCommentUsers);
          }
       %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>스터디 만세 Cocoro </title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
   <link rel="stylesheet" href="../page/mypage/mypage.css">
   <script type="text/javascript" src="../page/mypage/mypage.js"></script>
	<script type="text/javascript">
	//받은 쪽지함 삭제  
	function receiveDel(){
				alert('삭제버튼');
				$('#delMessage').submit();
			};
			$(function(){
				$('#delMessage').submit(function(e){
					event.preventDefault();
					$.getJSON('../page/mypage/messageOk.jsp',{message_id : $('#message_id').val(), messageInfo : 'del_receive'},function(data){
						$.each(data,function(key,value){
							$('#receiveBody').empty();
							var receive = '<tr>'	
			  				receive += '<td>'+value.u_name +'</td>';
			  				receive += '<td>'+value.message_Comment+'</td>';
			  				receive += '<td>'+value.message_date+'</td>';
			  				receive += '<td>'+value.message_check+'</td>';
			  				receive += '<td><form id="delMessage" method="post">';
			  				receive += '<input type="hidden" id="message_id" name="message_id" value="'+value.message_id+'">';
			  				receive += '<button class="btn-primary" type="submit">삭제</button>';
			  				receive += '</form>';  				
			  				receive += '</td></tr>';
			  				$('#receiveBody').append(receive);
						})
					})
				})
			})
	</script>
</head>
<body>
<div class="container">
    <div class="fb-profile">
        <img align="left" class="fb-image-lg" src="../img/mainTestimg2.jpg"/>
     <!-- 본인일떄 이미지 -->
         <c:if test="${fUsers == null }">
        <img align="left" class="fb-image-profile thumbnail" src="../img/${users.u_image }" alt="Profile image example"/>
        </c:if>
    <!-- 친구일떄 이미지 -->
         <c:if test="${fUsers != null }">
        <img align="left" class="fb-image-profile thumbnail" src="../img/${users.u_image }" alt="Profile image example"/>
        </c:if>
        <div class="fb-profile-text">
    <!-- 본인일때 이름 -->
        <c:if test="${fUsers == null }">
          <h2>${users.u_name}</h2>   
      </c:if>
    <!-- 친구일때 이름 -->
       <c:if test="${fUsers != null }">
          <h2 id="nameleft">${fUsers.u_name}</h2> 
          <button class="btn btn-primary btn-sm btnleft" href="#signup" data-toggle="modal" data-target=".mSend"><i class="glyphicon glyphicon-envelope"></i></button>
 		</c:if>
   <!-- 친구일때 팔로우 / 좋아요 버튼 -->
   <%if(fUsers != null){
       usersLikeCheck.put("u_id", users.getU_id());
       usersLikeCheck.put("l_o_id" ,fUsers.getU_id());
       
       likes_check = activityService.usersLikeCheck(usersLikeCheck);
       if(likes_check != null){
   %>
      <form action="../page/mypage/mypageLikeOk.jsp?l_o_id=<%= fUsers.getU_id() %>" method="post">
                        <button class="btn btn-danger btn-sm btnleft" id="u_like" type="submit"><i class="glyphicon glyphicon-heart"></i></button>
      </form>   
   <%}else{ %>
    <form action="../page/mypage/mypageLikeOk.jsp?l_o_id=<%= fUsers.getU_id() %>" method="post">
                         <input type="hidden" value="T" name="l_check">
                        <button class="btn btn-danger btn-sm btnleft" id="u_like" type="submit"><i class="glyphicon glyphicon-heart-empty"></i></button>
      </form>  
   <%} %>
   <%
                    usersFollowCheck.put("u_id", users.getU_id());   
                    usersFollowCheck.put("f_o_id" , fUsers.getU_id());
                    follow_check = activityService.usersFollowCheck(usersFollowCheck);
            //이미 팔로우관계면  UnFollow  아니면 Follow 버튼이 뜨게함
                   if(follow_check != null){%>
                        <form action="../page/mypage/mypageFollowOk.jsp?f_o_id=<%= fUsers.getU_id() %>" method="post">
                         <input type="hidden" value="F" name="f_check">
                        <button class="btn btn-danger btn-sm btnleft" id="u_follow" type="submit" role="button"><i class="glyphicon glyphicon-thumbs-down"></i></button>
                   </form>
                    <%   
                    }else{%>
                       <form action="../page/mypage/mypageFollowOk.jsp?f_o_id=<%= fUsers.getU_id() %>" method="post">
                         <input type="hidden" value="T" name="f_check">
                        <button class="btn btn-warning btn-sm btnleft" id="u_follow" type="submit" role="button"><i class="glyphicon glyphicon-thumbs-up"></i></button>
                       
                   </form>
                   <% }%>
            <% }
            %>
        </div>
    </div>
</div>  

    <div id="wrapper" style="width: 90%; margin-left: 5%;">
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                    </div>
                </div>              
                  <hr />
                <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-6">           
         <div class="panel panel-back noti-box">
                <span class="icon-box bg-color-red set-icon">
                    <i class="fa fa-envelope-o"></i>
                </span><br>
              <!-- 이메일  -->  
                <div class="text-box" >
                    <p class="main-text"><b>이메일</b></p>
            <c:if test="${fUsers == null }">
                       <p class="text-muted">${users.u_email}</p>
               </c:if>   
               <c:if test="${fUsers != null }">
                       <p class="text-muted">${fUsers.u_email}</p>
               </c:if>      
                </div>
             </div>
           </div>
              <div class="col-md-3 col-sm-6 col-xs-6">           
         <div class="panel panel-back noti-box">
                <span class="icon-box bg-color-green set-icon">
                    <i class="fa fa-bars"></i>
                </span>
              <!-- 최근 로그인 --> 
                <div class="text-box" >
                    <p class="main-text"><b>최근로그인</b></p>
            <c:if test="${fUsers == null }">
                    <p class="text-muted">${users.u_last_login}</p>
                </c:if>
                <c:if test="${fUsers != null }">
                    <p class="text-muted">${fUsers.u_last_login}</p>
                </c:if>
                </div>
             </div>
           </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">           
         <div class="panel panel-back noti-box">
                <span class="icon-box bg-color-blue set-icon">
                    <i class="fa fa-bell-o"></i>
                </span>
             <!-- 성별 -->  
                <div class="text-box" >
                    <p class="main-text"><b>성별</b></p>
                    <c:if test="${fUsers == null }">
                        <p class="text-muted">${users.u_sex}</p>
                    </c:if>
                        <c:if test="${fUsers != null }">
                        <p class="text-muted">${fUsers.u_sex}</p>
                    </c:if>
                </div>
             </div>
           </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">           
         <div class="panel panel-back noti-box">
                <span class="icon-box bg-color-brown set-icon">
                    <i class="fa fa-rocket"></i>
                </span>
              <!-- 멘토링 여부 --> 
             <c:if test="${fUsers == null }">  
              <c:if test="${users.u_mento_check == 'T' }"> 
                <div class="text-box" >
                    <p class="main-text"><b>멘토</b></p>
                    <p class="text-muted">${mento.m_major}</p>
                </div>
               </c:if> 
              <!-- 멘토가 아닐떄 --> 
                <c:if test="${users.u_mento_check == 'F' }"> 
                <div class="text-box" >
                    <p class="main-text"><b>멘토</b></p>
                    <p class="text-muted">멘토가아닙니다</p>
                </div>
               </c:if>
              </c:if> 
              <!-- 친구 멘토링 여부 -->
             <c:if test="${fUsers != null }">  
              <c:if test="${fUsers.u_mento_check == 'T' }"> 
                <div class="text-box" >
                    <p class="main-text">멘토</p>
                    <p class="text-muted">${mento.m_major}</p>
                </div>
               </c:if> 
              <!-- 친구 가멘토가 아닐떄 --> 
                <c:if test="${fUsers.u_mento_check == 'F' }"> 
                <div class="text-box" >
                    <p class="main-text">멘토</p>
                    <p class="text-muted">멘토가아닙니다</p>
                </div>
               </c:if>
              </c:if>
             </div>
           </div>
         </div>
                <hr />                
                <div class="row">
                    <div class="col-md-6 col-sm-12 col-xs-12">           
         <div class="panel panel-back noti-box">
                <span class="icon-box bg-color-blue">
                    <i class="fa fa-warning"></i>
                </span>
             <!--  자기소개  -->  
                <div class="text-box" >
                    <p class="main-text"><b>자기소개</b> </p>
                    <hr />
                    <p class="text-muted">
                          <span class="text-muted color-bottom-txt"><i class="fa fa-edit"></i>
                         <c:if test="${fUsers == null }">       
                               ${users.u_intro}
                         </c:if>   
                         <c:if test="${fUsers != null }">       
                               ${fUsers.u_intro}
                         </c:if>    
                               </span>
                    </p>
                </div>
             </div>
           </div>
           <!-- 관심사 -->
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel back-dash">
                               <i class="fa fa-dashboard fa-3x"></i><strong> &nbsp; 관심사</strong>
                             <c:if test="${fUsers == null }">   
                             <p class="text-muted">${users.u_tag}</p>
                             </c:if>
                             <c:if test="${fUsers != null }">   
                             <p class="text-muted">${fUsers.u_tag}</p>
                             </c:if>
                        </div>
                    </div>
             <!-- SNS주소 -->       
                     <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="panel back-dash">
                               <i class="fa fa-dashboard fa-3x"></i><strong> SNS주소 </strong>
                             <c:if test="${fUsers == null }">   
                             <p class="text-muted">${users.u_sns_address}</p>
                             </c:if>
                             <c:if test="${fUsers != null }">   
                             <p class="text-muted">${fUsers.u_sns_address}</p>
                             </c:if>
                        </div>
                    </div>
                        <div class="panel ">
          <!-- 가입일자 -->
          <div class="main-temp-back">
            <div class="panel-body">
              <div class="row">
                <div class="col-xs-6"> <i class="fa fa-cloud fa-3x"></i></div>
                <div class="col-xs-6">
                  <div class="text-temp"> <b>목표달성률</b> </div>
                <!-- 본인 달성률 -->
                  <c:if test="${fUsers == null }">
               <p class="summary">${users.u_goal_ration}%</p>
               <div class="progress">
                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${users.u_goal_ration}%">
               </div>
                   </div>
             </c:if>
             <!-- 친구 달성률 --> 
              <c:if test="${fUsers != null }">
               <p class="summary">${fUsers.u_goal_ration}%</p>
               <div class="progress">
                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${fUsers.u_goal_ration}%">
               </div>
                   </div>
             </c:if>   
              </div>
            </div>
          </div>
          
        </div>
    </div>
        </div>
                <div class="row"> 
           <div class="col-md-9 col-sm-12 col-xs-12">                     
           </div>
           </div>
                <div class="row" >
                    <div class="col-md-3 col-sm-12 col-xs-12">
    <!-- 주소 -->
                <div class="panel panel-info text-center no-boder bg-color-green">
                        <div class="panel-body">
                            <i class="fa fa-comments-o fa-5x"></i>
                   <c:if test="${fUsers == null }">   
                        <c:if test="${users.u_address_check == 'T' }">  
                            <h4>주소 </h4>
                             <h4>${users.u_address}</h4>
                        </c:if>
                         <c:if test="${users.u_address_check == 'F' }">  
                            <h4>주소 </h4>
                             <h4>비공개 입니다 </h4>
                        </c:if>  
                    </c:if> 
                       <c:if test="${fUsers != null }">   
                        <c:if test="${fUsers.u_address_check == 'T' }">  
                            <h4>주소</h4>
                             <h4>${fUsers.u_address}</h4>
                        </c:if>
                         <c:if test="${fUsers.u_address_check == 'F' }">  
                            <h4>주소 </h4>
                             <h4>비공개 입니다 </h4>
                        </c:if>  
                    </c:if>            
                        </div>
                  <!-- 생년월일 --> 
                    <div class="panel-footer back-footer-green">
                             <i class="fa fa-rocket fa-5x"></i>
                             <h4>생년월일 </h4>
                        <c:if test="${fUsers == null }">   
                          <c:if test="${users.u_birth_check == 'T'}">   
                             <h4>${users.u_birth}</h4>
                           </c:if>  
                           <c:if test="${users.u_birth_check == 'F'}">   
                           <h4>비공개 입니다.</h4>
                           </c:if>
                        </c:if>
                         <c:if test="${fUsers != null }">   
                               <c:if test="${fUsers.u_birth_check == 'T'}">   
                                <h4>${fUsers.u_birth}</h4>
                                 </c:if>  
                                 <c:if test="${fUsers.u_birth_check == 'F'}">   
                                 <h4>비공개 입니다.</h4>
                           </c:if>
                        </c:if>    
                    </div>
             </div>
            <!-- 계좌관리 --> 
            <c:if test="${fUsers == null }">  
              <div class="panel text-center no-boder bg-color-green">
                    <div class="panel-footer back-footer-green">
                             <i class="fa fa-rocket fa-5x"></i>
                             <h4>계좌관리 </h4>
                     <p class="title">계좌번호</p><br>
                      <p class="summary">${usersAccountInfo.u_account}</p>
                            <p>잔액: ${usersAccountInfo.u_balance}</p>
                            <button class="btn btn-info btn-lg" href="#signup" data-toggle="modal" data-target=".u_account">계좌관리</button>
                    </div>
             </div>
             </c:if>
                    </div>
                    <div class="col-md-9 col-sm-12 col-xs-12">
               <!-- 스터디 -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                                                        현재 참여중인 스터디 
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>스터디이름</th>
                                            <th>시작일</th>
                                            <th>종료일</th>
                                             <th>최근접속날짜</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Mark</td>
                                            <td>Otto</td>
                                            <td>@mdo</td>
                                            <td>100090</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Jacob</td>
                                            <td>Thornton</td>
                                            <td>@fat</td>
                                            <td>100090</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
               <!-- 현재 팔로잉 중인친구 -->
                 <div class="panel panel-default">
                        <div class="panel-heading">
                                                        팔로우 중인친구
                        <!-- 본인일때만 친구검색 버튼  -->
                        <c:if test="${fUsers == null}">   
                          <button class="btn btn-info btn-sm" style="float: rigth;" data-toggle="modal" data-target=".autoSearch">친구검색</button>
                        </c:if>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>이름</th>
                                            <th>이메일</th>
                                            <th>태그</th>
                                            <th>최근접속날짜</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${fUsers == null}">   
                                        <c:forEach var="follow" items="${follow}">
                                        <tr>
                                            <td><a href="../layout/mainLayout.jsp?f_o_id=${follow.u_id}">${follow.u_name}</a></td>
                                            <td>${follow.u_email}</td>
                                            <td>${follow.u_tag}</td>
                                            <td>${follow.u_last_login}</td>
                                            <td>
                                            <form action="../page/mypage/mypageFollowOk.jsp?f_o_id=${follow.u_id}" method="post">
                                              <input type="hidden" name="f_check" value="F">
                                              <input type="hidden" name="mypage" value="F">
                                            <button type="submit" class="btn-danger">팔로우끊기</button>
                                            </form>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </c:if>
                                      <c:if test="${fUsers != null}">   
                                        <c:forEach var="fFollow" items="${fFollow}">
                                        <tr>
                                            <td>${fFollow.u_name}</td>
                                            <td>${fFollow.u_email}</td>
                                            <td>${fFollow.u_tag}</td>
                                            <td>${fFollow.u_last_login}</td>
                                        </tr>
                                        </c:forEach>
                                    </c:if>     
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                        <c:if test="${fUsers == null}">           
            <!-- 쪽지함 -->        
                      <div class="panel panel-default">
                        <div class="panel-heading">
                         쪽지함
                     
                        </div>
                        <div class="panel-body">
					<!-- 쪽지 탭 네이 -->
						<div role="tabpanel">                            
                              <!-- Nav tabs -->
						  <ul class="nav nav-tabs" role="tablist">
						    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">받은쪽지함</a></li>
						    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">보낸쪽지함</a></li>
						  </ul>
					<!-- 받음 쪽지함 -->
                     <div class="tab-content">
					    <div role="tabpanel" class="tab-pane active" id="home">
					      <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>보낸사람</th>
                                            <th>내용</th>
                                            <th>받은날짜</th>
                                            <th>읽음 여부</th>
                                        </tr>
                                    </thead>
                               <tbody id="receiveBody">
                                 <c:forEach var="receiveMessage" items="${receiveMessage}"> 
                                        <tr>
                                 <!-- 답장 보류 답장 버튼을 눌렸을때 삭제가 되게할것인가 (그렇게하면 업데이트도간편 ) -->
                                 	<c:forEach var="receiveInfo" items="${receiveInfo}">
                                            <c:if test="${receiveMessage.message_u_id == receiveInfo.u_id }">
                                            <td><a href="#signup" data-toggle="modal" data-target=".mSend2">${receiveInfo.u_name}</a></td>
                                            </c:if>
                                    </c:forEach>
                                            <td>${receiveMessage.message_Comment}</td>
                                            <td>${receiveMessage.message_date}</td>
                                            <td>${receiveMessage.message_check}</td>
                                          	<td>
                                            <!-- 메세지 삭제 -->
                                            <form id="delMessage" method="post">
                                            <input type="hidden" id="message_id" name="message_id" value="${receiveMessage.message_id}">
                                            <input type="hidden" id="messageInfo" name="messageInfo" value="del_receive">
                                            </form>
                                            <button class="btn-primary" onclick="receiveDel()">삭제</button>
                                            </td>
                                        </tr>
                               	   </c:forEach>  
                                    </tbody>
                                </table>
					    </div>
					  <!--  보낸쪽지함 -->
					    <div role="tabpanel" class="tab-pane" id="profile">
					    <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>받는사람</th>
                                            <th>내용</th>
                                            <th>보낸날짜</th>
                                            <th>읽음 여부</th>
                                        </tr>
                                    </thead>
                                    <tbody id="postBody">
                                     <c:forEach var="postMessage" items="${postMessage}"> 
                                        <tr>
                                 	<c:forEach var="postInfo" items="${postInfo}">
                                            <c:if test="${postMessage.message_o_id == postInfo.u_id }">
                                            <td>${postInfo.u_name}</td>
                                            </c:if>
                                    </c:forEach>
                                            <td>${postMessage.message_Comment}</td>
                                            <td>${postMessage.message_date}</td>
                                            <td>${postMessage.message_check}</td>
                                        </tr>
                                  </c:forEach> 
                                    </tbody> 
                                </table>
					    </div>
                    </div>
                            </div>
                        </div>
                    </div>
                 </c:if>   
                    </div>
                </div>
                    </div>
                </div>
              <!--후기-->
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="chat-panel panel panel-default chat-boder chat-panel-head" >
                        <div class="panel-heading">
                               후기
                        </div>
      <!-- 본인 후기 출력  -->         
                        <div class="panel-body">
                           <c:if test="${fUsers == null}">
                             <c:forEach var="comment" items="${comment}" >
                                <c:forEach var="commentUsers" items="${commentUsers}">
                                       <c:if test="${comment.c_o_id == commentUsers.u_id}">
                                    <span class="chat-img pull-left">
                                        <img src="../img/${commentUsers.u_image}" alt="User" class="img-circle" width="30px" />
                                    </span>
                                    <div class="chat-body">                                        
                                            <strong >${commentUsers.u_name}(${commentUsers.u_email})</strong>
                                            <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i>${comment.c_date}
                                            </small>                                      
                                        <p>
                                        ${comment.c_comment}
                                        </p>
                                    </div>
                                    </c:if>
                           </c:forEach>
                               </c:forEach>
                            </c:if>
                    <!-- 친구후기 불러오기 -->        
                            <c:if test="${fUsers != null }">
                             <c:forEach var="fComment" items="${fComment}" >
                                <c:forEach var="fCommentUsers" items="${fCommentUsers}">
                                       <c:if test="${fComment.c_o_id == fCommentUsers.u_id}">
                                    <span class="chat-img pull-left">
                                        <img src="../img/${fCommentUsers.u_image}" alt="User" class="img-circle" width="30px" />
                                    </span>
                                    <div class="chat-body">                                        
                                            <strong >${fCommentUsers.u_name}(${fCommentUsers.u_email})</strong>
                                            <small class="pull-right text-muted">
                                                <i class="fa fa-clock-o fa-fw"></i>${fComment.c_date}
                                            </small>                                      
                                        <p>
                                        ${fComment.c_comment}
                                        </p>
                                    </div>
                                    </c:if>
                           </c:forEach>
                               </c:forEach>
                            </c:if>
                        </div>
                        <div class="panel-footer">
                            <form action="../page/mypage/mypageAfterOk.jsp" method="post">
                            <div class="input-group">
                               <input name="c_comment" type="text" class="form-control" placeholder="후기를 작성해주세요" />
                          <!-- fUsers == null 이면 본인이라는 소리 그래서 본인의 정보로 입력된다  -->
                               <c:if test="${fUsers == null }">
                                <input type="hidden" name="u_id" value="${users.u_id}">
                               </c:if> 
                          <!-- 친구로 접속했을때는 친구의 정보가 입력된다  -->
                               <c:if test="${fUsers != null }">
                                <input type="hidden" name="u_id" value="${fUsers.u_id}">
                               </c:if> 
                          <!-- c_o_id 가 로그인한사람  -->
                              <input type="hidden" name="c_o_id" value="${users.u_id}">
                                <span class="input-group-btn">
                                  <button class="btn btn-warning btn-sm">후기작성</button>
                                </span>
                            </div>
                            </form> 
                        </div>
                    </div>
                </div>
                </div>     
             </div>
            </div>
        </div>
        
  <!-- 계좌 모달 -->
  
  <!-- 계좌관리 -->
<!-- Modal -->
<div class="modal fade u_account" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
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
            <form class="form-horizontal" action="../page/mypage/mypageAccountOk.jsp?u_id=${users.u_id}" method="post">
            <fieldset>
            <div class="control-group">
              <label class="control-label" for="u_balance">입금액:</label>
              <div class="controls">
                <input id="u_balance" name="u_balance" type="text" class="form-control" placeholder="입금액을 적어주세요" class="input-medium" required="">
                 <input type="hidden" name="check" value="true"> 
              </div>
            </div>

            <!-- 입금버튼 -->
            <div class="control-group">
              <label class="control-label" for="signin"></label>
              <div class="controls">
                <button type="submit" id="signin" name="signin" class="btn btn-success">입금하기</button>
              </div>
            </div>
            </fieldset>
            </form>
            
            <!-- 출금폼 -->
             <form class="form-horizontal" action="../page/mypage/mypageAccountOk.jsp?u_id=${users.u_id}" method="post">
            <fieldset>
            <div class="control-group">
              <label class="control-label" for="u_balance">출금액:</label>
              <div class="controls">
                <input id="u_balance" name="u_balance" type="text" class="form-control" placeholder="출금액을 적어주세요" class="input-medium" required="">
                 <input type="hidden" name="check" value="false"> 
              </div>
            </div>

            <!-- 출금버튼 -->
            <div class="control-group">
              <label class="control-label" for="signin"></label>
              <div class="controls">
                <button type="submit" id="signin" name="signin" class="btn btn-success">출금하기</button>
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

<!-- 친구검색 모달 -->
<div class="modal fade autoSearch" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
         <h3 class="text-center">친구검색</h3>
         <input type="text" id="searchKey" class="col-md-12" placeholder="친구의 이름을 검색해주세요"/><Br>
           <div id="autoText">
         </div>
         <br><br><br><br><br><br><br><br><br><br><br><br><br>
    </div>
  </div>
</div>

<!-- 쪽지 보내기 -->
 <div class="modal fade mSend" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      	<h3 class="text-center">메세지보내기</h3>
      	<form method="post" id="mForm">
			<textarea rows="10" cols="39"  name="message_comment"></textarea>
			 <input type="hidden" name="message_o_id" value="${fUsers.u_id}">	
			 <input type="hidden" id="messageInfo" name="messageInfo" value="insert">
            <button type="submit" class="btn-block btn-primary" id="mBtn">메세지 보내기</button>
    	</form>
    </div>
  </div>
</div>

<c:if test="${fUsers == null}">
<a href="../layout/mainLayout.jsp?body=../page/mypage/mypageModify.jsp" class="text-right">수정하기</a>
</c:if>
</body>
</html>