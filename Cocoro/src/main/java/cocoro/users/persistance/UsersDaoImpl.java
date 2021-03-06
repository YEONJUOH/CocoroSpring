package cocoro.users.persistance;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cocoro.users.domain.Comment;
import cocoro.users.domain.CommentUsers;
import cocoro.users.domain.Follow;
import cocoro.users.domain.Likes;
import cocoro.users.domain.Mento;
import cocoro.users.domain.Message;
import cocoro.users.domain.Users;
import cocoro.users.domain.UsersAccount;
import cocoro.users.domain.UsersJoinStudy;

//Respositroy 스프링에서 Dao를 인식할 수 있도록 해준다.
@Repository
public class UsersDaoImpl implements UsersDao {
	
	@Inject
	private SqlSession sqlsession;

	//맵퍼 네임스페이스
	private static final String namespace = "cocoro.mapper.UsersMapper";
	
	//인설트
	@Override
	public void insertUsers(Users users) {
		sqlsession.insert(namespace +".insertUsers",users);
	}
	//유저리스트
	@Override
	public List<Users> usersList() throws Exception {
		return sqlsession.selectList(namespace +".usersList");
	}
	//유저수정
	@Override
	public void usersModify(Users users) throws Exception {
		sqlsession.update(namespace +".usersModify",users);
	}
	//배경 수정
	@Override
	public void usersBg(Users users) throws Exception {
		sqlsession.update(namespace +".usersBg",users);
	}
	//프로필 수정
	@Override
	public void usersImg(Users users) throws Exception {
		sqlsession.update(namespace +".usersProfile",users);		
	}
	//유저삭제
	@Override
	public void delUsers(Integer u_id) throws Exception {
		sqlsession.delete(namespace +".delUsers",u_id);
	}
	//유저정보
	@Override
	public Users usersInfo(Integer u_id) throws Exception {
		return sqlsession.selectOne(namespace +".usersInfo",u_id);
	}
	//유저 로그인
	@Override
	public Users usersLogin(HashMap<String, String> login) throws Exception {
		return sqlsession.selectOne(namespace +".usersLogin",login);		
	}
	
	
	
	//멘토생성
	@Override
	public void usersMento(Mento mento) throws Exception {
		sqlsession.insert(namespace +".usersMento", mento);
	}
	//전체멘토 불러오기
	@Override
	public List<Mento> usersMentoList() throws Exception {
		return sqlsession.selectList(namespace +".usersMentoList");
	}
	//멘토링 여부
	@Override
	public Mento usersMentoCheck(int u_id) throws Exception {
		return sqlsession.selectOne(namespace +".usersMentoCheck",u_id);
	}
	//멘토 업데이트
	@Override
	public void usersMentoUpdate(Mento mento) throws Exception {
		sqlsession.update(namespace +".usersMentoUpdate", mento);
	}
	//멘토 삭제
	@Override
	public void usersMentoDelete(int u_id) throws Exception {
		sqlsession.delete(namespace +".usersMentoDelete" , u_id);
	}
	
