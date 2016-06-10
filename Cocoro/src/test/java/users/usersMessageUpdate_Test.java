package users;

import java.util.HashMap;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cocoro.users.persistance.UsersDaoImpl;
import cocoro.users.service.UsersServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class usersMessageUpdate_Test {

	@Inject
	private UsersServiceImpl service;
	
	@Test
	public void MessageUpdate()throws Exception{
		
		HashMap<String, Integer> updateMessage = new HashMap<String, Integer>();
		updateMessage.put("message_u_id", 6);
		updateMessage.put("message_o_id", 5);
		
		service.updateMessage(updateMessage);
		
	}
}
