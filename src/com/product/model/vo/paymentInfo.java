package com.product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class paymentInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1000L;
	private int orderNo;
	private Date orderDate;
	private String pName; // 주문 상품명
	private String userName; // 주문자명
	private String userId; // 주문자 아이디
	private String sellerId; // 판매자 아이디
	private String userPhone; // 주문자 연락처
	private String address; // 배송지
	private String resultPrice; // 총가격
	private String paymentSelect; // 결제방법
	
	public paymentInfo() {
		
	}

	
	
	public paymentInfo(String pName, String userName, String userId, String sellerId, String userPhone, String address,
			String resultPrice, String paymentSelect) {
		super();
		this.pName = pName;
		this.userName = userName;
		this.userId = userId;
		this.sellerId = sellerId;
		this.userPhone = userPhone;
		this.address = address;
		this.resultPrice = resultPrice;
		this.paymentSelect = paymentSelect;
	}



	public paymentInfo(int orderNo, Date orderDate, String pName, String userName, String userId, String sellerId,
			String userPhone, String address, String resultPrice, String paymentSelect) {
		super();
		this.orderNo = orderNo;
		this.orderDate = orderDate;
		this.pName = pName;
		this.userName = userName;
		this.userId = userId;
		this.sellerId = sellerId;
		this.userPhone = userPhone;
		this.address = address;
		this.resultPrice = resultPrice;
		this.paymentSelect = paymentSelect;
	}



	public int getOrderNo() {
		return orderNo;
	}



	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}



	public Date getOrderDate() {
		return orderDate;
	}



	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}



	public String getpName() {
		return pName;
	}



	public void setpName(String pName) {
		this.pName = pName;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getSellerId() {
		return sellerId;
	}



	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}



	public String getUserPhone() {
		return userPhone;
	}



	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getResultPrice() {
		return resultPrice;
	}



	public void setResultPrice(String resultPrice) {
		this.resultPrice = resultPrice;
	}



	public String getPaymentSelect() {
		return paymentSelect;
	}



	public void setPaymentSelect(String paymentSelect) {
		this.paymentSelect = paymentSelect;
	}



	@Override
	public String toString() {
		return "paymentInfo [orderNo=" + orderNo + ", orderDate=" + orderDate + ", pName=" + pName + ", userName="
				+ userName + ", userId=" + userId + ", sellerId=" + sellerId + ", userPhone=" + userPhone + ", address="
				+ address + ", resultPrice=" + resultPrice + ", paymentSelect=" + paymentSelect + "]";
	}
	
	
	
}
