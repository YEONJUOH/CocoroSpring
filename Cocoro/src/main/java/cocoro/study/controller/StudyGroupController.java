package cocoro.study.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cocoro.study.domain.Apply;
import cocoro.study.domain.ListRank;
import cocoro.study.domain.StudyActivity;
import cocoro.study.domain.StudyGroup;
import cocoro.study.service.StudyGroupService;
import cocoro.users.domain.Users;

@Controller
@RequestMapping("/study/*")
public class StudyGroupController {
	
	private static final Logger logger = LoggerFactory.getLogger(StudyGroupController.class);
	
	@Inject
	private StudyGroupService service;
	
	@RequestMapping(value="/createStudy", method = RequestMethod.GET)
	public void createStudyGET(StudyGroup studygroup) throws Exception{
	}
	
	@RequestMapping(value="/createStudy", method = RequestMethod.POST)
	public String createStudyPOST(
			@RequestParam("deposit_check") int deposit_check, 
			@RequestParam("t_start") String t_start,
			@RequestParam("t_end") String t_end,
			RedirectAttributes rttr, StudyGroup studygroup) throws Exception {
		
		// 디파짓 설정에 사용안함을 선택하였을 경우, DB에는 -1을 넣어준다. 
		if(deposit_check == -1)
		{
			studygroup.setS_deposit(-1);
		}
		
		// 스터디 시간을 설정하지 않았을 경우
		if(studygroup.getS_time_check().equals("F"))
		{
			studygroup.setS_t_end(0);
			studygroup.setS_t_start(0);
		}
		else
		{
			// 시간 타입 변경해서 DB에 넣기
			int s_t_start, s_t_end, s_t_hour, s_t_min, e_t_hour, e_t_min;
			
			
				String s_hour = t_start.substring(0,2);
				s_t_hour = Integer.parseInt(s_hour);
				
				String s_min = t_start.substring(3,5);
				s_t_min = Integer.parseInt(s_min);
				
				s_t_start = s_t_hour*60 + s_t_min;
				
				studygroup.setS_t_start(s_t_start);
			
	
				String e_hour = t_end.substring(0, 2);
				e_t_hour = Integer.parseInt(e_hour);
				
				String e_min = t_end.substring(3, 5);
				e_t_min = Integer.parseInt(e_min);
				
				s_t_end = e_t_hour*60 + e_t_min;
				
				studygroup.setS_t_end(s_t_end);
				
		}
		
		rttr.addFlashAttribute("studygroup", studygroup);
		return "redirect:/study/createStudy2";
	}
	
	@RequestMapping(value="/createStudy2",method = RequestMethod.GET)
	public void createStudy2GET(StudyGroup studygroup) throws Exception{
				
	}
	
	@RequestMapping(value="/createStudy2", method = RequestMethod.POST)
	public String createStudy2POST(
			@RequestParam("online") String online,
			@RequestParam("s_abil") int s_abil,
			StudyGroup studygroup) throws Exception {
		
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
		
		// 스터디 생성
		service.createStudy(studygroup);
		
		// 스터디 생성되면 스터디 리더가 자동 가입
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("s_id", service.newStudy(studygroup.getS_leader_id()));
		map.put("s_leader_id", studygroup.getS_leader_id());
		
		service.insertS_leaderActivity(map);
		
		// 실력조건 설정한 경우 스터디 리더가 가입되면서 스터디의 실력조건을 리더의 실력점수로 넣기
		if(studygroup.getS_abil_check()!=0)
		{
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("j_id", service.maxJ_id(studygroup.getS_leader_id()));
		map2.put("rank", studygroup.getS_abil_check());
		
		service.insertS_leaderAbilityInfo(map2);
		}
		
		return "redirect:/study/success";
	}
	
	@RequestMapping(value="/success", method = RequestMethod.GET)
	public void createStudy3GET(StudyGroup studygroup, Model model) throws Exception {
		System.out.println("ok3");	
	}
	
