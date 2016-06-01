import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cocoro.users.domain.Users;
import cocoro.users.persistance.UsersDao;
// 디비 insert 테스트

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class usersDaoTest {

	@Inject
	private UsersDao dao;
	
	@Test
	public void insert()throws Exception{
		Users users = new Users();
		users.setU_name("홍길동");
		users.setU_email("aa@naver.com");
		users.setU_pwd("1234");
		users.setU_birth("1997-07-10");
		users.setU_address("안양");
		users.setU_sex("남");
		
		dao.insertUsers(users);
	}
}
