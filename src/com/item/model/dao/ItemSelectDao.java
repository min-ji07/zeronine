package com.item.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.common.JDBCTemplate.*;


import com.item.model.vo.ItemSelectVo;
import com.product.model.vo.Product;

public class ItemSelectDao {
	
	private Properties prop;
	
	public ItemSelectDao() {
		prop = new Properties();
		
		String filePath = ItemSelectDao.class.getResource("/config/product-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public Product selectOne(Connection con, int pno) {
		
		Product p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("itemselect");
		try {
			pstmt = con.prepareStatement(sql);
		
		
			pstmt.setInt(1, pno);			
		
			rset = pstmt.executeQuery();						
			
			while(rset.next()) {
				
				p = new Product();
				
				p.setPno(rset.getInt("pno"));
				p.setMainImage(rset.getString("mainimage"));
				p.setMainTitle(rset.getString("maintitle"));
				p.setMainPrice(rset.getInt("mainprice"));
				p.setHashtag1(rset.getString("hashtag1"));
				p.setHashtag2(rset.getString("hashtag2"));
				p.setHashtag3(rset.getString("hashtag3"));
				p.setMin_person(rset.getInt("min_count"));
				p.setDv_due(rset.getInt("dv_due"));
				p.setDv_price(rset.getInt("dv_price"));
				p.setOp1_title(rset.getString("op1_title"));
				p.setOp1_price(rset.getString("op1_price"));
				p.setOp2_title(rset.getString("op2_title"));
				p.setOp2_price(rset.getString("op2_price"));
				p.setOp3_title(rset.getString("op3_title"));							
				p.setOp3_price(rset.getString("op3_price"));
				p.setDetailImage(rset.getString("detailimage"));
				
			
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return p;
	}
	
	public Product selectSangCnt(Connection con, int pno) {
		
		Product scnt = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("sangcntselect");
		//System.out.print("상품문의갯수:"+sql);
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pno);			
			
			rset = pstmt.executeQuery();						
			
			while(rset.next()) {
				
				scnt = new Product();
							
				scnt.setSangcnt(rset.getInt("SANG_CNT"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		//System.out.println("상품문의갯수2" + scnt);
		return scnt;
	}

	public Product selectBuyCnt(Connection con, int pno) {
	
		Product bcnt = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("buycntselect");
		//System.out.print("리뷰갯수:"+sql);
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pno);			
			
			rset = pstmt.executeQuery();						
			
			while(rset.next()) {
				
				bcnt = new Product();
							
				bcnt.setBuycnt(rset.getInt("BUY_CNT"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		//System.out.println("리뷰갯수2" + bcnt);
		return bcnt;
	}
}
