package cocoro.study.domain;

import java.io.Serializable;
import java.sql.Date;

public class MemberList implements Serializable {
	private int j_id; 
	private int u_id;
	private String u_name;
	private int a_rank;
	private Date j_date;
	private Date s_last_login;
	private String u_image;
	private String u_sex;
	
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public int getJ_id() {
		return j_id;
	}
	public void setJ_id(int j_id) {
		this.j_id = j_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public int getA_rank() {
		return a_rank;
	}
	public void setA_rank(int a_rank) {
		this.a_rank = a_rank;
	}
	public Date getJ_date() {
		return j_date;
	}
	public void setJ_date(Date j_date) {
		this.j_date = j_date;
	}
	public Date getS_last_login() {
		return s_last_login;
	}
	public void setS_last_login(Date s_last_login) {
		this.s_last_login = s_last_login;
	}
	public String getU_image() {
		return u_image;
	}
	public void setU_image(String u_image) {
		this.u_image = u_image;
	}
	public String getU_sex() {
		return u_sex;
	}
	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}
	
	
	
}
