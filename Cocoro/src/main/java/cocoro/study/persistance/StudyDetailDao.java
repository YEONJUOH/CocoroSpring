package cocoro.study.persistance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import cocoro.study.domain.Attend;

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
	public int updateStudyActivity(Map<String, Integer> map);
	public PlanInfo selectPlan(PlanInfo pi);
	public int attendinsert(Map<String, Integer> map);
	public Attend attendcheck(Map<String, Integer> map2);
	public UsersAccount selectAccount(int u_id);
	public void updateStudyaccount(Map<String, Integer> map2);
	public void usersAccountdown(Map<String, Integer> map3);
	public int insertpenalty(Penalty pen);
	public Penalty selectpenalty(Penalty pen);
	public List<Penalty> listpenalty(int s_id);
	public List<PlanInfo> afterplan(PlanInfo pi);
	public List<PlanInfo> beforeplan(PlanInfo pi);
	public int deleteschedule(int plan_id);
	public int updateschedule(PlanInfo pn);
	public List<MemberList> memberList(int s_id);
	public int Forcedexit(int j_id);
	public void deleteability(int j_id);
	public Users leaderimg(int s_leader_id);
	public List<Board> boardlist(int s_id);
	public Board boardDetail(Board board);
	public void boardinput(Board board);
	public void boarddelete(int seq);
}
