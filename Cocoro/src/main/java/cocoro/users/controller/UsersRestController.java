package cocoro.users.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cocoro.users.domain.Comment;
import cocoro.users.domain.Users;
import cocoro.users.service.UsersServiceImpl;
import users.usersCRUD_Test;

@RestController
@RequestMapping("/rest")
public class UsersRestController {
	
	@Inject
	private UsersServiceImpl service;
	
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
}
	
