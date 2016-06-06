package cocoro.study.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cocoro.study.service.StudyGroupService;

@RestController
@RequestMapping("/study/*")
public class StudyRestController {
	
	@Inject
	StudyGroupService service;
	
	

}
