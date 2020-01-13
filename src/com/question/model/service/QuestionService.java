package com.question.model.service;

import static com.common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;

import com.question.model.dao.QuestionDao;
import com.question.model.vo.Question;
import com.question.model.vo.QuestionComment;


public class QuestionService {
	
	private QuestionDao qDao = new QuestionDao();
 
	// 페이징 처리
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = qDao.getListCount(con);
		
		close(con);
//		System.out.println("리스트 서비스탔다" + listCount);
		
		return listCount;
	
	
	}
	public ArrayList<Question> selectList(int currentPage,int limit){
		Connection con = getConnection();
		
		ArrayList<Question> list = qDao.selectList(con,currentPage, limit);
				
		close(con);
		System.out.println("서비스 셀렉 리스트 탔다 " + list);
		return list;		
	}
	
	/*
	 * 질문게시판 조회
	 * 
	 */
//	public ArrayList<Question> select(){
//		Connection con = getConnection();
//		
////		ArrayList<Question> list = qDao.selectList(con, currentPage, limit);
//		
//		ArrayList<Question> list = qDao.selectList(con);
//		
//		close(con);
//		System.out.println("서비스list"+ list);
//		return list;	
//		
//	}
	 
	/**
	 * 1대1 상담신청 등록
	 * @param q
	 * @return
	 */
	public int insertQuestion(Question q) {
		
		Connection con = getConnection();
		
		int result = qDao.insertQuestion(con,q);
		
		 if(result > 0) commit(con);
		 else rollback(con);
		 
		 close(con);
		 return result;
	}
	
	/**
	 * 질문 하나 선택
	 * 
	 */
	public Question selectOne(int no) {
		Connection con = getConnection();
		
		Question q = qDao.selectOne(con,no);
		
		if(q != null) {
			int result = qDao.updateReadCount(con,no);
			
			if(result > 0) commit(con);
			else rollback(con);
			
		}
		
		close(con);
		return q;
		
	}

	/**
	 * 
	 * 게시글 수정
	 * @param q
	 * @return
	 */
	public int updateQuestion(Question q) {
		
		Connection con = getConnection();
		
		int result = qDao.updateQuestion(con,q);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		System.out.println("업데이트 서비스 : " + result);
		return result;
	}

	/**
	 * 수정 페이지 정보조회
	 * @param no
	 * @return
	 */
	public Question updateView(int no) {
		Connection con = getConnection();
		
		Question q = qDao.selectOne(con, no);
		
		close(con);
		
		return q;
	}
	
	
	
	
	
	

	public int deleteQuestion(int no) {
		
		Connection con = getConnection();
		
		int result = qDao.deleteQuestion(con,no);
		
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
		
	}
	public ArrayList<Question> searchQuestion(String category, String keyword, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Question> list = new ArrayList<Question>();
		System.out.println("category.length() :" + category.length());
		list = (category.length() > 0 )?
					qDao.searchQuestion(con, category, keyword) : qDao.selectList(con, currentPage, limit);
					
		System.out.println("서치 서비스 탄다 " + list);
		
		close(con);
		return list;
		
		
	}
	

//	public ArrayList<Question> searchQuestion(String category, String keyword) {
//		
//		Connection con = getConnection();
//		
//		ArrayList<Question> list = new ArrayList<Question>();
//		System.out.println("category.length() : " + category.length());
//		list = (category.length() >0)?
//				qDao.searchQuestion(con,category,keyword) : qDao.selectList(con,);
//		
//		System.out.println("서치 서비스 탄다" + list);
//		
//		close(con);
//		
//		return list;
//		
//				
//	}

	
	
	
	

}














