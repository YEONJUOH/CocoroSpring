package cocoro.study.controller;

import java.util.List;
import java.util.Locale;

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
import cocoro.study.domain.PlanInfo;
import cocoro.study.domain.StudyGroup;
import cocoro.study.service.StudyDetailService;

@RestController
@RequestMapping("/StudyDetail/*")
public class StudyDetailJsonController {
	
	private static final Logger logger = LoggerFactory.getLogger(StudyDetailController.class);
	
	@Inject
	private StudyDetailService service;
	
	@RequestMapping("json-events22")
	public List<PlanInfo> jsonevents(@RequestParam("s_id")int s_id, Model model) throws Exception{
		System.out.println("jsonl 컨트롤러");
		return service.listCalendarService(s_id);
	}
}
