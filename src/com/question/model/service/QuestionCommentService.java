package com.question.model.service;

import static com.common.JDBCTemplate.close;
import static com.common.JDBCTemplate.commit;
import static com.common.JDBCTemplate.getConnection;
import static com.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.question.model.dao.QuestionCommentDao;
import com.question.model.vo.QuestionComment;

public class QuestionCommentService {
	
	private QuestionCommentDao qcDao = new QuestionCommentDao();
	

	public int insertComment(QuestionComment qco) {
		Connection con = getConnection();
		
		int result = qcDao.insertCommnet(con, qco);
		

		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		System.out.println("코맨트 서비스 탄다 " + result);
		
		return result;
		
		
	}

	public ArrayList<QuestionComment> selectList(int uno){
		Connection con = getConnection();
		
		ArrayList<QuestionComment> clist = qcDao.selectList(con,uno);
		
		close(con);
		System.out.println("c서비스 리스트 탄다 " + clist);
		return clist;
		
		
	}

	public int updateComment(QuestionComment qco) {
		Connection con = getConnection();
		
		int result = qcDao.updateComment(con,qco);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		System.out.println("코맨트 수정 서비스 탔다 "+ result);
		return result;

	}

	public int deleteComment(int cno) {
		
		Connection con = getConnection();
		
		int result = qcDao.deleteComment(con,cno);
		
		if(result > 0)commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}
	
	
}
