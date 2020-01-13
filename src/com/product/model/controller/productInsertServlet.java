package com.product.model.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.product.model.service.ProductService;
import com.product.model.vo.Product;

/**
 * Servlet implementation class productInsertServlet
 */
@WebServlet("/productInsert.do")
public class productInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public productInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int maxSize = 1024 * 1024 * 10;
		HttpSession session = request.getSession();
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

		Product p = new Product();
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

		// 7. 서비스 결과 처리하기
		int result = new ProductService().insertProduct(p);

		if (result > 0) {
			System.out.println("이미지 삽입 성공");
			// 상품 인서트 후 상품의 pno (sequence 가져와서 p2에 담기)
			Product p2 = new ProductService().selectSeq();
			// p2에 담은 수 pno에 담기
			int pno = p2.getPno();			
			// likey테이블에 insert 
			int result2 = new ProductService().insertLikey(pno);

			request.getRequestDispatcher("selectProductList.do?radio=" + radio).forward(request, response);
		} else {
			request.setAttribute("msg", "이미지 삽입 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
