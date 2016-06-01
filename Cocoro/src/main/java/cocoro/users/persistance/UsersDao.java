package cocoro.users.persistance;

import java.util.List;

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
}
