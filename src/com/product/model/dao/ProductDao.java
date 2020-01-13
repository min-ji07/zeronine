package com.product.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;


import com.product.model.vo.Product;
import com.product.model.vo.paymentInfo;



public class ProductDao {

	private Properties prop;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	public ProductDao() {
		prop = new Properties();
		
		String filePath = ProductDao.class.getResource("/config/product-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 상품 등록
	 * @param con
	 * @param b
	 * @return
	 */
	
	public int insertProduct(Connection con,Product p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertProduct");
		
		try {
			
			pstmt = con.prepareStatement(sql); // 미완성 쿼리
			pstmt.setString(1,p.getMainImage());
			pstmt.setString(2,p.getMainTitle());
			pstmt.setInt(3,p.getMainPrice());
			pstmt.setString(4, p.getOp1_title());
			pstmt.setString(5, p.getOp1_price());
			pstmt.setString(6, p.getOp2_title());
			pstmt.setString(7, p.getOp2_price());
			pstmt.setString(8, p.getOp3_title());
			pstmt.setString(9, p.getOp3_price());
			pstmt.setInt(10,p.getRadio());
			pstmt.setInt(11,p.getDv_price());
			pstmt.setInt(12,p.getDv_due());
			pstmt.setInt(13,p.getMin_person());
			pstmt.setInt(14,p.getMin_count());
			pstmt.setString(15,p.getHashtag1());
			pstmt.setString(16,p.getHashtag2());
			pstmt.setString(17,p.getHashtag3());
			pstmt.setString(18,p.getDetailImage());
			pstmt.setString(19,p.getWriterId());
			pstmt.setInt(20,p.getLikeCount());
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateProduct(Connection con,Product p,int pno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateProduct");
		
		try {
			
			pstmt = con.prepareStatement(sql); // 미완성 쿼리
			pstmt.setString(1,p.getMainImage());
			pstmt.setString(2,p.getMainTitle());
			pstmt.setInt(3,p.getMainPrice());
			pstmt.setString(4, p.getOp1_title());
			pstmt.setString(5, p.getOp1_price());
			pstmt.setString(6, p.getOp2_title());
			pstmt.setString(7, p.getOp2_price());
			pstmt.setString(8, p.getOp3_title());
			pstmt.setString(9, p.getOp3_price());
			pstmt.setInt(10,p.getRadio());
			pstmt.setInt(11,p.getDv_price());
			pstmt.setInt(12,p.getDv_due());
			pstmt.setInt(13,p.getMin_person());
			pstmt.setInt(14,p.getMin_count());
			pstmt.setString(15,p.getHashtag1());
			pstmt.setString(16,p.getHashtag2());
			pstmt.setString(17,p.getHashtag3());
			pstmt.setString(18,p.getDetailImage());
			pstmt.setInt(19,pno);
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
public Product selectSeq(Connection con) {
		
		Product p2 = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectSeq");
		//System.out.print(sql);
		try {
			pstmt = con.prepareStatement(sql);
			
			//pstmt.setInt(1, pno);			
			
			rset = pstmt.executeQuery();						
			
			if(rset.next()) {
				
				p2 = new Product();
				
				p2.setPno(rset.getInt("pno"));
				
							
			}						
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return p2;
	}
	
	/**
	 * 좋아요 인서트(상품등록시 실행)
	 * */
	public int insertLikey(Connection con,int pno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLikey");
		
		try {
			pstmt = con.prepareStatement(sql);			
			// pstmt.setInt(1, 1);						// 좋아요 순서 <- 시퀀스처리
			pstmt.setInt(1, pno);						// 글번호
			pstmt.setString(2, "as");						// 임시 아이디 등록
			pstmt.setString(3, "n");						// 임시 라이키
			pstmt.setInt(4, 0);
			/*
			 * pstmt.setString(2, li.getUserid()); // 유저아이디 pstmt.setString(3, "y"); //
			 * 좋아요여부
			 */								
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			
		}finally {
			close(pstmt);
		}
		System.out.println("여기서 result는 몇??"+result);
		return result;
	
	}
	
	
	/**
	 * 메뉴 카테고리 상품 개수
	 * @return
	 */
	public int getListCount1(Connection con,int radio) {
		
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = null;

		sql = prop.getProperty("listCount1");
		
		
		
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()){
				listCount = rset.getInt(1); 
			}
					
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return listCount;	
	}
	
public int getListCount2(Connection con,int radio) {
		
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = null;

		sql = prop.getProperty("listCount2");
		
		
		
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()){
				listCount = rset.getInt(1); 
			}
					
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return listCount;	
	}
	
public int getListCount3(Connection con,int radio) {
	
	int listCount = 0;
	Statement stmt = null;
	ResultSet rset = null;
	String sql = null;

	sql = prop.getProperty("listCount3");
	
	
	
	
	try {
		stmt = con.createStatement();
		
		rset = stmt.executeQuery(sql);
		
		if(rset.next()){
			listCount = rset.getInt(1); 
		}
				
	}catch(SQLException e) {
		e.printStackTrace();
	}finally {
		close(rset);
		close(stmt);
	}
	return listCount;	
}

public int getListCount4(Connection con,int radio) {
	
	int listCount = 0;
	Statement stmt = null;
	ResultSet rset = null;
	String sql = null;

	sql = prop.getProperty("listCount4");
	
	
	
	
	try {
		stmt = con.createStatement();
		
		rset = stmt.executeQuery(sql);
		
		if(rset.next()){
			listCount = rset.getInt(1); 
		}
				
	}catch(SQLException e) {
		e.printStackTrace();
	}finally {
		close(rset);
		close(stmt);
	}
	return listCount;	
}
	/**
	 * 상품 카테고리 페이지1 리스트
	 * @param currentPage
	 * @param limit
	 * @return
	 */
	public ArrayList<Product> selectProductList(Connection con,int currentPage,int limit,int radio){
		ArrayList<Product> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectProductList");
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage -1) * limit + 1; // 1, 11
			int endRow = startRow + limit -1; // 10, 20
			
			pstmt.setInt(1, radio);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Product>();
			while(rset.next()){
				Product p = new Product();
				p.setPno(rset.getInt("pno"));
				p.setMainImage(rset.getString("mainImage"));
				p.setMainTitle(rset.getString("mainTitle"));
				p.setMainPrice(rset.getInt("mainPrice"));
				p.setOp1_title(rset.getString("op1_title"));
				p.setOp1_price(rset.getString("op1_price"));
				p.setOp2_title(rset.getString("op2_title"));
				p.setOp2_price(rset.getString("op2_price"));
				p.setOp3_title(rset.getString("op3_title"));
				p.setOp3_price(rset.getString("op3_price"));
				p.setRadio(rset.getInt("radio"));
				p.setDv_price(rset.getInt("dv_price"));
				p.setDv_due(rset.getInt("dv_due"));
				p.setMin_person(rset.getInt("min_person"));
				p.setMin_count(rset.getInt("min_count"));
				p.setHashtag1(rset.getString("hashtag1"));
				p.setHashtag2(rset.getString("hashtag2"));
				p.setHashtag3(rset.getString("hashtag3"));
				p.setDetailImage(rset.getString("detailImage"));
				p.setWriterId(rset.getString("writerId"));
				p.setLikeCount(rset.getInt("likeCount"));
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}

	/**
	 * 상품 카테고리  정렬
	 * @param currentPage
	 * @param limit
	 * @return
	 */
	public ArrayList<Product> selectOrderList(Connection con,int currentPage,int limit,int k,int radio){
		ArrayList<Product> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.print("k 값: " + k);
		String sql = null;
		switch(k) {
			case 2:
				sql = prop.getProperty("selectOrderList2");
				break;
			case 3:
				sql = prop.getProperty("selectOrderList3");
				break;
			case 4: 
				sql = prop.getProperty("selectOrderList4");
				break;
		}
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage -1) * limit + 1; // 1, 11
			int endRow = startRow + limit -1; // 10, 20
			
			pstmt.setInt(1, radio);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Product>();
			while(rset.next()){
				Product p = new Product();
				p.setPno(rset.getInt("pno"));
				p.setMainImage(rset.getString("mainImage"));
				p.setMainTitle(rset.getString("mainTitle"));
				p.setMainPrice(rset.getInt("mainPrice"));
				p.setOp1_title(rset.getString("op1_title"));
				p.setOp1_price(rset.getString("op1_price"));
				p.setOp2_title(rset.getString("op2_title"));
				p.setOp2_price(rset.getString("op2_price"));
				p.setOp3_title(rset.getString("op3_title"));
				p.setOp3_price(rset.getString("op3_price"));
				p.setRadio(rset.getInt("radio"));
				p.setDv_price(rset.getInt("dv_price"));
				p.setDv_due(rset.getInt("dv_due"));
				p.setMin_person(rset.getInt("min_person"));
				p.setMin_count(rset.getInt("min_count"));
				p.setHashtag1(rset.getString("hashtag1"));
				p.setHashtag2(rset.getString("hashtag2"));
				p.setHashtag3(rset.getString("hashtag3"));
				p.setDetailImage(rset.getString("detailImage"));
				p.setWriterId(rset.getString("writerId"));
				p.setLikeCount(rset.getInt("likeCount"));
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * 태그 정렬
	 * @param con
	 * @param hashName
	 * @return
	 */
	public ArrayList<Product> productTagSelect(Connection con,String hashName,int radio){
		ArrayList<Product> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("productTagSelect");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, radio);
			pstmt.setString(2, hashName);
			pstmt.setString(3, hashName);
			pstmt.setString(4, hashName);
			rset = pstmt.executeQuery();
			list = new ArrayList<Product>();
			while(rset.next()){
				Product p = new Product();
				p.setPno(rset.getInt("pno"));
				p.setMainImage(rset.getString("mainImage"));
				p.setMainTitle(rset.getString("mainTitle"));
				p.setMainPrice(rset.getInt("mainPrice"));
				p.setOp1_title(rset.getString("op1_title"));
				p.setOp1_price(rset.getString("op1_price"));
				p.setOp2_title(rset.getString("op2_title"));
				p.setOp2_price(rset.getString("op2_price"));
				p.setOp3_title(rset.getString("op3_title"));
				p.setOp3_price(rset.getString("op3_price"));
				p.setRadio(rset.getInt("radio"));
				p.setDv_price(rset.getInt("dv_price"));
				p.setDv_due(rset.getInt("dv_due"));
				p.setMin_person(rset.getInt("min_person"));
				p.setMin_count(rset.getInt("min_count"));
				p.setHashtag1(rset.getString("hashtag1"));
				p.setHashtag2(rset.getString("hashtag2"));
				p.setHashtag3(rset.getString("hashtag3"));
				p.setDetailImage(rset.getString("detailImage"));
				p.setWriterId(rset.getString("writerId"));
				p.setLikeCount(rset.getInt("likeCount"));
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Product> productSearchSelect(Connection con,String search,int radio){
		ArrayList<Product> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("productSearchSelect");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, radio);
			pstmt.setString(2, "%" + search + "%");
			pstmt.setString(3, search);
			pstmt.setString(4, search);
			pstmt.setString(5, search);
			rset = pstmt.executeQuery();
			list = new ArrayList<Product>();
			while(rset.next()){
				Product p = new Product();
				p.setPno(rset.getInt("pno"));
				p.setMainImage(rset.getString("mainImage"));
				p.setMainTitle(rset.getString("mainTitle"));
				p.setMainPrice(rset.getInt("mainPrice"));
				p.setOp1_title(rset.getString("op1_title"));
				p.setOp1_price(rset.getString("op1_price"));
				p.setOp2_title(rset.getString("op2_title"));
				p.setOp2_price(rset.getString("op2_price"));
				p.setOp3_title(rset.getString("op3_title"));
				p.setOp3_price(rset.getString("op3_price"));
				p.setRadio(rset.getInt("radio"));
				p.setDv_price(rset.getInt("dv_price"));
				p.setDv_due(rset.getInt("dv_due"));
				p.setMin_person(rset.getInt("min_person"));
				p.setMin_count(rset.getInt("min_count"));
				p.setHashtag1(rset.getString("hashtag1"));
				p.setHashtag2(rset.getString("hashtag2"));
				p.setHashtag3(rset.getString("hashtag3"));
				p.setDetailImage(rset.getString("detailImage"));
				p.setWriterId(rset.getString("writerId"));
				p.setLikeCount(rset.getInt("likeCount"));
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
		public Product productSelectOne(Connection con, int pno) {
		
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("itemSelect");
		try {
			pstmt = con.prepareStatement(sql);
		
		
			pstmt.setInt(1, pno);			
		
			rset = pstmt.executeQuery();						
			
			while(rset.next()) {
				
				p = new Product();		
				p.setPno(rset.getInt("pno"));
				p.setMainImage(rset.getString("mainImage"));
				p.setMainTitle(rset.getString("mainTitle"));
				p.setMainPrice(rset.getInt("mainPrice"));
				p.setOp1_title(rset.getString("op1_title"));
				p.setOp1_price(rset.getString("op1_price"));
				p.setOp2_title(rset.getString("op2_title"));
				p.setOp2_price(rset.getString("op2_price"));
				p.setOp3_title(rset.getString("op3_title"));
				p.setOp3_price(rset.getString("op3_price"));
				p.setRadio(rset.getInt("radio"));
				p.setDv_price(rset.getInt("dv_price"));
				p.setDv_due(rset.getInt("dv_due"));
				p.setMin_person(rset.getInt("min_person"));
				p.setMin_count(rset.getInt("min_count"));
				p.setHashtag1(rset.getString("hashtag1"));
				p.setHashtag2(rset.getString("hashtag2"));
				p.setHashtag3(rset.getString("hashtag3"));
				p.setDetailImage(rset.getString("detailImage"));
				p.setWriterId(rset.getString("writerId"));
				p.setLikeCount(rset.getInt("likeCount"));				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}	
		return p;
	}
	
		

		public ArrayList<Product> myPageProductList(Connection con,String getId){
			ArrayList<Product> list = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("myPageProductList");
			try {
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, getId);
				
				rset = pstmt.executeQuery();
				list = new ArrayList<Product>();
				while(rset.next()){
					Product p = new Product();
					p.setPno(rset.getInt("pno"));
					p.setMainImage(rset.getString("mainImage"));
					p.setMainTitle(rset.getString("mainTitle"));
					p.setMainPrice(rset.getInt("mainPrice"));
					p.setOp1_title(rset.getString("op1_title"));
					p.setOp1_price(rset.getString("op1_price"));
					p.setOp2_title(rset.getString("op2_title"));
					p.setOp2_price(rset.getString("op2_price"));
					p.setOp3_title(rset.getString("op3_title"));
					p.setOp3_price(rset.getString("op3_price"));
					p.setRadio(rset.getInt("radio"));
					p.setDv_price(rset.getInt("dv_price"));
					p.setDv_due(rset.getInt("dv_due"));
					p.setMin_person(rset.getInt("min_person"));
					p.setMin_count(rset.getInt("min_count"));
					p.setHashtag1(rset.getString("hashtag1"));
					p.setHashtag2(rset.getString("hashtag2"));
					p.setHashtag3(rset.getString("hashtag3"));
					p.setDetailImage(rset.getString("detailImage"));
					p.setWriterId(rset.getString("writerId"));
					p.setLikeCount(rset.getInt("likeCount"));
					list.add(p);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally{
				close(rset);
				close(pstmt);
			}
			return list;
		}
		
		public ArrayList<Product> top3Select(Connection con){
			ArrayList<Product> list = null;
			Statement stmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("top3SelectList");
			try {
				stmt = con.createStatement();	
				rset = stmt.executeQuery(sql);
				list = new ArrayList<Product>();
				while(rset.next()){
					Product p = new Product();
					p.setPno(rset.getInt("pno"));
					p.setMainImage(rset.getString("mainImage"));
					p.setMainTitle(rset.getString("mainTitle"));
					p.setMainPrice(rset.getInt("mainPrice"));
					p.setOp1_title(rset.getString("op1_title"));
					p.setOp1_price(rset.getString("op1_price"));
					p.setOp2_title(rset.getString("op2_title"));
					p.setOp2_price(rset.getString("op2_price"));
					p.setOp3_title(rset.getString("op3_title"));
					p.setOp3_price(rset.getString("op3_price"));
					p.setRadio(rset.getInt("radio"));
					p.setDv_price(rset.getInt("dv_price"));
					p.setDv_due(rset.getInt("dv_due"));
					p.setMin_person(rset.getInt("min_person"));
					p.setMin_count(rset.getInt("min_count"));
					p.setHashtag1(rset.getString("hashtag1"));
					p.setHashtag2(rset.getString("hashtag2"));
					p.setHashtag3(rset.getString("hashtag3"));
					p.setDetailImage(rset.getString("detailImage"));
					p.setWriterId(rset.getString("writerId"));
					p.setLikeCount(rset.getInt("likeCount"));
					list.add(p);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally{
				close(rset);
				close(stmt);
			}
			return list;
		}

		public int updateLikey(Connection con, int pno, int likecnt) {
			int result = 0;
			PreparedStatement pstmt = null;		
			
			String sql = prop.getProperty("likecount");
			//System.out.print(sql);
			try {
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, likecnt);
				pstmt.setInt(2, pno);
				
				
				result = pstmt.executeUpdate();			
				
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {			
				close(pstmt);
			}
			System.out.println("결과값: " + result);
			return result;
		}
		
		public int insertPaymentInfo(Connection con,paymentInfo pm) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertpayment");
			
			try {
				
				pstmt = con.prepareStatement(sql); // 미완성 쿼리
				pstmt.setString(1,pm.getpName());
				pstmt.setString(2,pm.getUserName());
				pstmt.setString(3,pm.getUserId());
				pstmt.setString(4,pm.getSellerId());
				pstmt.setString(5,pm.getUserPhone());
				pstmt.setString(6,pm.getAddress());
				pstmt.setString(7,pm.getResultPrice());
				pstmt.setString(8,pm.getPaymentSelect());

				result = pstmt.executeUpdate();
				
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
		}
		
		
		
		
		public ArrayList<paymentInfo> myPageOrderList(Connection con,String getId){
			ArrayList<paymentInfo> list = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("myPageOrderList");
			try {
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, getId);
				rset = pstmt.executeQuery();
				list = new ArrayList<paymentInfo>();
				while(rset.next()){
					paymentInfo pm = new paymentInfo();
					pm.setOrderNo(rset.getInt("ORDER_NUM"));
					pm.setOrderDate(rset.getDate("ORDER_DATE"));
					pm.setpName(rset.getString("ORDER_PNAME")); // 오라클 DB 컬럼명과 일치시켜야함. 소문자 / 대문자 상관 X
					pm.setUserName(rset.getString("USERNAME"));
					pm.setUserId(rset.getString("USERID"));
					pm.setSellerId(rset.getString("SELLERID"));
					pm.setUserPhone(rset.getString("USER_PHONE"));
					pm.setAddress(rset.getString("DUE_ADDR"));
					pm.setResultPrice(rset.getString("RESULT_PRICE"));
					pm.setPaymentSelect(rset.getString("RESULT_STATUS"));
					list.add(pm);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally{
				close(rset);
				close(pstmt);
			}
			return list;
		}
		
		public ArrayList<paymentInfo> myPageSellerList(Connection con,String getId){
			ArrayList<paymentInfo> list = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("myPageSellerList");
			try {
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, getId);
				rset = pstmt.executeQuery();
				list = new ArrayList<paymentInfo>();
				while(rset.next()){
					paymentInfo pm = new paymentInfo();
					pm.setOrderNo(rset.getInt("ORDER_NUM"));
					pm.setOrderDate(rset.getDate("ORDER_DATE"));
					pm.setpName(rset.getString("ORDER_PNAME")); // 오라클 DB 컬럼명과 일치시켜야함. 소문자 / 대문자 상관 X
					pm.setUserName(rset.getString("USERNAME"));
					pm.setUserId(rset.getString("USERID"));
					pm.setSellerId(rset.getString("SELLERID"));
					pm.setUserPhone(rset.getString("USER_PHONE"));
					pm.setAddress(rset.getString("DUE_ADDR"));
					pm.setResultPrice(rset.getString("RESULT_PRICE"));
					pm.setPaymentSelect(rset.getString("RESULT_STATUS"));
					list.add(pm);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally{
				close(rset);
				close(pstmt);
			}
			return list;
		}
		
		public int deleteItem(Connection con, int pno) { // 상품 삭제
		      int result = 0;                     
		      PreparedStatement pstmt = null;         
		      String sql = prop.getProperty("deleteItem");
		      System.out.println(sql);
		      try {
		         pstmt = con.prepareStatement(sql);
		         pstmt.setInt(1, pno);
		         result = pstmt.executeUpdate();
		         System.out.println("다오의 result : " + result);
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(pstmt);
		      }
		      return result;
		   }
		
		public ArrayList<Product> myPageLikeList(Connection con,String userid){
			ArrayList<Product> list = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("myPageLikeList");
			try {
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, userid);
				
				rset = pstmt.executeQuery();
				list = new ArrayList<Product>();
				while(rset.next()){
					Product p = new Product();	
					p.setPno(rset.getInt("pno"));
					p.setMainImage(rset.getString("mainImage"));
					p.setMainTitle(rset.getString("mainTitle"));
					p.setMainPrice(rset.getInt("mainPrice"));
					list.add(p);
					System.out.println("myPageLike : " + list);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally{
				close(rset);
				close(pstmt);
			}
			return list;
		}
}
