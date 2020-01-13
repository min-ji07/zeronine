package com.question.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class QuestionComment implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int cno;
	private int uno;
	private String ccontent;
	private String cwriter; //댓글쓴이
	private Date cdate;
	private int refcno;
	private int clevel;
	
	
	public QuestionComment() {
		
	}
	
	public QuestionComment(int uno, String ccontent, String cwriter, int refcno, int clevel) {
		super();
		this.uno = uno;
		this.ccontent = ccontent;
		this.cwriter = cwriter;
		this.refcno = refcno;
		this.clevel = clevel;
	}


	public QuestionComment(int cno, int uno, String ccontent, String cwriter, Date cdate, int refcno, int clevel) {
		super();
		this.cno = cno;
		this.uno = uno;
		this.ccontent = ccontent;
		this.cwriter = cwriter;
		this.cdate = cdate;
		this.refcno = refcno;
		this.clevel = clevel;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public String getCwriter() {
		return cwriter;
	}

	public void setCwriter(String cwriter) {
		this.cwriter = cwriter;
	}

	public Date getCdate() {
		return cdate;
	}

	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}

	public int getRefcno() {
		return refcno;
	}

	public void setRefcno(int refcno) {
		this.refcno = refcno;
	}

	public int getClevel() {
		return clevel;
	}

	public void setClevel(int clevel) {
		this.clevel = clevel;
	}

	@Override
	public String toString() {
		return "QuestionComment [cno=" + cno + ", uno=" + uno + ", ccontent=" + ccontent + ", cwriter=" + cwriter
				+ ", cdate=" + cdate + ", refcno=" + refcno + ", clevel=" + clevel + "]";
	}
	
	
	
	
	
}
