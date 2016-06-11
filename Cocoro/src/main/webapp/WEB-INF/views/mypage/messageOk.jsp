<%@page import="java.io.PrintWriter"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="cocoro.user.service.UsersActivityService"%>
<%@page import="cocoro.user.model.Message"%>
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
	System.out.println("오케이 ??");
	
	UsersActivityService activityService = UsersActivityService.getInstance();
	Users users = (Users)session.getAttribute("users");
	//같은 이름으로 3개가넘어옴 insert > 쪽지보내기 del_recive는 받은 메세지삭제 post_receive
	String messageInfo = request.getParameter("messageInfo");
	
	
	if(messageInfo.equals("insert")){
		
		Message message = new Message();
	
		int message_o_id = Integer.parseInt(request.getParameter("message_o_id"));
		String message_comment = request.getParameter("message_comment");
		
		message.setMessage_u_id(users.getU_id());
		message.setMessage_o_id(message_o_id);
		message.setMessage_Comment(message_comment);
		
		System.out.println(users.getU_id());
		System.out.println(message_o_id);
		System.out.println(message_comment);
		
		int re = activityService.sendMessage(message);
		
		if(re > 0){
			System.out.println("성공");
		}else{
			System.out.println("실패");
		}
	}else if(messageInfo.equals("del_receive")){
		//메세지 삭제
		System.out.println("넘어온값은 ? " );
		int message_id = Integer.parseInt(request.getParameter("message_id"));
		System.out.println("넘어온값은 ? " + message_id);
		int re = activityService.delMessage(message_id);
	
		JSONArray list = new JSONArray();
		JSONObject object = null;

		 //받은 메세지 목록
 	    List<Message> receiveMessage = activityService.receiveMessage(users.getU_id());
 	
 	     //받은 메세지를 보낸 친구의 정보
 	    List<Users> receiveInfo = activityService.receiveInfo(users.getU_id());
		
		if(receiveMessage != null){
			for(int i=0;i<receiveMessage.size();i++){
				object = new JSONObject();
				object.put("message_Comment", receiveMessage.get(i).getMessage_Comment());
				object.put("message_date", receiveMessage.get(i).getMessage_date());
				object.put("message_check",receiveMessage.get(i).getMessage_check());
				
				if(receiveMessage.get(i).getMessage_u_id() == receiveInfo.get(i).getU_id()){
					object.put("u_name",receiveInfo.get(i).getU_name());
				}
				
				list.add(object);
				System.out.println(list.toString());
			}
			PrintWriter pw = response.getWriter();
		    pw.print(list);
		    pw.close();
		}
	}
	%>
</body>
</html>