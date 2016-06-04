package cocoro.users.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cocoro.users.domain.Comment;
import cocoro.users.domain.Follow;
import cocoro.users.domain.LoginVo;
import cocoro.users.domain.Users;
import cocoro.users.service.UsersServiceImpl;

//users로 들오는 모든 맵핑을 받겠다.
@Controller
@RequestMapping("/users/*")
public class UsersController {

	@Resource(name="uploadPath")
	private String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	//서비스 주입
	@Inject
	private UsersServiceImpl service;
	
	//회원가입
	@RequestMapping("/insertUsers")
	public String insertUsers(Users users)throws Exception{
		service.insertUsers(users);
		return "redirect:beforeMain";
	}
	
	//로그인 후 기본 맵핑
	@RequestMapping(value = "/afterMain", method = RequestMethod.GET)
	public String afterMain(Locale locale, Model model)throws Exception {
	return "afterMain";
	}
	
	//마이페이지 
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(@RequestParam("u_id")Integer u_id, Model model)throws Exception {
		System.out.println("유저번호" + u_id);
		
		//유저에게 남겨진 후기의수
		List<Comment> cList = service.usersAfterInfo(u_id);
		//후기를 남긴 회원의 정보
		List<Users> uList = service.usersAfterUsersInfo(u_id);
		//내가 팔로우중인 사람
		List<Users> followMe = service.usersFollowListMe(u_id);
		//나를 팔로우 중인사람
		List<Users> followYou = service.usersFollowListYou(u_id);
		
		System.out.println("나를 팔로우하고있는 사람 :" + followMe.size());
		System.out.println("내가 팔로우하고있는 사람 :" + followYou.size());
		
		model.addAttribute("cList", cList);
		model.addAttribute("uList", uList);
		model.addAttribute("followMe", followMe);
		model.addAttribute("followYou", followYou);
		
	return "mypage";
	}
	//마이페이지 
		@RequestMapping(value = "/friendPage", method = RequestMethod.GET)
		public String friednPage(@RequestParam("u_id")Integer u_id,@RequestParam("f_o_id")Integer f_o_id,Model model)throws Exception {
			System.out.println("친구번호" + u_id);
			System.out.println("내번호" + f_o_id);
			//친구 입장에선 내가 친구니까 f_o_id 를 users session값을 사용하겠다.
			
			//유저에게 남겨진 후기의수
			List<Comment> cList = service.usersAfterInfo(u_id);
			//후기를 남긴 회원의 정보
			List<Users> uList = service.usersAfterUsersInfo(u_id);
			//내가 팔로우중인 사람
			List<Users> followMe = service.usersFollowListMe(u_id);
			//나를 팔로우 중인사람
			List<Users> followYou = service.usersFollowListYou(u_id);
			Users fUsers = service.usersInfo(u_id);
			//팔로우체크
			HashMap<String, Integer> followCheck = new HashMap<String, Integer>();
			followCheck.put("f_o_id",f_o_id);
			followCheck.put("u_id", u_id);
			Follow follow = service.usersFollowCheck(followCheck);
			
			if(follow != null){
				model.addAttribute("follow",follow);
				System.out.println("이미 팔로워에요");
			}
			
			model.addAttribute("fUsers", fUsers);
			model.addAttribute("cList", cList);
			model.addAttribute("uList", uList);
			model.addAttribute("followMe", followMe);
			model.addAttribute("followYou", followYou);
			
		return "friendPage";
		}
		
		//팔로우 
		@RequestMapping(value = "/follow")
		public void follow(@RequestParam("u_id")Integer u_id,@RequestParam("f_o_id")Integer f_o_id)throws Exception{
			HashMap<String, Integer> follow = new HashMap<String, Integer>();
			System.out.println("내아이디"+ f_o_id);
			System.out.println("친구아이디"+u_id);
			follow.put("f_o_id", f_o_id);
			follow.put("u_id", u_id);
			service.usersFollow(follow);
		}
		//팔로우취소  
				@RequestMapping(value = "/unFollow")
				public void unFollow(@RequestParam("u_id")Integer u_id,@RequestParam("f_o_id")Integer f_o_id,Model model)throws Exception{
					HashMap<String, Integer> unFollow = new HashMap<String, Integer>();
					unFollow.put("f_o_id", f_o_id);
					unFollow.put("u_id", u_id);
					
					System.out.println("내아이디"+ f_o_id);
					System.out.println("친구아이디"+u_id);
					
					Follow follow = service.usersFollowCheck(unFollow);
					
					//팔로워가 끊겼으니 null 을 리턴해준다 .
					model.addAttribute("follow",null);
					
					service.usersUnFollow(unFollow);
				}
		
		//후기 남기기
		@RequestMapping("/usersAfter")
		public void usersAfter(Comment comment, MultipartFile file)throws Exception{
		System.out.println(comment.getC_comment());
		System.out.println(comment.getC_o_id());
		System.out.println(comment.getU_id());
		
		//파일 업로드
		if(!file.getOriginalFilename().equals("")){
			String saveName = uploadFile(file.getOriginalFilename(), file.getBytes());
			System.out.println(saveName);
			comment.setC_img(saveName);
		}else{
			comment.setC_img("");
		}
		//넘어온 파일이 없다면 null이들어간다.
		
		service.usersAfter(comment);
		}
		//이미지 업로드시 중복될수 있는 이름 때문에
		private String uploadFile(String originalName , byte[] fileData)throws Exception{
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + originalName;
			File target = new File(uploadPath,saveName);
			FileCopyUtils.copy(fileData, target);
			return saveName;
		}
}
