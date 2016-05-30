package cocoro.study.domain;

public class Applydata {

	private int apply_id;
	private int s_id;
	private int u_id;
	private int rank_for_apply;
	private String u_name;
	
	public Applydata(){}
	
	public Applydata(int apply_id, int s_id, int u_id, int rank_for_apply,
			String u_name) {
		super();
		this.apply_id = apply_id;
		this.s_id = s_id;
		this.u_id = u_id;
		this.rank_for_apply = rank_for_apply;
		this.u_name = u_name;
	}
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
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	@Override
	public String toString() {
		return "Applydata [apply_id=" + apply_id + ", s_id=" + s_id + ", u_id="
				+ u_id + ", rank_for_apply=" + rank_for_apply + ", u_name="
				+ u_name + "]";
	}
	
}
