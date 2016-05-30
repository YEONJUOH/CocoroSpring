<%@page import="java.io.PrintWriter"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.HashMap"%>
<%@page import="cocoro.user.model.Users"%>
<%@page import="java.util.List"%>
<%@page import="cocoro.user.service.UsersActivityService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String u_email = request.getParameter("u_email");
	String u_pwd = request.getParameter("u_pwd");
	JSONArray list = new JSONArray();
	JSONObject object = null;
	
	//넘어온 ID Pass를 해쉬맵에 저장
	HashMap<String, String> login = new HashMap<String, String>();
	login.put("u_email",u_email);
	login.put("u_pwd",u_pwd);
	
	//저장한 해쉬맵을 Login 메서드에 넣었습니다
	UsersActivityService activityService = UsersActivityService.getInstance();
	Users users = activityService.usersLogin(login);
 	
		//세션
		session.setAttribute("users",users);
		//로그인 시간
		activityService.usersLoginTime(users.getU_id());
		
		object = new JSONObject();
		object.put("users", users);
		list.add(object);
		
		PrintWriter pw = response.getWriter();
	    pw.print(list);
	    pw.close();
%>    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

</body>
</html>