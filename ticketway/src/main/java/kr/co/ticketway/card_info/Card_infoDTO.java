package kr.co.ticketway.card_info;

public class Card_infoDTO {

	private String card_no;
	private String card_name;
	private String mno;
	private String card_num;
	private String exp_date1;
	private String exp_date2;
	private String cvc_code;
	private String card_pwd;
	private String used_date;
	private String reg_date;

	@Override
	public String toString() {
		return card_no +" : "
				+ card_name +" : "
				+ mno +" : "
				+ card_num +" : "
				+ exp_date1 +" : "
				+ exp_date2 +" : "
				+ cvc_code +" : "
				+ card_pwd +" : "
				+ used_date +" : "
				+ reg_date;
	}
	public String getCard_num() {
		return card_num;
	}
	public void setCard_num(String card_num) {
		this.card_num = card_num;
	}
	public String getExp_date1() {
		return exp_date1;
	}
	public void setExp_date1(String exp_date1) {
		this.exp_date1 = exp_date1;
	}
	public String getExp_date2() {
		return exp_date2;
	}
	public void setExp_date2(String exp_date2) {
		this.exp_date2 = exp_date2;
	}
	public String getCard_pwd() {
		return card_pwd;
	}
	public void setCard_pwd(String card_pwd) {
		this.card_pwd = card_pwd;
	}
	public String getCard_no() {
		return card_no;
	}
	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}
	public String getCard_name() {
		return card_name;
	}
	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getCvc_code() {
		return cvc_code;
	}
	public void setCvc_code(String cvc_code) {
		this.cvc_code = cvc_code;
	}

	public String getUsed_date() {
		return used_date;
	}
	public void setUsed_date(String used_date) {
		this.used_date = used_date;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

}//class
