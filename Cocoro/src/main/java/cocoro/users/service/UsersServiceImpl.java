package cocoro.users.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import cocoro.users.domain.Comment;
import cocoro.users.domain.CommentUsers;
import cocoro.users.domain.Follow;
import cocoro.users.domain.Likes;
import cocoro.users.domain.Mento;
import cocoro.users.domain.Message;
import cocoro.users.domain.Users;
import cocoro.users.domain.UsersAccount;
import cocoro.users.domain.UsersJoinStudy;
import cocoro.users.persistance.UsersDao;

@Service
public class UsersServiceImpl implements UsersService {

	@Inject
	private UsersDao dao;
	
	//인설트
	@Override
	public void insertUsers(Users users) throws Exception {
		dao.insertUsers(users);
	}
	//전체 유저리스트
	@Override
	public List<Users> usersList() throws Exception {
		return dao.usersList();
	}
	//유저 수정
	@Override
	public void usersModify(Users users) throws Exception {
		dao.usersModify(users);
	}
	//배경 수정
	@Override
	public void usersBg(Users users) throws Exception {
		dao.usersBg(users);
	}
	//프로필 수정
	@Override
	public void usersImg(Users users) throws Exception {
		dao.usersImg(users);
	}
	
	//유저삭제
	@Override
	public void delUsers(Integer u_id) throws Exception {
		dao.delUsers(u_id);
	}
	//한명의 유저정보
	@Override
	public Users usersInfo(Integer u_id) throws Exception {
		return dao.usersInfo(u_id);
	}
	//유저 로그인 
	@Override
	public Users usersLogin(HashMap<String, String> login) throws Exception {
		return dao.usersLogin(login);
	}
	//후기 남기기
	@Override
	public void usersAfter(Comment comment) throws Exception {
		dao.usersAfter(comment);
	}
	//해당 회원의 후기 불러오기
	@Override
	public List<Comment> usersAfterInfo(Integer u_id) throws Exception {
		return dao.usersAfterInfo(u_id);
	}
	//후기를 남긴 친구들의 정보
	@Override
	public List<Users> usersAfterUsersInfo(Integer u_id) throws Exception {
		return dao.usersAfterUsersInfo(u_id);
	}
	//팔로우 걸기
	@Override
	public void usersFollow(HashMap<String, Integer> follow) throws Exception {
		dao.usersFollow(follow);
	}
	//팔로우 취소
	@Override
	public void usersUnFollow(HashMap<String, Integer> unFollow) throws Exception {
		dao.usersUnFollow(unFollow);
	}
	//나를 팔로우중인 사람들
	@Override
	public List<Users> usersFollowListMe(Integer u_id) throws Exception {
		return dao.usersFollowListMe(u_id);
	}
	//내가 팔로우중인 사람들
	@Override
	public List<Users> usersFollowListYou(Integer f_o_id) throws Exception {
		return dao.usersFollowListYou(f_o_id);
	}
	//팔로우 체크
	@Override
	public Follow usersFollowCheck(HashMap<String, Integer> folloCheck) throws Exception {
		return dao.usersFollowCheck(folloCheck);
	}
	//쪽지보내기
	@Override
	public void sendMessage(Message message) throws Exception {
		dao.sendMessage(message);
	}
	//좋아요누르기
	@Override
	public void usersLike(HashMap<String, Integer> usersLike) throws Exception {
		dao.usersLike(usersLike);
	}
	//좋아요취소
	@Override
	public void usersUnLike(HashMap<String, Integer> usersUnLike) throws Exception {
		dao.usersUnLike(usersUnLike);
	}
	//좋아요 체크
	@Override
	public Likes usersLikeCheck(HashMap<String, Integer> usersLikeCheck) throws Exception {
		return dao.usersLikeCheck(usersLikeCheck);
	}
	//좋아요 할떄마다 + 
	@Override
	public void usersLikeUpdate(int u_id) throws Exception {
		dao.usersLikeUpdate(u_id);
	}
	//좋아요 취소시 -
	@Override
	public void usersLikeMinusUpdate(int u_id) throws Exception {
		dao.usersLikeMinusUpdate(u_id);
	}
	//계좌생성
	@Override
	public void usersAccount(UsersAccount usersAccount) throws Exception {
		dao.usersAccount(usersAccount);
	}
	//해당 회원의 계좌 불러오기
	@Override
	public UsersAccount usersAccountInfo(int u_id) throws Exception {
		return dao.usersAccountInfo(u_id);
	}
	//회원들의 계좌번호 불러오기(중복체크) 
	@Override
	public List<UsersAccount> usersAccountNumber() throws Exception {
		return dao.usersAccountNumber();
	}
	//입금
	@Override
	public void usersAccountPlus(UsersAccount usersAccount) throws Exception {
		dao.usersAccountPlus(usersAccount);
	}
	//출금
	@Override
	public void usersAccountMinus(UsersAccount usersAccount) throws Exception {
		dao.usersAccountMinus(usersAccount);
	}
	//멘토생성
	@Override
	public void usersMento(Mento mento) throws Exception {
		dao.usersMento(mento);
	}
	//전체멘토 불러오기
	@Override
	public List<Mento> usersMentoList() throws Exception {
		return dao.usersMentoList();
	}
	//멘토링 여부
	@Override
	public Mento usersMentoCheck(int u_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.usersMentoCheck(u_id);
	}
	//멘토 업데이트
	@Override
	public void usersMentoUpdate(Mento mento) throws Exception {
		dao.usersMentoUpdate(mento);
	}
	//멘토 삭제
	@Override
	public void usersMentoDelete(int u_id) throws Exception {
		dao.usersMentoDelete(u_id);
	}
	//후기 댓글 남기기
	@Override
	public void commentUsers(CommentUsers commentUsers) throws Exception {
		dao.commentUsers(commentUsers);
	}
	//후기 댓글정보
	@Override
	public List<CommentUsers> commentList(int c_id) throws Exception {
		return dao.commentList(c_id);
	}
	//댓글단 사람의 정보
	@Override
	public List<Users> commentUserList(int c_id) throws Exception {
		return dao.commentUserList(c_id);
	}
	//모든댓글
	@Override
	public List<CommentUsers> commentAllList() throws Exception {
		return dao.commentAllList();
	}
	//보낸쪽지
	@Override
	public List<Message> postMessage(int message_o_id) throws Exception {
		return dao.postMessage(message_o_id);
	}
	//보낸쪽지 (받는 사람의 정보)
	@Override
	public List<Users> postInfo(int u_id) throws Exception {
		return dao.postInfo(u_id);
	}
	//받은쪽지
	@Override
	public List<Message> receiveMessage(int message_u_id) throws Exception {
		return dao.receiveMessage(message_u_id);
	}
	//받은쪽지(보낸사람의 정보)
	@Override
	public List<Users> receiveInfo(int message_u_id) throws Exception {
		return dao.receiveInfo(message_u_id);
	}
	//1대1 받은 쪽지
	@Override
	public List<Message> oneMyMessage(HashMap<String, Integer> oneMyMessage) throws Exception {
		return dao.oneMyMessage(oneMyMessage);
	}
	//1대1 보낸쪽지 
	@Override
	public List<Message> oneYouMessage(HashMap<String, Integer> oneYouMessage) throws Exception {
		return dao.oneYouMessage(oneYouMessage);
	}
	//메세지 업데이트
	@Override
	public void updateMessage(HashMap<String, Integer> updateMessage) throws Exception {
		 dao.updateMessage(updateMessage);
	}
	//헤더 쪽지
	@Override
	public List<Message> headerMessage(int message_u_id) throws Exception {
		return dao.headerMessage(message_u_id);
	}
	//유저 최근시간으로 업데이트
	@Override
	public void usersLoginTime(int u_id) throws Exception {
		dao.usersLoginTime(u_id);
	}
	//친구검색 
	@Override
	public List<Users> autoSearch(String autoSearch) throws Exception {
		return dao.autoSearch(autoSearch);
	}
	//내가 가입한 스터디 목
	public List<UsersJoinStudy> studyList(Integer u_id) throws Exception {
		return dao.UsersJoinStudy(u_id);
	}
	
	
	
	
}
