package cocoro.search.domain;

import java.util.ArrayList;
import java.util.List;


import cocoro.study.domain.StudyGroup;


public class Norm {

	private double avg_loc=0;
	private double deviation_loc=0;

	private double avg_level=0;
	private double deviation_level=0;


	private double sh_lat;
	private double sh_lng;

	
	private int sh_level;
	
	private List<StudyGroup> list=new ArrayList<StudyGroup>();

	Distance dis = new Distance();

	public Norm(double sh_lat, double sh_lng, int sh_level,List<StudyGroup> list){
	
		super();
		this.sh_lat = sh_lat;
		this.sh_lng = sh_lng;
		this.sh_level = sh_level;
		this.list = list;
	
		
		setAvg_level();
		
		setDeviation_level();
		
		setAvg_loc();
		
		setDeviation_loc();
	}
	
	


   public Norm() {
		super();
	}




// ddf
	public double getAvg_loc() {
		return avg_loc;
	}

	public void setAvg_loc(){

		double sum = 0;

		for (int i = 0; i < list.size(); i++){
			sum += dis.calDistance(sh_lat, sh_lng, list.get(i)
					.getS_location_x(), list.get(i).getS_location_y());
			System.out.println(dis.calDistance(sh_lat, sh_lng, list.get(i)
					.getS_location_x(), list.get(i).getS_location_y()));

		}

		this.avg_loc = sum / list.size();
	}

	public double getDeviation_loc() {
		return deviation_loc;
	}

	public void setDeviation_loc(){
		
		double sum = 0;

		for (int i = 0; i < list.size(); i++) {
			sum += Math.pow(dis.calDistance(sh_lat, sh_lng, list.get(i)
					.getS_location_x(), list.get(i).getS_location_y()), 2);

		}

		this.deviation_loc = Math.sqrt((sum / list.size())
				- Math.pow(getAvg_loc(), 2));
	
	}

	public double getAvg_level(){
		return avg_level;
	}

	public void setAvg_level() {
		int sum =0;
		System.out.println("listsize"+list.size());
		for (int i = 0; i < list.size(); i++) {
			sum += list.get(i).getS_avg_abil();

		}

		this.avg_level = sum/list.size();
	}

	public double getDeviation_level() {
		return deviation_level;
	}

	public void setDeviation_level() {
		
		int sum = 0;

		for (int i = 0; i < list.size(); i++) {
			sum += Math.pow(list.get(i).getS_avg_abil(), 2);

		}
		this.deviation_level =Math.sqrt((sum / list.size())
				- Math.pow(getAvg_loc(), 2));
	}


	public double getSh_lat() {
		return sh_lat;
	}


	public void setSh_lat(double sh_lat) {
		this.sh_lat = sh_lat;
	}


	public double getSh_lng() {
		return sh_lng;
	}


	public void setSh_lng(double sh_lng) {
		this.sh_lng = sh_lng;
	}


	public int getSh_level() {
		return sh_level;
	}


	public void setSh_level(int sh_level) {
		this.sh_level = sh_level;
	}
	
	

}
