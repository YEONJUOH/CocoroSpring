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
import cocoro.users.domain.Mento;
import cocoro.users.domain.Users;
import cocoro.users.domain.UsersAccount;
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
	
	//정보수정 
	@RequestMapping("/usersModify")
	public @ResponseBody Users usersModify(Users users, Mento mento)throws Exception{
	
	System.out.println(users.getU_id());
	System.out.println(users.getU_intro());
	System.out.println(users.getU_tag());
	System.out.println(users.getU_address_check());
	System.out.println("생일 "  + users.getU_birth_check());
	System.out.println(users.getU_sns_address());
	System.out.println(users.getU_mento_check());
	
	if(mento.getM_major() != null){
		System.out.println("멘토할라고?!");
	}
	//service.usersModify(users);
	return null;
	}
	
	//입금
	@RequestMapping(value = "/inputAccount", method = RequestMethod.POST)
	public @ResponseBody UsersAccount usersAccountInput(UsersAccount usersAccount)throws Exception{
		System.out.println("입금");
		
		UsersAccount accountCheck = new UsersAccount();
		
			service.usersAccountPlus(usersAccount);
			accountCheck = service.usersAccountInfo(usersAccount.getU_id());
			
		return accountCheck;
	}
	//출금
	@RequestMapping(value = "/outputAccount", method = RequestMethod.POST)
	public @ResponseBody UsersAccount usersAccountOutput(UsersAccount usersAccount)throws Exception{
		System.out.println("출금");
		
	UsersAccount accountCheck = service.usersAccountInfo(usersAccount.getU_id());
		
		if(accountCheck.getU_balance() < usersAccount.getU_balance()){
			return null;
		}else{
			 System.out.println("출금성공");
			 service.usersAccountMinus(usersAccount);
			 accountCheck = service.usersAccountInfo(usersAccount.getU_id());
		}
		return accountCheck;
	}
}
	
