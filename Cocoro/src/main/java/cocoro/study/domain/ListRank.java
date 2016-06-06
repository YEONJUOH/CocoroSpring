package cocoro.study.domain;

public class ListRank {
	
	private String u_name;
	private int a_rank;
	
	public ListRank(){}

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

	public ListRank(String u_name, int a_rank) {
		super();
		this.u_name = u_name;
		this.a_rank = a_rank;
	}

	@Override
	public String toString() {
		return "ListRank [u_name=" + u_name + ", a_rank=" + a_rank + "]";
	}
	
	
}
