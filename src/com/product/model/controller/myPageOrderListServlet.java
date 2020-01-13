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

import com.product.model.service.ProductService;
import com.product.model.vo.Product;
import com.product.model.vo.paymentInfo;

/**
 * Servlet implementation class myPageOrderListServlet
 */
@WebServlet("/myPageOrderList.do")	// 구매상품내역
public class myPageOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public myPageOrderListServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<paymentInfo> list = new ArrayList<paymentInfo>();
		ProductService ps = new ProductService();
		String getId = request.getParameter("getId");
		paymentInfo pm = new paymentInfo();
		HttpSession session = request.getSession();
		String page = "";
		list = ps.myPageOrderList(getId);
		if (list != null) {
			page = "views/myPage.jsp";
			session.setAttribute("orderList", list);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "이미지 상세보기 실패!!");
		}
		JSONObject result = new JSONObject();

		// 자바 스크립트 객체 형식으로 변환하여 저장(파싱)
		String data = "";
		for (paymentInfo pm1 : list) {
			data+="<div style='margin-bottom:10px;'>";
            data+="<div class='div2-1'>";
            data+="<span>주문 상품명 : </span>" + pm1.getpName() + "";
            data+="</div>";
            data+="<div class='div2-5'>";
            data+="<span class='span1-5'>결제방법:</span>";
            data+="<span class='span1-5' style='width:400px;display:inline-block;'>"+pm1.getPaymentSelect()+"</span>";
            data+="<span class='span1-5'>총금액 :</span>";
            data+="<span class='span1-2' style='margin-left:40px;'>" + pm1.getResultPrice() +"원</span>                                                 ";
            data+="</div>";
            data+="<div class='div2-5' style='margin-top:10px;border-bottom:1px solid #e3e3e3;'>";
            data+="<span class='span1-5'>배송주소:</span>";
            data+="<span class='span1-5' style='width:400px;display:inline-block;'>"+ pm1.getAddress() + "</span>";
            data+=" ";
            data+="<span class='span1-5'>구매날짜:</span>";
            data+="<span class='span1-5'>" + pm1.getOrderDate() + "</span>";
            data+="</div>";
            data+="</div>";
		}                                                                                                             
			result.put("data", data);
			//
			response.setContentType("application/json; charset=UTF-8");
			// response.setContentType("text/json; charset=UTF-8");
			response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
