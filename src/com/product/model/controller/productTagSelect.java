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

import com.member.model.vo.Member;
import com.product.model.service.ProductService;
import com.product.model.vo.PageInfo;
import com.product.model.vo.Product;

/**
 * Servlet implementation class productTagSelect
 */
@WebServlet("/tagSelect.do")
public class productTagSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public productTagSelect() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String hashName = request.getParameter("hashName");
		System.out.println("hashName: " + hashName);
		ArrayList<Product> list = new ArrayList<Product>();
		ProductService ps = new ProductService();
		int radio = Integer.parseInt(request.getParameter("radio"));
		System.out.println("radio: " + radio);

		Product p = new Product();
		HttpSession session = request.getSession();
		String page = "";

		list = ps.productTagSelect(hashName, radio);
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
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "이미지 상세보기 실패!!");
		}

		JSONObject result = new JSONObject();
		String data = "";
		Member m = (Member)session.getAttribute("member");
		int count = 0;
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
		result.put("data", data);
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(result);

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
