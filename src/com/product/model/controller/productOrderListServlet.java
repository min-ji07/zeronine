package com.product.model.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.product.model.vo.PageInfo;
import com.member.model.vo.Member;
import com.product.model.dao.ProductDao;
import com.product.model.service.ProductService;
import com.product.model.vo.Product;

/**
 * Servlet implementation class productOrderListServlet
 */
@WebServlet("/OrderListServlet.do")
public class productOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int listCount1;
	int listCount2;
	int listCount3;
	int listCount4;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	// public productOrderListServlet() {
	// super();
	// // TODO Auto-generated constructor stub
	// }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Product> list = new ArrayList<Product>();
		// new ArrayList<Product>()
		ProductService ps = new ProductService();
		int startPage;
		int endPage;
		int maxPage = 0;
		int currentPage;
		int limit;

		currentPage = 1;

		limit = 8;
		if (request.getParameter("aa") != null) {
			currentPage = Integer.parseInt(request.getParameter("aa"));
		}
		int radio = Integer.parseInt(request.getParameter("radio"));
		int k = Integer.parseInt(request.getParameter("k"));
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
	

		// 시작 페이지와 마지막 페이지 계산하기
		// 1~10 : 7, 7/10 --> 0.7 --> 1.6 --> 1 - 1 -- 0 * 10 + 1;
		// 11~20: 19, 19/10 -> 1.9 --> 2.8 --> 2 - 1 -- 1* 10 + 1;
		startPage = ((int) ((double) currentPage / 8 + 0.9) - 1) * limit + 1;
		endPage = startPage + limit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		Product p = new Product();
		HttpSession session = request.getSession();

		String page = "";

		list = ps.selectOrderList(currentPage, limit, k,radio);
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
			PageInfo pi = new PageInfo(currentPage, listCount1,listCount2,listCount3,listCount4, limit, maxPage, startPage, endPage);
			session.setAttribute("pi", pi);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "이미지 상세보기 실패!!");
		}

		// response.sendRedirect(page);

		JSONObject result = new JSONObject();

		// 자바 스크립트 객체 형식으로 변환하여 저장(파싱)
		String data = "";
		Member m = (Member)session.getAttribute("member");
		for (Product p1 : list) {
			data += "<div class='box' id='ajaxTable'>";
			if ( session.getAttribute("member") != null ) {
			data += "<a href=" + request.getContextPath() + "/productSelectOne.do?pno=" + p1.getPno() + "&userid=" + m.getUserId() + ">";	
			}else {
			data += "<a href=" + request.getContextPath() + "/views/loginForm.jsp>";
			}
			data += "<svg width='100%' height='100%'>";
			data += "<line class='top' x1='0' y1='0' x2='900' y2='0' />";
			data += "<line class='left' x1='0' y1='350' x2='0' y2='-920' />";
			data += "<line class='bottom' x1='200' y1='350' x2='-600' y2='350' />";
			data += "<line class='right' x1='200' y1='0' x2='200' y2='1380' />";
			data += "</svg>";
			data += "<div id='categoryName'><img src='" + request.getContextPath() + "/resources/productUploadFiles/"
					+ p1.getMainImage() + "'></div>   ";
			data += "<div id='categoryid1'>";
			data += "<a href=''>";
			data += "<span id='ct1-1'>" + p1.getMainPrice() + "</span>";
			data += "<span id='ctPriceWon'>원</span>";
			data += "<span id='ct1-2'><a href='#'><i><img src='" + request.getContextPath()
					+ "/resources/images/CategoryIcon/icon2.png'> </i>";
			data += ""+ p1.getLikeCount() + "</a></span>";
			data += "</a>";
			data += "<span id='ct2-1'>" + p1.getMainTitle() + " </span>";
			data += "<span id='ct3-1'> # " + p1.getHashtag1() + "  </span> ";
			data += "<span id='ct3-2'> # " + p1.getHashtag2() + "  </span> ";
			data += "<span id='ct3-3'> # " + p1.getHashtag3() + "  </span>";
			data += "<span id='ct4-1'>" + p1.getWriterId() + "님의 스토어</span>";
			data += "</div>";
			data += "</a>";
			data += "</div>";
		}
		;
		data += "<div class='pagingArea' align='center'>";
		data += "";
		data += "<nav>";
		data += "<ul class='pagination pg-blue'>";
		data += "<li class='page-item'><a class='page-link' aria-label='Previous'>";
		data += "<span aria-hidden='true'>&laquo;</span><span class='sr-only'>Previous</span></a></li>";

		switch (k) {
		case 2:
			for (int p2 = startPage; p2 <= endPage; p2++) {
				if (p2 == currentPage) {
					data += "<li class='page-item active'><a class='JsonPage2'>" + p2 + "</a></li>";
				} else {
					data += "<li class='page-item'><a class='JsonPage2'>" + p2 + "</a></li> ";
				}
			}
			break;
		case 3:
			for (int p2 = startPage; p2 <= endPage; p2++) {
				if (p2 == currentPage) {
					data += "<li class='page-item active'><a class='JsonPage3'>" + p2 + "</a></li>";
				} else {
					data += "<li class='page-item'><a class='JsonPage3'>" + p2 + "</a></li> ";
				}
			}
			break;
		case 4:
			for (int p2 = startPage; p2 <= endPage; p2++) {
				if (p2 == currentPage) {
					data += "<li class='page-item active'><a class='JsonPage4'>" + p2 + "</a></li>";
				} else {
					data += "<li class='page-item'><a class='JsonPage4'>" + p2 + "</a></li> ";
				}
			}
			break;
		}
		data += "<li class='page-item'>";
		data += "<a class='page-link' aria-label='Next' >";
		data += "<span aria-hidden='true'>&raquo;</span>";
		data += "<span class='sr-only'>Next</span>";
		data += "</a>";
		data += "</li>";
		data += "</ul>";
		data += "</nav>";
		result.put("data", data);
		//
		response.setContentType("application/json; charset=UTF-8");
		// response.setContentType("text/json; charset=UTF-8");
		response.getWriter().print(result);
		// request.getRequestDispatcher(page).forward(request, response);

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
