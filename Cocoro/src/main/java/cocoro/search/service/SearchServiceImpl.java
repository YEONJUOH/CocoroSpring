package cocoro.search.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import cocoro.mahout.MongoDB;
import cocoro.search.domain.ListComparator;
import cocoro.search.domain.Norm;
import cocoro.search.domain.Search;
import cocoro.search.domain.s_numComparator;
import cocoro.search.domain.tagSearch;
import cocoro.search.domain.tagSuggestion;
import cocoro.search.persistence.SearchDAO;
import cocoro.study.domain.StudyGroup;
import cocoro.study.persistance.StudyGroupDao;
import cocoro.study.persistance.StudyGroupDaoImpl;
import cocoro.study.service.StudyGroupServiceImpl;
import cocoro.users.domain.Users;

@Service
public class SearchServiceImpl implements SearchService {

	@Inject
	private SearchDAO dao;
    private MongoDB mongo;
    
    @Inject
    private StudyGroupDaoImpl sDao;
	
	
	
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
				List<tagSuggestion> tmp = (dao.tagSuggest(new tagSearch("스터디",
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
		for (int j = 0; j < newList.size(); j++) {
			list.add(newList.get(j));
		}

	}

	@Override
	public List<Integer> randomMaker(int tag_nums) throws Exception {
		// TODO Auto-generated method stub
		List<Integer>seq = new ArrayList<Integer>();
		for (int i = 0; i < 4; i++) {
			seq.add(randomRange(0, tag_nums - 1));
			System.out.println("seqNum" + seq.get(i));
		}
		
		return seq;
		
	}

	@Override
	public int randomRange(int n1, int n2) throws Exception {
		// TODO Auto-generated method stub
		return (int) (Math.random() * (n2 - n1 + 1)) + n1;
	}

	@Override
	public List<StudyGroup> item_recommend(int u_id) throws Exception {
		// TODO Auto-generated method stub
		List<StudyGroup> listS = new ArrayList<StudyGroup>();
		List<Integer> listI= mongo.recommend(u_id);
		for(int i=0;i<listI.size();i++){
			System.out.println("DFS"+listI.get(i));
			StudyGroup group = sDao.selectStudy(listI.get(i));
			listS.add(group);
		}
		
		return listS;
	}

}
