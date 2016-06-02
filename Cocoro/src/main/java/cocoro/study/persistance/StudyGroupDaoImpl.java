package cocoro.study.persistance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cocoro.study.domain.StudyGroup;
import cocoro.users.domain.Users;

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
	public List<Users> selectStudyMember(int s_id) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
