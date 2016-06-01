package cocoro.users.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import cocoro.users.domain.Users;
import cocoro.users.persistance.UsersDao;

@Service
public interface UsersService {
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
