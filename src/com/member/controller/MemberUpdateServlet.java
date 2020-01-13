package com.member.controller;

import java.io.IOException;
import java.sql.Date;

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
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/MemberUpdateServlet.do")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원 정보 수정용 데이터 꺼내오기
	
				String pwd = request.getParameter("userPwd");
				String email = request.getParameter("email");
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				String address3 = request.getParameter("address3");
				
				// 해당 회원을 구분짓는 ID 받아오기
				HttpSession session = request.getSession(false);
				
				Member m = (Member)session.getAttribute("member");
				
				// 기존의 회원 정보를 새로운 값으로 변경하기
				m.setUserPwd(pwd);
				m.setEmail(email);
				m.setAddress1(address1);
				m.setAddress2(address2);
				m.setAddress3(address3);
				
				System.out.println("변경한 회원 정보 확인 : " + m);
				
				MemberService ms = new MemberService();
				
				if( ms.updateMember(m) > 0) {
					// 회원 정보 수정 성공!
					
					System.out.println("회원 정보 수정 완료!");
					
					session.invalidate();
					
					RequestDispatcher view
					     = request.getRequestDispatcher("views/ZeroNineMainPage.jsp");
					
					view.forward(request, response);
				} else {
					// 회원 정보 수정 실패!
					
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
