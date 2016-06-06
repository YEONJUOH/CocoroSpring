package cocoro.study.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import cocoro.study.domain.Apply;
import cocoro.study.domain.Applydata;
import cocoro.study.domain.PlanInfo;
import cocoro.study.domain.StudyActivity;
import cocoro.study.domain.StudyGroup;
import cocoro.study.service.StudyDetailService;
import cocoro.users.domain.Users;

@Controller
@RequestMapping("/StudyDetail/*")
public class StudyDetailController {

private static final Logger logger = LoggerFactory.getLogger(StudyDetailController.class);
	
	@Inject
	private StudyDetailService service;
	
	//studydetail.jsp에 들어가는 작업 부분
	//기존 USER session 정보와 파라메터로 넘어오는 s_id를 받아서 진행됨
	@RequestMapping("studydetail")
	public String StudyDetail(HttpServletRequest request,Model model) throws Exception{
		System.out.println("studydetail 컨트롤러");
		//스터디 번호 
		int s_id = 2;
		List<Applydata> list =  service.applyList(s_id);
		StudyGroup study =  service.choseStudy(s_id);
		model.addAttribute("list", list);
		model.addAttribute("study", study);
		model.addAttribute("s_id", s_id);
		return "studyview";
	}
	//캘린더 작업에서 스케줄 입력을 하는 작업 부분
	// users의 세션값 + 사용자가 선택한 스케줄을 입력함.Ajax로 연동
	@RequestMapping("insertschedule")
	public void insertschedule(PlanInfo plan,HttpServletRequest request)throws Exception{
		System.out.println("인서트다");
		service.insertSchedule(plan);	
	}
	//스터디룸에 입장버튼을 클리하면 작동하는 부분
	@RequestMapping("StudyRoom")
	public String StudyRoom()throws Exception{
		System.out.println("스터디룸 입장");
		return "/StudyDetail/StudyRoom";
	}
	
	//지원한 사람들을 승인하는 컨트롤러
	@RequestMapping("applygogo")
	public void applygogo(@RequestParam("apply_id") int apply_id )throws Exception{
		System.out.println("가입승인 컨트롤러");
		System.out.println("어플 아이디"+apply_id);
		 if(apply_id != 0){
		 	Apply apply = service.selectApply(apply_id);
		 	System.out.println("선텍된 어플라이"+apply.toString());
		 	int re = service.insertActivity(apply);
		 	StudyActivity  sa = service.selectActivity(apply);
		 	System.out.println(sa.toString());
		 	int j_id =sa.getJ_id();
		 	int rank = apply.getRank_for_apply();
		 	Map<String,Integer> map = new HashMap<String,Integer>();
		 	map.put("j_id", j_id);
		 	map.put("rank", rank);
		 	service.insertAbiliy(map); 
		 	int gogo = service.deleteApply(apply_id);

		 }
	}
	
	@RequestMapping("rejectgogo")
	public void rejectgogo(@RequestParam("apply_id") int apply_id )throws Exception{
		System.out.println("가입거부 컨트롤러");
 		int gogo = service.deleteApply(apply_id);
	}

	
	
	
}
