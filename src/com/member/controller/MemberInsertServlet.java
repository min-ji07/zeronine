package com.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.service.MemberService;
import com.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/mInsert.me")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 가입 서비스를 연동하는 서블릿
		
		// 1. 인코딩
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
	
		// 회원 가입시 전달을 위한 vo생성
		Member m = new Member(userId,userName,userPwd,email,address1,address2,address3);
		
		System.out.println("가입 회원 정보 확인 : " + m);
		
		// 회원 가입 서비스 실행
		MemberService ms = new MemberService();
		
		int result = ms.insertMember(m);
		
		if(result > 0) {
			// 회원 가입 성공!
			
			 System.out.println("회원 가입에 성공하였습니다.");
			 
			 RequestDispatcher view
			    = request.getRequestDispatcher("views/ZeroNineMainPage.jsp");
			 
			 view.forward(request, response);
			
		} else {
			// 회원 가입 실패!!
			System.out.println("회원 가입에 실패하였습니다.");
			response.sendRedirect("views/common/errorPage.jsp");			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

}

