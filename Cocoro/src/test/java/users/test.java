package users;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cocoro.study.domain.StudyGroup;
import cocoro.study.service.StudyGroupService;
import cocoro.study.service.StudyGroupServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class test {

	@Autowired
	private  StudyGroupService service;
	
	@Test
	public  void test()throws Exception{

		StudyGroup sg = service.selectStudy(2);
		
		if(sg != null){
			System.out.println("불러왔어요");
		}
	}
}
