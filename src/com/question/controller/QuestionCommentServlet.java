package com.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.vo.Member;
import com.question.model.service.QuestionCommentService;
import com.question.model.vo.QuestionComment;

/**
 * Servlet implementation class QuestionCommentServlet
 */
@WebServlet("/qComment.do")
public class QuestionCommentServlet extends HttpServlet {

       
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cwriter = request.getParameter("cwriter");
		System.out.println(cwriter);
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		String ccontent = request.getParameter("replyContent");
		System.out.println(ccontent);
		int refcno = Integer.parseInt(request.getParameter("refcno"));
		System.out.println(refcno);
		int clevel = Integer.parseInt(request.getParameter("clevel"));
		System.out.println(clevel);
		
//		HttpSession session = request.getSession(false);
//		
//		Member sessionM = (Member)session.getAttribute("member");
		
		System.out.println("코맨트 서블릿 탄다");
		QuestionComment qco = new QuestionComment(no,ccontent,cwriter,refcno,clevel);
		System.out.println("들어갔니?  :" + qco);

		int result = new QuestionCommentService().insertComment(qco);
		String page = "";
				
		System.out.println(result);
		
		
		if(result >0) {
			page = "views/questionBoardDetail.jsp";
			response.sendRedirect("qselectone.do?no=" + no);
			
		}else {
			request.setAttribute("msg", "댓글 작성 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp")
			.forward(request, response);
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
