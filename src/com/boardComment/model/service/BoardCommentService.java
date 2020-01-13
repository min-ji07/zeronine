package com.boardComment.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.boardComment.model.dao.BoardCommentDao;
import com.boardComment.model.vo.BoardComment;
import static com.common.JDBCTemplate.*;
public class BoardCommentService {
	private BoardCommentDao bcDao = new BoardCommentDao();
	
	public int insertComment(BoardComment bco) {
		Connection con = getConnection();
		
		int result = bcDao.insertComment(con,bco);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);
		return result;
	}
	
	public ArrayList<BoardComment> selectList(int pno){
		Connection con = getConnection();
		ArrayList<BoardComment> clist = bcDao.selectList(con,pno);
		close(con);
		System.out.println("서비스pno"+pno);
		System.out.println("서비스에서 리턴값 "+clist);
		return clist;
	}
}
