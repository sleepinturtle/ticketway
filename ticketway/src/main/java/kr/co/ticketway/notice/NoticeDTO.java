package kr.co.ticketway.notice;

public class NoticeDTO {

	private String news_no;
	private String title;
	private String mno;
	private String mid;
	private String class_no;
	private String cnts;
	private String news_date;
	private String thumnail_path;
	private String qna_no;
	private String qna_date;
	private String qna_cnts;
	private String view_cnt;
	private String cmt_no;
	private String rply_date;
	

	public String getCmt_no() {
		return cmt_no;
	}

	public void setCmt_no(String cmt_no) {
		this.cmt_no = cmt_no;
	}

	public String getRply_date() {
		return rply_date;
	}

	public void setRply_date(String rply_date) {
		this.rply_date = rply_date;
	}

	public String getQna_no() {
		return qna_no;
	}

	public void setQna_no(String qna_no) {
		this.qna_no = qna_no;
	}

	public String getQna_date() {
		return qna_date;
	}

	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}

	public String getQna_cnts() {
		return qna_cnts;
	}

	public void setQna_cnts(String qna_cnts) {
		this.qna_cnts = qna_cnts;
	}

	public String getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(String view_cnt) {
		this.view_cnt = view_cnt;
	}

	@Override
	public String toString() {
		return news_no + " : " + title + " : " + mid;
	}

	public String getNews_no() {
		return news_no;
	}

	public void setNews_no(String news_no) {
		this.news_no = news_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getClass_no() {
		return class_no;
	}

	public void setClass_no(String class_no) {
		this.class_no = class_no;
	}

	public String getCnts() {
		return cnts;
	}

	public void setCnts(String cnts) {
		this.cnts = cnts;
	}

	public String getNews_date() {
		return news_date;
	}

	public void setNews_date(String news_date) {
		this.news_date = news_date;
	}

	public String getThumnail_path() {
		return thumnail_path;
	}

	public void setThumnail_path(String thumnail_path) {
		this.thumnail_path = thumnail_path;
	}

	

}//class
