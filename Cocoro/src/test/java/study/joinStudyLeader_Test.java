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

import cocoro.study.domain.StudyActivity;
import cocoro.study.persistance.StudyGroupDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class joinStudyLeader_Test {

	@Inject
	private StudyGroupDao dao;
	
	private static Logger logger = LoggerFactory.getLogger(createStudy_Test.class);
	
	//studyleader join study
	@Test
	public void joinStudy() throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		int s_id = 31;
		int s_leader_id = 1;
		map.put("s_id", s_id);
		map.put("s_leader_id", s_leader_id);
		dao.insertS_leaderActivity(map);
	}
}
