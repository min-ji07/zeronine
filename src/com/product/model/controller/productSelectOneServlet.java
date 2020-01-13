package com.product.model.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.boardComment.model.service.BoardCommentService;
import com.boardComment.model.vo.BoardComment;
import com.boardLikey.model.service.LikeyService;
import com.boardLikey.model.vo.Likey;
import com.item.model.service.ItemSelectService;
import com.product.model.service.ProductService;
import com.product.model.vo.Product;

/**
 * Servlet implementation class productSelectOneServlet
 */
@WebServlet("/productSelectOne.do")
public class productSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pno = Integer.parseInt(request.getParameter("pno"));
		String userid = request.getParameter("userid");
		System.out.println("pno: " + pno);
		
		Product p = new ProductService().productSelectOne(pno);
		
		// 상품문의 댓글갯수 가져오기
		Product scnt = new ItemSelectService().selectSangCnt(pno);
		// 상품리뷰 댓글갯수 가져오기
		Product bcnt = new ItemSelectService().selectBuyCnt(pno);		 
		// 상세페이지 내에 좋아요 갯수 갖고오기
		Likey yn = new LikeyService().selectLikeyYn(pno,userid);
		
		Likey yncount = new LikeyService().selectCnt(pno);				

		// 상품리스트 댓글리스트 가져오기
		//ArrayList<BoardComment> clist = new ArrayList<BoardComment>();
		ArrayList<BoardComment> clist = new BoardCommentService().selectList(pno);
		
		String page = "";					
		String value1 = "n";
		
		if(p != null) {			
			//Product p2 = new ProductService().selectSeq();
			// p2에 담은 수 pno에 담기			
			if(yn != null) {
				 request.setAttribute("likeyYn", yn);
				 int likecnt = yncount.getYn_cnt();	
				 // likey테이블에 insert 
				 int result2 = new ProductService().updateLikecount(pno,likecnt);
			}else {				
				request.setAttribute("ynId", value1);
			}
															
			page = "views/itemDetailPage.jsp";
			// 상품정보 전달 
			request.setAttribute("item", p);
			
			request.setAttribute("sang_cnt", scnt);
			// 상품리뷰 갯수 전달
			request.setAttribute("buy_cnt", bcnt);			
			// 댓글정보 전달			
			request.setAttribute("clist", clist);
			// 상품 갯수전달
			request.setAttribute("yncnt",yncount);					
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세보기 실패!!");
		}
		
		// 좋아요 갯수
		
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
