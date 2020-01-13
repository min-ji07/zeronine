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
 * Servlet implementation class myPageProductListServlet
 */
@WebServlet("/myPageLikeList.do")			// 구매자 관심상품내역
public class myPageLikeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public myPageLikeListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Product> list = new ArrayList<Product>();
		ProductService ps = new ProductService();
		String userid = request.getParameter("getId");		
		Product p = new Product();
		HttpSession session = request.getSession();
		String page = "";
		list = ps.myPageLikeList(userid);
		if (list != null) {
			page = "views/myPage.jsp";
			session.setAttribute("productList", list);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "이미지 상세보기 실패!!");
		}
		JSONObject result = new JSONObject();

		// 자바 스크립트 객체 형식으로 변환하여 저장(파싱)
		String data = "";
		for (Product p1 : list) {
			
			data+= "<div class='div1itemLayout'>";
        	data+= "<div class='div1item1-1'>";
        	data+= "<img src=" + request.getContextPath() + "/resources/productUploadFiles/" + p1.getMainImage() + ">";
            data+= "<div class='text-block'>";
            data+= "<p>" + p1.getMainTitle()  + "/" + p1.getMainPrice() + "원</p>";
            data+= "</div>";
            data+= "</div>";
        	data+= "<div class='div1item1-2'><a href=" + request.getContextPath() + "/productSelectOne.do?pno=" + p1.getPno() +"&userid=" + userid+
        			"><button id='likeBtn' style='width:150px;margin-left:20px;'>관심상품 구매</button></a></div>";
        	data+= "</div>";
		}
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