package cocoro.search.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cocoro.search.domain.Search;

@Controller
@RequestMapping("/search/*")
public class SearchController{

	@RequestMapping(value="/searchMain",method = RequestMethod.GET)
	public String searchMain(@ModelAttribute("search") Search search){
		System.out.println("값을 받음"+search.getSearchCtg());
		
		return "searchMain";
	}
	
	
	
	
}
