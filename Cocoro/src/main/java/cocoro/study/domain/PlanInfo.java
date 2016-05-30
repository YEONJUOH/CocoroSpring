package cocoro.study.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class PlanInfo implements Serializable {
  private int plan_id; 
  private String plan_name;
  private String plan_date;
  private String plan_comment;
  private int s_id;
  
	public String getPlan_date() {
	return plan_date;
}
public void setPlan_date(String plan_date) {
	this.plan_date = plan_date;
}
	public int getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}
	public String getPlan_name() {
		return plan_name;
	}
	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}
	public String getPlan_comment() {
		return plan_comment;
	}
	public void setPlan_comment(String plan_comment) {
		this.plan_comment = plan_comment;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	@Override 
	public String toString() {
		return "PlanInfo [plan_id=" + plan_id + ", plan_name=" + plan_name
				+ ", plan_date=" + plan_date + ", plan_comment=" + plan_comment
				+ ", s_id=" + s_id + "]";
	}
	
}
