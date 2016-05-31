package cocoro.study.persistance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cocoro.search.domain.Search;
import cocoro.study.domain.Apply;
import cocoro.study.domain.Applydata;
import cocoro.study.domain.PlanInfo;
import cocoro.study.domain.StudyActivity;
import cocoro.study.domain.StudyGroup;
import cocoro.users.domain.Users;

public interface StudyDetailDao {
	public List<StudyGroup> searchResult(Search search);
	public int createStudy(StudyGroup studygroup);
	public Integer selectS_id();
	public List<StudyGroup> listStudyGroup(StudyGroup studygroup);
	public StudyGroup selectStudy(int s_id);
	public int updateHit(StudyGroup studygroup);
	public List<StudyGroup> recommendStudy(List<Integer> listInt);
	public int getSnum(String str);
	public Users selectUsers(HashMap<String, Integer> map);
	public int applyStudy(HashMap<String, Integer> map);
	
	public int creatStudy(StudyGroup studygroup);
	public int insertSchedule(PlanInfo pi);
	public List<Applydata> applyListinfo(int s_id);
	public int deleteApply(int apply_id);
	public Apply selectApply(int apply_id);
	public int insertActivity(Apply apply);
	public List listCalendarService(int s_id);
	public StudyGroup choseStudy(int s_id);
	public StudyActivity selectActivity(Apply apply);
	public int insertAbiliy(Map<String, Integer> map);
}
