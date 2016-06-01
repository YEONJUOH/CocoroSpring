package cocoro.users.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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

}
