package com.question.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Question implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int no; // 게시글 번호
	private String title;  // 제목
	private String content; // 내용
	private String writer;  // 유저아이디
	private Date date;      // 날짜
	private int count;		// 조회수
	private boolean check;  // 체크 유무
	
	// 추가
	private String username; //유저 이름
	private String status;   //삭제 여부('Y'이면 삭제X, 'N'이면 삭제O)
	
	
	public Question() {}
	
/*	public Question(String title, String content, boolean check) {
		super();
		this.title = title;
		this.content = content;
		this.check = check;
	}*/
	
	// 1대1폼 작성후 들어가는 생성자
	public Question(String title, String content, String writer, String status) {
		super();
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.status = status;
		
	}
	
	public Question(int no, String title, String content, String writer, Date date, int count) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.date = date;
		this.count = count;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public boolean isCheck() {
		return check;
	}

	public void setCheck(boolean check) {
		this.check = check;
	}
	
	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getStatues() {
		return status;
	}

	public void setStatus(String stats) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Question [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer + ", date="
				+ date + ", count=" + count + ", check=" + check + ", username=" + username + ", status=" + status
				+ "]";
	}



}
