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
	
	public int insertSchedule(PlanInfo pi);
	public List<Applydata> applyList(int s_id);
	public int deleteApply(int apply_id);
	public Apply selectApply(int apply_id);
	public int insertActivity(Apply apply);
	public List<PlanInfo> listCalendarService(int s_id);
	public StudyGroup choseStudy(int s_id);
	public StudyActivity selectActivity(Apply apply);
	public int insertAbiliy(Map<String, Integer> map);
}
