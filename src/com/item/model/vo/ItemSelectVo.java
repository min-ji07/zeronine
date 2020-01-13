package com.item.model.vo;

import java.io.Serializable;

public class ItemSelectVo implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int pno;
	private String mimg;		
	private String pname; 	
	private int price; 		
	private String hash;	
	private int mincnt;
	private int delay;		
	private int delpay; 		
	private String op1name; 			
	private int op1price;			
	private String op2name; 	
	private int op2price;
	private String op3name; 	
	private int op3price;		
	private String deimg;
	
	public ItemSelectVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ItemSelectVo(int pno, String mimg, String pname, int price, String hash, int mincnt, int delay, int delpay,
			String op1name, int op1price, String op2name, int op2price, String op3name, int op3price, String deimg) {
		super();
		this.pno = pno;
		this.mimg = mimg;
		this.pname = pname;
		this.price = price;
		this.hash = hash;
		this.mincnt = mincnt;
		this.delay = delay;
		this.delpay = delpay;
		this.op1name = op1name;
		this.op1price = op1price;
		this.op2name = op2name;
		this.op2price = op2price;
		this.op3name = op3name;
		this.op3price = op3price;
		this.deimg = deimg;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getMimg() {
		return mimg;
	}

	public void setMimg(String mimg) {
		this.mimg = mimg;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}

	public int getMincnt() {
		return mincnt;
	}

	public void setMincnt(int mincnt) {
		this.mincnt = mincnt;
	}

	public int getDelay() {
		return delay;
	}

	public void setDelay(int delay) {
		this.delay = delay;
	}

	public int getDelpay() {
		return delpay;
	}

	public void setDelpay(int delpay) {
		this.delpay = delpay;
	}

	public String getOp1name() {
		return op1name;
	}

	public void setOp1name(String op1name) {
		this.op1name = op1name;
	}

	public int getOp1price() {
		return op1price;
	}

	public void setOp1price(int op1price) {
		this.op1price = op1price;
	}

	public String getOp2name() {
		return op2name;
	}

	public void setOp2name(String op2name) {
		this.op2name = op2name;
	}

	public int getOp2price() {
		return op2price;
	}

	public void setOp2price(int op2price) {
		this.op2price = op2price;
	}

	public String getOp3name() {
		return op3name;
	}

	public void setOp3name(String op3name) {
		this.op3name = op3name;
	}

	public int getOp3price() {
		return op3price;
	}

	public void setOp3price(int op3price) {
		this.op3price = op3price;
	}

	public String getDeimg() {
		return deimg;
	}

	public void setDeimg(String deimg) {
		this.deimg = deimg;
	}

	@Override
	public String toString() {
		return "ItemSelectVo [pno=" + pno + ", mimg=" + mimg + ", pname=" + pname + ", price=" + price + ", hash="
				+ hash + ", mincnt=" + mincnt + ", delay=" + delay + ", delpay=" + delpay + ", op1name=" + op1name
				+ ", op1price=" + op1price + ", op2name=" + op2name + ", op2price=" + op2price + ", op3name=" + op3name
				+ ", op3price=" + op3price + ", deimg=" + deimg + "]";
	}
	
	
	
	
	
}
