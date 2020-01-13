package com.product.model.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.member.model.service.MemberService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.product.model.service.ProductService;
import com.product.model.vo.Product;

/**
 * Servlet implementation class productUpdateServlet2
 */
@WebServlet("/productUpdate2.do")
public class productUpdateServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productUpdateServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pno = Integer.parseInt(request.getParameter("pno"));
		System.out.println("업데이트 서블릿3 : " + pno);
		int maxSize = 1024 * 1024 * 10;
		if (!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "multipart를 통한 전송이 아닙니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		String root = request.getServletContext().getRealPath("/");
		System.out.println(root);
		String savePath = root + "resources/productUploadFiles";
		System.out.println(savePath);

		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());
		String mainImage = mrequest.getFilesystemName("mainImage");
		String mainTitle = mrequest.getParameter("mainTitle");
		int mainPrice = Integer.parseInt(mrequest.getParameter("mainPrice"));
		String op1_title = mrequest.getParameter("op1_title");
		String op1_price = mrequest.getParameter("op1_price");
		String op2_title = mrequest.getParameter("op2_title");
		String op2_price = mrequest.getParameter("op2_price");
		String op3_title = mrequest.getParameter("op3_title");
		String op3_price = mrequest.getParameter("op3_price");
		int radio = Integer.parseInt(mrequest.getParameter("radio"));
		int dv_price = Integer.parseInt(mrequest.getParameter("dv_price"));
		int dv_due = Integer.parseInt(mrequest.getParameter("dv_due"));
		int min_person = Integer.parseInt(mrequest.getParameter("min_person"));
		int min_count = Integer.parseInt(mrequest.getParameter("min_count"));
		String hashtag1 = mrequest.getParameter("hashtag1");
		String hashtag2 = mrequest.getParameter("hashtag2");
		String hashtag3 = mrequest.getParameter("hashtag3");
		String detailImage = mrequest.getFilesystemName("detailImage");
		String writerId = mrequest.getParameter("writerId");
		
		HttpSession session = request.getSession(false);
		Product p = new Product();
		p.setPno(pno);
		p.setMainImage(mainImage);
		p.setMainTitle(mainTitle);
		p.setMainPrice(mainPrice);
		p.setOp1_title(op1_title);
		p.setOp1_price(op1_price);
		p.setOp2_title(op2_title);
		p.setOp2_price(op2_price);
		p.setOp3_title(op3_title);
		p.setOp3_price(op3_price);
		p.setRadio(radio);
		p.setDv_price(dv_price);
		p.setDv_due(dv_due);
		p.setMin_person(min_person);
		p.setMin_count(min_count);
		p.setHashtag1(hashtag1);
		p.setHashtag2(hashtag2);
		p.setHashtag3(hashtag3);
		p.setDetailImage(detailImage);
		p.setWriterId(writerId);
	
		ProductService ps = new ProductService();
		if( ps.UpdateProduct(p,pno) > 0) {
			System.out.println("업데이트 성공");
			RequestDispatcher view = request.getRequestDispatcher("views/myPage.jsp");
		    view.forward(request, response);
		} else {
		// 상품 정보 수정 실패!
		response.sendRedirect("views/common/errorPage.jsp");
		}
		System.out.println("업데이트 컨트롤러 p: " + p);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
