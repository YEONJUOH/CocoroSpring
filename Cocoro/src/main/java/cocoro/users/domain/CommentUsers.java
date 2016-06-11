package cocoro.users.domain;

import java.io.Serializable;

public class CommentUsers implements Serializable{
	private int cu_id;
	private int c_id;
	private int u_id;
	private String cu_comment;
	
	public int getCu_id() {
		return cu_id;
	}
	public void setCu_id(int cu_id) {
		this.cu_id = cu_id;
	}
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
	public String getCu_comment() {
		return cu_comment;
	}
	public void setCu_comment(String cu_comment) {
		this.cu_comment = cu_comment;
	}
	
	
}
