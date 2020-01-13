package com.item.model.service;

import com.item.model.dao.ItemSelectDao;
import com.item.model.vo.ItemSelectVo;
import com.product.model.vo.Product;

import static com.common.JDBCTemplate.*;

import java.sql.Connection;

public class ItemSelectService {
	
	private ItemSelectDao pDao = new ItemSelectDao();
	
	public Product selectOne(int pno) {
		Connection con = getConnection();
		
		Product p = pDao.selectOne(con, pno);
		
		//System.out.println("test" + p);
		close(con);
		
		return p;
	}
	
	public Product selectSangCnt(int pno) {
		Connection con = getConnection();
		
		Product scnt = pDao.selectSangCnt(con, pno);
		
		//System.out.println("test" + pno);
		close(con);
		
		return scnt;
	}
	
	public Product selectBuyCnt(int pno) {
		Connection con = getConnection();
		
		Product bcnt = pDao.selectBuyCnt(con, pno);
		
		
		close(con);
		
		return bcnt;
	}
}
