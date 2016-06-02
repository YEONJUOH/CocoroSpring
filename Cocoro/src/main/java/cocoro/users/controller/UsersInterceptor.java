package cocoro.users.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UsersInterceptor extends HandlerInterceptorAdapter {
	//동작이전에 가로챈다
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	System.out.println("pre..");
    	try {
            //users이라는 세션key를 가진 정보가 널일경우 로그인페이지로 이동
            if(request.getSession().getAttribute("users") == null ){
                    response.sendRedirect("/"); 
                    return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("/redirect:afterMain"); 
        return true;
    }
    
    //지정된 컨트롤러의 동작 이후에 처리
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }
    
    //화면처리가완료된 후에 처리
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }
}
