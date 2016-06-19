package cocoro.home.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cocoro.search.domain.tagSearch;
import cocoro.search.domain.tagSuggestion;
import cocoro.search.service.SearchServiceImpl;
import cocoro.study.domain.StudyGroup;
import cocoro.users.domain.Users;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private SearchServiceImpl service;
	
	
	//濡쒓렇�씤�쟾 湲곕낯 留듯븨
/*	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "beforeMain";
	}*/
	@RequestMapping(value = "/beforeMain", method = RequestMethod.GET)
	public String home(){
		return "beforeMain";
	}
	
	
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String Main(Model model,HttpSession session){
		
		List<tagSuggestion> list = null;
		List<StudyGroup> listS =null;
		Users users = (Users)session.getAttribute("users");
		
		String salut ="Cocoro에 오신걸 환영합니다";
		String nextPage="beforeMain";
		
		if(users!=null){
			
			try {
				System.out.println("~~");
				 System.out.println("whowho~! "+users.getU_tag());
				list = service.tagSuggest(users.getU_tag());
				listS = service.item_recommend(users.getU_id());
				
			    salut = users.getU_name()+"님 환영합니다";
			    nextPage ="afterMain";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		model.addAttribute("salut", salut);
		model.addAttribute("list",list);
		model.addAttribute("listS",listS);
		
		return nextPage;
	
	
	}
	
	//로그인 페이지
	@RequestMapping(value="/loginPage", method = RequestMethod.GET)
	public String loginPage(){
		return "loginPage";
	}
	
	//회원가입 페이지
	@RequestMapping(value="/joinPage", method = RequestMethod.GET)
	public String joinPage(){
		return "joinPage";
	}
	
	
	
	
	
}
