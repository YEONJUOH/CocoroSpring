package cocoro.users.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class Likes implements Serializable{
	
	private int l_id;
	private int u_id;
	private int l_o_id;
	private Timestamp l_history;
	private String l_check;
	
	public int getL_id() {
		return l_id;
	}
	public void setL_id(int l_id) {
		this.l_id = l_id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public int getL_o_id() {
		return l_o_id;
	}
	public void setL_o_id(int l_o_id) {
		this.l_o_id = l_o_id;
	}
	public Timestamp getL_history() {
		return l_history;
	}
	public void setL_history(Timestamp l_history) {
		this.l_history = l_history;
	}
	public String getL_check() {
		return l_check;
	}
	public void setL_check(String l_check) {
		this.l_check = l_check;
	}
}
