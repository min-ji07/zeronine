package com.boardLikey.model.dao;

import static com.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.boardLikey.model.vo.Likey;
import com.product.model.vo.Product;


public class LikeyDao {
	private Properties prop = new Properties();
	
	public LikeyDao() {
		String filePath = 
				LikeyDao.class
				.getResource("/config/likey-query.properties")
				.getPath();
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertLikey(Connection con,int pno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLikey");
		
		try {
			pstmt = con.prepareStatement(sql);			
			// pstmt.setInt(1, 1);						// 좋아요 순서 <- 시퀀스처리
			pstmt.setInt(1, pno);						// 글번호
			pstmt.setString(2, "test");	// 유저아이디
			pstmt.setString(3, "n");	// 좋아요여부
			
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			
		}finally {
			close(pstmt);
		}
		return result;
	
	}
	
	public Likey selectLikeCount(Connection con, int pno) {
		Likey likecount = null;		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectlikecount");
		
		try {
			pstmt = con.prepareStatement(sql);			
			pstmt.setInt(1, pno);						// 글번호				
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				likecount = new Likey();
				likecount.setUserid(rset.getString("userid"));
				likecount.setYn_cnt(rset.getInt("yn_cnt"));
			}		
		}catch(SQLException e) {
			
		}finally {
			close(pstmt);
		}
		return likecount;
	}
	
	public int insertLikeyId(Connection con, int bno, String userid) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLikeyId");
		
		try {
			pstmt = con.prepareStatement(sql);			
			pstmt.setInt(1, bno);						// 글번호
			pstmt.setString(2, userid);	// 유저아이디
			pstmt.setString(3, "y");	// 좋아요여부
			pstmt.setInt(4, 1);						// 글번호
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Likey> selectyn(Connection con) {					
			ArrayList<Likey> ynlist = null;
			Statement stmt = null;
			ResultSet rset = null;
			
			String sql = prop.getProperty("selectlikeyn");
			try {
				stmt = con.prepareStatement(sql);
				
				
				rset = stmt.executeQuery(sql);		
				ynlist = new ArrayList<Likey>();
				
				while(rset.next()){
					Likey li = new Likey();
					li.setLikecount(rset.getInt("likecount"));					
					ynlist.add(li);
																	
				}						
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(stmt);
			}
			
			return ynlist;
		
	}
	
	public int updateLikey(Connection con,int bno,String userid) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("likeyupdate");

		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			pstmt.setString(2, userid);
			pstmt.setString(3, "y");
			pstmt.setInt(4, 1);
			
											
			result = pstmt.executeUpdate();						
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {			
			close(pstmt);
		}

		return result;
	}
	
	public Likey likeySelect(Connection con, String userid) {
		Likey yn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectyn");

		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userid);			
			
			rset = pstmt.executeQuery();						
			
			if(rset.next()) {
				
				yn = new Likey();
				
				yn.setUserid(rset.getString("userid"));				
			}						
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return yn;	
	}
	
	public Likey selectLikeyYn(Connection con, int pno, String userid) {
		Likey yn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectyn");

		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			pstmt.setString(2, userid);
			
			rset = pstmt.executeQuery();						
			
			if(rset.next()) {
				
				yn = new Likey();
				
				yn.setUserid(rset.getString("userid"));
				yn.setLikecount(rset.getInt("likecount"));
			}			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return yn;	
	}
	
	
	
	
	
	public Likey selectOne(Connection con, int pno) {
		
		Likey li = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("likeyselect");
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pno);			
			
			rset = pstmt.executeQuery();						
			
			while(rset.next()) {
				
				li = new Likey();
				
				li.setBno(rset.getInt("bno"));
				li.setUserid(rset.getString("userid"));
				li.setLikey_yn(rset.getString("likey_yn"));							
			}						
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return li;
	}
	
	public Likey selectCnt(Connection con, int pno) {
		
		Likey li = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("likeycntselect");
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pno);
			pstmt.setInt(2, 1);
			rset = pstmt.executeQuery();						
			
			while(rset.next()) {
				
				li = new Likey();
							
				li.setYn_cnt(rset.getInt("YN_CNT"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return li;
	}
	
}
