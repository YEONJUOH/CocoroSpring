package users;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cocoro.users.domain.Comment;
import cocoro.users.persistance.UsersDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class usersAfter_Test {
	
	@Inject
	private UsersDao dao;
	
	private static Logger logger = LoggerFactory.getLogger(usersCRUD_Test.class);
	
	//6번이 5번에게 후기를 남김
	@Test
	public void After()throws Exception{
		Comment comment = new Comment();
		comment.setC_comment("후기 테스트입니다");
		comment.setU_id(5);
		comment.setC_o_id(6);
		
		dao.usersAfter(comment);
		logger.info(comment.toString());
	}
	//5번의 모든 후기를 불러옴 
	@Test
	public void commentList()throws Exception{
	    List<Comment> comment = dao.usersAfterInfo(5);
	    
	    logger.info("현재 후기 수 :" + comment.size());
	    for(int i=0;i<comment.size();i++){
	    	logger.info(comment.get(i).toString());
	    }
	}

}
