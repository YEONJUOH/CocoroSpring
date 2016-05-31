<%@page import="cocoro.studygroup.model.StudyGroup"%>
<%@page import="java.util.List"%>
<%@page import="cocoro.search.service.SearchService"%>
<%@page import="cocoro.user.model.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 	
String header = "SearchHeader.jsp";


   if((Users)session.getAttribute("users")!=null){
		header = "SearchHeaderAfter.jsp";
		
		 }
		
		
		
	
	%>
	
	<jsp:include page="<%=header%>" /> 
	<jsp:include page="sidebar.jsp" />
    <jsp:include page="SearchBody.jsp" /> 

	
</body>
</html>