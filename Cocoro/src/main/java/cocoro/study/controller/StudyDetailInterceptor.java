package cocoro.study.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import  org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cocoro.study.domain.Apply;
import cocoro.study.domain.StudyActivity;
import cocoro.study.service.StudyDetailService;
import cocoro.users.domain.Users;

public class StudyDetailInterceptor extends HandlerInterceptorAdapter {

	private static final String StudyDetail = "studydetail";
	
	@Inject
	private StudyDetailService service;
	private static Logger logger = LoggerFactory.getLogger(StudyDetailInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		session.getAttribute("users");
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Users users = (Users)session.getAttribute("users");
		if(session.getAttribute("users") == null){
			response.sendRedirect("/");
			return false;
		}else if(request.getParameter("s_id")==null){
			response.sendRedirect("/");
			return false;
		}else if(request.getParameter("s_id") != null && session.getAttribute("users") != null){
			int s_id = Integer.parseInt(request.getParameter("s_id"));
			int u_id = users.getU_id();
			Apply ap = new Apply();
			ap.setS_id(s_id);
			ap.setU_id(u_id);
			StudyActivity sa= service.selectActivity(ap);
			if(sa == null){
				response.sendRedirect("/");
				return false;
			}else{
				return true;
			}
		}else{
			return true;
		}
		
	}
	
	
}
