package cocoro.search.domain;

import java.util.Comparator;


import javax.inject.Inject;


import cocoro.search.persistence.SearchDAO;

public class s_numComparator implements Comparator{

	 String[] interests;
	 
	 @Inject
	 private SearchDAO dao;
	 
	 public s_numComparator(String[] interests) {
		super();
		this.interests = interests;
	}
	
	@Override
	public int compare(Object o1, Object o2){
		// TODO Auto-generated method stub
		
		String str1 = interests[(Integer)o1];
		String str2 = interests[(Integer)o2];	
		
		int snum1=0;
		try {
			snum1 = dao.getSnum(str1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int snum2=0;
		try {
			snum2 = dao.getSnum(str2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
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
