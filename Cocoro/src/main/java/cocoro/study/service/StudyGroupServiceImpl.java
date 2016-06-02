package cocoro.study.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import cocoro.study.domain.StudyGroup;
import cocoro.study.persistance.StudyGroupDao;

@Service
public class StudyGroupServiceImpl implements StudyGroupService {
	
	@Inject
	StudyGroupDao dao;

	@Override
	public void createStudy(StudyGroup studygroup) throws Exception {
		dao.createStudy(studygroup);
	}
	
	

}
