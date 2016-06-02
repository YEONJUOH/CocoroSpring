package cocoro.study.persistance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cocoro.study.domain.StudyGroup;
import cocoro.users.domain.Users;



public interface StudyGroupDao {
	public void createStudy(StudyGroup studygroup);
	
	public Integer selectS_id();
	
	public List<StudyGroup> listStudyGroup(StudyGroup studygroup);
	
	public StudyGroup selectStudy(int s_id);
	
	public int updateHit(StudyGroup studygroup);
	
	public Users selectUsers(HashMap<String, Integer> map);
	
	public int applyStudy(HashMap<String, Integer> map);
	
	public List<Users> selectStudyMember(int s_id);
}
