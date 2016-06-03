package cocoro.search.domain;

import java.sql.Timestamp;

public class SearchInfo {
	private int u_id;
	private int s_id;
	
	private int s_hit;
	private Timestamp search_date;
	
	public SearchInfo(){};
	
	public SearchInfo(int u_id, int s_id, int s_hit, Timestamp search_date) {
		super();
		this.u_id = u_id;
		this.s_id = s_id;
		this.s_hit = s_hit;
		this.search_date = search_date;
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
	public int getS_hit() {
		return s_hit;
	}
	public void setS_hit(int s_hit) {
		this.s_hit = s_hit;
	}
	public Timestamp getSearch_date() {
		return search_date;
	}
	public void setSearch_date(Timestamp search_date) {
		this.search_date = search_date;
	}
	
}
