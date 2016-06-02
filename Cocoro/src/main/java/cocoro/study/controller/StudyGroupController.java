package cocoro.study.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cocoro.study.domain.StudyGroup;
import cocoro.study.service.StudyGroupService;

@Controller
@RequestMapping("/study/*")
public class StudyGroupController {
	
	private static final Logger logger = LoggerFactory.getLogger(StudyGroupController.class);
	
	@Inject
	private StudyGroupService service;
	
	@RequestMapping(value="/createStudy", method = RequestMethod.GET)
	public void createStudyGET(StudyGroup studygroup) throws Exception{
		System.out.println("ok");	
	}
	
	@RequestMapping(value="/createStudy", method = RequestMethod.POST)
	public String createStudyPOST(
			@RequestParam("deposit_check") int deposit_check, 
			@RequestParam("t_start") String t_start,
			@RequestParam("t_end") String t_end,
			Model model, StudyGroup studygroup) throws Exception {
		
		// 디파짓 설정에 사용안함을 선택하였을 경우, DB에는 -1을 넣어준다. 
		if(deposit_check == -1)
		{
			studygroup.setS_deposit(-1);
		}
		
		// 스터디 시간을 설정하지 않았을 경우, 폼2로는 NULL이 아닌 000000 상태로 보내준다.
		if(studygroup.getS_time_check().equals("F"))
		{
			t_start = "000000";
			t_end = "000000";
			model.addAttribute(t_start);
			model.addAttribute(t_end);
		}
		else if(studygroup.getS_time_check().equals("T"))
		{
			model.addAttribute(t_start);
			model.addAttribute(t_end);
		}
		
		model.addAttribute("studygroup", studygroup);
		return "redirect:/study/createStudy2";
	}
	
	@RequestMapping(value="/createStudy2", method = RequestMethod.GET)
	public void createStudy2GET(StudyGroup studygroup, Model model) throws Exception{
		System.out.println("ok2");	
	}
	
	@RequestMapping(value="/createStudy2", method = RequestMethod.POST)
	public String createStudy2POST(
			@RequestParam("t_start") String t_start,
			@RequestParam("t_end") String t_end,
			@RequestParam("online") String online,
			@RequestParam("s_abil") int s_abil,
			StudyGroup studygroup) throws Exception {
		
		
		// 시간 타입 변경해서 DB에 넣기
		int s_t_start, s_t_end, s_t_hour, s_t_min, e_t_hour, e_t_min;
		
		if(t_start != null)
		{
			String s_hour = t_start.substring(0,2);
			s_t_hour = Integer.parseInt(s_hour);
			
			String s_min = t_start.substring(3,5);
			s_t_min = Integer.parseInt(s_min);
			
			s_t_start = s_t_hour*60 + s_t_min;
			
			studygroup.setS_t_start(s_t_start);
		}
		
		if(t_end != null)
		{
			String e_hour = t_end.substring(0, 2);
			e_t_hour = Integer.parseInt(e_hour);
			
			String e_min = t_end.substring(3, 5);
			e_t_min = Integer.parseInt(e_min);
			
			s_t_end = e_t_hour*60 + e_t_min;
			
			studygroup.setS_t_end(s_t_end);
		}
		
		// 온라인 체크
		
			if(online.equals("T"))
			{
				studygroup.setS_online("T");
				studygroup.setS_offline("F");
			}
			else if(online.equals("F"))
			{
				studygroup.setS_online("F");
				studygroup.setS_offline("T");
			}
			else if(online.equals("B"))
			{
				studygroup.setS_online("T");
				studygroup.setS_offline("T");
			}
		
		// 실력 수치 입력
		if(studygroup.getS_abil_check()==-1)
		{
			studygroup.setS_abil_check(s_abil);
		}
		
		service.createStudy(studygroup);
		return "redirect:/study/success";
	}
	
	@RequestMapping(value="/success", method = RequestMethod.GET)
	public void createStudy3GET(StudyGroup studygroup, Model model) throws Exception {
		System.out.println("ok3");	
	}
	

}
