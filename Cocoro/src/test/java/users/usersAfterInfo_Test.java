package users;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.catalina.User;
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
public class usersAfterInfo_Test {

	@Inject
	private UsersServiceImpl service;
	
	private static Logger logger = LoggerFactory.getLogger(usersCRUD_Test.class);
	
	@Test
	public void after()throws Exception{
		//5번에 후기를 남긴 애들의 정보를 가져오겠다. 
		Integer u_id = 5;
		List<Comment> cList = service.usersAfterInfo(u_id);
		List<Users> uList = service.usersAfterUsersInfo(u_id);
		
		logger.info("5번 회원의 후기 갯수:" + cList.size());
		for(int i=0;i<cList.size();i++){
			for(int j=0;j< uList.size(); j++){
				if(cList.get(i).getC_o_id() == uList.get(j).getU_id()){
					logger.info("5번 회원의 후기를 남긴 사람들:" + uList.toString());
				}
			}
		}
	}
}
