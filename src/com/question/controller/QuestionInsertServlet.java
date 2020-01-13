package com.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.vo.Member;
import com.question.model.service.QuestionService;
import com.question.model.vo.Question;

/**
 * Servlet implementation class InsertQuestion
 */
@WebServlet("/qInsert.do")
public class QuestionInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1대1 문의의 제목, 내용, 체크박스 , 아이디
		String title = request.getParameter("title");
		String content = request.getParameter("content");
//		boolean chk = request.getParameter("chk1_4") != null; // 삼항연산식
		String status = request.getParameter("status"); 
		
		HttpSession session = request.getSession(false);
		
		Member sessionM = (Member)session.getAttribute("member");
	
		System.out.println("title 확인 : " + title);
		System.out.println("content 확인 : " + content);
//		System.out.println("체크 확인 : " + chk);
		System.out.println("스테이터스 확인 : " + status);
		System.out.println("아이디확인 : "+ sessionM.getUserId());
		
		
		// 문의 사항 등록을 위한 VO 객체 만들기
		Question q = new Question(title,content,sessionM.getUserId(),status); // 수정사항 : Session값에서 로그인 사용자 추가하기
		
		QuestionService qs = new QuestionService();
		
		int result = qs.insertQuestion(q);
		
		if(result > 0) {
			// 문의 사항 추가 성공
			response.sendRedirect(request.getContextPath() + "/qList.do");
		}else {
			// 문의사항 추가 실패
			request.setAttribute("msg", "문의 사항 등록 실패!");
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
