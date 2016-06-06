package cocoro.study.domain;

import java.io.Serializable;

public class AbilityInfo implements Serializable{

  private int a_id; 
  private int j_id;
  private int a_rank;
  	
	public int getA_id() {
		return a_id;
	}
	public void setA_id(int a_id) {
		this.a_id = a_id;
	}
	public int getJ_id() {
		return j_id;
	}
	public void setJ_id(int j_id) {
		this.j_id = j_id;
	}
	public int getA_rank() {
		return a_rank;
	}
	public void setA_rank(int a_rank) {
		this.a_rank = a_rank;
	}
	
	@Override
	public String toString() {
		return "AbilityInfo [a_id=" + a_id + ", j_id=" + j_id + ", a_rank=" + a_rank + "]";
	}
	

}
