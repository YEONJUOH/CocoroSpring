<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%-- <%@page import="cocoro.studygroup.model.StudyActivity"%> --%>
<%-- <%@page import="cocoro.studygroup.model.Apply"%> --%>
<%-- <%@page import="cocoro.studygroup.service.StudyDetailService"%> --%>
<%-- <%@page import="org.json.simple.JSONArray"%> --%>
<%@page import="java.util.List"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int z =  Integer.parseInt(request.getParameter("apply_id")); 
	
// if(z != 0){
// 	StudyDetailService service = StudyDetailService.getInstance();
// 	Apply apply = service.selectApply(z); 
// 	int re = service.insertActivity(apply);
// 	StudyActivity sa = service.selectActivity(apply);
// 	System.out.println(sa);
// 	int j_id =sa.getJ_id();
// 	int rank = apply.getRank_for_apply();
// 	Map<String,Integer> map = new HashMap<String,Integer>();
// 	map.put("j_id", j_id);
// 	map.put("rank", rank);
// 	service.insertAbiliy(map); 
// 	int gogo = service.deleteApply(z);
//		int apt_APTGNo=m.getApt_APTGNo();
//		Object obj = service.listCalendarService(apt_APTGNo);
	
// }
	

	
%>

