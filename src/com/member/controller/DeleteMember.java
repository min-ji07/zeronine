package com.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.service.MemberService;
import com.member.model.vo.Member;

/**
 * Servlet implementation class DeleteMember
 */
@WebServlet("/memberdelete.me")
public class DeleteMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		MemberService ms = new MemberService();
		int result = ms.memberDelete(userId);
		
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
