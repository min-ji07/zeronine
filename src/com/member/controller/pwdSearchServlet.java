package com.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.service.MemberService;
import com.member.model.vo.Member;

/**
 * Servlet implementation class pwdSearchServlet
 */
@WebServlet("/pwdSearchServlet.do")
public class pwdSearchServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pwdSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        System.out.println(id);
        String email2 = request.getParameter("email2");
        
         
         Member m2 = new Member();
         
         MemberService ms = new MemberService();
        
         m2 = ms.pwdSearchServlet(id,email2);

       
         if(m2 != null) {
            // 로그인 성공!!
            request.setAttribute("m2", m2);
            RequestDispatcher view = request.getRequestDispatcher("views/SearchPwdResult.jsp");
            view.forward(request, response);
            
         } else {
            response.sendRedirect("views/SearchPwdResult.jsp");
            
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