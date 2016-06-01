package cocoro.users.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
	@RequestMapping(value="/insertUsers")
	public String insertUsers(Users users,HttpServletRequest request)throws Exception{
		
		System.out.println(users.getU_email());
		
		service.insertUsers(users);
		return "beforeMain";
	}
	
	
	
	
	
	

}
