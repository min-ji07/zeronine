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
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/MemberDeleteServlet.do") // 회원탈퇴
public class MemberDeleteServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // 로그인된 세션 가져오기 --> false -- null값인지 아닌지 확인 -- 로그인되어있기 때문에 null이 아님
      HttpSession session = request.getSession(false);
      
      String userId = ((Member)session.getAttribute("member")).getUserId();
      
      System.out.println("회원 기존 아이디  : " + userId);
      
      MemberService ms = new MemberService();
      
      if (ms.deleteMember(userId) > 0) {
         System.out.println("회원 탈퇴 완료!");
         
         session.invalidate();             // 세션 초기화 -- 로그아웃할 때 사용됨
         
         RequestDispatcher view = request.getRequestDispatcher("/views/ZeroNineMainPage.jsp");
         
         view.forward(request, response);
         
      } else {
         
         response.sendRedirect("views/errorPage.jsp");
         
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