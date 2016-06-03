package users;
import java.util.HashMap;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cocoro.users.domain.Comment;
import cocoro.users.domain.Users;
import cocoro.users.persistance.UsersDao;
import cocoro.users.service.UsersServiceImpl;

//Users Login Test
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class usersUpload_Test {

	@Inject
	private UsersServiceImpl service;
	
	private static Logger logger = LoggerFactory.getLogger(usersCRUD_Test.class);
	
	@Test
	public void login()throws Exception{
		Comment comment = new Comment();
		
		
		
	}
}
