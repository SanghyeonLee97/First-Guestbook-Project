package com.oopsw.model;
//회원정보 memberID, pw, member_nickname, name, birthdate, mobile_number, email, agreement
public class MemberVO {
	private String memberID;
	private String pw;
	private String memberNickname;
	private String name;
	private String birthdate;
	private String mobileNumber;
	private String email;
	private int agreement;


	public MemberVO(){}
	public MemberVO(String memberID, String pw, String memberNickname, String name, String birthdate,
			String mobileNumber, String email, int agreement) {
		super();
		this.memberID = memberID;
		this.pw = pw;
		this.memberNickname = memberNickname;
		this.name = name;
		this.birthdate = birthdate;
		this.mobileNumber = mobileNumber;
		this.email = email;
		this.agreement = agreement;
	}


	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAgreement() {
		return agreement;
	}
	public void setAgreement(int agreement) {
		this.agreement = agreement;
	}
	@Override
	public String toString() {
		return "memberID=" + memberID + ", pw=" + pw + ", memberNickname=" + memberNickname + ", name=" + name
				+ ", birthdate=" + birthdate + ", mobileNumber=" + mobileNumber + ", email=" + email + ", agreement="
				+ agreement;
	}
}