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
 * Servlet implementation class QuestionUpdateViewServlet
 */
@WebServlet("/qUpview.do")
public class QuestionUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		String newcontent = request.getParameter("content");
		String newtitle =  request.getParameter("title");
		//Question q = new Question();
		
//		q.setNo(no);
//		q.setContent(newcontent);
//		q.setTitle(newtitle);
		System.out.println(no + newcontent + newtitle);
		
		/*int result = new QuestionService().updateView(q);*/
		Question q = new QuestionService().updateView(no);
		
		// 페이지이동
		String page = "";
		
		if(q != null) {
			page = "views/questionUpdate.jsp";
			request.setAttribute("question", q);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지 글 수정페이지 연결 실패!");
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
