package study;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cocoro.study.domain.StudyGroup;
import cocoro.study.persistance.StudyGroupDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class createStudy_Test {

	@Inject
	private StudyGroupDao dao;
	
	private static Logger logger = LoggerFactory.getLogger(createStudy_Test.class);
	
	// insert
	@Test
	public void insert() throws Exception {
		StudyGroup studygroup = new StudyGroup();
		studygroup.setS_name("스터디");
		studygroup.setS_tag("#토익");
		studygroup.setS_intro("토익 공부");
		studygroup.setS_leader_id(1);
		studygroup.setS_max_member("5명");
		studygroup.setS_fix_member("F");
		studygroup.setS_start("2016/05/25");
		studygroup.setS_end("2016/06/25");
		studygroup.setS_attend_check("T");
		studygroup.setS_abil_check(8);
		studygroup.setS_location_x(0);
		studygroup.setS_location_y(0);
		studygroup.setS_address("서울");
		studygroup.setS_offline("T");
		studygroup.setS_online("T");
		studygroup.setS_mento_check("S");
		studygroup.setS_kind_check("T");
		studygroup.setS_time_check("T");
		studygroup.setS_deposit(10000);
		studygroup.setS_last_act("2016/05/25");
		studygroup.setS_t_start(100);
		studygroup.setS_t_end(200);
		studygroup.setS_history("2016/05/25");
		
		dao.createStudy(studygroup);
		
		
	}
	
}
