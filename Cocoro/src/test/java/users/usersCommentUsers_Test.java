package users;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cocoro.users.domain.CommentUsers;
import cocoro.users.domain.Users;
import cocoro.users.service.UsersServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class usersCommentUsers_Test {

	@Inject
	private UsersServiceImpl service;
	
	private static Logger logger = LoggerFactory.getLogger(usersCRUD_Test.class);
	
	@Test
	public void commentUset()throws Exception{
		CommentUsers commentUsers = new CommentUsers();
		commentUsers.setC_id(82);
		commentUsers.setU_id(5);
		commentUsers.setCu_comment("처음 댓글남기네요 호호");
		
		//댓글 작성
		service.commentUsers(commentUsers);
		
		//후기의 댓글정보
		List<CommentUsers> clist = service.commentList(82);
		System.out.println("82번 후기에 댓글갯수" + clist.size());
		
		//82번 후기에 댓글을 단 모든사람들
		List<Users> uList = service.commentUserList(82);
		System.out.println("82번후기에 댓글을 단 사람의 수 " + uList.size());
		
		
	}
	
}
