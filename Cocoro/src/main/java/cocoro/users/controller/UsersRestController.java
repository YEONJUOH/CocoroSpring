package cocoro.users.controller;

import java.io.File;
import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.util.JSONPObject;

import cocoro.users.domain.Comment;
import cocoro.users.domain.CommentUsers;
import cocoro.users.domain.Follow;
import cocoro.users.domain.HeaderMessageVo;
import cocoro.users.domain.Mento;
import cocoro.users.domain.Message;
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
		
		HashMap<String, String> login = new HashMap<String, String>();
		login.put("u_email",u_email);
		login.put("u_pwd", u_pwd);
		
		Users users = service.usersLogin(login);
		List<Message> receiveList = null;
		if(users != null){
		model.addAttribute("users",users);
		session.setAttribute("users", users);
		service.usersLoginTime(users.getU_id());
	  }
		return users;
	}
	
	/*
	 if(hList.getMessage_o_id() == hUlist.getU_id()){
				System.out.println("보낸사람이름 : " + hUlist.getU_name());
				System.out.println("보낸내용 :" + hList.getMessage_comment());
				
			}
	 */
	
	// 헤더 메세지 
	@RequestMapping(value = "/headerMessage" , method=RequestMethod.POST)
	public @ResponseBody List<Object> headerMessage(@RequestParam("u_id")int u_id,HeaderMessageVo headerMessageVo)throws Exception{
		List<Message> headerList = service.headerMessage(u_id);
		List<Users> headerUList = new ArrayList<Users>();
		
		List<Object> ob = new ArrayList<Object>();
		
		for(Message hList : headerList){
			Users hUlist = service.usersInfo(hList.getMessage_o_id());
			headerMessageVo = new HeaderMessageVo();
			
			 if(hList.getMessage_o_id() == hUlist.getU_id()){
					
					headerMessageVo.setMessage_comment(hList.getMessage_comment());
					headerMessageVo.setMessage_date(hList.getMessage_date());
					headerMessageVo.setMessage_o_id(hList.getMessage_o_id());
					headerMessageVo.setMessage_u_id(hList.getMessage_u_id());
					headerMessageVo.setU_id(hUlist.getU_id());
					headerMessageVo.setU_image(hUlist.getU_image());
					headerMessageVo.setU_name(hUlist.getU_name());
					
					ob.add(headerMessageVo);
				}
		}
		return ob;
	}
	//후기 댓글 
	@RequestMapping(value = "/commentUsers" , method=RequestMethod.POST)
	public @ResponseBody List<CommentUsers> commentUsers(@RequestParam("u_id")int u_id,@RequestParam("c_id")int c_id,
			@RequestParam("cu_comment")String cu_comment)throws Exception{
		//후기댓글 생성
		CommentUsers commentUsers = new CommentUsers();
		commentUsers.setC_id(c_id);
		commentUsers.setU_id(u_id);
		commentUsers.setCu_comment(cu_comment);
		
		service.commentUsers(commentUsers);
		List<CommentUsers> commentList = service.commentList(c_id);
		System.out.println(commentList.toString());
		
		return commentList;
	}
	
	//정보수정 
	@RequestMapping("/usersModify")
	public @ResponseBody Users usersModify(Users users, Mento mento,HttpSession session)throws Exception{
	
	//멘토를 하겠다고함
	if(!mento.getM_major().equals("")){
		
		String m_major = mento.getM_major();
		int u_id = users.getU_id();
		
		Mento mentoCheck = service.usersMentoCheck(users.getU_id());
		//멘토여부판단 null이 아니면 이미 멘토라는뜻 업데이트를 해준다
		if(mentoCheck != null){
			mentoCheck.setM_major(m_major);
			mentoCheck.setU_id(u_id);
			service.usersMentoUpdate(mentoCheck);
		}else{
			//멘토생성
			mento.setM_major(m_major);
			mento.setU_id(u_id);
			service.usersMento(mento);
		}
	}else{
		//멘토를 안하겠다고함 그런데 이미 멘토면 삭제를 해야함
		Mento mentoCheck = service.usersMentoCheck(users.getU_id());
		if(mentoCheck != null){
			service.usersMentoDelete(users.getU_id());
		}
	}
	service.usersModify(users);
	session.removeAttribute("users");
	users = service.usersInfo(users.getU_id());
	session.setAttribute("users", users);
	
	return users;
	}
	
	//입금
	@RequestMapping(value = "/inputAccount", method = RequestMethod.POST)
	public @ResponseBody UsersAccount usersAccountInput(UsersAccount usersAccount)throws Exception{
		UsersAccount accountCheck = new UsersAccount();
		
			service.usersAccountPlus(usersAccount);
			accountCheck = service.usersAccountInfo(usersAccount.getU_id());
			
		return accountCheck;
	}
	//출금
	@RequestMapping(value = "/outputAccount", method = RequestMethod.POST)
	public @ResponseBody UsersAccount usersAccountOutput(UsersAccount usersAccount)throws Exception{
	UsersAccount accountCheck = service.usersAccountInfo(usersAccount.getU_id());
		
		if(accountCheck.getU_balance() < usersAccount.getU_balance()){
			return null;
		}else{
			 service.usersAccountMinus(usersAccount);
			 accountCheck = service.usersAccountInfo(usersAccount.getU_id());
		}
		return accountCheck;
	}
	
	//팔로우 
			@RequestMapping(value="/follow",method = RequestMethod.POST)
			public List<Users> follow(@RequestParam("u_id")int u_id,@RequestParam("f_o_id")int f_o_id)throws Exception{
				HashMap<String, Integer> follow = new HashMap<String, Integer>();
				follow.put("f_o_id", u_id);
				follow.put("u_id", f_o_id);
				
				service.usersFollow(follow);
				
				List<Users> followList = service.usersFollowListYou(u_id);
				return followList;
			}
			
			//팔로우취소  
					@RequestMapping("/unFollow")
					public List<Users> unFollow(@RequestParam("u_id")int u_id,@RequestParam("f_o_id")int f_o_id,Model model)throws Exception{
						HashMap<String, Integer> unFollow = new HashMap<String, Integer>();
						unFollow.put("f_o_id", u_id);
						unFollow.put("u_id", f_o_id);
						
						System.out.println("내아이디"+ u_id);
						System.out.println("친구아이디"+f_o_id);
						
						Follow follow = service.usersFollowCheck(unFollow);
						
						//팔로워가 끊겼으니 null 을 리턴해준다 .
						model.addAttribute("follow",null);
						
						service.usersUnFollow(unFollow);
						
						List<Users> followList = service.usersFollowListYou(u_id);
						return followList;
					}
	 //친구 자동검색
	@RequestMapping("/autoSearch")
	public @ResponseBody List<Users> autoSearch(@RequestParam("searchKey")String searchKey)throws Exception{
		System.out.println(searchKey);
		
		List<Users> usersList = service.autoSearch(searchKey);
		
		return usersList;
	}
}
	
