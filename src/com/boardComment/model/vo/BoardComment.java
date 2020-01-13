package com.boardComment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BoardComment implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int dno;
	private int bno;
	private String dcontent;
	private String userid;
	private Date ddate;
	private int refdno;
	private int clevel;
	private String cwriter;
	private int loc;
	
	public BoardComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BoardComment(int bno, int loc) {
		super();
		this.bno = bno;		
		this.loc = loc;
		
	}
	
	public BoardComment(int bno, String dcontent, String userid, int refdno, int clevel,String cwriter, int loc) {
		super();
		this.bno = bno;
		this.dcontent = dcontent;
		this.userid = userid;
		this.refdno = refdno;
		this.clevel = clevel;
		this.cwriter = cwriter;
		this.loc = loc;
		
	}

	public BoardComment(int dno, int bno, String dcontent, String userid, Date ddate, int refdno, int clevel, String cwriter) {
		super();
		this.dno = dno;
		this.bno = bno;
		this.dcontent = dcontent;
		this.userid = userid;
		this.ddate = ddate;
		this.refdno = refdno;
		this.clevel = clevel;
		this.cwriter = cwriter;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getDcontent() {
		return dcontent;
	}

	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getDdate() {
		return ddate;
	}

	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}

	public int getRefdno() {
		return refdno;
	}

	public void setRefdno(int refdno) {
		this.refdno = refdno;
	}

	public int getClevel() {
		return clevel;
	}

	public void setClevel(int clevel) {
		this.clevel = clevel;
	}
	
	public String getCwriter() {
		return cwriter;
	}
	public void setCwriter(String cwriter) {
		this.cwriter = cwriter;
	}		

	public int getLoc() {
		return loc;
	}

	public void setLoc(int loc) {
		this.loc = loc;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "BoardComment [dno=" + dno + ", bno=" + bno + ", dcontent=" + dcontent + ", userid=" + userid
				+ ", ddate=" + ddate + ", refdno=" + refdno + ", clevel=" + clevel + ",cwriter="+cwriter + ",loc"+ loc +"]";
	}

	
	
	
	
	
	
	
}
