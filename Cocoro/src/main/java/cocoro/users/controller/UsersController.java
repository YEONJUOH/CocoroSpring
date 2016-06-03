package cocoro.users.controller;

import java.util.HashMap;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cocoro.users.domain.LoginVo;
import cocoro.users.domain.Users;
import cocoro.users.service.UsersServiceImpl;

//users로 들오는 모든 맵핑을 받겠다.
@Controller
@RequestMapping("/users/*")
public class UsersController {
	
	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	//서비스 주입
	@Inject
	private UsersServiceImpl service;
	
	//회원가입
	@RequestMapping("/insertUsers")
	public String insertUsers(Users users)throws Exception{
		
		System.out.println(users.getU_email());
		
		service.insertUsers(users);
		return "redirect:beforeMain";
	}
	//유저 로그인
	@RequestMapping("/usersLogin")
	public @ResponseBody Users usersLogin(@RequestParam("u_email")String u_email,@RequestParam("u_pwd")String u_pwd,HttpSession session,Model model)throws Exception{
		System.out.println("로그인 컨트롤러");
		
		HashMap<String, String> login = new HashMap<String, String>();
		login.put("u_email",u_email);
		login.put("u_pwd", u_pwd);
		
		Users users = service.usersLogin(login);
		
		if(users != null){
		model.addAttribute("users",users);
		session.setAttribute("users", users);
		}
		return users;
	}
	
	//로그인 후 기본 맵핑
	@RequestMapping(value = "/afterMain", method = RequestMethod.GET)
	public String afterMain(Locale locale, Model model) {
	return "afterMain";
	}
	
	//마이페이지 
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model) {
	return "mypage";
	}
}
