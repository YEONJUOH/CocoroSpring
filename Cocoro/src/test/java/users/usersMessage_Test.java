package users;

import java.util.List;

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
import cocoro.users.service.UsersServiceImpl;

//Users Login Test
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class usersMessage_Test {

	@Inject
	private UsersServiceImpl service;
	
	private static Logger logger = LoggerFactory.getLogger(usersCRUD_Test.class);
	
	@Test
	public void sendMessage()throws Exception{
		Message message = new Message();
		//6번한테 5번이 메세지를 보낸다. 
		message.setMessage_u_id(5);
		message.setMessage_o_id(6);
		message.setMessage_Comment("메세지 테스트");
		
		service.sendMessage(message);
		//5 번의 받은 받은 쪽지정보
		List<Message> receiveMessage = service.receiveMessage(5);
		for(Message receive : receiveMessage){
			System.out.println("5번이 받은 메세지 정보 : " + receive.getMessage_comment());
			System.out.println("5번이 받은 메세지보낸사람 : " + receive.getMessage_o_id());
		}
		//5번에게 쪽지를 보낸사람들
		List<Users> receiveUsers = service.receiveInfo(5);
		for(Users usersList : receiveUsers ) {
			System.out.println("5번한테 쪽지보낸사람들의 이름 :" + usersList.getU_name());
		}
		
		//6번이 보낸쪽지 정보
		List<Message> postMessage = service.postMessage(6);
		for(Message postMList : postMessage){
			System.out.println("6번이 보낸 메세지받는사람 : "+  postMList.getMessage_u_id());
			System.out.println("6번이 보낸 메세지 정보 : " + postMList.getMessage_comment());
		}
		
		//6번이 보낸쪽지 받는 사람정보
		List<Users> postUList = service.postInfo(6);
		for(Users postUsers : postUList){
			System.out.println("받는 사람의 이름 : " + postUsers.getU_name());;
		}
		
		
		
		
	 }
	}
