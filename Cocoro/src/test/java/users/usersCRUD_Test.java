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
import cocoro.users.persistance.UsersDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class usersCRUD_Test {
	
	@Inject
	private UsersDao dao;
	
	private static Logger logger = LoggerFactory.getLogger(usersCRUD_Test.class);
	
	//인설트
	@Test
	public void insert()throws Exception{
		Users users = new Users();
		users.setU_name("홍길자");
		users.setU_email("bb@naver.com");
		users.setU_pwd("1234");
		users.setU_birth("1997-07-10");
		users.setU_address("안양");
		users.setU_sex("남");
		
		dao.insertUsers(users);
	}
	
	//해당 시퀀스 멤버의정보
	@Test
	public void read()throws Exception{
		logger.info(dao.usersInfo(5).toString());
	}
	//멤버수
	@Test
	public void readList()throws Exception{
		List<Users> list = dao.usersList();
		logger.info("현재 멤버의 수 : " + list.size());
	}
	//수정
	@Test
	public void update()throws Exception{
	    Users users = new Users();

	    users.setU_id(5);
	    users.setU_image("aaa.jpg");
	    users.setU_intro("수정됬나요");
	    users.setU_tag("#웅쨩");
	    users.setU_address_check("F");
	    users.setU_address("수정마을");
	    users.setU_birth_check("F");
	    users.setU_sns_address("안합니당");
	    users.setU_mento_check("F");
	    
	    dao.usersModify(users);
	}
	

}
