<%@page import="cocoro.user.model.Mento"%>
<%@page import="cocoro.user.model.Users"%>
<%@page import="cocoro.user.service.UsersActivityService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
%>
<jsp:useBean id="Users" class="cocoro.user.model.Users"></jsp:useBean>
<jsp:setProperty property="*" name="Users"/>

<jsp:useBean id="Mento" class="cocoro.user.model.Mento"></jsp:useBean>
<jsp:setProperty property="*" name="Mento"/>
<%
	int u_id = Integer.parseInt(request.getParameter("u_id"));	
	
	UsersActivityService activityService = UsersActivityService.getInstance();
	
	//이미지 업로드 
	 MultipartRequest multi = null;
	
	 String realFolder = "";
	 String filename = "";
	 int maxSize = 1024*1024*5;
	 String encType = "utf-8";
	 String savefile = "img";
	 ServletContext scontext = getServletContext();
	 realFolder = scontext.getRealPath(savefile);
	
	 try{
             multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		  	 Enumeration<?> files = multi.getFileNames();
		     String file1 = (String)files.nextElement();
		     filename = multi.getFilesystemName(file1);
		 } catch(Exception e) {
		  e.printStackTrace();
		 }
	
	String fullpath = realFolder + "\\" + filename;
	
	//유저 업데이트
	Users = activityService.usersInfo(u_id);
	Users.setU_id(Integer.parseInt(multi.getParameter("u_id")));
	Users.setU_intro(multi.getParameter("u_intro"));
	Users.setU_tag(multi.getParameter("u_tag"));
	Users.setU_address_check(multi.getParameter("u_address_check"));
	Users.setU_address(multi.getParameter("u_address"));
	Users.setU_birth_check(multi.getParameter("u_brith_check"));
	Users.setU_sns_address(multi.getParameter("u_sns_address"));
	Users.setU_mento_check(multi.getParameter("u_mento_check"));
	
	
	

	//이미지변경을 원하지않을때 디비에있는 값을 디폴트로 넣어준다
	String img = multi.getParameter("imgname");
	//이미지가 변경을 안할때
	if(filename == null){
		Users.setU_image(img);
	}else{
	//이미지 변경을 할 때
		Users.setU_image(filename);
	}
	
	int re = activityService.usersModify(Users);
	if(re >0){
	 System.out.println("성공");
	 session.setAttribute("users", Users);
	 response.sendRedirect("../../layout/mainLayout.jsp?body=../page/mypage/mypage.jsp"); 
	}else{
	 System.out.println("실패");
     response.sendRedirect("../../layout/mainLayout.jsp?body=../page/mypage/mypage.jsp");
	}
	
	//멘토 체크가 되있는 사람만 멘토인설트를 해준다.
	if(multi.getParameter("u_mento_check").equals("T")){
		//현재 멘토인가 여부 판단 
		Mento mento2 =  activityService.usersMentoCheck(Users.getU_id());
		//멘토 여부가 null 이면 멘토생성
		if(mento2 == null){
			Mento.setU_id(Users.getU_id());
			Mento.setM_major(multi.getParameter("m_major"));
			
			int mre = activityService.usersMento(Mento);
			if(mre > 0){
				session.setAttribute("mento", Mento);
				System.out.println("넌 이제부터 멘토야");
			}else{
				System.out.println("실패!");
			}
		}else{
			//이미 멘토인경우 업데이트를 해준다
			Mento.setU_id(Users.getU_id());
			Mento.setM_major(multi.getParameter("m_major"));
			
			int mre = activityService.usersMentoUpdate(Mento);
			if(mre > 0){
				session.setAttribute("mento", Mento);
				System.out.println("멘토업데이트 완료");
			}else{
				System.out.println("실패!");
			}
		}
		 //멘토여부에 F를 체크했을때 만약 멘토면 삭제
	}else{
		Mento mento2 = activityService.usersMentoCheck(Users.getU_id());
		if(mento2 != null){
			activityService.usersMentoDelete(Users.getU_id());
			session.setAttribute("mento", Mento);
		}
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