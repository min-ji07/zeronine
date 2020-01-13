package com.product.model.vo;

import java.io.Serializable;

public class PageInfo implements Serializable{

   /**
    * 
    */
   private static final long serialVersionUID = 1L;
   private int currentPage;
   private int listCount1;
   private int listCount2;
   private int listCount3;
   private int listCount4;
   private int limit;
   private int maxPage;
   private int startPage;
   private int endPage;
   
   public PageInfo() {
      
   }
   
   

   public PageInfo(int currentPage, int listCount1, int listCount2, int listCount3, int listCount4, int limit, int maxPage,
		int startPage, int endPage) {
	super();
	this.currentPage = currentPage;
	this.listCount1 = listCount1;
	this.listCount2 = listCount2;
	this.listCount3 = listCount3;
	this.listCount4 = listCount4;
	this.limit = limit;
	this.maxPage = maxPage;
	this.startPage = startPage;
	this.endPage = endPage;
}



public int getCurrentPage() {
      return currentPage;
   }

   public void setCurrentPage(int currentPage) {
      this.currentPage = currentPage;
   }

  
   public int getListCount1() {
	return listCount1;
}



public void setListCount1(int listCount1) {
	this.listCount1 = listCount1;
}



public int getListCount2() {
	return listCount2;
}



public void setListCount2(int listCount2) {
	this.listCount2 = listCount2;
}



public int getListCount3() {
	return listCount3;
}



public void setListCount3(int listCount3) {
	this.listCount3 = listCount3;
}



public int getListCount4() {
	return listCount4;
}



public void setListCount4(int listCount4) {
	this.listCount4 = listCount4;
}



public int getLimit() {
      return limit;
   }

   public void setLimit(int limit) {
      this.limit = limit;
   }

   public int getMaxPage() {
      return maxPage;
   }

   public void setMaxPage(int maxPage) {
      this.maxPage = maxPage;
   }

   public int getStartPage() {
      return startPage;
   }

   public void setStartPage(int startPage) {
      this.startPage = startPage;
   }

   public int getEndPage() {
      return endPage;
   }

   public void setEndPage(int endPage) {
      this.endPage = endPage;
   }



@Override
public String toString() {
	return "PageInfo [currentPage=" + currentPage + ", listCount1=" + listCount1 + ", listCount2=" + listCount2
			+ ", listCount3=" + listCount3 + ", listCount4=" + listCount4 + ", limit=" + limit + ", maxPage=" + maxPage
			+ ", startPage=" + startPage + ", endPage=" + endPage + "]";
}
   
   
}