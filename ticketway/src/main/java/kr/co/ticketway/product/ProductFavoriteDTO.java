package kr.co.ticketway.product;

public class ProductFavoriteDTO {

	private String mno;
	private String prdt_no;
	private String favoriteCount;

	@Override
	public String toString() {
		return "mno : " + mno
				+ ", prdt_no : " + prdt_no
				+ ", favoriteCount : " + favoriteCount;
	}
	public String getMno() {
		return mno;
	}
	public void setMno(String mno) {
		this.mno = mno;
	}
	public String getPrdt_no() {
		return prdt_no;
	}
	public void setPrdt_no(String prdt_no) {
		this.prdt_no = prdt_no;
	}
	public String getFavoriteCount() {
		return favoriteCount;
	}
	public void setFavoriteCount(String favoriteCount) {
		this.favoriteCount = favoriteCount;
	}

}//class
