package cocoro.search.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import cocoro.search.domain.Search;
import cocoro.search.domain.SearchInfo;
import cocoro.search.domain.tagSearch;
import cocoro.search.domain.tagSuggestion;
import cocoro.study.domain.StudyGroup;
import cocoro.users.domain.Users;

@Repository
public class SearchDAOImpl implements SearchDAO {

	
	@Inject
	private SqlSession session;
	
	private static String namespace = "cocoro.search.mapper.SearchMapper";
	
	
	@Override
	public List<StudyGroup> searchResult(Search search) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".searchResult",search);
	}

	@Override
	public List<Users> searchPeople(Search search) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".searchPeople",search);
	}

	@Override
	public int getSnum(String str) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getSnum", str);
	}

	@Override
	public List<tagSuggestion> tagSuggest(tagSearch tagSearch) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".tagSuggest",tagSearch);
	}

	@Override
	public int insertSearchInfo(SearchInfo searchInfo) throws Exception {
		// TODO Auto-generated method stub
		return session.insert(namespace+".insertSearchInfo",searchInfo);
	}

	@Override
	public int updateSearchInfo(SearchInfo searchInfo) throws Exception {
		// TODO Auto-generated method stub
		return session.update(namespace+".updateS_hit",searchInfo);
	}

	@Override
	public int recommendSelectS_id(int u_id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".recommendSelectS_id",u_id);
	}

	@Override
	public List<StudyGroup> recommendStudy(List<Integer> listInt) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".recommendStudy",listInt);
	}

}
