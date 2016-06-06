package cocoro.study.domain;

import java.io.Serializable;

public class Apply implements Serializable{

	private int apply_id;
	private int s_id;
	private int u_id;
	private int rank_for_apply;
	
	@Override
	public String toString() {
		return "Apply [apply_id=" + apply_id + ", s_id=" + s_id + ", u_id=" + u_id + ", rank_for_apply="
				+ rank_for_apply + "]";
	}

	public Apply(){};
	
	public int getApply_id() {
		return apply_id;
	}


	public void setApply_id(int apply_id) {
		this.apply_id = apply_id;
	}


	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public int getRank_for_apply() {
		return rank_for_apply;
	}
	public void setRank_for_apply(int rank_for_apply) {
		this.rank_for_apply = rank_for_apply;
	}
	
	
}
