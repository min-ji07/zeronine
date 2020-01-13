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

import com.google.gson.Gson;
import com.product.model.service.ProductService;
import com.product.model.vo.PageInfo;
import com.product.model.vo.Product;

/**
 * Servlet implementation class Top3SelectServlet
 */
@WebServlet("/top3Select.do")
public class Top3SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Top3SelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<Product> list = new ArrayList<Product>();
		ProductService ps = new ProductService();
		Product p = new Product();
		HttpSession session = request.getSession();
		
		String page = "";
		list = ps.top3Select();
		if (list != null) {
			System.out.println("마이페이지 리스트 출력");
			System.out.print("list:" + list);
			page = "views/ZeroNineMainPage.jsp";
			session.setAttribute("productList", list);

		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "이미지 상세보기 실패!!");
		}

		// response.sendRedirect(page);

		JSONObject result = new JSONObject();

		// 자바 스크립트 객체 형식으로 변환하여 저장(파싱)
		String data = "";
		int count = 1;
		for (Product p1 : list) {
			data+="<div class='bestSellerListDiv'>                                                                ";
			data+="<div class='best'>                                                                             ";
			data+= "<img src=" + request.getContextPath() + "/resources/productUploadFiles/" + p1.getMainImage() + ">"; 
			data+="</div>                                                                                         ";
			data+="<article>                                                                                      ";
			data+="	<div class='articleThumb'>                                                                    ";
			if(count==1) {
				data+="		<div class='num'>                                                                         ";
				data+="			<span class='number'>1</span> <span class='text'>First</span>                         ";
				data+="		</div> ";
			}else if(count ==2) {
				data+="		<div class='num'>                                                                         ";
				data+="			<span class='number'>2</span> <span class='text'>Second</span>                         ";
				data+="		</div> ";
			}else if(count ==3) {
				data+="		<div class='num'>                                                                         ";
				data+="			<span class='number'>3</span> <span class='text'>Third</span>                         ";
				data+="		</div> ";
			}
			data+="	</div>                                                                                        ";
			data+="	<div id='article1'>                                                                           ";
			data+="		<span id='ar1-1'>" + p1.getMainPrice() +"<span id='arPriceWon'>원</span></span> ";
			data+="<span id='ar1-2'><i><img src=" +request.getContextPath() +"/resources/images/CategoryIcon/icon2.png></i>" + p1.getLikeCount() +"</span>"; 
			data+="	</div>                                                                                        ";
			data+="	<div id='article2'>" +p1.getMainTitle() + "</div>                                                     ";
			data+="	<div id='article3'>                                                                           ";
			data+="		<span id='ar3-1'>#" +p1.getHashtag1() + "</span> <span id='ar3-2'>#" +p1.getHashtag2() +"</span> <span";
			data+="			id='ar3-3'>#" +p1.getHashtag3() + "</span>                                                            ";
			data+="	</div>                                                                                        ";
			data+="	<div class='articleMeta'>" +p1.getWriterId() + "님의 스토어</div>                                                  ";
			data+="</article>                                                                                     ";
			data+="</div>                                                                                         ";
			count++;
			System.out.println(count);
		}             
			result.put("data", data);
			//
			response.setContentType("application/json; charset=UTF-8");
			// response.setContentType("text/json; charset=UTF-8");
			response.getWriter().print(result);
			// request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
