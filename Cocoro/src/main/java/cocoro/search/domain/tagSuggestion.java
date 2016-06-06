package cocoro.search.domain;

import java.io.Serializable;

public class tagSuggestion implements Serializable{

	
	private int rownum;
	private int s_id;
	private String s_name;

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getS_id() {
		return s_id;
	}

	public void setS_id(int s_id) {
		this.s_id = s_id;
	}

	public String getS_name(){
		return s_name;
	}

	public void setS_name(String s_name){
		this.s_name = s_name;
	}

	@Override
	public String toString(){
		return "tagSuggestion [rownum=" + rownum + ", s_id=" + s_id
				+ ", s_name=" + s_name + "]";
	}
	
	

}
