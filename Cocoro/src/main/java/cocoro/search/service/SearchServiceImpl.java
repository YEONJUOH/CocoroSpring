package cocoro.search.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import cocoro.search.domain.ListComparator;
import cocoro.search.domain.Norm;
import cocoro.search.domain.Search;
import cocoro.search.domain.s_numComparator;
import cocoro.search.domain.tagSearch;
import cocoro.search.domain.tagSuggestion;
import cocoro.search.persistence.SearchDAO;
import cocoro.study.domain.StudyGroup;
import cocoro.users.domain.Users;

@Service
public class SearchServiceImpl implements SearchService {

	@Inject
	private SearchDAO dao;

	@Override
	public List<StudyGroup> searchStudy(Search search) throws Exception {
		// TODO Auto-generated method stub

		List<StudyGroup> list = dao.searchResult(search);

		if (list != null && list.size() != 0 && (search.getLevelCheck() != null || search.getLocCheck() != null)) {
			Norm norm = new Norm(search.getLat(), search.getLng(), search.getLevel(), list);
			Collections.sort(list, new ListComparator(norm, search));
		}

		return list;

	}

	@Override
	public List<Users> searchPeople(Search search) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchPeople(search);
	}

	@Override
	public List<tagSuggestion> tagSuggest(String tag) throws Exception {
		// TODO Auto-generated method stub
		String tag_2 = tag.substring(1, tag.length());
		String[] interest = tag_2.split("#");
		int tag_nums = interest.length;
		List<Integer> seq = randomMaker(tag_nums);
		List<tagSuggestion> list = new ArrayList<tagSuggestion>();
        Collections.sort(seq, new s_numComparator(interest));
		
		int flag = 1;
		for (int i = 0; i < 4; i++) {
			
			if (i != 3&&seq.get(i) == seq.get(i+1)){
				flag++;
			} else {
				List<tagSuggestion> tmp = (dao.tagSuggest(new tagSearch("�뒪�꽣�뵒",
						interest[seq.get(i)], 1, flag)));
				if(tmp.size()<flag&&i!=3){
					int tp_next = seq.get(i+1);
					i = i-(flag-tmp.size());
					for(int j=i+1;j<flag;j++){
					
					seq.set(j, tp_next);
				}
					}
				
				addList(list,tmp);
				flag = 1;

			}

		}

		return list;
	}

	@Override
	public void addList(List<tagSuggestion> list, List<tagSuggestion> newList) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Integer> randomMaker(int tag_nums) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int randomRange(int n1, int n2) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<StudyGroup> item_recommend(int u_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
