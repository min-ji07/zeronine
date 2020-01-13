package com.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.service.MemberService;
import com.member.model.vo.Member;

/**
 * Servlet implementation class UpdateMember
 */
@WebServlet("/updatemember.me")
public class UpdateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("userPwd");
		String email = request.getParameter("email");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3"); 
		
		//System.out.println(email+address1);
		Member m = new Member();
		// 기존의 회원 정보를 새로운 값으로 변경하기
		m.setUserId(userId);
		m.setUserPwd(pwd);
		m.setEmail(email);
		m.setAddress1(address1);
		m.setAddress2(address2);
		m.setAddress3(address3);				
		
		MemberService ms = new MemberService();
		int result = ms.memberUpdate(m);
		String page = "";
		//String page = "";
		if( result > 0) {
			// 회원 정보 수정 성공!
			
			System.out.println("회원 정보 수정 완료!");								
			//response.sendRedirect("memberselect.me");
			
			page = "memberselect.me";
			
		} else {
			// 회원 정보 수정 실패!			
			//page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세보기 실패!!");
		}
		response.sendRedirect(page);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
