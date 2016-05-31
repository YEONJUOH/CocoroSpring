<%@page import="cocoro.use.model.UsersAccount"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.HashMap"%>
<%@page import="cocoro.user.service.UsersActivityService"%>
<%@page import="cocoro.user.model.Users"%>
<%@page import="cocoro.user.service.UsersCRUDService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	    
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:useBean id="users" class="cocoro.user.model.Users"></jsp:useBean>
<jsp:setProperty property="*" name="users"/>
<%
	//회원가입 
   
	UsersCRUDService service = UsersCRUDService.getInstance();
	int re = service.insertUsers(users);
	
	if(re > 0){
		UsersActivityService activityService = UsersActivityService.getInstance();
		HashMap<String, String> login = new HashMap<String, String>();
		login.put("u_email",users.getU_email());
		login.put("u_pwd",users.getU_pwd());
		Users user = activityService.usersLogin(login);
		session.setAttribute("users",user);
	    response.sendRedirect("../../layout/mainLayout.jsp?body=../page/mypage/mypageModify.jsp");
	}else{
		response.sendRedirect("../../layout/mainLayout.jsp");
		System.out.println("실패");
	}
%>
</head>
<body>

</body>
</html>