package cocoro.search.persistence;

import java.util.List;

import cocoro.search.domain.Search;
import cocoro.search.domain.SearchInfo;
import cocoro.search.domain.tagSearch;
import cocoro.search.domain.tagSuggestion;
import cocoro.study.domain.StudyGroup;
import cocoro.users.domain.Users;

public interface SearchDAO {

	
	public List<StudyGroup> searchResult(Search search) throws Exception;
	public List<Users> searchPeople(Search search) throws Exception;
	public  int getSnum(String str) throws Exception;
	public List<tagSuggestion> tagSuggest(tagSearch tagSearch) throws Exception;
	public int insertSearchInfo(SearchInfo searchInfo) throws Exception;
	public int updateSearchInfo(SearchInfo searchInfo) throws Exception;
	public int recommendSelectS_id(int u_id) throws Exception;
	public List<StudyGroup> recommendStudy(List<Integer> listInt) throws Exception;
}

/*package cocoro.search.dao;




import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import cocoro.mapper.SearchMapper;
import cocoro.mapper.StudyGroupMapper;
import cocoro.mapper.UsersMapper;
import cocoro.search.model.Search;
import cocoro.search.model.SearchInfo;
import cocoro.search.model.Suggestion;
import cocoro.search.model.tagSearch;
import cocoro.search.model.tagSuggestion;
import cocoro.studygroup.model.StudyGroup;
import cocoro.user.model.Users;

public class SearchDao {

	private static SearchDao dao = new SearchDao();
	public static SearchDao getInstance(){
		return dao;
	}
	
	
	
	public SqlSessionFactory getSqlSessionFactory(){
		String resource = "cocoro/mybatis-config.xml";
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new SqlSessionFactoryBuilder().build(input);
	}
	
	
	public List<StudyGroup> searchResult(Search search) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<StudyGroup> list = null;
		try {
			list = sqlSession.getMapper(StudyGroupMapper.class).searchResult(search);
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			sqlSession.close();
		}
		
		return list; 
	}


	public List<Users> searchPeople(Search search){
		// TODO Auto-generated method stub
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<Users> list = null;
		try {
			list = sqlSession.getMapper(UsersMapper.class).searchPeople(search);
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			sqlSession.close();
		}
		
		return list; 
	}

    public int getSnum(String str){
    	
    	SqlSession sqlSession = getSqlSessionFactory().openSession();
		int re = 0;
		try {
        re= sqlSession.getMapper(StudyGroupMapper.class).getSnum(str);
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			sqlSession.close();
		}
		
		return re; 
    	
    }
	public List<tagSuggestion> tagSuggest(tagSearch tagSearch) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<tagSuggestion> list = null;
		try {
        list= sqlSession.getMapper(StudyGroupMapper.class).tagSuggest(tagSearch);
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			sqlSession.close();
		}
		
		return list; 
	}

	//추천 
	
	
	public int insertSearchInfo(SearchInfo searchInfo) {
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			re = sqlSession.getMapper(SearchMapper.class).insertSearchInfo();
			if (re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return re;
	}

	public int updateSearchInfo(SearchInfo searchInfo) {
		int re = -1;
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			re = sqlSession.getMapper(SearchMapper.class).updateSearchInfo();
			if (re > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return re;
	}
	
	
	
	public int recommendSelectS_id(int u_id){// 최신 조회수 찾기
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		if (sqlSession.getMapper(SearchMapper.class).recommendSelectS_id(u_id) == null) {
			return 0;
		} else {
			return sqlSession.getMapper(SearchMapper.class).recommendSelectS_id(u_id);
		}
		
		
	}

	public List<StudyGroup> recommendStudy(List<Integer> listInt) {
		
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		List<StudyGroup> list = null;
		try {
			list = sqlSession.getMapper(StudyGroupMapper.class).recommendStudy(listInt);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sqlSession.close();
		}

		return list;
	}



}*/
