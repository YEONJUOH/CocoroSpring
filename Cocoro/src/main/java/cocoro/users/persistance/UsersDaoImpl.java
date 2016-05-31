package cocoro.users.persistance;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cocoro.users.domain.Users;

//Respositroy 스프링에서 Dao를 인식할 수 있도록 해준다.
@Repository
public class UsersDaoImpl implements UsersDao {
	
	@Inject
	private SqlSession sqlsession;

	@Override
	public void insertUsers(Users users) {
		
	}

}
