package com.product.model.vo;

import java.io.Serializable;

public class Product implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int pno;
	private String mainImage;
	private String mainTitle;
	private int mainPrice;
	private String op1_title;
	private String op1_price;
	private String op2_title;
	private String op2_price;
	private String op3_title;
	private String op3_price;
	private int radio;
	private int dv_price;
	private int dv_due;
	private int min_person;
	private int min_count;
	private String hashtag1;
	private String hashtag2;
	private String hashtag3;
	private String detailImage;
	private String writerId;
	private int likeCount;
	private int sangcnt;
	private int buycnt;
	public Product() {
		
	}

	public Product(int pno, String mainImage, String mainTitle, int mainPrice, String op1_title, String op1_price,
			String op2_title, String op2_price, String op3_title, String op3_price, int radio, int dv_price, int dv_due,
			int min_person, int min_count, String hashtag1,String hashtag2,String hashtag3,String detailImage,String writerId,int likeCount) {
		super();
		this.pno = pno;
		this.mainImage = mainImage;
		this.mainTitle = mainTitle;
		this.mainPrice = mainPrice;
		this.op1_title = op1_title;
		this.op1_price = op1_price;
		this.op2_title = op2_title;
		this.op2_price = op2_price;
		this.op3_title = op3_title;
		this.op3_price = op3_price;
		this.radio = radio;
		this.dv_price = dv_price;
		this.dv_due = dv_due;
		this.min_person = min_person;
		this.min_count = min_count;
		this.hashtag1 = hashtag1;
		this.hashtag2 = hashtag2;
		this.hashtag3 = hashtag3;
		this.detailImage = detailImage;
		this.writerId = writerId;
		this.likeCount = likeCount;
	}
	
	public Product(int pno, String mainImage, String mainTitle, int mainPrice,int dv_price, int dv_due,
			int min_person, int min_count, String hashtag1,String hashtag2,String hashtag3, String detailImage,String writerId) {
		super();
		this.pno = pno;
		this.mainImage = mainImage;
		this.mainTitle = mainTitle;
		this.mainPrice = mainPrice;
		this.dv_price = dv_price;
		this.dv_due = dv_due;
		this.min_person = min_person;
		this.min_count = min_count;
		this.hashtag1 = hashtag1;
		this.hashtag2 = hashtag2;
		this.hashtag3 = hashtag3;
		this.detailImage = detailImage;
		this.writerId = writerId;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getMainImage() {
		return mainImage;
	}

	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}

	public String getMainTitle() {
		return mainTitle;
	}

	public void setMainTitle(String mainTitle) {
		this.mainTitle = mainTitle;
	}

	public int getMainPrice() {
		return mainPrice;
	}

	public void setMainPrice(int mainPrice) {
		this.mainPrice = mainPrice;
	}

	public String getOp1_title() {
		return op1_title;
	}

	public void setOp1_title(String op1_title) {
		this.op1_title = op1_title;
	}

	public String getOp1_price() {
		return op1_price;
	}

	public void setOp1_price(String op1_price) {
		this.op1_price = op1_price;
	}

	public String getOp2_title() {
		return op2_title;
	}

	public void setOp2_title(String op2_title) {
		this.op2_title = op2_title;
	}

	public String getOp2_price() {
		return op2_price;
	}

	public void setOp2_price(String op2_price) {
		this.op2_price = op2_price;
	}

	public String getOp3_title() {
		return op3_title;
	}

	public void setOp3_title(String op3_title) {
		this.op3_title = op3_title;
	}

	public String getOp3_price() {
		return op3_price;
	}

	public void setOp3_price(String op3_price) {
		this.op3_price = op3_price;
	}

	public int getRadio() {
		return radio;
	}

	public void setRadio(int radio) {
		this.radio = radio;
	}

	public int getDv_price() {
		return dv_price;
	}

	public void setDv_price(int dv_price) {
		this.dv_price = dv_price;
	}

	public int getDv_due() {
		return dv_due;
	}

	public void setDv_due(int dv_due) {
		this.dv_due = dv_due;
	}

	public int getMin_person() {
		return min_person;
	}

	public void setMin_person(int min_person) {
		this.min_person = min_person;
	}

	public int getMin_count() {
		return min_count;
	}

	public void setMin_count(int min_count) {
		this.min_count = min_count;
	}

	

	public String getHashtag1() {
		return hashtag1;
	}

	public void setHashtag1(String hashtag1) {
		this.hashtag1 = hashtag1;
	}

	public String getHashtag2() {
		return hashtag2;
	}

	public void setHashtag2(String hashtag2) {
		this.hashtag2 = hashtag2;
	}

	public String getHashtag3() {
		return hashtag3;
	}

	public void setHashtag3(String hashtag3) {
		this.hashtag3 = hashtag3;
	}

	public String getDetailImage() {
		return detailImage;
	}

	public void setDetailImage(String detailImage) {
		this.detailImage = detailImage;
	}

	
	
	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	
	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getSangcnt() {
		return sangcnt;
	}

	public void setSangcnt(int sangcnt) {
		this.sangcnt = sangcnt;
	}

	public int getBuycnt() {
		return buycnt;
	}

	public void setBuycnt(int buycnt) {
		this.buycnt = buycnt;
	}

	@Override
	public String toString() {
		return "Product [pno=" + pno + ", mainImage=" + mainImage + ", mainTitle=" + mainTitle + ", mainPrice="
				+ mainPrice + ", op1_title=" + op1_title + ", op1_price=" + op1_price + ", op2_title=" + op2_title
				+ ", op2_price=" + op2_price + ", op3_title=" + op3_title + ", op3_price=" + op3_price + ", radio="
				+ radio + ", dv_price=" + dv_price + ", dv_due=" + dv_due + ", min_person=" + min_person
				+ ", min_count=" + min_count + ", hashtag1=" + hashtag1 + ", hashtag2=" + hashtag2 + ", hashtag3="
				+ hashtag3 + ", detailImage=" + detailImage + ", writerId=" + writerId + ", likeCount=" + likeCount
				+ "]";
	}

	
	

	
	
	
}
