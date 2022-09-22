package kr.co.ticketway.purchase;

public class PurchaseDTO {

	private int book_num;
	private int mno;
	private int play_no;
	private String hall_name;
	private String total_price;
	private int ticket_cnt;
	private String play_date;
	private String book_date;
	private int card_no;
	private String seat_code;
	
	
	public int getBook_num() {
		return book_num;
	}
	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getPlay_no() {
		return play_no;
	}
	public void setPlay_no(int play_no) {
		this.play_no = play_no;
	}
	public String getHall_name() {
		return hall_name;
	}
	public void setHall_name(String hall_name) {
		this.hall_name = hall_name;
	}
	public String getTotal_price() {
		return total_price;
	}
	public void setTotal_price(String total_price) {
		this.total_price = total_price;
	}
	public int getTicket_cnt() {
		return ticket_cnt;
	}
	public void setTicket_cnt(int ticket_cnt) {
		this.ticket_cnt = ticket_cnt;
	}
	public String getPlay_date() {
		return play_date;
	}
	public void setPlay_date(String play_date) {
		this.play_date = play_date;
	}
	public String getBook_date() {
		return book_date;
	}
	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}
	public int getCard_no() {
		return card_no;
	}
	public void setCard_no(int card_no) {
		this.card_no = card_no;
	}
	public String getSeat_code() {
		return seat_code;
	}
	public void setSeat_code(String seat_code) {
		this.seat_code = seat_code;
	}
}
