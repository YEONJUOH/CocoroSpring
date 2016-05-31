<%@page import="cocoro.user.model.Users"%>
<%@page import="cocoro.search.service.SearchService"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="cocoro.studygroup.model.StudyGroup"%>
<%@page import="java.util.List"%>
<%@page import="cocoro.search.dao.SearchDao"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="search" class="cocoro.search.model.Search">
</jsp:useBean>
<jsp:setProperty property="*" name="search"/>

<% //add
	SearchService service  = SearchService.getInstance();
     List<StudyGroup> list =null;
     List<Users> listU = null;
     if(search.getSearchCtg()!=null && search.getSearchCtg().equals("스터디")){
    	 list = service.searchStudy(search);
    	 System.out.print(list.toString());
    	 if(list != null && list.size() != 0){
    	      String json = JSONArray.fromObject(list).toString();
    	      out.print(json);}	 
     
     
     }
     if(search.getSearchCtg()!=null && search.getSearchCtg().equals("인물")){
    	 System.out.println("\n인물");
    	 listU = service.searchPeople(search);
    	 if(listU != null && listU.size() != 0){
    	      String json = JSONArray.fromObject(listU).toString();
    	      out.print(json);}
     }
%>