	@RequestMapping(value="/previewStudy", method = RequestMethod.GET)
	public void previewStudy(@RequestParam("s_id") int s_id, Model model)throws Exception{
		
		StudyGroup studygroup = service.selectStudy(s_id);
		
		   // 스터디 조회수 증가
		   service.updateHit(s_id);
		   
		   // 스터디 시간계산해서 뷰에 뿌려주기
		
		   int s_t_start = 0;	
		   int s_t_end = 0;
		   int start_hour = 0;
		   int start_min = 0;
		   int end_hour = 0;
		   int end_min = 0;
		   
	       s_t_start = studygroup.getS_t_start();
	       s_t_end = studygroup.getS_t_end();
	       start_hour = s_t_start/60;
	       start_min = s_t_start%60;
	       end_hour = s_t_end/60;
	       end_min = s_t_end%60;
	       
	    // 스터디 리더 정보 구하기
	       
	    Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put("s_id", s_id);
		map3.put("s_leader_id", studygroup.getS_leader_id());

	    Users leaderInfo = service.selectUsers(map3);
	       
		
	    model.addAttribute("start_hour", start_hour);
	    model.addAttribute("start_min", start_min);
	    model.addAttribute("end_hour", end_hour);
	    model.addAttribute("end_min", end_min);
		model.addAttribute("studygroup",studygroup);
		model.addAttribute("leaderInfo", leaderInfo);
	}
	

	
	
	@RequestMapping(value="/applyStudy", method = RequestMethod.GET)
	public String applyStudy(
			@RequestParam("s_id") int s_id,
			@RequestParam("u_id") int u_id,
			@RequestParam("rank_for_apply") int rank_for_apply	
			) throws Exception {
		Map<String, Object> map4 = new HashMap<String, Object>();
		map4.put("s_id", s_id);
		map4.put("u_id", u_id);
		map4.put("rank_for_apply", rank_for_apply);
		
		
		Map<String, Object> map6 = new HashMap<String, Object>();
		map6.put("s_id", s_id);
		map6.put("u_id", u_id);
		Apply check_applying = service.check_applying(map6);
		StudyActivity check_enterStudy = service.check_enterStudy(map6);
		
		if(check_applying != null)
		{
			return "redirect:/study/fail?s_id="+s_id;    // fail 페이지에서 이미 가입신청중인 스터디라는 얼럿창 띄워주고 메인으로 보내기 
		
		}
		else if(check_applying == null)
		{
			if(check_enterStudy == null)       // 현재 신청중도 아니고, 가입되지도 않은 경우에만 스터디 가입신청 가능
			{
				service.applyStudy(map4);
			}
			else
			{
				return "redirect:/study/fail2?s_id="+s_id;  // fail2 페이지에서 이미 가입된 스터디라는 얼럿창 띄워주고 메인으로 보내기
			}
		}
		return "redirect:/study/previewStudy?s_id="+s_id;
	}
	
	@RequestMapping(value="/enterStudy", method = RequestMethod.GET)
	public String enterStudy(
			@RequestParam("u_id") int u_id,
			@RequestParam("s_id") int s_id
			) throws Exception { 
		
		Map<String, Object> map5 = new HashMap<String, Object>();
		map5.put("u_id", u_id);
		map5.put("s_id", s_id);
		
		
		StudyActivity check_enterStudy = service.check_enterStudy(map5);
		if(check_enterStudy == null)
		{
			service.enterStudy(map5);   // 입장한적없으면 DB에 값 넣고 이동, 추후 개방형 스터디의 디테일 페이지로 이동하도록 수정
		}

		return "redirect:/study/previewStudy?s_id="+s_id;
	}
	
	@RequestMapping(value="/fail", method = RequestMethod.GET)
	public void fail(@RequestParam("s_id") int s_id) throws Exception {
		// 이미 신청중인 스터디에 중복신청했을 경우
	}
	
	@RequestMapping(value="/fail2", method = RequestMethod.GET)
	public void fail2(@RequestParam("s_id") int s_id) throws Exception {
		// 이미 가입된 스터디에 중복신청했을 경우
	}

}
