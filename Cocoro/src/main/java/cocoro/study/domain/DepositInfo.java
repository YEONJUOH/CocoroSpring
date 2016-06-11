package cocoro.study.domain;

import java.io.Serializable;

public class DepositInfo implements Serializable {

	private int d_id; 
	private int j_id;
	private int p_total_amount;
	private int s_id;
	private int p_id;
	private int plan_id;
	public int getD_id() {
		return d_id;
	}
	public void setD_id(int d_id) {
		this.d_id = d_id;
	}
	public int getJ_id() {
		return j_id;
	}
	public void setJ_id(int j_id) {
		this.j_id = j_id;
	}
	public int getP_total_amount() {
		return p_total_amount;
	}
	public void setP_total_amount(int p_total_amount) {
		this.p_total_amount = p_total_amount;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}
	@Override
	public String toString() {
		return "DepositInfo [d_id=" + d_id + ", j_id=" + j_id + ", p_total_amount=" + p_total_amount + ", s_id=" + s_id
				+ ", p_id=" + p_id + ", plan_id=" + plan_id + "]";
	}
	
	
}
