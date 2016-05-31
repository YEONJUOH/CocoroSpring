package cocoro.search.domain;

import java.util.Comparator;

import cocoro.search.dao.SearchDao;

public class s_numComparator implements Comparator{

	 String[] interests;
	 SearchDao dao = SearchDao.getInstance();
	 public s_numComparator(String[] interests) {
		super();
		this.interests = interests;
	}
	
	@Override
	public int compare(Object o1, Object o2) {
		// TODO Auto-generated method stub
		
		String str1 = interests[(Integer)o1];
		String str2 = interests[(Integer)o2];		
		int snum1 = dao.getSnum(str1);
		int snum2 = dao.getSnum(str2);
		
		int val1 = snum1+(Integer)o1;
		int val2 = snum2+(Integer)o2;
		
		if(val1>val2){
			return 1;
		}else if(val1<val2){
			return -1;
		}else{
			return 0;	
		}
	}
	

}
