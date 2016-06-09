package cocoro.study.domain;

public class StudyAccount {

	private int s_account_id;
	private int s_account; 
	private int s_balance;
	private int s_id;
	
	public StudyAccount(){}

	public int getS_account_id() {
		return s_account_id;
	}

	public void setS_account_id(int s_account_id) {
		this.s_account_id = s_account_id;
	}

	public int getS_account() {
		return s_account;
	}

	public void setS_account(int s_account) {
		this.s_account = s_account;
	}

	public int getS_balance() {
		return s_balance;
	}

	public void setS_balance(int s_balance) {
		this.s_balance = s_balance;
	}

	public int getS_id() {
		return s_id;
	}

	public void setS_id(int s_id) {
		this.s_id = s_id;
	}

	public StudyAccount(int s_account_id, int s_account, int s_balance, int s_id) {
		super();
		this.s_account_id = s_account_id;
		this.s_account = s_account;
		this.s_balance = s_balance;
		this.s_id = s_id;
	}
	
	
}
