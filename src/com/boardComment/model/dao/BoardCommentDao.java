package com.boardComment.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.boardComment.model.vo.BoardComment;
import static com.common.JDBCTemplate.*;

public class BoardCommentDao {
	
	private Properties prop = new Properties();
	
	public BoardCommentDao() {
		String filePath = 
				BoardCommentDao.class
				.getResource("/config/comment-query.properties")
				.getPath();
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertComment(Connection con, BoardComment bco) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertComment");
		//System.out.print("sql="+sql);
		try {
			pstmt = con.prepareStatement(sql);			
			pstmt.setInt(1, bco.getBno());
			pstmt.setString(2, bco.getDcontent());			
			pstmt.setString(3, bco.getUserid());
			
			if(bco.getRefdno() > 0) {
				pstmt.setInt(4, bco.getRefdno());
			}else {
				pstmt.setNull(4, java.sql.Types.NULL);
			}
			pstmt.setInt(5, bco.getClevel());
						
			pstmt.setString(6, bco.getCwriter());
			pstmt.setInt(7, bco.getLoc());
			//System.out.println("에러가뭔지떠야뭘찾지");
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			
		}finally {
			close(pstmt);
		}
		
		return result;
	
	}
	
	public ArrayList<BoardComment> selectList(Connection con,int pno){
		ArrayList<BoardComment> clist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pno);
			//pstmt.setInt(2, loc);
			
			rset = pstmt.executeQuery();
			clist = new ArrayList<BoardComment>();
			
			while(rset.next()) {
				BoardComment bco = new BoardComment();
				bco.setDno(rset.getInt("DNO"));
				bco.setBno(rset.getInt("bno"));
				bco.setDcontent(rset.getString("DCONTENT"));
				bco.setUserid(rset.getString("USERNAME"));				
				bco.setDdate(rset.getDate("DDATE"));
				bco.setRefdno(rset.getInt("REF_dNO"));
				bco.setClevel(rset.getInt("CLEVEL"));
				bco.setLoc(rset.getInt("loc"));
				
				clist.add(bco);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("clist="+clist);
		System.out.println("여기 결과값은 ??="+clist);
		return clist;
	}
}
