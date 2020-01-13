package com.product.model.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.product.model.vo.PageInfo;
import com.boardLikey.model.service.LikeyService;
import com.boardLikey.model.vo.Likey;
import com.product.model.dao.ProductDao;
import com.product.model.service.ProductService;
import com.product.model.vo.Product;

/**
 * Servlet implementation class productListServlet
 */
@WebServlet("/selectProductList.do")
public class productListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int listCount1;
	int listCount2;
	int listCount3;
	int listCount4;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public productListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Product> list = new ArrayList<Product>();
		ProductService ps = new ProductService();
		int startPage;
		int endPage;
		int maxPage = 0;
		int currentPage;
		int limit;

		currentPage = 1;

		limit = 8;

		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int radio = Integer.parseInt(request.getParameter("radio"));
		switch(radio) {
			case 1:
				listCount1 = ps.getListCount1(radio);
				maxPage = (int) ((double) listCount1 / limit + 0.9);
				break;
			case 2:
				listCount2 = ps.getListCount2(radio);
				maxPage = (int) ((double) listCount2 / limit + 0.9);
				break;
			case 3:
				listCount3 = ps.getListCount3(radio);
				maxPage = (int) ((double) listCount3 / limit + 0.9);
				break;
			case 4:
				listCount4 = ps.getListCount4(radio);
				maxPage = (int) ((double) listCount4 / limit + 0.9);
				break;
		}
		
		startPage = ((int) ((double) currentPage / 8 + 0.9) - 1) * limit + 1;
		endPage = startPage + limit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		Product p = new Product();
		HttpSession session = request.getSession();
		
		// 상품리스트에서 좋아요 갯수 갖고오기
		ArrayList<Likey> ynlist = new ArrayList<Likey>();
		ynlist = new LikeyService().selectyn();				
		System.out.println("좋아요 개수: " + ynlist);
				
		String page = "";

		list = ps.selectProductList(currentPage, limit, radio);
		if (list != null) {
			switch (radio) {
			case 1:
				page = "views/menuCategory1.jsp";
				break;
			case 2:
				page = "views/menuCategory2.jsp";
				break;
			case 3:
				page = "views/menuCategory3.jsp";
				break;
			case 4:
				page = "views/menuCategory4.jsp";
				break;
			}
			session.setAttribute("productList", list);
			session.setAttribute("like_count", ynlist);
			PageInfo pi = new PageInfo(currentPage, listCount1,listCount2,listCount3,listCount4,limit, maxPage, startPage, endPage);
			session.setAttribute("pi", pi);

		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "이미지 상세보기 실패!!");
		}

		response.sendRedirect(page);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
