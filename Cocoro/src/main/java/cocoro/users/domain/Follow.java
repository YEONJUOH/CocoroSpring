package cocoro.users.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class Follow implements Serializable {
    private int f_id;
	private int u_id;
	private int f_o_id;
	private Timestamp f_history;
	private String f_check;
	
	
	public String getF_check() {
		return f_check;
	}
	public void setF_check(String f_check) {
		this.f_check = f_check;
	}
	public int getF_id() {
		return f_id;
	}
	public void setF_id(int f_id) {
		this.f_id = f_id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public int getF_o_id() {
		return f_o_id;
	}
	public void setF_o_id(int f_o_id) {
		this.f_o_id = f_o_id;
	}
	public Timestamp getF_history() {
		return f_history;
	}
	public void setF_history(Timestamp f_history) {
		this.f_history = f_history;
	}
	
}
