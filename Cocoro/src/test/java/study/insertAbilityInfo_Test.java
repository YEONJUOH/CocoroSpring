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
public class insertAbilityInfo_Test {
	
	@Inject
	private StudyGroupDao dao;
	
	private static Logger logger = LoggerFactory.getLogger(createStudy_Test.class);
	
	// insert abilityinfo
	@Test
	public void insertAbilityInfo_leader() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int j_id = 33;
		int rank = 5;
		map.put("j_id", j_id);
		map.put("rank", rank);
		dao.insertS_leaderAbilityInfo(map);
	}
	
}
