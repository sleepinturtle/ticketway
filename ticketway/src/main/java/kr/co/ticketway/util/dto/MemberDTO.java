package kr.co.ticketway.util.dto;

public class MemberDTO {

	private String mno;
	private String mid;
	private String mname;
	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}
	private String mpwd;
	private String mtel;
	private String tel1;
	private String tel2;
	private String tel3;
	private String email1;
	private String email2;
	
	private String mpost;
	private String maddr;
	private String maddr1;
	private String email;
	private String mbday;
	private String cert1;
	private String cert2;
	private String del_yn;
	private String mgr_yn;

	public String getMtel() {
		return mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	public String getMbday() {
		return mbday;
	}

	public void setMbday(String mbday) {
		this.mbday = mbday;
	}

	public String getCert1() {
		return cert1;
	}

	public void setCert1(String cert1) {
		this.cert1 = cert1;
	}

	public String getCert2() {
		return cert2;
	}

	public void setCert2(String cert2) {
		this.cert2 = cert2;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public String getMgr_yn() {
		return mgr_yn;
	}

	public void setMgr_yn(String mgr_yn) {
		this.mgr_yn = mgr_yn;
	}

	public String getMpost() {
		return mpost;
	}

	public void setMpost(String mpost) {
		this.mpost = mpost;
	}

	public String getMaddr() {
		return maddr;
	}

	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}

	public String getMaddr1() {
		return maddr1;
	}

	public void setMaddr1(String maddr1) {
		this.maddr1 = maddr1;
	}

	public String toString() {
		return mno + " : " + mid;
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
	public String getMpwd() {
		return mpwd;
	}
	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	

	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}



}//class

/*
 * DTO의 종류
 * 1. Table DTO : 테이블 컬럼과 동일한 변수를 갖는 DTO
 * 2. View DTO : 화면 요소와 동일한 변수를 갖는 DTO
 * 3. Composite DTO : 복합적인 변수를 갖는 DTO
 * -> 결론은 개발자 맘대로 만드시면 되요.
 */
