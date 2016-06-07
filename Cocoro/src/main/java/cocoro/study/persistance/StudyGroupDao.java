package cocoro.study.persistance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cocoro.study.domain.Apply;
import cocoro.study.domain.ListRank;
import cocoro.study.domain.StudyActivity;
import cocoro.study.domain.StudyGroup;
import cocoro.users.domain.Users;



public interface StudyGroupDao {
	public void createStudy(StudyGroup studygroup);
	
	public int newStudy(int s_leader_id);

	public void insertS_leaderActivity(Map<String, Object> map);
	
	public Integer selectS_id();
	
	public List<StudyGroup> listStudyGroup(StudyGroup studygroup);
	
	public StudyGroup selectStudy(int s_id);
	
	public void updateHit(int s_id);
	
	public List<Users> selectStudyMember(int s_id);

	public int maxJ_id(int s_leader_id);

	public void insertS_leaderAbilityInfo(Map<String, Object> map2);

	public Users selectUsers(Map<String, Object> map3);

	public void applyStudy(Map<String, Object> map4);

	public void enterStudy(Map<String, Object> map5);

	public StudyActivity check_enterStudy(Map<String, Object> map5);

	public Apply check_applying(Map<String, Object> map6);

	public List<ListRank> listRank(int s_id);

}
