package kr.co.ticketway.product;

public class ProductReplyDTO {

	private String reply_no;
	private String prdt_no;
	private String mno;
	private String mid;
	private String reply_class;
	private String reply_class_name;
	private String contents;
	private String reply_date;

	@Override
	public String toString() {
		return "reply_no : " + reply_no
				+ ", prdt_no : " + prdt_no
				+ ", mno : " + mno
				+ ", reply_class : " + reply_class
				+ ", contents : " + contents
				+ ", reply_date : " + reply_date;
	}
	public String getReply_no() {
		return reply_no;
	}
	public void setReply_no(String reply_no) {
		this.reply_no = reply_no;
	}
	public String getPrdt_no() {
		return prdt_no;
	}
	public void setPrdt_no(String prdt_no) {
		this.prdt_no = prdt_no;
	}
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getReply_class() {
		return reply_class;
	}
	public void setReply_class(String reply_class) {
		this.reply_class = reply_class;
	}
	public String getReply_class_name() {
		return reply_class_name;
	}
	public void setReply_class_name(String reply_class_name) {
		this.reply_class_name = reply_class_name;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}

}//class
