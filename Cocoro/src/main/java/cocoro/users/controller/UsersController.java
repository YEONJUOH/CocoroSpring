package cocoro.users.controller;

import java.io.File;
import java.util.HashMap;
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
	public String mypage(Locale locale, Model model)throws Exception {
	return "mypage";
	}
	
		//후기 남기기
		@RequestMapping("/usersAfter")
		public void usersAfter(Comment comment, MultipartFile file)throws Exception{
		System.out.println("컨트롤러");
		System.out.println(file.getOriginalFilename());
		System.out.println(comment.getC_comment());

		//파일 업로드
		if(file != null){
			String saveName = uploadFile(file.getOriginalFilename(), file.getBytes());
			System.out.println(saveName);
			comment.setC_img(saveName);
			
		}
		service.usersAfter(comment);
		}

		private String uploadFile(String originalName , byte[] fileData)throws Exception{
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + originalName;
			File target = new File(uploadPath,saveName);
			FileCopyUtils.copy(fileData, target);
			return saveName;
		}
	
}
