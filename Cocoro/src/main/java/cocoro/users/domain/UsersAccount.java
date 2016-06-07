package cocoro.users.domain;

import java.io.Serializable;

public class UsersAccount implements Serializable{
	
	private int u_account_id;
	private int u_account;
	private int u_balance;
	private int u_id;
	
	public int getU_account_id() {
		return u_account_id;
	}
	public void setU_account_id(int u_account_id) {
		this.u_account_id = u_account_id;
	}
	public int getU_account() {
		return u_account;
	}
	public void setU_account(int u_account) {
		this.u_account = u_account;
	}
	public int getU_balance() {
		return u_balance;
	}
	public void setU_balance(int u_balance) {
		this.u_balance = u_balance;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	
	@Override
	public String toString() {
		return "UsersAccount [u_account_id=" + u_account_id + ", u_account=" + u_account + ", u_balance=" + u_balance
				+ ", u_id=" + u_id + "]";
	}
	

}
