package study;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cocoro.study.persistance.StudyGroupDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class applyStudy_Test {
	
	@Inject
	private StudyGroupDao dao;
	
	private static Logger logger = LoggerFactory.getLogger(createStudy_Test.class);
	
	// apply study
	@Test
	public void applyStudy() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int s_id = 31;
		int u_id = 5;
		int rank_for_apply = 5;
		map.put("s_id", s_id);
		map.put("u_id", u_id);
		map.put("rank_for_apply", rank_for_apply);
		
		dao.applyStudy(map);
	}
	
}
