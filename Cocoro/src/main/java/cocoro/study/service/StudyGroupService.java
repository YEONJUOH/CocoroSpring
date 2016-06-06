package cocoro.study.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cocoro.study.domain.Apply;
import cocoro.study.domain.ListRank;
import cocoro.study.domain.StudyActivity;
import cocoro.study.domain.StudyGroup;
import cocoro.users.domain.Users;

public interface StudyGroupService {
	
	public void createStudy(StudyGroup studygroup) throws Exception;
	
	public int newStudy(int s_leader_id) throws Exception;

	public void insertS_leaderActivity(Map<String, Object> map) throws Exception;
	
	public int maxJ_id(int s_leader_id) throws Exception;

	public void insertS_leaderAbilityInfo(Map<String, Object> map2) throws Exception;
	
	public StudyGroup selectStudy(int s_id) throws Exception;
	
	public Users selectUsers(Map<String, Object> map3) throws Exception;
	
	public void applyStudy(Map<String, Object> map4) throws Exception;

	public void enterStudy(Map<String, Object> map5) throws Exception;

	public StudyActivity check_enterStudy(Map<String, Object> map5) throws Exception;

	public Apply check_applying(Map<String, Object> map6) throws Exception;

	public void updateHit(int s_id) throws Exception;
	
	public List<ListRank> listRank(int s_id) throws Exception;
	
}
