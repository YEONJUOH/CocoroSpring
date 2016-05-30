<%@page import="java.io.PrintWriter"%>
<%@page import="cocoro.user.model.Users"%>
<%@page import="java.util.List"%>
<%@page import="cocoro.user.service.UsersActivityService"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String searchKey = request.getParameter("searchKey");
System.out.println(searchKey);

JSONArray list = new JSONArray();
JSONObject object = null;

UsersActivityService activityService = UsersActivityService.getInstance();
Users users = null;

if (searchKey != null){
	users = activityService.joinSearch(searchKey);
	
	if(users == null){
		System.out.println("중복되지않아요");
	}else{
	if(searchKey.equals(users.getU_email())){
		object = new JSONObject();
		object.put("u_email", users.getU_email());
		list.add(object);
		System.out.println(users.toString());
		
	PrintWriter pw = response.getWriter();
    pw.print(list);
    pw.close();
	}
	}
}
%>
</body>
</html>