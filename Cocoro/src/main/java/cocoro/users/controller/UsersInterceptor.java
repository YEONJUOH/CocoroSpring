package cocoro.users.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UsersInterceptor extends HandlerInterceptorAdapter {
	//동작이전에 가로챈다
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	return true;
    }
    
    //지정된 컨트롤러의 동작 이후에 처리
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    	System.out.println("post 실행중 ..");
    	HttpSession session = request.getSession();
    	
    	ModelMap modelMap = modelAndView.getModelMap();
    	Object users = modelMap.get("users");
    	
    	if(users != null){
    		session.setAttribute("users", users);
    	}
    }
    
    //화면처리가완료된 후에 처리
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }
}
