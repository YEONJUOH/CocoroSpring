
import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cocoro.search.domain.Search;
import cocoro.search.persistence.SearchDAO;
import cocoro.study.domain.StudyGroup;
import cocoro.users.domain.Users;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class SearchDaoTest{
	
	private static Logger logger = LoggerFactory.getLogger(SearchDaoTest.class);
	
	@Inject
	private SearchDAO dao;


	
	/*@Test
	public void testListCriteria() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(0);
		cri.setPerPageNum(2);
		
		List<BoardVO> list = dao.listCriteria(cri);
		for(BoardVO boardVO :list){
			logger.info(boardVO.getBno()+":"+boardVO.getTitle());
		}
	}*/
	
	@Test
	public void testDynamic()throws Exception{
		
		List<Users> list = dao.searchPeople(new Search());
		
		logger.info("=============");
		logger.info("COUNT"+list.size());

		logger.info("========");
		
	}

}
