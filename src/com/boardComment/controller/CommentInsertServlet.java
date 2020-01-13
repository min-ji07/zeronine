package com.boardComment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.boardComment.model.service.BoardCommentService;
import com.boardComment.model.vo.BoardComment;
import com.member.model.vo.Member;

/**
 * Servlet implementation class CommentInsertServlet
 */
@WebServlet("/insertComment.bo")
public class CommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = request.getParameter("writer");
		int bno = Integer.parseInt(request.getParameter("bno"));
		String content = request.getParameter("content");
		int refdno = Integer.parseInt(request.getParameter("refdno"));
		int clevel = Integer.parseInt(request.getParameter("clevel"));
		String cwriter = request.getParameter("writer");
		int loc = Integer.parseInt(request.getParameter("loc"));
		
		
		//System.out.println("이거 안나와?" + writer +":"+bno+ ":" + content + ":" + refdno + ":" + clevel);
		
		BoardComment bco = new BoardComment(bno,content,writer,refdno,clevel,cwriter,loc);
		HttpSession session = request.getSession();
		
		int result = new BoardCommentService().insertComment(bco);
		Member m = (Member)session.getAttribute("member");
		System.out.println(result);
		if(result > 0) {
			response.sendRedirect("productSelectOne.do?pno="+bno + "&userid=" + m.getUserId());
		}else {
			System.out.print("동록실패염");
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
