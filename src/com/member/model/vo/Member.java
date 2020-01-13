package com.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

// VO : 데이터 전달용 그릇
public class Member implements Serializable {

	private static final long serialVersionUID = 1000L;
	/*
	USERID, PASSWORD, USERNAME, EAMIL , ZIPCODE, ADDRESS1, ADDRESS2
	*/
	
	// 1. 필드변수 / 멤버 변수
	private int nno;
	private String userId;   // 사용자 아이디
	private String userName; // 사용자 이름
	private String userPwd;  // 사용자 비밀번호
	private String email;	 // 이메일
	private String address1;  // 주소1
	private String address2;  // 주소2
	private String address3; // 주소3
	private Date enrollDate; // 가입일(java.sql.Date)
	private int userjoin;
	
	// 2. 생성자
	// 기본 생성자
	public Member() {}
	
	// 로그인용 생성자
	public Member(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}
	
	  public Member(String userId) {
	      this.userId = userId;
	   }
	
	public Member(String userId, String userName, String userPwd, String email,String address1,
			String address2,String address3) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.email = email;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
	}
	
	public Member(int nno,String userId,  String userName, String userPwd, String email,String address1,
			String address2,String address3,Date enrollDate) {
		super();
		this.nno = nno;
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.email = email;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.enrollDate = enrollDate;
	}
	

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	
	
	public int getUserjoin() {
		return userjoin;
	}

	public void setUserjoin(int userjoin) {
		this.userjoin = userjoin;
	}

	@Override
	public String toString() {
		return "Member [nno=" + nno + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", email=" + email + ", address1=" + address1 + ", address2=" + address2 + ", address3=" + address3
				+ ", enrollDate=" + enrollDate + "]";
	}

	


	
	

	
	
	

	
}
