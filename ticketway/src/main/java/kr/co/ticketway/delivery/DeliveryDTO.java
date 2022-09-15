package kr.co.ticketway.delivery;

public class DeliveryDTO {

	private String addr_no;
	private String addr_name;
	private String mno;
	private String recipient_name;
	private String tel;
	private String post_code;
	private String addr1;
	private String addr2;

	@Override
	public String toString() {
		return addr_no +" : "
				+ addr_name +" : "
				+ mno +" : "
				+ recipient_name +" : "
				+ tel +" : "
				+ post_code +" : "
				+ addr1 +" : "
				+ addr2;
	}
	public String getAddr_no() {
		return addr_no;
	}
	public void setAddr_no(String addr_no) {
		this.addr_no = addr_no;
	}
	public String getAddr_name() {
		return addr_name;
	}
	public void setAddr_name(String addr_name) {
		this.addr_name = addr_name;
	}
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getRecipient_name() {
		return recipient_name;
	}
	public void setRecipient_name(String recipient_name) {
		this.recipient_name = recipient_name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

}//class
