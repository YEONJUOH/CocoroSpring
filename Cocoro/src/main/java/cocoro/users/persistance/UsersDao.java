package cocoro.users.persistance;

import cocoro.users.domain.Users;

public interface UsersDao {
	public void insertUsers(Users users)throws Exception;
}
