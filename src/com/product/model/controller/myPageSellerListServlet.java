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
import com.product.model.vo.paymentInfo;

/**
 * Servlet implementation class myPageSellerListServlet
 */
@WebServlet("/myPageSellerList.do")
public class myPageSellerListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myPageSellerListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<paymentInfo> list = new ArrayList<paymentInfo>();
		ProductService ps = new ProductService();
		String getId = request.getParameter("getId");
		paymentInfo pm = new paymentInfo();
		HttpSession session = request.getSession();

		String page = "";
		list = ps.myPageSellerList(getId);
		System.out.println("결제 리스트2: " + list);
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
			 data+="<table style='border:1px solid black; background:white;margin-top:20px;font-size:14px;'>";
             data+="<tr style='height:30px;'>                                                               ";
             data+="    <th style='width:150px;'>주문날짜</th>                                              ";
             data+="    <th style='width:200px;'>주문 상품명</th>                                           ";
             data+="    <th style='width:100px;'>고객 아이디</th>                                           ";
             data+="    <th style='width:180px;'>고객 연락처</th>                                           ";
             data+="    <th style='width:100px;'>결제금액</th>                                              ";
             data+="    <th style='width:180px;'>결제상태</th>                                              ";
             data+="    <th style='width:350px;'>배송지</th>                                                ";
             data+="</tr>                                                                                   ";
             data+="                                                                                        ";
             data+="<tr style='border:1px solid black;height:40px;'>                                        ";
             data+="    <td style='width:150px;'>"+pm1.getOrderDate() +"</td>                                              ";
             data+="    <td style='width:200px;'>"+pm1.getpName() + "</td>";
             data+="    <td style='width:100px;'>"+pm1.getUserId()+"</td>                                               ";
             data+="    <td style='width:180px;'>"+pm1.getUserPhone()+"</td>                                         ";
             data+="    <td style='width:100px;'>"+pm1.getResultPrice()+"</td>                                               ";
             data+="    <td style='width:180px;'>"+pm1.getPaymentSelect()+"</td>                                              ";
             data+="    <td style='width:350px;'>"+pm1.getAddress()+"</td>                            ";
             data+="                                                                                        ";
             data+="</tr>                                                                                   ";
             data+="</table>                                                                                ";
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
