package com.question.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.vo.Member;
import com.question.model.service.QuestionCommentService;
import com.question.model.service.QuestionService;
import com.question.model.vo.Question;
import com.question.model.vo.QuestionComment;

/**
 * Servlet implementation class SelectOneQuestionServlet
 */
@WebServlet("/qselectone.do")
public class QuestionSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		
		QuestionService qs = new QuestionService();
		Question q = qs.selectOne(no);
		ArrayList<QuestionComment> clist = new QuestionCommentService().selectList(no);
		
		String page = "";
		
		HttpSession session = request.getSession(false);
		
		Member sessionM = (Member)session.getAttribute("member");
		
		System.out.println("아이디확인 : "+ sessionM.getUserId());
		
		if(q != null) {
			page = "views/questionBoardDetail.jsp";
			request.setAttribute("question",q);
			request.setAttribute("clist", clist);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 상세 보기 실패!");
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
