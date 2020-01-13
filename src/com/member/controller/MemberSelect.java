package com.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.service.MemberService;
import com.member.model.vo.Member;
import com.product.model.service.ProductService;

/**
 * Servlet implementation class MemberSelect
 */
@WebServlet("/memberselect.me")
public class MemberSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Member> mem = new MemberService().selectAllMember();
		
		String page = "";
		if(mem != null) {			
			page = "views/member_admin.jsp";
			// 상품정보 전달 
			request.setAttribute("member", mem);															
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세보기 실패!!");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
