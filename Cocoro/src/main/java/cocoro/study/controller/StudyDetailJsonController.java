package cocoro.study.controller;

import java.sql.Date;
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

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import cocoro.study.domain.Applydata;
import cocoro.study.domain.Board;
import cocoro.study.domain.Penalty;
import cocoro.study.domain.PlanInfo;
import cocoro.study.domain.StudyGroup;
import cocoro.study.service.StudyDetailService;

@RestController
@RequestMapping("/StudyDetailJson/*")
public class StudyDetailJsonController {
	
	private static final Logger logger = LoggerFactory.getLogger(StudyDetailController.class);
	
	@Inject
	private StudyDetailService service;
	
	@RequestMapping("json-events22")
	public List<PlanInfo> jsonevents(@RequestParam("s_id")int s_id, Model model) throws Exception{
		System.out.println("jsonl 컨트롤러");
		return service.listCalendarService(s_id);
	}
	
	@RequestMapping("penaltyinput")
	public Penalty penaltyputer(@RequestParam("p_name") String p_name ,@RequestParam("p_price") int p_price,@RequestParam("s_id") int s_id ) throws Exception{
		System.out.println("왜안타는거니?");
		Penalty pen = new Penalty();
		pen.setP_name(p_name);
		pen.setP_price(p_price);
		pen.setS_id(s_id); 
		int g = service.insertpenalty(pen);
		if(g>0){
			 pen = service.selectpenalty(pen);
		}
		return pen;
	}
	@RequestMapping("deleteschedule")
	public void deleteschedule(@RequestParam("plan_id") int plan_id) throws Exception{
		System.out.println("JSON컨트롤러 스케줄삭제");
		int x = service.deleteschedule(plan_id);
	}
	
	@RequestMapping("updateschedule")
	public void updateschedule(PlanInfo pn) throws Exception{
		System.out.println("JSON컨트롤러 스케줄수정");
		int x = service.updateschedule(pn);
	}
	@RequestMapping("Forcedexit")
	public void Forcedexit(@RequestParam("j_id") int j_id)throws Exception{
		System.out.println("JSON컨트롤러 강퇴고고");
		int x = service.Forcedexit(j_id);
	}
	@RequestMapping("boardDetail")
	public Board boardDetail(Board board){
		System.out.println("JSON컨트롤러 상세정보");
		System.out.println(board.toString());
		Board boarddetail = service.boardDetail(board);
		return boarddetail;
	}
	@RequestMapping("boardinput")
	public void boardinput(Board board)throws Exception{
		System.out.println("JSON컨트롤러 공지글쓰기");
		System.out.println(board.toString());
		service.boardinput(board);
	}
	@RequestMapping("noticeDelete")
	public void noticeDelete(@RequestParam("seq") int seq)throws Exception{
		System.out.println("JSON컨트롤러 공지글삭제");
//		System.out.println(seq +" 컨트롤러의 seq입니당.");
		int o=service.boarddelete(seq);
	}
	
	@RequestMapping("studydeadLine")
	public void studydeadLine(@RequestParam("s_id") int s_id)throws Exception{
		System.out.println("JSON컨트롤러 스터디 모집 마감 ");
		 service.studydeadLine(s_id);
	}
}
