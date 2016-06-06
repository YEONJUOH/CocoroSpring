package cocoro.study.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import cocoro.study.domain.ListRank;
import cocoro.study.service.StudyGroupService;

@RestController
@RequestMapping("/study/*")
public class StudyRestController {
	
	@Inject
	private StudyGroupService service;
	
	@RequestMapping(value="rankAjax",method=RequestMethod.POST)
	public List<ListRank> rankAjax(@RequestParam("s_id") int s_id) throws Exception {
		System.out.println("여기오긴했니?1212");
		List<ListRank> list = service.listRank(s_id);
		System.out.println(list.toString());
		return list;
	}

}
