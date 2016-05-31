package cocoro.users.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class Comment implements Serializable{

	private int c_id;
	private int u_id;
	private int c_o_id;
	private String c_comment;
	private Timestamp c_date;
	
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public int getC_o_id() {
		return c_o_id;
	}
	public void setC_o_id(int c_o_id) {
		this.c_o_id = c_o_id;
	}
	public String getC_comment() {
		return c_comment;
	}
	public void setC_comment(String c_comment) {
		this.c_comment = c_comment;
	}
	public Timestamp getC_date() {
		return c_date;
	}
	public void setC_date(Timestamp c_date) {
		this.c_date = c_date;
	}
}
