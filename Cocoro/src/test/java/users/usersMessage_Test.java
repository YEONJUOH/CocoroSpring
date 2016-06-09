package users;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cocoro.users.domain.Message;
import cocoro.users.domain.Users;
import cocoro.users.persistance.UsersDao;

//Users Login Test
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class usersMessage_Test {

	@Inject
	private UsersDao dao;
	
	private static Logger logger = LoggerFactory.getLogger(usersCRUD_Test.class);
	
	@Test
	public void sendMessage()throws Exception{
		Message message = new Message();
		//5번한테 6번이 메세지를 보낸다. 
		message.setMessage_u_id(5);
		message.setMessage_o_id(6);
		message.setMessage_Comment("안녕 메세지는 처음이지?");
		
		dao.sendMessage(message);
	 }
	}
