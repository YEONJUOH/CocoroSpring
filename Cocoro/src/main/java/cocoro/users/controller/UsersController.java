package cocoro.users.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.apache.catalina.connector.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cocoro.users.domain.Comment;
import cocoro.users.domain.CommentUsers;
import cocoro.users.domain.Follow;
import cocoro.users.domain.Likes;
import cocoro.users.domain.LoginVo;
import cocoro.users.domain.Mento;
import cocoro.users.domain.Message;
import cocoro.users.domain.Users;
import cocoro.users.domain.UsersAccount;
import cocoro.users.domain.UsersJoinStudy;
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
	@RequestMapping(value="/insertUsers",method=RequestMethod.POST)
	public String insertUsers(Users users)throws Exception{
		System.out.println("회원가입폼");
		service.insertUsers(users);

		return "redirect:/users/joinLogin?u_email="+users.getU_email()+"&u_pwd="+users.getU_pwd()+"";
	}
	
	//회원가입
	@RequestMapping(value="/insertFacebook",method=RequestMethod.GET)
	public String insertFacebook(@RequestParam("u_name")String u_name,@RequestParam("u_email")String u_email,
			@RequestParam("u_sex")String u_sex)throws Exception{

		System.out.println("이름: "  +u_name);
		System.out.println("성별: "  +u_email);
		System.out.println("이메일: "  +u_sex);
		
		Users uCheck = service.joinOverlap(u_email);
		String re = null;
		// 중복검사 만약 아이디가 있다면 
		if(uCheck != null){
			re =  "redirect:/";
		}else{
			//아이디가 존재하지 않는다면
			Users users = new Users();
			
			users.setU_name(u_name);
			users.setU_email(u_email);
			
			if(u_sex.equals("male")){
				users.setU_sex("남");
			}else{
				users.setU_sex("여");
			}
			service.insertFacebook(users);
			
			re = "redirect:/users/joinLogin?u_email="+users.getU_email()+"&u_pwd=1234";
		}
		return re;
	}
	
	
	//회원가입하고 바로 로그인
	@RequestMapping("/joinLogin")
	public String joinLogin(@RequestParam("u_email")String u_email,@RequestParam("u_pwd")String u_pwd,HttpSession session,Model model)throws Exception{
		
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
		return "redirect:/users/afterMain";
	}

	
		//배경이미지 변경
			@RequestMapping("/usersBg")
			public String usersBg(@RequestParam("u_id")int u_id, MultipartFile fileBack,HttpSession session)throws Exception{
				Users users = new Users();
			
			//파일 업로드
				String u_bgimg = uploadFile(fileBack.getOriginalFilename(), fileBack.getBytes());

				System.out.println("넘어온 배경 "+ u_bgimg);
				System.out.println("넘어온 아이디 "+ u_id);
				
				users.setU_bgimg(u_bgimg);
				users.setU_id(u_id);
				
				service.usersBg(users);
				//실시간 갱신을 위해 새로운 세션을 넣음
				users = service.usersInfo(u_id);
				session.removeAttribute("users");
				session.setAttribute("users", users);
				
			return "redirect:/users/mypage?u_id="+u_id+"";
			}
			//프로필 변경
			@RequestMapping("/usersProfile")
			public String usersProfile(@RequestParam("u_id")int u_id, MultipartFile fileProfile,HttpSession session)throws Exception{
				Users users = new Users();
			
			//파일 업로드
				String Profile = uploadFile(fileProfile.getOriginalFilename(), fileProfile.getBytes());

				System.out.println("넘어온 배경 "+ fileProfile);
				System.out.println("넘어온 아이디 "+ u_id);
				
				users.setU_image(Profile);
				users.setU_id(u_id);
				
				service.usersImg(users);
				//실시간 갱신을 위해 새로운 세션을 넣음
				users = service.usersInfo(u_id);
				session.removeAttribute("users");
				session.setAttribute("users", users);
				
			return "redirect:/users/mypage?u_id="+u_id+"";
			}
	
	//로그인 후 기본 맵핑
	@RequestMapping(value = "/afterMain", method = RequestMethod.GET)
	public String afterMain(Locale locale, Model model)throws Exception {
	return "afterMain";
	}
	
	//로그아웃 
	@RequestMapping("/logout")
	public String logout(HttpSession session)throws Exception {
	session.invalidate();
	return "redirect:/";
	}
	
	//마이페이지 
	@Transactional
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(@RequestParam("u_id")Integer u_id, Model model)throws Exception {
		System.out.println("유저번호" + u_id);
		
		//유저에게 남겨진 후기의수
		List<Comment> cList = service.usersAfterInfo(u_id);
		//후기를 남긴 회원의 정보
		List<Users> uList = service.usersAfterUsersInfo(u_id);
		//나를 팔로우중인 사람
		List<Users> followMe = service.usersFollowListMe(u_id);
		//내가 팔로우 중인사람
		List<Users> followYou = service.usersFollowListYou(u_id);
		//멘토판단
		Mento mento  = service.usersMentoCheck(u_id);
		if(mento != null){
			model.addAttribute("mento", mento);
		}
		
		//후기 모든 댓글
		List<CommentUsers> commentAllList = service.commentAllList();
		List<Users> usersList = service.usersList();
		model.addAttribute("usersList",usersList);
		if(commentAllList != null){
		model.addAttribute("commentAllList", commentAllList);	
		}
		
		//계좌정보 계좌가 없으면 생성해줘라
		UsersAccount usersAccount =  service.usersAccountInfo(u_id);
		if(usersAccount == null){
			//랜덤으로 계좌번호를 생성
			Random random = new Random();
	        int account = random.nextInt(9999)+1;
	        //계좌생성
	        UsersAccount createAccount = new UsersAccount();
	        createAccount.setU_account(account);
	        createAccount.setU_id(u_id);
	        service.usersAccount(createAccount);
	        // 해당회원의 계좌를 조회해서 값을 넘겨준다
	        usersAccount = service.usersAccountInfo(u_id);
			
			model.addAttribute("usersAccount",usersAccount);
		}
		//내가 가입한 스터디의 리스트
		List<UsersJoinStudy> studyList = service.studyList(u_id);
		if(studyList != null){
			model.addAttribute("studyList", studyList);
		}
		System.out.println(studyList.toString());
		model.addAttribute("usersAccount", usersAccount);
		model.addAttribute("cList", cList);
		model.addAttribute("uList", uList);
		model.addAttribute("followMe", followMe);
		model.addAttribute("followYou", followYou);
		model.addAttribute("studyList", studyList);
	return "mypage";
	} 
	
	//친구페이지 
		@Transactional
		@RequestMapping(value = "/friendPage", method = {RequestMethod.POST,RequestMethod.GET})
		public String friednPage(@RequestParam("u_id")Integer u_id,@RequestParam("f_o_id")Integer f_o_id,Model model)throws Exception {
			System.out.println("친구번호" + f_o_id);
			System.out.println("내번호" +  u_id);
			
			//유저에게 남겨진 후기의수
			List<Comment> cList = service.usersAfterInfo(f_o_id);
			//후기를 남긴 회원의 정보
			List<Users> uList = service.usersAfterUsersInfo(f_o_id);
			//나를 팔로우중인 사람
			List<Users> followMe = service.usersFollowListMe(f_o_id);
			//내가 팔로우 중인사람
			List<Users> followYou = service.usersFollowListYou(f_o_id);
			Users fUsers = service.usersInfo(f_o_id);
			//팔로우체크
			HashMap<String, Integer> followCheck = new HashMap<String, Integer>();
			followCheck.put("f_o_id", u_id);
			followCheck.put("u_id", f_o_id);
			Follow follow = service.usersFollowCheck(followCheck);
			
			if(follow != null){
				model.addAttribute("follow",follow);
			}
			//좋아요 체크
			HashMap<String, Integer> likes = new HashMap<String, Integer>();
			likes.put("u_id", f_o_id);
			likes.put("l_o_id", u_id);
			Likes likeCheck =  service.usersLikeCheck(likes);
			
			if(likeCheck != null){
				model.addAttribute("likes",likes);
			}else{
				System.out.println("좋아요관계가 아닙니다");
			}
			
			//멘토판단
			Mento mento  = service.usersMentoCheck(f_o_id);
			if(mento != null){
				model.addAttribute("mento", mento);
			}
			
			//후기 모든 댓글
			List<CommentUsers> commentAllList = service.commentAllList();
			List<Users> usersList = service.usersList();
			model.addAttribute("usersList",usersList);
			if(commentAllList != null){
			model.addAttribute("commentAllList", commentAllList);	
			}
			
			//쪽지
			HashMap<String, Integer> oneMyMessage = new HashMap<String, Integer>();
			oneMyMessage.put("message_u_id", u_id);
			oneMyMessage.put("message_o_id", f_o_id);
			//내가 보낸메세지
			
			List<Message> oneMyList = service.oneMyMessage(oneMyMessage);
			
			for(Message MyList : oneMyList){
				System.out.println("받는사람 " + MyList.getMessage_u_id() + "받은 메세지 :" + MyList.getMessage_comment());
			}
			//내가 가입한 스터디의 리스트
			List<UsersJoinStudy> studyList = service.studyList(f_o_id);
			if(studyList != null ){
				model.addAttribute("studyList", studyList);
			}else{
				model.addAttribute("studyList", null);
			}
			System.out.println(studyList.toString());
			
			model.addAttribute("oneMyList" ,oneMyList);
			model.addAttribute("fUsers", fUsers);
			model.addAttribute("cList", cList);
			model.addAttribute("uList", uList);
			model.addAttribute("followMe", followMe);
			model.addAttribute("followYou", followYou);
			
		return "friendPage";
		}
		
		
		//팔로우 
		@RequestMapping(value="/follow",method = RequestMethod.POST)
		public void follow(@RequestParam("u_id")int u_id,@RequestParam("f_o_id")int f_o_id)throws Exception{
			HashMap<String, Integer> follow = new HashMap<String, Integer>();
			System.out.println("내아이디"+ u_id);
			System.out.println("친구아이디"+ f_o_id);
			follow.put("f_o_id", u_id);
			follow.put("u_id", f_o_id);
			
			service.usersFollow(follow);
		}
		//팔로우취소  
				@RequestMapping("/unFollow")
				public void unFollow(@RequestParam("u_id")int u_id,@RequestParam("f_o_id")int f_o_id,Model model)throws Exception{
					HashMap<String, Integer> unFollow = new HashMap<String, Integer>();
					unFollow.put("f_o_id", u_id);
					unFollow.put("u_id", f_o_id);
					
					Follow follow = service.usersFollowCheck(unFollow);
					
					//팔로워가 끊겼으니 null 을 리턴해준다 .
					model.addAttribute("follow",null);
					
					service.usersUnFollow(unFollow);
				}
				//좋아요누르기  
				@Transactional
				@RequestMapping("/usersLikes")
				public void usersLikes(@RequestParam("u_id")int u_id,@RequestParam("l_o_id")int l_o_id,Model model)throws Exception{
					HashMap<String, Integer> usersLikes = new HashMap<String, Integer>();
					usersLikes.put("l_o_id", u_id);
					usersLikes.put("u_id", l_o_id);
					// 좋아요 수 + 
					service.usersLikeUpdate(l_o_id);
					service.usersLike(usersLikes);
				}
				//싫어요  
				@Transactional
				@RequestMapping("/usersUnLikes")
				public void usersUnLikes(@RequestParam("u_id")int u_id,@RequestParam("l_o_id")int l_o_id,Model model)throws Exception{
					HashMap<String, Integer> usersLikes = new HashMap<String, Integer>();
					usersLikes.put("l_o_id", u_id);
					usersLikes.put("u_id", l_o_id);
					
					// 좋아요수 - 
					service.usersLikeMinusUpdate(l_o_id);
					service.usersUnLike(usersLikes);
				}
		
		//후기 남기기
		@RequestMapping("/usersAfter")
		public @ResponseBody Comment usersAfter(Comment comment, MultipartFile file)throws Exception{
		String c_comment = comment.getC_comment();
		//c_comment = new String(c_comment.getBytes("8859_1"),"utf-8");
		//한글이 깨져서 인코딩을 해줌
		comment.setC_comment(c_comment);
		//파일 업로드
		if(!file.getOriginalFilename().equals("")){
			String saveName = uploadFile(file.getOriginalFilename(), file.getBytes());
			System.out.println(saveName);
			comment.setC_img(saveName);
		}else{
			comment.setC_img("");
		}
		System.out.println(file.getOriginalFilename());
		System.out.println("후기 : " + comment.getC_comment());
		//넘어온 파일이 없다면 null이들어간다.
		service.usersAfter(comment);
		
		return comment;
		}
		
		//쪽지 보내기 
		@RequestMapping("/mSendMessage")
		public @ResponseBody Message mSendMessage(Message message,@RequestParam("message_comment")String message_comment)throws Exception{
			
			message.setMessage_Comment(message_comment);
			service.sendMessage(message);
			
			return message;
		}
		// 버튼눌렸을때업데이트
		@Transactional
		@RequestMapping("/updateMessage")
		public @ResponseBody List<Message> updateMessage(@RequestParam("u_id")int message_u_id,@RequestParam("f_o_id")int message_o_id)throws Exception{
			
			HashMap<String, Integer> updateMessage = new HashMap<String, Integer>();
			updateMessage.put("message_u_id", message_u_id);
			updateMessage.put("message_o_id", message_o_id);
			
			service.updateMessage(updateMessage);
			//리스트 다시리턴
			List<Message> oneMyList = service.oneMyMessage(updateMessage);
			
			return oneMyList;
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
