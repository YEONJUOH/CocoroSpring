package cocoro.study.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
import cocoro.study.persistance.StudyDetailDao;
import cocoro.users.domain.Users;
import cocoro.users.domain.UsersAccount;
import cocoro.study.domain.Attend;

@Service
public class StudyDetailServiceImpl implements StudyDetailService {

	@Inject
	private StudyDetailDao dao;
	

	@Override
	public int insertSchedule(PlanInfo pi) {
		return dao.insertSchedule(pi);
	}

	@Override
	public List<Applydata> applyList(int s_id) {
		return dao.applyList(s_id);
	}

	@Override
	public int deleteApply(int apply_id) {
		return dao.deleteApply(apply_id);
	}

	@Override
	public Apply selectApply(int apply_id) {
		return dao.selectApply(apply_id);
	}

	@Override
	public int insertActivity(Apply apply) {
		return dao.insertActivity(apply);
	}

	//캘린더의 목록을 가지고 오기위한 구문
	@Override
	public List<PlanInfo> listCalendarService(int s_id) {
		return dao.listCalendarService(s_id);
	}

	@Override
	public StudyGroup choseStudy(int s_id) {
		return dao.choseStudy(s_id);
	}

	//지원한 스터디가 어디인지 확인하기위한 메서드
	@Override
	public StudyActivity selectActivity(Apply apply) {
		return dao.selectActivity(apply);
	}

	//스터디 가입 승인시 가입과 동시에 해당 레벨을 어빌 테이블에 입력하는 메서드
	@Override
	public int insertAbiliy(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return dao.insertAbiliy(map);
	}

	@Override
	public int updateStudyActivity(Map<String, Integer> map) {
		return dao.updateStudyActivity(map);
		
	}

	@Override
	public PlanInfo selectPlan(PlanInfo pi) {
		return dao.selectPlan(pi);
	}

	@Override
	public int attendinsert(Map<String, Integer> map) {
		return dao.attendinsert(map);
	}

	@Override
	public Attend attendcheck(Map<String, Integer> map2) {
		return dao.attendcheck(map2);
	}

	@Override
	public UsersAccount selectAccount(int u_id) {
		return dao.selectAccount(u_id);
	}

	@Override
	public void updateStudyaccount(Map<String, Integer> map2) {
		dao.updateStudyaccount(map2);
		
	}

	@Override
	public void usersAccountdown(Map<String, Integer> map3) {
		dao.usersAccountdown(map3);
		
	}

	@Override
	public int insertpenalty(Penalty pen) {
		return dao.insertpenalty(pen);
	}

	@Override
	public Penalty selectpenalty(Penalty pen) {
		return dao.selectpenalty(pen);
	}

	@Override
	public List<Penalty> listpenalty(int s_id) {
		return dao.listpenalty(s_id);
	}

	@Override
	public List<PlanInfo> afterplan(PlanInfo pi) {
		return dao.afterplan(pi);
	}

	@Override
	public List<PlanInfo> beforeplan(PlanInfo pi) {
		return dao.beforeplan(pi);
	}

	@Override
	public int deleteschedule(int plan_id) {
		return dao.deleteschedule(plan_id);
	}

	@Override
	public int updateschedule(PlanInfo pn) {
		return dao.updateschedule(pn);
	}

	@Override
	public List<MemberList> memberList(int s_id) {
		return dao.memberList(s_id);
	}

	@Override
	public int Forcedexit(int j_id) {
		dao.deleteability(j_id);
		return dao.Forcedexit(j_id);
	}

	@Override
	public Users leaderimg(int s_leader_id) {
		return dao.leaderimg(s_leader_id);
	}

	@Override
	public List<Board> boardlist(int s_id) {
		return dao.boardlist(s_id);
	}

	@Override
	public Board boardDetail(Board board) {
		return dao.boardDetail(board);
	}

	@Override
	public void boardinput(Board board) {
		dao.boardinput(board);
		
	}

	@Override
	public void boarddelete(int seq) {
		dao.boarddelete(seq);
		
	}


}
