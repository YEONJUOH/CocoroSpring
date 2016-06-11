package cocoro.users.domain;

import java.io.Serializable;


public class UsersJoinStudy implements Serializable{
	
	private String s_last_login;
	private String s_name;
	private String s_id;
	
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_last_login() {
		return s_last_login;
	}
	public void setS_last_login(String s_last_login) {
		this.s_last_login = s_last_login;
	}
	
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	@Override
	public String toString() {
		return "UsersJoinStudy [s_last_login=" + s_last_login + ", s_sname=" + s_name + ", s_id=" + s_id + "]";
	}
	
	

}
