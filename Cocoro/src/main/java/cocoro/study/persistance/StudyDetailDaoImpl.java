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
public class StudyDetailDaoImpl implements StudyDetailDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "cocoro.mapper.StudyDatailMapper";


	@Override
	public int insertSchedule(PlanInfo pi) {
		return session.insert(namespace + ".insertSchedule", pi);
	}

	@Override
	public List<Applydata> applyList(int s_id) {
		return session.selectList(namespace + ".applyList", s_id);
	}

	@Override
	public int deleteApply(int apply_id) {
		return session.delete(namespace + ".deleteApply", apply_id);
	}

	@Override
	public Apply selectApply(int apply_id) {
		return session.selectOne(namespace + ".selectApply", apply_id);
	}

	@Override
	public int insertActivity(Apply apply) {
		return session.insert(namespace + ".insertActivity", apply);
	}

	@Override
	public List<PlanInfo> listCalendarService(int s_id) {
		return session.selectList(namespace + ".listCalendarService", s_id);
	}

	@Override
	public StudyGroup choseStudy(int s_id) {
		return session.selectOne(namespace + ".choseStudy", s_id);
	}

	@Override
	public StudyActivity selectActivity(Apply apply) {
		return session.selectOne(namespace+".selectActivity", apply);
	}

	@Override
	public int insertAbiliy(Map<String, Integer> map) {
		return session.insert(namespace + ".insertAbiliy", map);
	}
	

	
}
