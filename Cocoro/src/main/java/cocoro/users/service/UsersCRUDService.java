package cocoro.users.service;

import cocoro.user.dao.UsersDao;
import cocoro.user.model.Users;

public class UsersCRUDService {
	public static UsersDao dao;
	public static UsersCRUDService service = new UsersCRUDService();
	
	public static UsersCRUDService getInstance(){
		dao = UsersDao.getInstance();
		return service;
	}
	//insert
	public int insertUsers(Users users) throws Exception{
		return dao.insertUsers(users);
	}
	
}
