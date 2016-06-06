package cocoro.study.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class StudyActivity  implements Serializable {

	private int j_id;
	private int u_id;
	private int s_id;
	private Timestamp j_date;
	private Timestamp s_last_login;
	
	public int getJ_id() {
		return j_id;
	}
	public void setJ_id(int j_id) {
		this.j_id = j_id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public Timestamp getJ_date() {
		return j_date;
	}
	public void setJ_date(Timestamp j_date) {
		this.j_date = j_date;
	}
	public Timestamp getS_last_login() {
		return s_last_login;
	}
	public void setS_last_login(Timestamp s_last_login) {
		this.s_last_login = s_last_login;
	}
	@Override
	public String toString() {
		return "StudyActivity [j_id=" + j_id + ", u_id=" + u_id + ", s_id=" + s_id + ", j_date=" + j_date
				+ ", s_last_login=" + s_last_login + "]";
	}
	
	
	
}
