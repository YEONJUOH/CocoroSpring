<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- ������� -->
<tiles:insertAttribute name="header"/>

<!-- �׺���̼� -->
<tiles:insertAttribute name="navigator"/>
<!-- �ٵ𿵿� -->

<tiles:insertAttribute name="body"/>


<!-- Ǫ�Ϳ��� -->
<tiles:insertAttribute name="footer"/>
</body>
</html>