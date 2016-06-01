package cocoro.users.service;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import cocoro.user.dao.UsersActivityDao;
import cocoro.user.model.Comment;
import cocoro.user.model.Follow;
import cocoro.user.model.Likes;
import cocoro.user.model.Mento;
import cocoro.user.model.Message;
import cocoro.user.model.Users;
import cocoro.user.model.UsersAccount;

public class UsersActivityService {
	public static UsersActivityDao dao;
	public static UsersActivityService ActivityService = new UsersActivityService();
	
	public static UsersActivityService getInstance(){
		
		dao = UsersActivityDao.getInstance();
		return ActivityService;
	}
	//insert
		public int insertUsers(Users users) throws Exception{
			return dao.insertUsers(users);
		}
	
	//로그인 
	public Users usersLogin(HashMap<String,String> login) throws Exception{
		return dao.usersLogin(login);
	}
	//로그인 할때마다 최신 시간 업데이트 
	public int usersLoginTime(int u_id){
		return dao.usersLoginTime(u_id);
	}
	//회원정보 가져오기 
	public Users usersInfo(int u_id){
		return dao.usersInfo(u_id);
	}
	//모든 회원정보
	public List<Users> usersList(){
		return dao.usersList();
	}
	//멘토등록
	public int usersMento(Mento Mento){
		return dao.usersMento(Mento);
	}
	//현재 멘토인가 여부 
	public Mento usersMentoCheck(int u_id){
		return dao.usersMentoCheck(u_id);
	}
	//멘토 업데이트문 
	public int usersMentoUpdate(Mento mento){
		return dao.usersMentoUpdate(mento);
	}
	//멘토 삭제 
	public int usersMentoDelete(int u_id){
		return dao.usersMentoDelete(u_id);
	}
	//모든 멘토 리스트
	public List<Mento> usersMentoList(){
		return dao.usersMentoList();
	}
	//팔로우 하고 있는 친구리스트
	public List<Users> usersFollowList(int u_id)throws Exception{
		return dao.usersFollowList(u_id);
	}
	//팔로우 걸기 
	public int usersFollow(HashMap<String, Integer> follow){
		return dao.usersFollow(follow);
	}
	//팔로우 해제 
	public int usersUnFollow(HashMap<String, Integer> unFollow){
		return dao.usersUnFollow(unFollow);
	}
	//팔로우 체크
	public Follow usersFollowCheck(HashMap<String, Integer> usersFollowCheck){
		return dao.usersFollowCheck(usersFollowCheck);
	}
	//업데이트
	public int usersModify(Users users) throws Exception{
		return dao.usersModify(users);
	}
	//계좌생성
	public int usersAccount(UsersAccount usersAccount){
		return dao.usersAccount(usersAccount);
	}
	//회원 계좌 뽑아오기 
	public UsersAccount usersAccountInfo(int u_id){
		return dao.usersAccountInfo(u_id);
	}
	//회원들계좌 번호 받아오기(중복값 체크)
	public List<UsersAccount> usersAccountNumber(){
		return dao.usersAccountNumber();
	}
	//계좌 입금
	public int usersAccountPlus(UsersAccount usersAccount){
		return dao.usersAccountPlus(usersAccount);
	}
	//계좌 출금
	public int usersAccountMinus(UsersAccount usersAccount){
		return dao.usersAccountMinus(usersAccount);
	}
	//후기 작성
	public int usersAfter(Comment comment){
		return dao.usersAfter(comment);
	}
	//후기 불러오기 
	public List<Comment> usersAfterInfo(int u_id){
		return dao.usersAfterInfo(u_id);
	}
	//후기쓴 유저들의 정보
	public List<Users> usersAfterUsersInfo(int u_id){
		return dao.usersAfterUsersInfo(u_id);
	}
	//좋아요 누르기 
	public int usersLike(HashMap<String, Integer> usersLike){
		return dao.usersLike(usersLike);
	}
	//좋아요 회원들의 정보
	public List<Likes> usersLikeNum(int u_id){
		return dao.usersLikeNum(u_id);
	}
	//좋아요 누를때마다 업데이트 
	public int usersLikeUpdate(int u_id){
		return dao.usersLikeUpdate(u_id);
	}
	public int usersLikeMinusUpdate(int u_id){
		return dao.usersLikeMinusUpdate(u_id);
	}
	//좋아요 취소 
	public int usersUnLike(HashMap<String, Integer> usersUnLike){
		return dao.usersUnLike(usersUnLike);
	}
	//좋아요 관계체크 
	public Likes usersLikeCheck(HashMap<String, Integer> usersLikeCheck){
		return dao.usersLikeCheck(usersLikeCheck);
	}
	
	//자동완성 검색
	public List<Users> autoSearch(String searchKey){
		return dao.autoSearch(searchKey);
	}
	//중복체크 검색
	public Users joinSearch(String searchKey){
		return dao.joinSearch(searchKey);
	}
	//메세지 보내기 
	public int sendMessage(Message message){
	return dao.sendMessage(message);
		}
	//받은 메세지 정보 
	public List<Message> receiveMessage(int message_o_id){
	return dao.receiveMessage(message_o_id);
		}
	//받은 메세지를 보낸사람의 정보
	public List<Users> receiveInfo(int message_o_id){
    return dao.receiveInfo(message_o_id);
		}
	//보낸 메세지 정보 
		public List<Message> postMessage(int message_u_id){
		return dao.postMessage(message_u_id);
			}
		//보낸 메세지를 받은사람 정보
		public List<Users> postInfo(int message_u_id){
	    return dao.postInfo(message_u_id);
			}
	//해당 메시지 삭제
		public int delMessage(int message_id){
			return dao.delMessage(message_id);
		}
	
}
