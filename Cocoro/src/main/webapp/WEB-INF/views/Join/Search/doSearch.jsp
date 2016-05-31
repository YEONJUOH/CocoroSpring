<%@page import="cocoro.studygroup.model.StudyGroup"%>
<%@page import="java.util.List"%>
<%@page import="cocoro.search.dao.SearchDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="search" class="cocoro.search.model.Search">
</jsp:useBean>
<jsp:setProperty property="*" name="search"/>

<%
System.out.print("\n메인검색"+search.toString());
 request.setAttribute("search", search);
 


 RequestDispatcher dispatcher = request.getRequestDispatcher("../../page/Search/SearchResult.jsp");
 dispatcher.forward(request, response); 
  

%>
