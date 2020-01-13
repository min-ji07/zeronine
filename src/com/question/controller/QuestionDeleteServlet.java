package com.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.question.model.service.QuestionService;

/**
 * Servlet implementation class QuestionDeleteServlet
 */
@WebServlet("/qdelete.do")
public class QuestionDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		
		int result = new QuestionService().deleteQuestion(no);
		
		System.out.println("글 번호 전달 확인 : " + no);
		
		// 글 삭제
		if(result > 0) {
			// 공지사항 삭제 성공
			response.sendRedirect("qList.do"); //jsp페이지, 서블릿 써주는곳
			System.out.println("삭제성공");
		}else {
			// 공지사항 삭제 실패
			request.setAttribute("msg", "공지사항 삭제 실패!");
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
