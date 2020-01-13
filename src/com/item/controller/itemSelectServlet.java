package com.item.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boardComment.model.service.BoardCommentService;
import com.boardComment.model.vo.BoardComment;
import com.item.model.service.ItemSelectService;
import com.item.model.vo.ItemSelectVo;
import com.product.model.vo.Product;

/**
 * Servlet implementation class itemSelectServlet
 */
@WebServlet("/itemSelect.do")
public class itemSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public itemSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 상품 리스트 관련객체 생성
		
		int pno = Integer.parseInt(request.getParameter("pno"));

		//String userid = request.getParameter("userid");
		
		
		Product p = new ItemSelectService().selectOne(pno);
		
		Product scnt = new ItemSelectService().selectSangCnt(pno);
		Product bcnt = new ItemSelectService().selectBuyCnt(pno);
				// 
				
		ArrayList<BoardComment> clist = new ArrayList<BoardComment>();
		BoardCommentService bs = new BoardCommentService();
		
		clist = bs.selectList(pno);		
		
		/*
		 * Likey li = new LikeyService().selectOne(pno);
		 * 
		 * Likey yn = new LikeyService().selectCnt(pno);
		 */
		
						
		//System.out.println("정보는?:"+li+"아이디는?:"+li.getUserid()+"좋아요는?"+yn);
		
		String page = "";			
		/*
		 * if(li.getUserid()== "null"){ li.setUserid() = "admin"; }
		 */
		System.out.println("갖고는오지?:"+scnt.getSangcnt() + "리뷰는 : " + bcnt.getBuycnt());	
		
		if(p != null) {			
			

			page = "views/itemDetailPage.jsp";
			// 상품정보 전달 
			request.setAttribute("item", p);
			/*
			 * // 좋아요정보 전달 request.setAttribute("likey", li); // 좋아요 갯수 전달
			 * request.setAttribute("yn_cnt", yn);
			 */
			// 상품문의 갯수 전달
			request.setAttribute("sang_cnt", scnt);
			// 상품리뷰 갯수 전달
			request.setAttribute("buy_cnt", bcnt);			
			// 댓글정보 전달			
			request.setAttribute("clist", clist);			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세보기 실패!!");
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
