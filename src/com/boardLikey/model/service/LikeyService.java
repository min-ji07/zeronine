package com.boardLikey.model.service;

import static com.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.boardLikey.model.dao.LikeyDao;
import com.boardLikey.model.vo.Likey;
import com.item.model.dao.ItemSelectDao;
import com.item.model.vo.ItemSelectVo;
import com.product.model.vo.Product;

public class LikeyService {
	private LikeyDao liDao = new LikeyDao();
	
	public int insertLikey(int pno) {
		Connection con = getConnection();
		
		int result = liDao.insertLikey(con,pno);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);
		return result;
	}
	
	public Likey selectLikeCount(int pno) {
		Connection con = getConnection();
		Likey result = liDao.selectLikeCount(con,pno);
		
		if(result != null) commit(con);
		else rollback(con);
		
		close(con);
		return result;
	}
	
	public int updateLikey(int bno, String userid) {
		Connection con = getConnection();
		int result = liDao.updateLikey(con,bno,userid);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);
		return result;
	}
	
	public int insertLikeyId(int bno, String userid) {
		Connection con = getConnection();
		int result = liDao.insertLikeyId(con,bno,userid);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		return result;
	}

	
	public ArrayList<Likey> selectyn() {
		Connection con = getConnection();
		ArrayList<Likey> ynlist = liDao.selectyn(con);
		close(con);
		
		return ynlist;
	}
	
	public Likey selectLikeyYn(int pno, String userid) {
		Connection con = getConnection();
		Likey yn = liDao.selectLikeyYn(con,pno, userid);						
		close(con);
		
		return yn;
	}
		
	
	public Likey selectOne(int pno) {
		Connection con = getConnection();
		//System.out.print("bcno =" + pno);
		Likey li = liDao.selectOne(con, pno);
		
		//System.out.println("test" + pno);
		close(con);
		
		return li;
	}
	
	public Likey selectCnt(int pno) {
		Connection con = getConnection();
		//System.out.print("bcno =" + pno);
		Likey yn = liDao.selectCnt(con, pno);
		
		//System.out.println("test" + pno);
		close(con);
		
		return yn;
	}

	
	
	
	
}
