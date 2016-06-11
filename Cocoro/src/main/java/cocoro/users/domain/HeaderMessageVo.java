package cocoro.users.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class HeaderMessageVo implements Serializable{

	private int message_o_id;
	private int message_u_id;
	private int u_id;
	private String u_name;
	private String u_image;
	private String message_comment;
	private Timestamp message_date;
	
	
	public int getMessage_o_id() {
		return message_o_id;
	}
	public void setMessage_o_id(int message_o_id) {
		this.message_o_id = message_o_id;
	}
	public int getMessage_u_id() {
		return message_u_id;
	}
	public void setMessage_u_id(int message_u_id) {
		this.message_u_id = message_u_id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_image() {
		return u_image;
	}
	public void setU_image(String u_image) {
		this.u_image = u_image;
	}
	public String getMessage_comment() {
		return message_comment;
	}
	public void setMessage_comment(String message_comment) {
		this.message_comment = message_comment;
	}
	public Timestamp getMessage_date() {
		return message_date;
	}
	public void setMessage_date(Timestamp timestamp) {
		this.message_date = timestamp;
	}
	
	@Override
	public String toString() {
		return "HeaderMessageVo [message_o_id=" + message_o_id + ", message_u_id=" + message_u_id + ", u_id=" + u_id
				+ ", u_name=" + u_name + ", u_image=" + u_image + ", message_comment=" + message_comment
				+ ", message_date=" + message_date + "]";
	}
	
	
	
	

	
	
}
