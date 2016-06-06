package cocoro.search.service;

import java.util.List;

import cocoro.search.domain.Search;
import cocoro.search.domain.tagSuggestion;
import cocoro.study.domain.StudyGroup;
import cocoro.users.domain.Users;

public interface SearchService {

	public List<StudyGroup> searchStudy(Search search)throws Exception;
	public List<Users> searchPeople(Search search) throws Exception;
	public List<tagSuggestion> tagSuggest(String tag) throws Exception;
	public void addList(List<tagSuggestion> list, List<tagSuggestion> newList)throws Exception;
	public List<Integer> randomMaker(int tag_nums)throws Exception;
	public int randomRange(int n1, int n2) throws Exception;
	public List<StudyGroup> item_recommend (int u_id) throws Exception;
	
	
}

