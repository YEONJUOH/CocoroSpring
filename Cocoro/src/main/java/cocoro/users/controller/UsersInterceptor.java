package cocoro.users.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cocoro.users.domain.Users;

public class UsersInterceptor extends HandlerInterceptorAdapter {
	private static final String users = "users";
	
	//동작이전에 가로챈다
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	HttpSession session = request.getSession();
    	System.out.println("pre....");
    	if(session.getAttribute(users) != null){
    		session.removeAttribute(users);
    	}
    	return true;
    }
    
    //지정된 컨트롤러의 동작 이후에 처리
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    	System.out.println("post 실행중 ..");
    	HttpSession session = request.getSession();
    	
    	ModelMap modelMap = modelAndView.getModelMap();
    	Users users = (Users) modelMap.get("users");
    	
    	if(users != null){
    		session.setAttribute("users", users);
    		response.sendRedirect("/");
    	}
    }
    
    //화면처리가완료된 후에 처리
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }
}
