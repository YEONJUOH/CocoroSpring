package cocoro.study.domain;

import java.io.Serializable;

public class Penalty implements Serializable{

  private int s_id; 
  private int p_id;
  private String p_name;
  private int p_price;
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
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	@Override
	public String toString() {
		return "Penalty [s_id=" + s_id + ", p_id=" + p_id + ", p_name=" + p_name + ", p_price=" + p_price + "]";
	}
  
  
  


}
