package cocoro.users.persistance;

import java.util.HashMap;
import java.util.List;

import cocoro.users.domain.Comment;
import cocoro.users.domain.Users;

public interface UsersDao {
	//인설트
	public void insertUsers(Users users)throws Exception;
	//유저리스트 
	public List<Users> usersList()throws Exception;
	//유저 수정
	public void usersModify(Users users)throws Exception;
	//유저삭제 
	public void delUsers(Integer u_id)throws Exception;
	//한명의 멤버만 가져오기
	public Users usersInfo(Integer u_id)throws Exception;
	//로그인
	public Users usersLogin(HashMap<String, String> login)throws Exception;
	//팔로우 걸기
	public void usersFollow(HashMap<String,Integer> follow)throws Exception;
	//후기 남기기
	public void usersAfter(Comment comment)throws Exception;
	//해당해원의 후기 불러오기 
	public List<Comment> usersAfterInfo(Integer u_id)throws Exception;







}
