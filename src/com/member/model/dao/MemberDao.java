package com.member.model.dao;

import static com.common.JDBCTemplate.*;
import static com.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.member.model.vo.Member;
import com.member.model.vo.*;

// DAO(Data Access Object) :
//   Service 로부터 받은 정보를 
//   실제 데이터베이스에 전달하여 
//   CRUD를 수행하는 객체
public class MemberDao {

	private Properties prop;

	public MemberDao() {
		prop = new Properties();

		String filePath = MemberDao.class.getResource("/config/member-query.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertMember(Connection con, Member m) {

		// 결과 확인을 위한 변수 result 생성
		int result = 0;

		PreparedStatement pstmt = null;

		try {
			String sql = prop.getProperty("insertMember");

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserName());
			pstmt.setString(3, m.getUserPwd());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getAddress1());
			pstmt.setString(6, m.getAddress2());
			pstmt.setString(7, m.getAddress3());
			pstmt.setInt(8, 1);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			close(pstmt);
		}

		return result;
	}

	public Member selectMember(Connection con, Member m) {

		Member result = null; // 결과를 담을 객체
		PreparedStatement pstmt = null;
		ResultSet rset = null; // Select의 결과를 담은 객체
		System.out.println("로그인 검색 m:" + m);
		try {

			String sql = prop.getProperty("selectMember");

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());

			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = new Member();
				result.setUserId(m.getUserId());
				result.setUserName(rset.getString("userName"));
				result.setUserPwd(m.getUserPwd());
				result.setEmail(rset.getString("email"));
				result.setAddress1(rset.getString("address1"));
				result.setAddress2(rset.getString("address2"));
				result.setAddress3(rset.getString("address3"));
			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}
	
	public int memberUpdate(Connection con, Member m){
		int result = 0; // 결과를 담을 객체
		PreparedStatement pstmt = null;
		ResultSet rset = null; // Select의 결과를 담은 객체		
		
		try {

			String sql = prop.getProperty("memberupdate");
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getAddress1());
			pstmt.setString(4, m.getAddress2());
			pstmt.setString(5, m.getAddress3());
			pstmt.setString(6, m.getUserId());
						
			result = pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			close(rset);
			close(pstmt);
		}		
		return result;
	}
	
	public int memberDelete(Connection con, String userId) {
		int result = 0; // 결과를 담을 객체
		PreparedStatement pstmt = null;
		ResultSet rset = null; // Select의 결과를 담은 객체		
		
		try {

			String sql = prop.getProperty("memberdelete");
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);

			
			pstmt.setInt(1, 2);
			pstmt.setString(2, userId);
						
			result = pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			close(rset);
			close(pstmt);
		}		
		return result;
	}
	
	public ArrayList<Member> selectAllList(Connection con){
		ArrayList<Member> mem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAllList");		
		
		try {
			pstmt = con.prepareStatement(sql);
			
			
			rset = pstmt.executeQuery();
			mem = new ArrayList<Member>();
			
			while(rset.next()) {
				Member m = new Member();
				m.setUserId(rset.getString("USERID"));
				m.setUserName(rset.getString("USERNAME"));
				m.setEmail(rset.getString("EMAIL"));
				m.setAddress1(rset.getString("ADDRESS1"));				
				m.setAddress2(rset.getString("ADDRESS2"));
				m.setAddress3(rset.getString("ADDRESS3"));
				m.setEnrollDate(rset.getDate("ENROLLDATE"));
				m.setUserjoin(rset.getInt("USERJOIN"));
				
				
				mem.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return mem;
	}

	public Member idSearchServlet(Connection con, String email) {

		Member result = null; // 결과를 담을 객체
		PreparedStatement pstmt = null;
		ResultSet rset = null; // Select의 결과를 담은 객체
		// System.out.println("아이디 검색 m:" + m);
		try {

			String sql = prop.getProperty("idSearchServlet");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = new Member();
				result.setUserId(rset.getString("userId"));
			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	public Member pwdSearchServlet(Connection con, String id, String email2) {

		Member result = null; // 결과를 담을 객체
		PreparedStatement pstmt = null;
		ResultSet rset = null; // Select의 결과를 담은 객체
		String pwd = null;
		// System.out.println("아이디 검색 m:" + m);
		String sql = prop.getProperty("pwdSearchServlet");
		System.out.println(sql);
		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email2);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				result = new Member();
				result.setUserPwd(rset.getString("PASSWORD"));
			}

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	public int idDupCheck(Connection con, String id) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = -1;

		String sql = "SELECT COUNT(*) FROM USER_MEMBER WHERE USERID=?";

		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;

	}
	
public int updateMember(Connection con, Member m) { 	// 개인정보수정
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			
			String sql = "UPDATE USER_MEMBER"
					+ " SET PASSWORD = ?"
					+ ", EMAIL = ?"
					+ ", ADDRESS1 = ?"
					+ ", ADDRESS2 = ?"
					+ ", ADDRESS3 = ? WHERE USERID = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getAddress1());	
			pstmt.setString(4, m.getAddress2());
			pstmt.setString(5, m.getAddress3());
			pstmt.setString(6, m.getUserId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			 
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteMember(Connection con, String userId) {		// 회원탈퇴
		int result = 0;							// result 값을 초기화
		PreparedStatement pstmt = null;			// pstmt  값을 초기화
		
		try {
			
			String sql = "DELETE FROM USER_MEMBER WHERE USERID = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			// result에 쿼리실행해서 나온 값을 넣어줌
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	   // 비밀번호 재설정할때 받는 값
	   public Member rePwd(Connection con,String id, String email2) {

	         Member result = null; // 결과를 담을 객체
	         PreparedStatement pstmt = null;
	         ResultSet rset = null; // Select의 결과를 담은 객체
	         String pwd = null;
//	         System.out.println("아이디 검색 m:" + m);
	         String sql = prop.getProperty("pwdSearch");
	         System.out.println(sql);
	         try {

	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, id);
	            pstmt.setString(2, email2);
	            rset = pstmt.executeQuery();
	            if (rset.next()) {
	               result = new Member();
	               result.setUserId(rset.getString("USERID"));
	              result.setUserName(rset.getString("USERNAME"));
	               result.setUserPwd(rset.getString("PASSWORD"));
	               result.setEmail(rset.getString("EMAIL"));
	            result.setAddress1(rset.getString("ADDRESS1"));
	            result.setAddress2(rset.getString("ADDRESS2"));
	            result.setAddress3(rset.getString("ADDRESS3"));   
	               

	            }
	            
	         } catch (Exception e) {

	            e.printStackTrace();

	         } finally {
	            close(rset);
	            close(pstmt);
	         }

	         return result;
	      }

	   // 비밀번호 재설정
	   public int pwdReset(Connection con, Member m) {
	      
	      
	        int result = 0;
	         PreparedStatement pstmt = null;
	         ResultSet rset = null; // Select의 결과를 담은 객체
	         
	         String sql = prop.getProperty("rePwdServlet");
	            System.out.println(sql);
	         try {
	             pstmt = con.prepareStatement(sql);
	             
	             pstmt.setString(1, m.getUserPwd());
	             pstmt.setString(2, m.getUserId());
	             pstmt.setString(3, m.getEmail());
	             
	             result = pstmt.executeUpdate();
	             System.out.println("DAO :"+result);
	          }catch(SQLException e) {
	             e.printStackTrace();
	          }finally {
	             close(pstmt);
	          }
	          return result;
	       }

}
