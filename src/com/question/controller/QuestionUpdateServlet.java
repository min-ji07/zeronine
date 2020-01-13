package com.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.question.model.service.QuestionService;
import com.question.model.vo.Question;

/**
 * Servlet implementation class QuestionUpdateServlet
 */
@WebServlet("/qUpdate.do")
public class QuestionUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int no = Integer.parseInt(request.getParameter("no"));
		
		Question q = new Question();
		
		q.setNo(no);
		q.setContent(content);
		q.setTitle(title);
		System.out.println("업데이트 오류찾기");
		System.out.println("no" + no);
		System.out.println("content : "+ content);
		System.out.println("title : " + title);
		int result = new QuestionService().updateQuestion(q);
		System.out.println("업데이트 서블릿 result " + result);
		if(result > 0) {
			// 게시글 수정 성공
			response.sendRedirect("qselectone.do?no="+no);
			System.out.println("수정성공");
		}else {
			request.setAttribute("msg", "공지사항 수정 실패");
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
