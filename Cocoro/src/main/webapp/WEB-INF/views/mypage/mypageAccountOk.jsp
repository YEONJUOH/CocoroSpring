<%@page import="java.io.PrintWriter"%>
<%@page import="cocoro.user.service.UsersActivityService"%>
<%@page import="cocoro.user.model.UsersAccount"%>
<%@page import="cocoro.user.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	    
<jsp:useBean id="usersAccount" class="cocoro.user.model.UsersAccount"></jsp:useBean>    
<jsp:setProperty property="*" name="usersAccount"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	//입금 출금을 플래그로 판단 
	String check = request.getParameter("check");
	int u_balance = Integer.parseInt(request.getParameter("u_balance"));
	int u_id = Integer.parseInt(request.getParameter("u_id"));	
	//서비스 선언
	UsersActivityService activityService = UsersActivityService.getInstance();
	//입금
	if(check.equals("true")){

	usersAccount.setU_balance(u_balance);
	usersAccount.setU_id(u_id);
	
	int re = activityService.usersAccountPlus(usersAccount);
	
	if(re > 0){
		System.out.println("입금 성공");
		session.setAttribute("usersAccount",usersAccount);
		response.sendRedirect("../../layout/mainLayout.jsp?body=../page/mypage/mypage.jsp");
	}
	}else{
		//입금한 잔액값
		usersAccount  = activityService.usersAccountInfo(u_id);

		//현재 회원의 잔액보다 입력한 값이 크면
		if(usersAccount.getU_balance() < u_balance){
			response.sendRedirect("../../layout/mainLayout.jsp?body=../page/mypage/mypage.jsp");
		}else{
			usersAccount.setU_balance(u_balance);
			usersAccount.setU_id(u_id);
			
			int re = activityService.usersAccountMinus(usersAccount);
			
			if(re > 0){
				System.out.println("출금 성공");
				session.setAttribute("usersAccount",usersAccount);
				response.sendRedirect("../../layout/mainLayout.jsp?body=../page/mypage/mypage.jsp");
			}
		}
	}
%>    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>