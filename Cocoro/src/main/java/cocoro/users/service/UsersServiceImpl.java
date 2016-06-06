package cocoro.users.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import cocoro.users.domain.Comment;
import cocoro.users.domain.Follow;
import cocoro.users.domain.Message;
import cocoro.users.domain.Users;
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
	
	
	
	
	
}
