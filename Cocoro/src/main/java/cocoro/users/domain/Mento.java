package cocoro.users.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class Mento implements Serializable {
	
	private int m_id;
	private int u_id;
	private String m_major;
	private Timestamp m_check_date;
	
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public String getM_major() {
		return m_major;
	}
	public void setM_major(String m_major) {
		this.m_major = m_major;
	}
	public Timestamp getM_check_date() {
		return m_check_date;
	}
	public void setM_check_date(Timestamp m_check_date) {
		this.m_check_date = m_check_date;
	}
}
