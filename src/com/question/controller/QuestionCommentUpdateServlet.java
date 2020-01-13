package com.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.question.model.service.QuestionCommentService;
import com.question.model.vo.QuestionComment;

/**
 * Servlet implementation class QuestionCommentUpdateServlet
 */
@WebServlet("/updateComment.do")
public class QuestionCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionCommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String comment = request.getParameter("content");
		System.out.println("코맨트 가져왔나" + comment);
		int no = Integer.parseInt(request.getParameter("no"));
		int cno = Integer.parseInt(request.getParameter("cno"));
		QuestionComment qco = new QuestionComment();
		
		qco.setCcontent(comment);
		qco.setUno(no);
		qco.setCno(cno);
		
		System.out.println(comment);
		System.out.println(no);
		System.out.println(cno);
		int result = new QuestionCommentService().updateComment(qco);
		
		String page ="";
		
		if(result > 0) {
			// 댓글 수정 성공
			page = "views/questionBoardDetail.jsp";
			response.sendRedirect("qselectone.do?no="+no);
		}else {
			request.setAttribute("msg", "댓글 수정 실패");
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
