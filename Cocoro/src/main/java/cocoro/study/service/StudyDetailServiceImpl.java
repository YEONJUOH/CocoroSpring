package cocoro.study.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import cocoro.search.domain.Search;
import cocoro.study.domain.Apply;
import cocoro.study.domain.Applydata;
import cocoro.study.domain.PlanInfo;
import cocoro.study.domain.StudyActivity;
import cocoro.study.domain.StudyGroup;
import cocoro.study.persistance.StudyDetailDao;
import cocoro.users.domain.Users;

@Service
public class StudyDetailServiceImpl implements StudyDetailService {

	@Inject
	private StudyDetailDao dao;
	
	@Override
	public int creatStudy(StudyGroup studygroup) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSchedule(PlanInfo pi) {
		return dao.insertSchedule(pi);
	}

	@Override
	public List<Applydata> applyList(int s_id) {
		return dao.applyList(s_id);
	}

	@Override
	public int deleteApply(int apply_id) {
		return dao.deleteApply(apply_id);
	}

	@Override
	public Apply selectApply(int apply_id) {
		return dao.selectApply(apply_id);
	}

	@Override
	public int insertActivity(Apply apply) {
		return dao.insertActivity(apply);
	}

	//캘린더의 목록을 가지고 오기위한 구문
	@Override
	public List<PlanInfo> listCalendarService(int s_id) {
		return dao.listCalendarService(s_id);
	}

	@Override
	public StudyGroup choseStudy(int s_id) {
		return dao.choseStudy(s_id);
	}

	//지원한 스터디가 어디인지 확인하기위한 메서드
	@Override
	public StudyActivity selectActivity(Apply apply) {
		return dao.selectActivity(apply);
	}

	//스터디 가입 승인시 가입과 동시에 해당 레벨을 어빌 테이블에 입력하는 메서드
	@Override
	public int insertAbiliy(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return dao.insertAbiliy(map);
	}


}
