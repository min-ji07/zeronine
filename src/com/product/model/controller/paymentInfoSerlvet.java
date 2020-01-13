package com.product.model.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.service.MemberService;
import com.product.model.service.ProductService;
import com.product.model.vo.paymentInfo;

/**
 * Servlet implementation class paymentInfoSerlvet
 */
@WebServlet("/paymentInfo.do")
public class paymentInfoSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public paymentInfoSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String pName = request.getParameter("pName"); // 주문 상품명
		String userName = request.getParameter("userName"); // 주문자명
		String userId = request.getParameter("userId"); // 주문자 아이디
		String sellerId = request.getParameter("sellerId"); // 판매자 아이디
		String userPhone  = request.getParameter("userPhone"); // 주문자 연락처
		String address =  request.getParameter("add2") + " " + request.getParameter("add3"); // 배송지
	    String resultPrice = request.getParameter("resultPrice"); // 총가격
	    String paymentSelect = request.getParameter("paymentSelect"); // 결제방법
	    paymentInfo pm = new paymentInfo(pName,userName,userId,sellerId,userPhone,address,resultPrice,paymentSelect);
	    HttpSession session = request.getSession();
	    ProductService ps = new ProductService();
		
		int result = ps.insertPaymentInfo(pm);
		RequestDispatcher view;
		if(result > 0) {
			// 회원 가입 성공!
			switch(paymentSelect) {
			case "신용카드":
				session.setAttribute("payment", pm);
				view = request.getRequestDispatcher("views/cardPayment.jsp");
				view.forward(request, response);
				break;
			case "카카오페이":
				session.setAttribute("payment", pm);
				view = request.getRequestDispatcher("views/kakaoPayment.jsp");
				view.forward(request, response);
				break;
			}	
		}else {
			System.out.println("결제 정보 확인에 실패하였습니다.");
			response.sendRedirect("views/common/errorPage.jsp");			
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
