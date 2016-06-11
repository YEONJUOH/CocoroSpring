package cocoro.study.domain;

import java.io.Serializable;

public class Attend implements Serializable {

	private int atd_id; 
	private int j_id;
	private int plan_id;
	private String atd_check;
	
	public int getAtd_id() {
		return atd_id;
	}
	public void setAtd_id(int atd_id) {
		this.atd_id = atd_id;
	}
	public int getJ_id() {
		return j_id;
	}
	public void setJ_id(int j_id) {
		this.j_id = j_id;
	}
	public int getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}
	public String getAtd_check() {
		return atd_check;
	}
	public void setAtd_check(String atd_check) {
		this.atd_check = atd_check;
	}
	@Override
	public String toString() {
		return "Attend [atd_id=" + atd_id + ", j_id=" + j_id + ", plan_id=" + plan_id + ", atd_check=" + atd_check
				+ "]";
	}
	
	
}
