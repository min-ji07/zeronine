package com.boardLikey.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boardComment.model.service.BoardCommentService;
import com.boardLikey.model.service.LikeyService;
import com.boardLikey.model.vo.Likey;



/**
 * Servlet implementation class LikeyInsertServlet
 */
@WebServlet("/likeyInsert.do")
public class LikeyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String userid = request.getParameter("userid");
		
		int result = new LikeyService().updateLikey(bno,userid);
		
		if(result > 0) {
			int result2 = new LikeyService().insertLikeyId(bno,userid);
			
			response.sendRedirect("productSelectOne.do?pno="+bno+"&userid="+userid);
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
