package cocoro.users.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class Message implements Serializable{
	private int message_id;
	private int message_u_id;
	private int message_o_id;
	private String message_comment;
	private Timestamp message_date;
	private String message_check;
	
	
	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}
	public int getMessage_u_id() {
		return message_u_id;
	}
	public void setMessage_u_id(int message_u_id) {
		this.message_u_id = message_u_id;
	}
	public int getMessage_o_id() {
		return message_o_id;
	}
	public void setMessage_o_id(int message_o_id) {
		this.message_o_id = message_o_id;
	}
	public String getMessage_Comment() {
		return message_comment;
	}
	public void setMessage_Comment(String message_Comment) {
		this.message_comment = message_Comment;
	}
	public Timestamp getMessage_date() {
		return message_date;
	}
	public void setMessage_date(Timestamp message_date) {
		this.message_date = message_date;
	}
	public String getMessage_check() {
		return message_check;
	}
	public void setMessage_check(String message_check) {
		this.message_check = message_check;
	}
	
}
