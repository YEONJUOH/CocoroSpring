package cocoro.users.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UsersInterceptor extends HandlerInterceptorAdapter {
	//동작이전에 가로챈다
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        try {
        	//세션이 없으면 메인으로 돌아가라
            if(request.getSession().getAttribute("Users") == null ){
                    response.sendRedirect("/"); 
                    return false;
            }else{
            	
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //admin 세션key 존재시 main 페이지 이동
        return true;
    }
    
    //지정된 컨트롤러의 동작 이후에 처리
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
    //화면처리가완료된 후에 처리
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }
}
