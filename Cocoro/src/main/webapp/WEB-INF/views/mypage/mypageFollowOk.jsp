<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.HashMap"%>
<%@page import="cocoro.user.service.UsersActivityService"%>
<%@page import="cocoro.user.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	//친구번호
	int f_o_id = Integer.parseInt(request.getParameter("f_o_id"));
	String f_check = request.getParameter("f_check");
	//마이페이지에서 팔로우 끊기를 눌렀을경우	
	String mypage = null;
	
	//현재 로그인 되어있는번호
	Users users = (Users)session.getAttribute("users");
	
	System.out.println("내이름"+users.getU_name());
	System.out.println("친구번호 "+f_o_id);
	
	HashMap<String,Integer> follow = new HashMap<String,Integer>();
	follow.put("u_id", users.getU_id());
	follow.put("f_o_id",f_o_id);
	
	UsersActivityService activityService = UsersActivityService.getInstance();
	
	  //true이면 팔로우 False면 팔로우 해제 
	if(f_check.equals("T")){
		int re = activityService.usersFollow(follow);
	
		if(re > 0){
			System.out.println("성공");
			response.sendRedirect("../../layout/mainLayout.jsp?body=../page/mypage/mypage.jsp");
		}else{
			System.out.println("실패 ");
			response.sendRedirect("../../layout/mainLayout.jsp?body=../page/mypage/mypage.jsp");
		}
		//마이페이지에서 언팔을 눌렀을때
	}else{
		int re = activityService.usersUnFollow(follow);
		
		if(re > 0){
			if(request.getParameter("mypage") != null){
			response.sendRedirect("../../layout/mainLayout.jsp?body=../page/mypage/mypage.jsp");
			}else{
			response.sendRedirect("../../layout/mainLayout.jsp?body=../page/mypage/mypage.jsp");
			}
		}else{
			response.sendRedirect("../../layout/mainLayout.jsp?body=../page/mypage/mypage.jsp");
		}
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>