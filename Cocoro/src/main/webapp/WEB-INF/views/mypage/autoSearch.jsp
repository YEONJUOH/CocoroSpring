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
List<Users> usersList = activityService.autoSearch(searchKey);
System.out.println(usersList.size());

if(usersList != null){
	for(int i=0;i<usersList.size();i++){
		object = new JSONObject();
		object.put("u_name", usersList.get(i).getU_name());
		object.put("u_email", usersList.get(i).getU_email());
		object.put("u_id",usersList.get(i).getU_id());
		list.add(object);
		System.out.println(list.toString());
	}
	PrintWriter pw = response.getWriter();
    pw.print(list);
    pw.close();
}

%>
</body>
</html>