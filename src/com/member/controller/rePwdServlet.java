package com.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.service.MemberService;
import com.member.model.vo.Member;

/**
 * Servlet implementation class rePwdServlet
 */
@WebServlet("/rePwdServlet.do")
public class rePwdServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rePwdServlet() {
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
        
         System.out.println("서블릿: " + id);
       // System.out.println("email2: " + email2);
         
         Member m2 = new Member();
         
         MemberService ms = new MemberService();
        
         m2 = ms.rePwd(id,email2);
         System.out.println("서블릿: " + m2);
        // m2 = ms.idSearchServlet(email2);
       
         // System.out.print("서블릿 m" + m2.getUserId());
       
         if(m2 != null) {
            // 로그인 성공!!
            
            HttpSession session = request.getSession();

            session.setAttribute("m2", m2); //세션 이름 key, value
            
            RequestDispatcher view = request.getRequestDispatcher("views/updatePwd.jsp");
            view.forward(request, response);
            
         } else {
            // 로그인 실패!
            
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