	//팔로우하기
	@Override
	public void usersFollow(HashMap<String, Integer> follow) throws Exception {
		sqlsession.insert(namespace +".usersFollow" , follow);
	}
	//팔로우끊기 
	@Override
	public void usersUnFollow(HashMap<String, Integer> unFollow) throws Exception {
		sqlsession.delete(namespace+ ".usersUnFollow" , unFollow);
	}
	//나를 팔로우 중인 목록
	@Override
	public List<Users> usersFollowListMe(Integer u_id) throws Exception {
		return sqlsession.selectList(namespace+ ".usersFollowListMe", u_id); 
	}
	//내가 팔로우 중인 목록
	@Override
	public List<Users> usersFollowListYou(Integer f_o_id) throws Exception {
	    return sqlsession.selectList(namespace+ ".usersFollowListYou", f_o_id); 
	}
	//팔로우 체크
	public Follow usersFollowCheck(HashMap<String, Integer> followCheck)throws Exception{
		return sqlsession.selectOne(namespace + ".usersFollowCheck", followCheck);
	}
	//후기작성
	@Override
	public void usersAfter(Comment comment) throws Exception {
		sqlsession.insert(namespace +".usersAfter", comment);
	}
	//해당회원의 후기불러오기
	@Override
	public List<Comment> usersAfterInfo(Integer u_id) throws Exception {
		return sqlsession.selectList(namespace + ".usersAfterInfo",u_id);
	}
	//후기를 남긴 친구들의 정보
	@Override
	public List<Users> usersAfterUsersInfo(Integer u_id) throws Exception {
		return sqlsession.selectList(namespace +".usersAfterUsersInfo",u_id);
	}
	//쪽지 보내기
	@Override
	public void sendMessage(Message message) throws Exception {
		sqlsession.insert(namespace +".sendMessage" , message);
	}
	//좋아요 누르기 
	@Override
	public void usersLike(HashMap<String, Integer> usersLike) throws Exception {
		sqlsession.insert(namespace +".usersLike" ,usersLike);
	}
	//좋아요 취소
	@Override
	public void usersUnLike(HashMap<String, Integer> usersUnLike) throws Exception {
		sqlsession.delete(namespace +".usersUnLike" ,usersUnLike);
	}
	//좋아요 체크
	@Override
	public Likes usersLikeCheck(HashMap<String, Integer> usersLikeCheck) throws Exception {
		return sqlsession.selectOne(namespace + ".usersLikeCheck",usersLikeCheck);
		
	}
	//좋아요 할때마다 + 업데이트
	@Override
	public void usersLikeUpdate(int u_id) throws Exception {
		sqlsession.update(namespace + ".usersLikeUpdate" ,u_id);
	}
	//좋아요 할때마다 + 업데이트
	@Override
	public void usersLikeMinusUpdate(int u_id) throws Exception {
		sqlsession.update(namespace + ".usersLikeMinusUpdate" ,u_id);
	}
	//계좌생성
	@Override
	public void usersAccount(UsersAccount usersAccount) throws Exception {
		sqlsession.insert(namespace +".usersAccount", usersAccount);
	}
	//해당 회원의 계좌 불러오기
	@Override
	public UsersAccount usersAccountInfo(int u_id) throws Exception {
		return sqlsession.selectOne(namespace +".usersAccountInfo" , u_id);
	}
	//회원들의 계좌불러오기
	@Override
	public List<UsersAccount> usersAccountNumber() throws Exception {
		return sqlsession.selectList(namespace +".usersAccountNumber");
	}
	//입금
	@Override
	public void usersAccountPlus(UsersAccount usersAccount) throws Exception {
		sqlsession.update(namespace +".usersAccountPlus", usersAccount);
	}
	//출금
	@Override
	public void usersAccountMinus(UsersAccount usersAccount) throws Exception {
		sqlsession.update(namespace +".usersAccountMinus", usersAccount);
	}
	//후기댓글
	@Override
	public void commentUsers(CommentUsers commentUsers) throws Exception {
		sqlsession.insert(namespace +".commentUsers", commentUsers);
	}
	//댓글 불러오기
	@Override
	public List<CommentUsers> commentList(int c_id) throws Exception {
		return sqlsession.selectList(namespace +".commentList", c_id);
	}
	//댓글단 사람의 정보
	@Override
	public List<Users> commentUserList(int c_id) throws Exception {
		return sqlsession.selectList(namespace + ".commentUserList",c_id);
	}
	//모든댓글
	@Override
	public List<CommentUsers> commentAllList() throws Exception {
		return sqlsession.selectList(namespace +".commentAllList");
	}
	//받은쪽지
	@Override
	public List<Message> receiveMessage(int message_u_id) throws Exception {
		return sqlsession.selectList(namespace + ".receiveMessage",message_u_id);
	}
	//받은쪽지(보낸사람의 정보)
	@Override
	public List<Users> receiveInfo(int message_u_id) throws Exception {
		return sqlsession.selectList(namespace + ".receiveInfo",message_u_id);
	}
	//보낸쪽지
	@Override
	public List<Message> postMessage(int message_o_id) throws Exception {
		return sqlsession.selectList(namespace + ".postMessage" , message_o_id);
	}
	//보낸쪽지(받는사람의 정보)
	@Override
	public List<Users> postInfo(int u_id) throws Exception {
		return sqlsession.selectList(namespace +".postInfo" , u_id);
	}
	//1대1 내가 받은 메세지
	@Override
	public List<Message> oneMyMessage(HashMap<String, Integer> oneMyMessage) throws Exception {
		return sqlsession.selectList(namespace +".oneMyMessage", oneMyMessage);
	}
	//1댑 내가 보낸 메세지
	@Override
	public List<Message> oneYouMessage(HashMap<String, Integer> oneYouMessage) throws Exception {
		return sqlsession.selectList(namespace +".oneYouMessage",oneYouMessage);
	}
	//메세지 업데이트
	@Override
	public void updateMessage(HashMap<String, Integer> updateMessage) throws Exception {
		sqlsession.update(namespace + ".updateMessage", updateMessage);
	}
	//헤더 메세지
	@Override
	public List<Message> headerMessage(int message_u_id)throws Exception {
		return sqlsession.selectList(namespace + ".headerMessage", message_u_id);
	}
	//최근시간으로 로그인시 업데이트
	@Override
	public void usersLoginTime(int u_id) throws Exception {
		sqlsession.update(namespace + ".usersLoginTime", u_id);
	}
	//자동검색
	@Override
	public List<Users> autoSearch(String autoSearch) throws Exception {
		return sqlsession.selectList(namespace + ".autoSearch",autoSearch);
	}
	//내가 가입중인 스터디 
	@Override
	public List<UsersJoinStudy> UsersJoinStudy(int u_id) throws Exception {
		return sqlsession.selectList(namespace+ ".UsersJoinStudy", u_id);
	}
	//페이스북 로그인
	@Override
	public void insertFacebook(Users users) throws Exception {
		sqlsession.insert(namespace +".insertFacebook" , users);
	}
	//중복검사
	@Override
	public Users joinOverlap(String u_email) throws Exception {
		return sqlsession.selectOne(namespace +".joinOverlap" , u_email);
	}
	
	
	
	
}
