package cocoro.users.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class Users implements Serializable{

	// user , account, mentor 갓상효

	private int u_id;
	private String u_email;
	private String u_pwd;
	private String u_birth;
	private String u_birth_check; // 제약조건 T or F
	private String u_address;
	private String u_address_check; // 제약조건 T or F
	private String u_image;
	private String u_sex; // 제약조건 남 or 여
	private String u_intro;
	private String u_tag;
	private Timestamp u_histroy;
	private Timestamp u_last_login;
	private String u_mento_check; // 제약조건 T or F
	private int u_like_num;
	private String u_sns_address;
	private int u_goal_ration;	//목표달성률
	private String u_bgimg; 
	
	

	public String getU_bgimg() {
		return u_bgimg;
	}

	public void setU_bgimg(String u_bgimg) {
		this.u_bgimg = u_bgimg;
	}

	// 추가1
	private String u_name;
	// 추가2
	private String m_major;

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_pwd() {
		return u_pwd;
	}

	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}

	public String getU_birth() {
		return u_birth;
	}

	public void setU_birth(String u_birth) {
		this.u_birth = u_birth;
	}

	public String getU_birth_check() {
		return u_birth_check;
	}

	public void setU_birth_check(String u_birth_check) {
		this.u_birth_check = u_birth_check;
	}

	public String getU_address() {
		return u_address;
	}

	public void setU_address(String u_address) {
		this.u_address = u_address;
	}

	public String getU_address_check() {
		return u_address_check;
	}

	public void setU_address_check(String u_address_check) {
		this.u_address_check = u_address_check;
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

	public String getU_intro() {
		return u_intro;
	}

	public void setU_intro(String u_intro) {
		this.u_intro = u_intro;
	}

	public String getU_tag() {
		return u_tag;
	}

	public void setU_tag(String u_tag) {
		this.u_tag = u_tag;
	}

	public Timestamp getU_histroy() {
		return u_histroy;
	}

	public void setU_histroy(Timestamp u_histroy) {
		this.u_histroy = u_histroy;
	}

	public Timestamp getU_last_login() {
		return u_last_login;
	}

	public void setU_last_login(Timestamp u_last_login) {
		this.u_last_login = u_last_login;
	}

	public String getU_mento_check() {
		return u_mento_check;
	}

	public void setU_mento_check(String u_mento_check) {
		this.u_mento_check = u_mento_check;
	}

	public int getU_like_num() {
		return u_like_num;
	}

	public void setU_like_num(int u_like_num) {
		this.u_like_num = u_like_num;
	}

	public String getU_sns_address() {
		return u_sns_address;
	}

	public void setU_sns_address(String u_sns_address) {
		this.u_sns_address = u_sns_address;
	}

	public int getU_goal_ration() {
		return u_goal_ration;
	}

	public void setU_goal_ration(int u_goal_ratio) {
		this.u_goal_ration = u_goal_ratio;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getM_major() {
		return m_major;
	}

	public void setM_major(String m_major) {
		this.m_major = m_major;
	}

	@Override
	public String toString() {
		return "Users [u_id=" + u_id + ", u_email=" + u_email + ", u_pwd="
				+ u_pwd + ", u_birth=" + u_birth + ", u_birth_check="
				+ u_birth_check + ", u_address=" + u_address
				+ ", u_address_check=" + u_address_check + ", u_image="
				+ u_image + ", u_sex=" + u_sex + ", u_intro=" + u_intro
				+ ", u_tag=" + u_tag + ", u_histroy=" + u_histroy
				+ ", u_last_login=" + u_last_login + ", u_mento_check="
				+ u_mento_check + ", u_like_num=" + u_like_num
				+ ", u_sns_address=" + u_sns_address + ", u_goal_ratio="
				+ u_goal_ration + ", u_name=" + u_name + ", m_major=" + m_major
				+ "]";
	}


}
