package users;

import java.util.HashMap;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cocoro.users.domain.Message;
import cocoro.users.service.UsersServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class usersHeaderMessage_Test {
	
	@Inject
	private UsersServiceImpl service;
	
	@Test
	public void usersHeaderMessage_Test()throws Exception{
		HashMap<String, Integer> headerMessage = new HashMap<String, Integer>();
		headerMessage.put("message_u_id", 5);
		headerMessage.put("message_o_id", 6);
		
	}
}
