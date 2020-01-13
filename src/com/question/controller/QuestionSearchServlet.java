package com.question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.question.model.service.QuestionService;
import com.question.model.vo.PageInfo;
import com.question.model.vo.Question;

/**
 * Servlet implementation class QuestionSearchServlet
 */
@WebServlet("/searchQ.do")
public class QuestionSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1.페이징 처리
		ArrayList<Question> list = null;
		QuestionService qs = new QuestionService();
		
		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit;
		
		currentPage = 1;
		limit = 10;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));		
		}
		int listCount = qs.getListCount();
		
		System.out.println("서치 서블릿 listCount" + listCount);
		
		maxPage = (int)((double)listCount / limit + 0.9);
		startPage = ((int)((double)currentPage/10 + 0.9)-1)* limit +1;
		endPage = startPage + limit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 기존  검색 카테고리
		String category = request.getParameter("con");
		
		// 검색키워드
		String keyword = request.getParameter("keyword");
		
		//ArrayList<Question> list = new ArrayList<Question>();
		
		//QuestionService qs = new QuestionService();
		
		//TODO 이거 수정해야함
		list = qs.searchQuestion(category,keyword,currentPage,limit);
		
		String page = "";
		
		System.out.println("list " + list);
		
		if(list != null) {
			page = "views/questionBoard.jsp";
			request.setAttribute("list", list);
			
			PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
			request.setAttribute("pi", pi);
			System.out.println("페이징 성공");
		}else {
			page = "views/questionBoard.jsp";
			request.setAttribute("msg", "공지사항 검색 실패!");
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
