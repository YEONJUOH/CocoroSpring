<%@page import="cocoro.user.service.UsersActivityService"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="Comment" class="cocoro.user.model.Comment"></jsp:useBean>
<jsp:setProperty property="*" name="Comment"/>
<%
	String c_comment = request.getParameter("c_comment");
	int u_id = Integer.parseInt(request.getParameter("u_id"));
	int c_o_id = Integer.parseInt(request.getParameter("c_o_id"));
	
	Comment.setC_comment(c_comment);
	Comment.setU_id(u_id);
	Comment.setC_o_id(c_o_id);
	
	UsersActivityService activityService = UsersActivityService.getInstance();
	int re = activityService.usersAfter(Comment);
	
	if(re > 0 ){
		System.out.println("인설트 성공");
		response.sendRedirect("../../layout/mainLayout.jsp?body=../page/mypage/mypage.jsp");
	}else{
		System.out.println("실패");
	}
%>
<body>

</body>
</html>