<%@page import="cocoro.users.domain.Users"%>
<%@page import="cocoro.search.service.SearchService"%>
<%@page import="cocoro.search.persistence.SearchDAOImpl"%>
<%@page import="cocoro.study.domain.StudyGroup"%>
<%@page import="java.util.List"%>
<%@page import="cocoro.search.domain.Search"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/resources/css/SearchResult/SearchBody.css" rel="stylesheet">

<script type="text/javascript">
   
<%
   
   List<StudyGroup> list = (List)request.getAttribute("list");
   List<Users> listU = (List)request.getAttribute("listU");
   Users users = (Users)session.getAttribute("users");
   
   if(list!=null){%>
   $(function(){
      
      $("#study-icon").css("color","green");
      
      var html = '';
<%for(int i=0;i<list.size();i++){%>
      html +='<div class="row"><div class="col-md-1"></div>';
      html +='<div class="col-md-9"><div class="well well-sm"><div class="row infoBox">';
      html +='<div class="col-xs-3 col-md-3 text-center ">';
      html +='<a href="../../study/previewStudy?s_id=<%=list.get(i).getS_id()%>"><img src="/resources/img/groupImg.PNG" alt="bootsnipp" class="img-rounded img-responsive" />';
      html+='</a>';
     
      html +='<div><a href="/study/previewStudy?s_id=<%=list.get(i).getS_id()%>"><span class="glyphicon glyphicon-info-sign"></span></a>';
      html+='<span class="glyphicon glyphicon-home"></span></div></div>';
      html +='<div class="col-xs-8 col-md-8 section-box"><h4><b>';
      
      html +='<%=list.get(i).getS_name()%></b></h4>';
      html += '<p><%=list.get(i).getS_intro()%></p>';
      html += '<div class="row rating-desc"><div class="col-md-12">';

        <%for(int j=0;j<list.get(i).getAttr().size();j++){%>
        html +='<span class="label label-default"><%=list.get(i).getAttr().get(j)%></span>&nbsp';
        <%}%>
        html+='</div><br><br>';
        <%if(list.get(i).getS_start()!=null){%>
        html+='<label><%=list.get(i).getS_start()%></label>~&nbsp<label><%=list.get(i).getS_end()%></label>';
        <%}%>
        html+='</div><div><br><hr/>';
          html+='<p><%=list.get(i).getS_tag()%></p>';
        html +='</div></div></div></div></div></div>';
      
<%}%>
   $("#main").append(html);})
<%}else if(listU!=null){%>

$(function(){
   
   $("#user-icon").css("color","green");
   var html = '';
<%for(int i=0;i<listU.size();i++){%>
    
   html+='<div class="row"><div class="col-md-1"></div><div class="col-md-9">';
   html+='<div class="well well-sm"><div class="row infoBox">';
   html+='<div class="col-xs-3 col-md-3 text-center ">';
   <% if(users.getU_id()!= listU.get(i).getU_id()){ %>
   html+='<a href="/users/friendPage?u_id=${users.u_id}&f_o_id=<%=listU.get(i).getU_id()%>"><img src="/resources/img/userPic.PNG" alt="bootsnipp" class="img-rounded img-responsive"/></a>';
   <%}else{%>
   html+='<a href="/users/mypage?u_id=${users.u_id}"><img src="/resources/img/userPic.PNG" alt="bootsnipp" class="img-rounded img-responsive"/></a>';
   <%}%>
    html+='<div><span class="glyphicon glyphicon-heart"></span><span id="heart-num"><%=listU.get(i).getU_like_num()%></span>';
    html+='</div></div><div class="col-xs-8 col-md-8 section-box">';
    html+='<h4><b><%=listU.get(i).getU_name()%></b><br></h4><p><%=listU.get(i).getU_intro()%></p>';
    html+='<hr /><div>';
    <%if(listU.get(i).getM_major()!=null){%>
    html+='<h5><b>멘토 활동 분야</b></h5><p><%=listU.get(i).getM_major()%></p>';<%}%>
    html+='<h5><b>관심사</b></h5><p><%=listU.get(i).getU_tag()%></p>';
    html+='</div></div></div></div></div></div>';
    
<%}%>
$("#main").append(html);})


   
<%}else{%>
$(function(){
$("#main").append("검색 결과가 없습니다.");})

<%} %>


   
</script>
</head>
<body>
   <div class="col-sm-8 col-sm-offset-4 col-md-9 col-md-offset-3 main"
      id="main">



   </div>
</body>
</html>