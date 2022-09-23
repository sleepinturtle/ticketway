package kr.co.ticketway.ticketing;


public class TicketingDTO {

	private String sche_no;
	private String play_no;
	private String play_title;
	private String runtime;
	private String open_date;
	private String close_date;
	private String play_date;
	private String play_time;
	private String tht_no;
	private String hall_no;
	private String book_cnt;
	private String remain_seat;
	
	

	private String sido_code;
	private String hall_name;
	private String seat_qty;
	private String r_qty;
	private String c_qty;
	
	@Override
	public String toString() {
		return sche_no
				+ " : " +play_no
				+ " : " +play_title
				+ " : " +runtime
				+ " : " +open_date
				+ " : " +close_date
				+ " : " +play_date
				+ " : " +play_time
				+ " : " +tht_no
				+ " : " +hall_no
				+ " : " +book_cnt
				+ " : " +remain_seat
				+ " : " +sido_code
				+ " : " +hall_name
				+ " : " +seat_qty
				+ " : " +r_qty
				+ " : " +c_qty;
	}

	public String getSche_no() {
		return sche_no;
	}

	public void setSche_no(String sche_no) {
		this.sche_no = sche_no;
	}

	public String getPlay_no() {
		return play_no;
	}

	public void setPlay_no(String play_no) {
		this.play_no = play_no;
	}

	public String getPlay_title() {
		return play_title;
	}

	public void setPlay_title(String play_title) {
		this.play_title = play_title;
	}

	public String getRuntime() {
		return runtime;
	}

	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}

	public String getOpen_date() {
		return open_date;
	}

	public void setOpen_date(String open_date) {
		this.open_date = open_date;
	}

	public String getClose_date() {
		return close_date;
	}

	public void setClose_date(String close_date) {
		this.close_date = close_date;
	}

	public String getPlay_date() {
		return play_date;
	}

	public void setPlay_date(String play_date) {
		this.play_date = play_date;
	}

	public String getPlay_time() {
		return play_time;
	}

	public void setPlay_time(String play_time) {
		this.play_time = play_time;
	}

	public String getTht_no() {
		return tht_no;
	}

	public void setTht_no(String tht_no) {
		this.tht_no = tht_no;
	}

	public String getHall_no() {
		return hall_no;
	}

	public void setHall_no(String hall_no) {
		this.hall_no = hall_no;
	}

	public String getBook_cnt() {
		return book_cnt;
	}

	public void setBook_cnt(String book_cnt) {
		this.book_cnt = book_cnt;
	}

	public String getRemain_seat() {
		return remain_seat;
	}

	public void setRemain_seat(String remain_seat) {
		this.remain_seat = remain_seat;
	}

	public String getSido_code() {
		return sido_code;
	}

	public void setSido_code(String sido_code) {
		this.sido_code = sido_code;
	}

	public String getHall_name() {
		return hall_name;
	}

	public void setHall_name(String hall_name) {
		this.hall_name = hall_name;
	}

	public String getSeat_qty() {
		return seat_qty;
	}

	public void setSeat_qty(String seat_qty) {
		this.seat_qty = seat_qty;
	}

	public String getR_qty() {
		return r_qty;
	}

	public void setR_qty(String r_qty) {
		this.r_qty = r_qty;
	}

	public String getC_qty() {
		return c_qty;
	}

	public void setC_qty(String c_qty) {
		this.c_qty = c_qty;
	}
	
	
	
}
