package cocoro.search.domain;

import java.util.Comparator;

import cocoro.study.domain.StudyGroup;

public class ListComparator implements Comparator{
	
/*	private double avg_loc=0;
	private double deviation_loc=0;
	

	private double avg_level=0;
	private double deviation_level=0;*/
	private Norm norm =new Norm();
	private Search search = new Search();
	Distance distance = new Distance();
	
	public ListComparator(Norm norm,Search search){
	super();
	this.norm = norm;
	this.search =search;
	}

   @Override
	public int compare(Object o1, Object o2){
		// TODO Auto-generated method stub
		
		StudyGroup s1 = (StudyGroup)o1;
		StudyGroup s2 = (StudyGroup)o2;
		

		double val1=0 ;
		double val2 =0;
		if(search.getLocCheck()!=null){
			double dis1 = distance.calDistance(norm.getSh_lat(),norm.getSh_lng(), s1.getS_location_x(), s1.getS_location_y());
			double dis2 = distance.calDistance(norm.getSh_lat(),norm.getSh_lng(), s2.getS_location_x(), s2.getS_location_y());
			val1 = (dis1-norm.getAvg_loc())/norm.getDeviation_loc();
			val2 = (dis2-norm.getAvg_loc())/norm.getDeviation_loc();
			System.out.println(s1.getS_name()+"dis1>>"+dis1);
			System.out.println(s2.getS_name()+"dis2>>"+dis2);
		}
		
		if(search.getLevelCheck()!=null){
			double lev1 = Math.abs(norm.getSh_level()-s1.getS_avg_abil());
			double lev2 = Math.abs(norm.getSh_level()-s2.getS_avg_abil());
			val1=(lev1-norm.getAvg_level())/norm.getDeviation_level();	
			val2=(lev2-norm.getAvg_level())/norm.getDeviation_level();
			System.out.println(s1.getS_name()+"lev1>>"+lev1);
			System.out.println(s2.getS_name()+"lev2>>"+lev2);	

		}

		


        
		System.out.println(s1.getS_name()+"val1>>"+val1);
		System.out.println(s2.getS_name()+"val2>>"+val2);
		
	
		
		
		if(val1>val2){
			return 1;
		}else if(val1<val2){
			return -1;
		}else{
			return 0;	
		}
		
		
	}
	
 



}
