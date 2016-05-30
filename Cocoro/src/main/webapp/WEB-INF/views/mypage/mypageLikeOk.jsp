<%@page import="cocoro.user.model.Likes"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="cocoro.user.service.UsersActivityService"%>
<%@page import="cocoro.user.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Users users = (Users)session.getAttribute("users");

	int l_o_id = Integer.parseInt(request.getParameter("l_o_id"));
	String l_check = null;
	l_check = request.getParameter("l_check");

	System.out.println(request.getParameter("l_o_id"));
	System.out.println(users.getU_id());
	
	
	//좋아요 여부판단
	UsersActivityService activityService = UsersActivityService.getInstance();
	HashMap<String,Integer> usersLike = new HashMap<String,Integer>();
	usersLike.put("u_id", users.getU_id());
	usersLike.put("l_o_id", l_o_id);
	
	
	//이미 좋아요된 상태면 취소 아니면 인설트
	
	//좋아요
	if(l_check != null){
		//좋아요 인설트 
		System.out.println("왔니..?");
		activityService.usersLike(usersLike);
	    //해당회원 좋아요수 update
		activityService.usersLikeUpdate(l_o_id);
	    response.sendRedirect("../../layout/mainLayout.jsp?body=../page/mypage/mypage.jsp");
	}else{
		//UNLIKE 인설트  
		activityService.usersUnLike(usersLike);
		//해당회원 좋아요수 - 
		activityService.usersLikeMinusUpdate(l_o_id);
		response.sendRedirect("../../layout/mainLayout.jsp?body=../page/mypage/mypage.jsp");
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>