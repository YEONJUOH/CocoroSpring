package cocoro.home.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//로그인전 기본 맵핑
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "beforeMain";
	}
	//회원가입폼
	@RequestMapping(value="/join_form", method = RequestMethod.GET)
	public String insert(){
		return "join_form";
	}
	@RequestMapping("/home")
	public String home(){
		return "";
	}
	
	
	
	
	
	
}
