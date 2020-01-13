package com.product.model.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.model.service.ProductService;

/**
 * Servlet implementation class productDeleteServlet
 */
@WebServlet("/productDelete.do")
public class productDeleteServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int pno = Integer.parseInt(request.getParameter("pno"));
      System.out.println("삭제 할 상품번호 : " + pno);
      
      ProductService ps = new ProductService();
      
      if (ps.deleteItem(pno) > 0) {      // ps의 메소드 deleteItem(pno)가 0보다 클경우 상품삭제
         System.out.println("삭제 된 상품 번호 : " + pno);
         RequestDispatcher view = request.getRequestDispatcher("/views/myPage.jsp");
         view.forward(request, response);
      } else {
         
         System.out.println("상품 삭제 안됨...");
         
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