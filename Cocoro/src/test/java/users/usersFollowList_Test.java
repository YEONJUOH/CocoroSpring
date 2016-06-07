package users;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cocoro.users.domain.Users;
import cocoro.users.persistance.UsersDaoImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class usersFollowList_Test {

	@Inject
	private UsersDaoImpl dao;
	
	private static Logger logger = LoggerFactory.getLogger(usersFollowList_Test.class);
	
	@Test
	public void commentTest()throws Exception{
		
	List<Users> list =  dao.usersFollowListMe(5);
	List<Users> list2 = dao.usersFollowListYou(5);
	System.out.println("5번을 팔로우중인 친구들의 수  :" + list.size());
	System.out.println("5번이 팔로우중인 친구들의 수  :" + list2.size());
	
		
	}
	
	
}
