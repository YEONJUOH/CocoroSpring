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
import cocoro.study.domain.Attend;
import cocoro.study.domain.Board;
import cocoro.study.domain.MemberList;
import cocoro.study.domain.Penalty;
import cocoro.study.domain.PlanInfo;
import cocoro.study.domain.StudyActivity;
import cocoro.study.domain.StudyGroup;
import cocoro.users.domain.Users;
import cocoro.users.domain.UsersAccount;


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
		List callist = session.selectList(namespace + ".listCalendarService", s_id);
		for (int i = 0; i < callist.size(); i++) {
			String date = ((PlanInfo)callist.get(i)).getPlan_date();
			String cut = date.substring(0, 10);
			((PlanInfo)callist.get(i)).setPlan_date(cut);
		}
		return callist;
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

	@Override
	public int updateStudyActivity(Map<String, Integer> map) {
		return session.update(namespace+".updateStudyActivity", map);
	}

	@Override
	public PlanInfo selectPlan(PlanInfo pi) {
		return session.selectOne(namespace+".selectPlan", pi);
	}

	@Override
	public int attendinsert(Map<String, Integer> map) {
		return session.insert(namespace+".attendinsert", map);
	}

	@Override
	public Attend attendcheck(Map<String, Integer> map2) {
		return session.selectOne(namespace+".attendcheck", map2);
	}

	@Override
	public UsersAccount selectAccount(int u_id) {
		return session.selectOne(namespace+".selectAccount",u_id);
	}

	@Override
	public void updateStudyaccount(Map<String, Integer> map2) {
		session.update(namespace+".updateStudyaccount", map2);
		
	}

	@Override
	public void usersAccountdown(Map<String, Integer> map3) {
		session.update(namespace+".usersAccountdown", map3);
	}

	@Override
	public int insertpenalty(Penalty pen) {
		return session.insert(namespace+".insertpenalty", pen);
	}

	@Override
	public Penalty selectpenalty(Penalty pen) {
		return session.selectOne(namespace+".selectpenalty", pen);
	}

	@Override
	public List<Penalty> listpenalty(int s_id) {
		return session.selectList(namespace+".listpenalty", s_id);
	}

	@Override
	public List<PlanInfo> afterplan(PlanInfo pi) {
		return session.selectList(namespace+".afterplan", pi);
	}

	@Override
	public List<PlanInfo> beforeplan(PlanInfo pi) {
		return session.selectList(namespace+".beforeplan", pi);
	}

	@Override
	public int deleteschedule(int plan_id) {
		return session.delete(namespace+".deleteschedule", plan_id);
	}

	@Override
	public int updateschedule(PlanInfo pn) {
		return session.update(namespace+".updateschedule", pn);
	}

	@Override
	public List<MemberList> memberList(int s_id) {
		return session.selectList(namespace+".memberList", s_id);
	}

	@Override
	public int Forcedexit(int j_id) {
		return session.delete(namespace+".Forcedexit", j_id);
	}

	@Override
	public void deleteability(int j_id) {
		session.delete(namespace+".deleteability", j_id);
	}

	@Override
	public Users leaderimg(int s_leader_id) {
		return session.selectOne(namespace+".leaderimg", s_leader_id);
	}

	@Override
	public List<Board> boardlist(int s_id) {
		return session.selectList(namespace+".boardlist", s_id);
	}

	@Override
	public Board boardDetail(Board board) {
		return session.selectOne(namespace+".boardDetail", board);
	}

	@Override
	public void boardinput(Board board) {
		session.insert(namespace+".boardinput", board);
	}

	@Override
	public void boarddelete(int seq) {
		session.delete(namespace+".boarddelete", seq);
	}
	

	
}
