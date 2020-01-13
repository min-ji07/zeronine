package com.boardLikey.model.vo;

import java.io.Serializable;

public class Likey implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int likeyno;
	private int bno;
	private String userid;
	private String likey_yn;
	private int yn_cnt;
	private int likecount;
	public Likey() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public Likey(int bno, String userid) {
		super();
		this.bno = bno;
		this.userid = userid;
	}



	public Likey(int likeyno, int bno, String userid, String likey_yn, int likecount) {
		super();
		this.likeyno = likeyno;
		this.bno = bno;
		this.userid = userid;
		this.likey_yn = likey_yn;
		this.likecount = likecount;
	}

	public int getLikeyno() {
		return likeyno;
	}

	public void setLikeyno(int likeyno) {
		this.likeyno = likeyno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getLikey_yn() {
		return likey_yn;
	}

	public void setLikey_yn(String likey_yn) {
		this.likey_yn = likey_yn;
	}
	
	public int getYn_cnt() {
		return yn_cnt;
	}
	public void setYn_cnt(int yn_cnt) {
		this.yn_cnt = yn_cnt;
	}
	
	

	public int getLikecount() {
		return likecount;
	}



	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}



	@Override
	public String toString() {
		return "Likey [likeyno=" + likeyno + 
					", bno=" + bno +
					", userid=" + userid +
					", likey_yn=" + likey_yn + ",likecount" + likecount + "]";
	}
	
	
	

}
