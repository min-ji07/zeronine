package com.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.question.model.service.QuestionCommentService;

/**
 * Servlet implementation class QuestionCommentDeleteServlet
 */
@WebServlet("/deleteComment.do")
public class QuestionCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionCommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		int no = Integer.parseInt(request.getParameter("no"));
		int result = new QuestionCommentService().deleteComment(cno);
		System.out.println("댓글 번호 전달 확인 : " + cno);
				
		// 댓글 삭제
		if(result > 0) {
			response.sendRedirect("qselectone.do?no=" + no);
			System.out.println("삭제 성공");
		}else {
			request.setAttribute("msg", "댓글 삭제 실패!");
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
