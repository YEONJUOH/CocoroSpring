package cocoro.study.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import cocoro.study.service.StudyGroupService;
import cocoro.study.domain.Attend;
import cocoro.study.domain.Penalty;
import cocoro.users.domain.Users;
import cocoro.users.domain.UsersAccount;

@Controller
@RequestMapping("/StudyDetail/*")
public class StudyDetailController {

private static final Logger logger = LoggerFactory.getLogger(StudyDetailController.class);
	
	@Inject
	private StudyDetailService service;
	
	@Inject
	private StudyGroupService service2;
	
	//studydetail.jsp에 들어가는 작업 부분
	//기존 USER session 정보와 파라메터로 넘어오는 s_id를 받아서 진행됨
	@RequestMapping("studydetail")
	public String StudyDetail(HttpServletRequest request,Model model) throws Exception{
		System.out.println("studydetail 컨트롤러");
		//메소드 안에서 필요한것들을 생성해놓은 부분
		Date date = new Date();
		PlanInfo pi = new PlanInfo();
		SimpleDateFormat sdfNow = new SimpleDateFormat("yyyy/MM/dd");
		Apply ap = new Apply();
		
		//스터디홈페이지 접속한 유저 정보를 가지고온다.
		Users users = (Users)request.getSession().getAttribute("users");
		//스터디 번호 나중에 넘어오게될 파라메터를 지금은 일단 2라고 데이터를 박아 놓음
		int s_id = 13;
		int u_id = users.getU_id();
		ap.setS_id(s_id);
		ap.setU_id(u_id);
		//해당스터디의 오늘 스케줄이 있는지 없는지 가지고오는 문장
		String strNow = sdfNow.format(date);
		pi.setPlan_date(strNow);
		pi.setS_id(s_id);
		PlanInfo pi2=service.selectPlan(pi);
		 if(pi2 != null){
			 model.addAttribute("plan", pi2);
		 }
		//지난 일정과 미래의 일정을 가지고오는 부분
		List<PlanInfo> afdate = service.afterplan(pi);
		System.out.println(afdate.toString());
		List<PlanInfo> bedate =service.beforeplan(pi);
		System.out.println(bedate.toString());
		//스터디 홈페이지는 가입자만 들어올수 있다는 가정하에 users_id와 스터디 번호를 조합하여 studyactivitiy의 최근접속일을 업데이트한다.
		Map<String,Integer> map = new HashMap<String,Integer>();
	 	map.put("s_id", s_id);
	 	map.put("u_id", u_id);
	 	int g = service.updateStudyActivity(map);
	 	//출첵 처리를 위한 StudyActivity 정보 모델링
	 	StudyActivity sa = service.selectActivity(ap);
	 	//출첵 확인해볼까용?
	 	//스터디의 스케줄 출첵을 했는지 안했는지 알아보는 부분
	 	Map<String,Integer> map2 = new HashMap<String,Integer>();
	 	map2.put("j_id", sa.getJ_id());
	 	if(pi2 != null){
	 		map2.put("plan_id", pi.getPlan_id());
		 }else{
			 map2.put("plan_id", 0);
		 }
		Attend at = service.attendcheck(map2);
		//스터디 가입지원자들의 리스트를 출력해주는 문장
		List<Applydata> list =  service.applyList(s_id);
		//스터디 정보를 표시해주기위한 문장
		StudyGroup study =  service.choseStudy(s_id);
		//스터디 페널티 정보를 표시해주기 위한 문장
		List<Penalty> pn = service.listpenalty(s_id);
		//각각의 데이터를 바인딩하기 위한 문장
		model.addAttribute("Attend", at);
		model.addAttribute("studyactivitiy", sa);
		model.addAttribute("list", list);
		model.addAttribute("study", study);
		model.addAttribute("s_id", s_id);
		model.addAttribute("Penaltylist", pn);
		model.addAttribute("beforedate", bedate);
		model.addAttribute("afterdate", afdate);
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
		System.out.println("가입승인 컨트롤러 디파짓 안씀");
		 if(apply_id != 0){
			 //지원한 사람의 정보를 가지고온다 ( 실력,유저ID)
		 	Apply apply = service.selectApply(apply_id);
		 	//지원한 사람의 정보를 바탕으로 studyactivity테이블에 실력과 정보를 입력한다.
		 	int re = service.insertActivity(apply);
		 	//해당 입력한 activitiy의 j_id를 얻기위해 정보를 자기오는 문장
		 	StudyActivity  sa = service.selectActivity(apply);
		 	int j_id =sa.getJ_id();
		 	int rank = apply.getRank_for_apply();
		 	Map<String,Integer> map = new HashMap<String,Integer>();
		 	map.put("j_id", j_id);
		 	map.put("rank", rank);
		 	//스터디가입 인원의 실력정보를 입력하기 위해서 만들어진 문장
		 	service.insertAbiliy(map); 
		 	//승인 처리 이후에 지원했던 정보를 삭제해주는 문장
		 	int gogo = service.deleteApply(apply_id);
		 	
		 }
	}
	//지원한 사람들을 승인하는 컨트롤러(디파짓 사용)
		@RequestMapping("applygogoyesdepoist")
		public void applygogoyesdepoist(@RequestParam("apply_id") int apply_id )throws Exception{
			System.out.println("가입승인 컨트롤러 디파짓 사용");
			 if(apply_id != 0){
				 //지원한 사람의 정보를 가지고온다 ( 실력,유저ID)
				 System.out.println(apply_id);
			 	Apply apply = service.selectApply(apply_id);
			 	System.out.println(apply.toString()+"apply아이디");
			 	StudyGroup sg = service2.selectStudy(apply.getS_id());
			 	System.out.println(sg.toString()+"sg 값");
			 	UsersAccount ua = service.selectAccount(apply.getU_id());
			 	System.out.println(ua.toString()+"ua값");
			 	if(sg.getS_deposit() >0)
			 	{
			 		//가입지원자의 계정 정보를 확인하고 계정의 계좌에 돈을 확인후 처리하는부분
			 		if(ua.getU_balance()>= sg.getS_deposit()){
			 			Map<String,Integer> map2 = new HashMap<String,Integer>();
					 	map2.put("s_deposit", sg.getS_deposit());
					 	map2.put("s_id", sg.getS_id());
			 			service.updateStudyaccount(map2);
			 			Map<String,Integer> map3 = new HashMap<String,Integer>();
					 	map3.put("s_deposit", sg.getS_deposit());
					 	map3.put("u_id", apply.getU_id());
			 			service.usersAccountdown(map3);
			 			//지원한 사람의 정보를 바탕으로 studyactivity테이블에 실력과 정보를 입력한다.
					 	int re = service.insertActivity(apply);
					 	//해당 입력한 activitiy의 j_id를 얻기위해 정보를 자기오는 문장
					 	StudyActivity  sa = service.selectActivity(apply);
					 	int j_id =sa.getJ_id();
					 	int rank = apply.getRank_for_apply();
					 	Map<String,Integer> map = new HashMap<String,Integer>();
					 	map.put("j_id", j_id);
					 	map.put("rank", rank);
					 	//스터디가입 인원의 실력정보를 입력하기 위해서 만들어진 문장
					 	service.insertAbiliy(map); 
					 	//승인 처리 이후에 지원했던 정보를 삭제해주는 문장
					 	int gogo = service.deleteApply(apply_id);
			 		}
			 	}
			 }
		}
	//가입처리를 거절한다!! 
	@RequestMapping("rejectgogo")
	public void rejectgogo(@RequestParam("apply_id") int apply_id )throws Exception{
		System.out.println("가입거부 컨트롤러");
		//거절한다!! 삭제한다!!
 		int gogo = service.deleteApply(apply_id);
	}
	
	//출석체크를 처리한다!!
	@RequestMapping("Attend")
	public void Attendput(@RequestParam("plan_id") int plan_id,@RequestParam("j_id") int j_id)throws Exception{
		System.out.println("출석체크완료시키는부분");
		//출석을 시키는 부분
		Map<String,Integer> map = new HashMap<String,Integer>();
	 	map.put("j_id", j_id);
	 	map.put("plan_id", plan_id);
		int o = service.attendinsert(map);
	}
	
}
