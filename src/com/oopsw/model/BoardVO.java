package com.oopsw.model;

//회원정보 memberID, pw, member_nickname, name, birthdate, mobile_number, email, agreement
//게시판 post_code, post_title, title, writing, upload_date, thumbsup
public class BoardVO {
	//member data
	private int postCode;
	private String postTitle;
	private String title;
	private String writing;
	private String memberNickname;
	private String uploadDate;
	private int thumbsUp;

	//constructors
	public BoardVO() {}

	public BoardVO(int postCode, String postTitle, String title, String writing, String memberNickname,
			String uploadDate, int thumbsUp) {
		super();
		this.postCode = postCode;
		this.postTitle = postTitle;
		this.title = title;
		this.writing = writing;
		this.memberNickname = memberNickname;
		this.uploadDate = uploadDate;
		this.thumbsUp = thumbsUp;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriting() {
		return writing;
	}

	public void setWriting(String writing) {
		this.writing = writing;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getThumbsUp() {
		return thumbsUp;
	}

	public void setThumbsUp(int thumbsUp) {
		this.thumbsUp = thumbsUp;
	}

	@Override
	public String toString() {
		return "\n postCode=" + postCode + ", postTitle=" + postTitle + ", title=" + title + ", writing=" + writing + ", memberNickname="
				+ memberNickname + ", uploadDate=" + uploadDate + ", thumbsUp=" + thumbsUp;
	}

}
