package cocoro.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import cocoro.search.domain.Search;
import cocoro.search.service.SearchServiceImpl;
import cocoro.study.domain.StudyGroup;
import cocoro.users.domain.Users;

@Controller
@RequestMapping("/search/*")
public class SearchController {

	
	@Inject
	private SearchServiceImpl service;
	
	@RequestMapping(value="/searchMain",method = RequestMethod.GET)
	public String searchMain(@ModelAttribute("search") Search search,Model model) throws Exception{
		
		
		 List<StudyGroup> list =null;
		 List<Users> listU =null;
		 
	    if(search.getSearchCtg()!=null && search.getSearchCtg().equals("스터디")){
	     list = service.searchStudy(search);
	    
	    }
	    if(search.getSearchCtg()!=null && search.getSearchCtg().equals("인물")){
	     listU = service.searchPeople(search);
	    }
	    
	    model.addAttribute("list",list);
	    model.addAttribute("listU",listU);
	    
	    
		return "searchMain";
	}
	
	

	@RequestMapping(value="/doAjax",method=RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> doAjax(@RequestBody Search search)throws Exception{
		
	    System.out.println("search: "+ search.toString());
		//System.out.println(request.getParameter("levelCheck"));
	
		
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<String, Object>();
		
		 if(search.getSearchCtg()!=null && search.getSearchCtg().equals("스터디")){
	    	List<StudyGroup> list = service.searchStudy(search);
	    	map.put("list", list);
	    	System.out.println(list.size()); 
	     
	     }
	     if(search.getSearchCtg()!=null && search.getSearchCtg().equals("인물")){
	    	List<Users> listU = service.searchPeople(search);
	    	map.put("list", listU);
	    	System.out.println("�ι�"+listU.size()); 
	    
	     }
	     
	   return  entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		
	}
	
	
	
	
	
}
