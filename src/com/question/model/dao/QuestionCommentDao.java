package com.question.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.question.model.vo.QuestionComment;

public class QuestionCommentDao {
	
	private Properties prop = new Properties();
	
	public QuestionCommentDao() {
		String filePath = QuestionCommentDao.class.getResource("/config/questioncomment-query.properties")
				.getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	
	}

	public int insertCommnet(Connection con, QuestionComment qco) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertComment");
		System.out.println("댓글 다오 sql" + sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, qco.getUno());
			pstmt.setString(2, qco.getCcontent());
			pstmt.setString(3, qco.getCwriter());
			
			if(qco.getRefcno() > 0) {
				pstmt.setInt(4, qco.getRefcno());
			}else {
				pstmt.setNull(4,java.sql.Types.NULL);
			}
			
			pstmt.setInt(5, qco.getClevel());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("다오 result 탔다" + result);
		return result;
		
	}

	public ArrayList<QuestionComment> selectList(Connection con, int uno) {
		ArrayList<QuestionComment> clist = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		System.out.println("코맨트 다오 sql " +sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			clist = new ArrayList<QuestionComment>();
			
			while(rset.next()) {
				QuestionComment qco = new QuestionComment();
				
				qco.setCno(rset.getInt("cno"));
				qco.setUno(uno);
				qco.setCcontent(rset.getString("ccontent"));
				qco.setCwriter(rset.getString("cwriter"));
				qco.setCdate(rset.getDate("cdate"));
				qco.setRefcno(rset.getInt("ref_cno"));
				qco.setClevel(rset.getInt("clevel"));
				
				clist.add(qco);
				
			}
						
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("다오 c리스트 탔다 " + clist);
		return clist;
		
	}

	public int updateComment(Connection con, QuestionComment qco) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateComment");
		
		System.out.println(sql);
		try {
			pstmt = con.prepareStatement(sql);
			System.out.println("content :" +qco.getCcontent());
			System.out.println("Uno : " +qco.getCno());
			pstmt.setString(1, qco.getCcontent());
			pstmt.setInt(2, qco.getCno());
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		System.out.println("result" + result);
		return result;
	
	}

	public int deleteComment(Connection con, int cno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql =  prop.getProperty("deleteQuestion");
		
		try{
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1,cno);
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("댓글 삭제 다오 result:" + result);
		return result;
	}

}
