package cocoro.study.persistance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cocoro.search.domain.SearchInfo;
import cocoro.study.domain.Apply;
import cocoro.study.domain.ListRank;
import cocoro.study.domain.StudyAccount;
import cocoro.study.domain.StudyActivity;
import cocoro.study.domain.StudyGroup;
import cocoro.users.domain.Users;
import cocoro.users.domain.UsersAccount;

@Repository
public class StudyGroupDaoImpl implements StudyGroupDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "cocoro.mapper.StudyGroupMapper";
	
	@Override
	public void createStudy(StudyGroup studygroup) {
		session.insert(namespace+".createStudy", studygroup);
	}
	

	@Override
	public int newStudy(int s_leader_id) {
		return session.selectOne(namespace+".newStudy", s_leader_id);
	}
	
	
	@Override
	public void insertS_leaderActivity(Map<String, Object> map) {
		session.insert(namespace+".insertS_leaderActivity", map);
	}
	
	@Override
	public int maxJ_id(int s_leader_id) {
		return session.selectOne(namespace+".maxJ_id", s_leader_id);
	}
	

	@Override
	public void insertS_leaderAbilityInfo(Map<String, Object> map2) {
		session.insert(namespace+".insertS_leaderAbilityInfo", map2);
	}
	
	@Override
	public StudyGroup selectStudy(int s_id) {
		return session.selectOne(namespace+".selectStudy", s_id);
	}
	

	@Override
	public Users selectUsers(Map<String, Object> map3) {
		return session.selectOne(namespace+".selectUsers", map3);
	}
	
	@Override
	public void enterStudy(Map<String, Object> map5) {
		session.insert(namespace+".enterStudy", map5);
	}
	
	@Override
	public StudyActivity check_enterStudy(Map<String, Object> map5) {
		return session.selectOne(namespace+".check_enterStudy", map5);
	}

	
	@Override
	public void applyStudy(Map<String, Object> map4) {
		session.insert(namespace+".applyStudy", map4);
	}
	

	@Override
	public Apply check_applying(Map<String, Object> map6) {
		return session.selectOne(namespace+".check_applying", map6);
	}
	

	@Override
	public List<ListRank> listRank(int s_id) {
		return session.selectList(namespace+".listRank", s_id);
	}
	

	@Override
	public void updateHit(int s_id) {
		session.update(namespace+".updateHit", s_id);
	}


	@Override
	public void updateS_leader_balance(UsersAccount usersaccount) {
		session.update(namespace+".updateS_leader_balance", usersaccount);
		
	}


	@Override
	public void createStudyAccount(StudyAccount studyAccount) {
		session.insert(namespace+".createStudyAccount", studyAccount);
	}

	
	@Override
	public void insert_searchinfo(Map<String, Object> map7) {
		session.insert(namespace+".insert_searchinfo", map7);
	}

	@Override
	public SearchInfo check_searchinfo(Map<String, Object> map7) {
		return session.selectOne(namespace+".check_searchinfo", map7);
	}


	@Override
	public void updatehit_searchinfo(Map<String, Object> map7) {
		session.update(namespace+".updatehit_searchinfo", map7);
	}


	@Override
	public void updatedate_searchinfo(Map<String, Object> map7) {
		session.update(namespace+".updatedate_searchinfo", map7);
	}
















	


	


	


	

}
