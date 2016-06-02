package users;

import java.util.HashMap;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cocoro.users.persistance.UsersDaoImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class usersFollow_Test {

	@Inject
	private UsersDaoImpl dao;
	
	//6 번이 5번을 팔로우한다.
	@Test
	public void follow()throws Exception{
		HashMap<String, Integer> follow = new HashMap<String, Integer>();
		follow.put("u_id", 5);
		follow.put("f_o_id", 6);
	
		dao.usersFollow(follow);
	}
}
