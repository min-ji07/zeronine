package com.member.model.service;

import static com.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.member.model.dao.MemberDao;
import com.member.model.vo.Member;

// Service :
//   Controller인 서블릿에서
//   전달한 정보를 업무 수행로직(비즈니스 로직)에
//   따라 가공하여 DAO에게 전달하는 역할
public class MemberService {
	// Service는 하나의 SQL을 담당하는 DAO 메소드들을
	// 더 큰 하나의 서비스라는 개념으로 묶어 처리하는
	// 비즈니스 로직(업무 로직)을 담당하는 객체이다.
	// 따라서 DB의 트랜잭션에 대한 TCL(commit/rollback)처리를
	// 직접 담당해야 한다.

	/**
	 * 회원가입
	 */
	private Connection con;
	private MemberDao mDao = new MemberDao();

	public int insertMember(Member m) {

		con = getConnection();
		int result = mDao.insertMember(con, m);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);

		return result;
	}

	/**
	 * 로그인
	 * 
	 * @param m
	 * @return
	 */
	public Member selectMember(Member m) {

		con = getConnection();

		Member result = mDao.selectMember(con, m);

		if (result != null)
			commit(con);
		else
			rollback(con);

		close(con);

		return result;

	}
	
	public ArrayList<Member> selectAllMember(){
		Connection con = getConnection();
		ArrayList<Member> mem = mDao.selectAllList(con);
		close(con);
		
		return mem;
	}

	public int idDupCheck(String id) {
		con = getConnection();
		int result = mDao.idDupCheck(con, id);

		close(con);

		return result;

	}
	
	public int memberUpdate(Member m) {
		con = getConnection();
		int result = mDao.memberUpdate(con, m);		
		
		if (result > 0)
			commit(con);
		
		else
			rollback(con);
		
		close(con);
		return result;

	}
	
	public int memberDelete(String userId) {
		con = getConnection();

		int result = mDao.memberDelete(con, userId);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);
		return result;
	}

	public Member idSearchServlet(String email) {
		con = getConnection();

		Member result = mDao.idSearchServlet(con, email);

		if (result != null)
			commit(con);
		else
			rollback(con);

		close(con);
		return result;

	}

	
public int updateMember(Member m) {
		
		con = getConnection();						// 연결
		int result = mDao.updateMember(con, m);		// 다오에 회원정보수정메소드(연결, 회원정보중 바뀐값,,?)
		// result는 바뀐 행의 갯수
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	/**
	 * 회원탈퇴
	 * @param
	 * 
	 * */
	public int deleteMember(String userId) { 		// 회원 탈퇴
		con = getConnection(); 						// DB랑 연결해서 가져옴
		int result = mDao.deleteMember(con, userId);// dao에 회원탈퇴메소드
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	   public Member pwdSearchServlet(String id, String email2) {
		      con = getConnection();
		         
		         Member result = mDao.pwdSearchServlet(con,id,email2);
		         System.out.println("서비스: " + result);
		         if(result != null) commit(con);
		         else rollback(con);
		         
		         close(con);
		         //System.out.print("서비스 m" + result.getUserId());
		         return result;
		   }

	 public Member rePwd(String id, String email2) {
	      con = getConnection();
	         
	         Member result = mDao.rePwd(con,id,email2);
	         System.out.println("서비스: " + result);
	         if(result != null) commit(con);
	         else rollback(con);
	         
	         close(con);
	         //System.out.print("서비스 m" + result.getUserId());
	         return result;
	   }

	   public int pwdReset(Member m) {
	      
	      con = getConnection();
	      int result = mDao.pwdReset(con,m);
	         
	         if(result > 0) commit(con);
	         else rollback(con);
	         
	         close(con);
	         
	         return result;
	      
	      
	   }

	

}
