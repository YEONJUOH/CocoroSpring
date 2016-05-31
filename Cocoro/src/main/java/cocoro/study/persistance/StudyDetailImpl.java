package cocoro.study.persistance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cocoro.search.domain.Search;
import cocoro.study.domain.Apply;
import cocoro.study.domain.Applydata;
import cocoro.study.domain.PlanInfo;
import cocoro.study.domain.StudyActivity;
import cocoro.study.domain.StudyGroup;
import cocoro.users.domain.Users;

@Repository
public class StudyDetailImpl implements StudyDetailDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "cocoro.mapper.StudyDatailMapper";
	
	@Override
	public List<StudyGroup> searchResult(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int createStudy(StudyGroup studygroup) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Integer selectS_id() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StudyGroup> listStudyGroup(StudyGroup studygroup) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudyGroup selectStudy(int s_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateHit(StudyGroup studygroup) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<StudyGroup> recommendStudy(List<Integer> listInt) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getSnum(String str) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Users selectUsers(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int applyStudy(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int creatStudy(StudyGroup studygroup) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSchedule(PlanInfo pi) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Applydata> applyListinfo(int s_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteApply(int apply_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Apply selectApply(int apply_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertActivity(Apply apply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List listCalendarService(int s_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudyGroup choseStudy(int s_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StudyActivity selectActivity(Apply apply) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertAbiliy(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
