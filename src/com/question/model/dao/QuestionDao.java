package com.question.model.dao;

import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.question.model.vo.Question;


public class QuestionDao {

	private Properties prop;
	
	public QuestionDao() {
		prop = new Properties();
		
		String filePath = QuestionDao.class
				.getResource("/config/question-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	/**
	 * 질문글 추가
	 * 
	 */
	public int insertQuestion(Connection con, Question q) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQuestion");
//		System.out.println(sql);
//		
//		System.out.println("인서트 다오 : " + result);
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, q.getWriter()); 
			pstmt.setString(2, q.getTitle());
			pstmt.setString(3, q.getContent());
			
			result = pstmt.executeUpdate();
		
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
//		System.out.println(result);
		return result;
	}

	
	// 게시글 조회 일반
//	public ArrayList<Question> selectList(Connection con) {
//		
//		ArrayList<Question> list = null;
//		Statement stmt = null;
//		ResultSet rset = null;
//		
//		String sql = prop.getProperty("selectList");
//		
//		try {
//			stmt = con.createStatement();
//			
//			rset = stmt.executeQuery(sql);
//			
//			list = new ArrayList<Question>();
//			
//			while(rset.next()) {
//				
//				Question q = new Question();
//				
//				q.setNo(rset.getInt("uno")); // "DB의 컬럼값"
//				q.setTitle(rset.getString("title"));
//				q.setWriter(rset.getString("userid"));
//				q.setDate(rset.getDate("adddate"));
//				q.setCount(rset.getInt("count"));
//				
//				list.add(q);
//			}
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rset);
//			close(stmt);
//		}
//		
//		System.out.println("게시글 조회 list :" + list);
//		
//		return list;
//	}
		
	public Question selectOne(Connection con, int no) {
		
		Question q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
	
		String sql = prop.getProperty("selectOne");
//		System.out.println("한개 조회 sql: "+ sql);
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				q = new Question();
				q.setNo(no);
				q.setTitle(rset.getString("title"));
				q.setWriter(rset.getString("userid"));
				q.setContent(rset.getString("content"));
				q.setDate(rset.getDate("adddate"));
				q.setCount(rset.getInt("count"));
				q.setStatus(rset.getString("status"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
//		System.out.println("1개 조회다오 탄다" + q);
		return q;
		
	}
	
	public int updateReadCount(Connection con, int no) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReadCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}

	/*
	 * 게시글 수정
	 * 
	 */
	public int updateQuestion(Connection con, Question q) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateQuestion");
		System.out.println("업데이트 다오 sql :" + sql);
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, q.getTitle());
			pstmt.setString(2, q.getContent());
			pstmt.setInt(3, q.getNo());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		System.out.println("업뎃 result : " + result);
		return result;
	
	}

	public int deleteQuestion(Connection con, int no) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql =  prop.getProperty("deleteQuestion");
		
		try {
			pstmt = con.prepareStatement(sql);//미완성된 쿼리
			
			pstmt.setInt(1, no);
			// 결과 확인
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}



	public ArrayList<Question> searchQuestion(Connection con, String category, String keyword) {
		ArrayList<Question> list = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		System.out.println(sql);
		switch(category) {
		case "writer" : 
			sql = prop.getProperty("searchWriterNotice");
			break;
		case "title" : 
			sql = prop.getProperty("searchTitleNotice");
			break;
		case "content" :
			sql = prop.getProperty("searchContentNotice");
			break;
		}
		System.out.println("서치 퀘스쳔 다오 : sql "+sql);
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();
			list = new ArrayList<Question>();
			
			while(rset.next()) {
				Question q = new Question();
				
				q.setNo(rset.getInt("uno"));
				q.setWriter(rset.getString("userid"));
				q.setTitle(rset.getString("title"));
				q.setContent(rset.getString("content"));
				q.setDate(rset.getDate("adddate"));
				q.setCount(rset.getInt("count"));
				q.setStatus(rset.getString("status"));
				
				list.add(q);
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		System.out.println("서치 퀘스쳔 list " + list);
		return list;
		
		
	}


	// 페이징
	public int getListCount(Connection con) {
		// 총 게시글 수
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
//		System.out.println("listCount : " + sql);
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			if(rset.next()) {
				listCount = rset.getInt(1); 
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
			
		}
		System.out.println(listCount);
		return listCount;
		
	}


	public ArrayList<Question> selectList(Connection con, int currentPage, int limit) {
		
		ArrayList<Question> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		System.out.println("셀렉리스트 다오 sql" + sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			
			// 1. 마지막 행의 번호
			// 2. 첫 행의 번호
			int startRow = (currentPage -1) * limit + 1; // 1, 11
			
			int endRow = startRow + limit -1; // 10,20
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Question>();
			
			while(rset.next()) {
				
				Question q = new Question();
				
				q.setNo(rset.getInt("uno"));
				q.setWriter(rset.getString("userid"));
				q.setTitle(rset.getString("title"));
				q.setContent(rset.getString("content"));
				q.setDate(rset.getDate("adddate"));
				q.setCount(rset.getInt("count"));
				q.setStatus(rset.getString("status"));
				
				list.add(q);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("셀렉 리스트 다오 다 탔다 list" + list);
		return list;
		
	}


	
}














