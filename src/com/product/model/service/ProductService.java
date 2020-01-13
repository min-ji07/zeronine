package com.product.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.product.model.dao.ProductDao;
import com.product.model.vo.Product;
import com.product.model.vo.paymentInfo;

public class ProductService {
	
private ProductDao pDao = new ProductDao();
	/**
	 * 상품 등록
	 * @param p
	 * @return
	 */
	public int insertProduct(Product p) {
		Connection con = getConnection();
		
		int result = pDao.insertProduct(con,p);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	public int UpdateProduct(Product p,int pno) {
		Connection con = getConnection();
		System.out.println("업데이트 서비스 서블릿: " + p);
		int result = pDao.updateProduct(con,p,pno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	public int insertLikey(int pno) {
		Connection con = getConnection();
		
		int result = pDao.insertLikey(con,pno);
		System.out.println("여기result = " +result);
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);
		return result;
	}
	
	public Product selectSeq() {
		Connection con = getConnection();
		Product p2 = pDao.selectSeq(con);
		close(con);
		
		return p2;
	}
	/**
	 * 상품 카테고리 페이지 리스트
	 * @param currentPage
	 * @param limit
	 * @return
	 */
	public ArrayList<Product> selectProductList(int currentPage,int limit,int radio){
		Connection con = getConnection();
		
		ArrayList<Product> list = pDao.selectProductList(con,currentPage,limit,radio);
		
		close(con);
		
		return list;
	}
	
	

	/**
	 * 상품 카테고리 순서 정렬
	 * @param currentPage
	 * @param limit
	 * @return
	 */
	public ArrayList<Product> selectOrderList(int currentPage,int limit,int k,int radio){
		Connection con = getConnection();
		
		ArrayList<Product> list = pDao.selectOrderList(con,currentPage,limit,k,radio);
		
		close(con);
		
		return list;
	}
	
	public ArrayList<Product> top3Select(){
		Connection con = getConnection();
		ArrayList<Product> list = pDao.top3Select(con);	
		close(con);	
		return list;
	}

		
	
	/**
	 * 메뉴 카테고리 상품 개수
	 * @return
	 */
	public int getListCount1(int radio) {
		Connection con = getConnection();	
		int listCount = pDao.getListCount1(con,radio);	
		close(con);
		return listCount;
	}

	public int getListCount2(int radio) {
		Connection con = getConnection();	
		int listCount = pDao.getListCount2(con,radio);	
		close(con);
		return listCount;
	}
	
	public int getListCount3(int radio) {
		Connection con = getConnection();	
		int listCount = pDao.getListCount3(con,radio);	
		close(con);
		return listCount;
	}
	
	public int getListCount4(int radio) {
		Connection con = getConnection();	
		int listCount = pDao.getListCount4(con,radio);	
		close(con);
		return listCount;
	}
	
	/**
	 * 카테고리 태그 검색
	 * @param hashName
	 * @return
	 */
	public ArrayList<Product> productTagSelect(String hashName,int radio){
		Connection con = getConnection();
		
		ArrayList<Product> list = pDao.productTagSelect(con,hashName,radio);
		
		close(con);
		
		return list;
	}
	
	public ArrayList<Product> productSearchSelect(String search,int radio){
		Connection con = getConnection();
		
		ArrayList<Product> list = pDao.productSearchSelect(con,search,radio);
		
		close(con);
		
		return list;
	}

	
	public Product productSelectOne(int pno) {
		Connection con = getConnection();
		
		Product p = pDao.productSelectOne(con, pno);
		
	
		close(con);
		
		return p;
	}
	
	public int updateLikecount(int pno, int likecnt) {
		Connection con = getConnection();
		int result = pDao.updateLikey(con,pno,likecnt);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);
		return result;	
	}
	
	public int insertPaymentInfo(paymentInfo pm) {
		Connection con = getConnection();
		
		int result = pDao.insertPaymentInfo(con,pm);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	
	public ArrayList<Product> myPageProductList(String getId){
		Connection con = getConnection();
		
		ArrayList<Product> list = pDao.myPageProductList(con,getId);
		
		close(con);
		
		return list;
	}
	
	public ArrayList<paymentInfo> myPageOrderList(String getId){
		Connection con = getConnection();
		
		ArrayList<paymentInfo> list = pDao.myPageOrderList(con,getId);
		
		close(con);
		
		return list;
	}
	
	public ArrayList<paymentInfo> myPageSellerList(String getId){
		Connection con = getConnection();
		
		ArrayList<paymentInfo> list = pDao.myPageSellerList(con,getId);
		
		close(con);
		
		return list;
	}
	
	public int deleteItem(int pno) {             // 상품삭제
	      Connection con = getConnection();                   
	      int result = pDao.deleteItem(con, pno);      // result의 값 = 0
	      if(result > 0) commit(con);
	      else rollback(con);
	      
	      close(con);	      
	      return result;
	   }
	public ArrayList<Product> myPageLikeList(String userid){
		Connection con = getConnection();
		
		ArrayList<Product> list = pDao.myPageLikeList(con,userid);
		
		close(con);
		
		return list;
	}
}
