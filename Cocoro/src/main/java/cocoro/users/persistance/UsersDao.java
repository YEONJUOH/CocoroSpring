package cocoro.users.persistance;

import java.util.HashMap;
import java.util.List;

import cocoro.users.domain.Comment;
import cocoro.users.domain.CommentUsers;
import cocoro.users.domain.Follow;
import cocoro.users.domain.Likes;
import cocoro.users.domain.Mento;
import cocoro.users.domain.Message;
import cocoro.users.domain.Users;
import cocoro.users.domain.UsersAccount;
import cocoro.users.domain.UsersJoinStudy;

public interface UsersDao {
	//인설트
	public void insertUsers(Users users)throws Exception;
	//유저리스트 
	public List<Users> usersList()throws Exception;
	//유저 수정
	public void usersModify(Users users)throws Exception;
	//유저 배경 수정
	public void usersBg(Users users)throws Exception;
	//유저 프로필 수정
	public void usersImg(Users users)throws Exception;
	//유저삭제 
	public void delUsers(Integer u_id)throws Exception;
	//한명의 멤버만 가져오기
	public Users usersInfo(Integer u_id)throws Exception;
	//로그인
	public Users usersLogin(HashMap<String, String> login)throws Exception;
	//최근 시간 업데이트 
	public void usersLoginTime(int u_id)throws Exception;
	//친구 자동검색 
	public List<Users> autoSearch(String autoSearch)throws Exception;
	
	//멘토
	public void usersMento(Mento mento)throws Exception;
	//전체멘토 불러오기
	public List<Mento> usersMentoList()throws Exception;
	//멘토링 여부
	public Mento usersMentoCheck(int u_id)throws Exception;
	//멘토 업데이트
	public void usersMentoUpdate(Mento mento)throws Exception;
	//멘토 삭제
	public void usersMentoDelete(int u_id)throws Exception;
	
	//팔로우 걸기
	public void usersFollow(HashMap<String,Integer> follow)throws Exception;
	//팔로우 취소
	public void usersUnFollow(HashMap<String, Integer> unFollow)throws Exception;
	//나를 팔로우 중인 목록
	public List<Users> usersFollowListMe(Integer u_id)throws Exception;
	//내가 팔로우 중인 목록
	public List<Users> usersFollowListYou(Integer f_o_id)throws Exception;
	//팔로우 체크
	public Follow usersFollowCheck(HashMap<String, Integer> folloCheck)throws Exception;
	
	//후기 남기기
	public void usersAfter(Comment comment)throws Exception;
	//해당해원의 후기 불러오기 
	public List<Comment> usersAfterInfo(Integer u_id)throws Exception;
	//후기를 남긴 친구들의 정보
	public List<Users> usersAfterUsersInfo(Integer u_id)throws Exception;

	//후기 댓글
	public void commentUsers(CommentUsers commentUsers)throws Exception;
	//댓글 불러오기
	public List<CommentUsers> commentList(int c_id)throws Exception;
	//댓글을 남긴 사람들의 정보
	public List<Users> commentUserList(int c_id)throws Exception;
	//모든 후기 댓글 
	public List<CommentUsers> commentAllList()throws Exception;
	
	//쪽지 보내기
	public void sendMessage(Message message)throws Exception;
	//보낸쪽지
	public List<Message> postMessage(int message_o_id)throws Exception;
	//보낸쪽지(보낸사람의 정보)
	public List<Users> postInfo(int u_id)throws Exception;
	//받은쪽지 정보
	public List<Message> receiveMessage(int message_o_id)throws Exception;
	//받은쪽지(보낸사람의 정보)
	public List<Users> receiveInfo(int message_o_id)throws Exception;
	//1대1 내가 받은 쪽지 
	public List<Message> oneMyMessage(HashMap<String, Integer> oneMyMessage)throws Exception;
	//1대1 내가 보낸 쪽지 
	public List<Message> oneYouMessage(HashMap<String, Integer> oneYouMessage)throws Exception;
	//메세지 업데이트 
	public void updateMessage(HashMap<String, Integer> updateMessage)throws Exception;
	//헤더 메세지 
	public List<Message> headerMessage(int message_u_id)throws Exception;
	
	//좋아요 누르기
	public void usersLike(HashMap<String, Integer> usersLike)throws Exception;
	//좋아요 취소 
	public void usersUnLike(HashMap<String, Integer> usersUnLike)throws Exception;
	//좋아요 체트
	public Likes usersLikeCheck(HashMap<String, Integer> usersLikeCheck)throws Exception;
	//좋아요 할때마다 + 업데이트
	public void usersLikeUpdate(int u_id)throws Exception;
	//좋아요 때마다- 업데이트
	public void usersLikeMinusUpdate(int u_id)throws Exception;
	
	//계좌생성
	public void usersAccount(UsersAccount usersAccount)throws Exception;
	//해당 회원의 계좌 불러오기
	public UsersAccount usersAccountInfo(int u_id)throws Exception;
	//회원들의 계좌번호 불러오기(중복체크) 
	public List<UsersAccount> usersAccountNumber()throws Exception;
	//입금
	public void usersAccountPlus(UsersAccount usersAccount)throws Exception;
	//출금 
	public void usersAccountMinus(UsersAccount usersAccount)throws Exception;
	
	//내가 가입한 스터디 뽑아오기 
	public List<UsersJoinStudy> UsersJoinStudy(int u_id)throws Exception;
	
	


}
