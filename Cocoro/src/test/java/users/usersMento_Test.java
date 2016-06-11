package users;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cocoro.users.domain.Mento;
import cocoro.users.service.UsersServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class usersMento_Test {
	
	@Inject
	private UsersServiceImpl service;
	
	@Test
	public void usersMento()throws Exception{
		/*
		Mento mento = new  Mento();
		//5번이 영어분야의 멘토를 맡는다.
		mento.setU_id(5);
		mento.setM_major("#영어");
		//멘토생성
		service.usersMento(mento);
		*/
		
		List<Mento> mList = service.usersMentoList();
		System.out.println("현재 멘토의 수 :" +mList.size());
		
		//5번이 멘토인가요
		Mento mento = service.usersMentoCheck(5);

		if(mento != null){
			System.out.println("5번회원은 멘토입니다.");
			mento.setM_major("#수영");
			service.usersMentoUpdate(mento);
			System.out.println("멘토수정완료");
		}
	
	}
}
