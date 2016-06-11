package cocoro.study.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import cocoro.study.domain.Apply;
import cocoro.study.domain.ListRank;
import cocoro.study.domain.StudyAccount;
import cocoro.study.domain.StudyActivity;
import cocoro.study.domain.StudyGroup;
import cocoro.study.persistance.StudyGroupDao;
import cocoro.study.persistance.StudyGroupDaoImpl;
import cocoro.users.domain.Users;
import cocoro.users.domain.UsersAccount;

@Service
public class StudyGroupServiceImpl implements StudyGroupService {
	
	@Inject
	private StudyGroupDaoImpl dao;
	
	
	@Override
	public void createStudy(StudyGroup studygroup) throws Exception {
		dao.createStudy(studygroup);
	}

	@Override
	public int newStudy(int s_leader_id) throws Exception {
		return dao.newStudy(s_leader_id);
	}

	@Override
	public void insertS_leaderActivity(Map<String, Object> map) throws Exception {
		dao.insertS_leaderActivity(map);
	}

	@Override
	public int maxJ_id(int s_leader_id) throws Exception {
		return dao.maxJ_id(s_leader_id);
	}

	@Override
	public void insertS_leaderAbilityInfo(Map<String, Object> map2) throws Exception {
		dao.insertS_leaderAbilityInfo(map2);
	}

	@Override
	public StudyGroup selectStudy(int s_id) throws Exception {
		return dao.selectStudy(s_id);
	}

	@Override
	public Users selectUsers(Map<String, Object> map3) throws Exception {
		return dao.selectUsers(map3);
	}

	@Override
	public void applyStudy(Map<String, Object> map4) throws Exception {
		dao.applyStudy(map4);
	}

	@Override
	public void enterStudy(Map<String, Object> map5) throws Exception {	
		dao.enterStudy(map5);
	}

	@Override
	public StudyActivity check_enterStudy(Map<String, Object> map5) throws Exception {
		return dao.check_enterStudy(map5);
	}

	@Override
	public Apply check_applying(Map<String, Object> map6) throws Exception {
		return dao.check_applying(map6);
	}

	@Override
	public void updateHit(int s_id) {
		dao.updateHit(s_id);
	}

	@Override
	public List<ListRank> listRank(int s_id) throws Exception {
		return dao.listRank(s_id);
	}

	@Override
	public void updateS_leader_balance(UsersAccount usersaccount) {
		dao.updateS_leader_balance(usersaccount);
	}

	@Override
	public void createStudyAccount(StudyAccount studyAccount) {
		dao.createStudyAccount(studyAccount);
		
	}

	

}
