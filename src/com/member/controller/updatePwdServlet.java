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
 * Servlet implementation class updatePwdServlet
 */
@WebServlet("/updatePwdServlet.do")
public class updatePwdServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String pwd = request.getParameter("userPwd"); // 파라미터는 무조건 name=? 이거 가져옴 
      
      HttpSession session= request.getSession(false);
      Member m = (Member)session.getAttribute("m2");
      System.out.println("세션값 확인 : "+ m);
      System.out.println(pwd);
      m.setUserPwd(pwd); // 자바에선 일단 바뀜
      
      MemberService ms = new MemberService(); 
      
      if(ms.pwdReset(m) > 0) {
            // 비밀번호 변경 수정 성공!
            
            System.out.println("비밀번호 수정 완료!");
            
            session.invalidate();//세션 소멸
            RequestDispatcher view
              = request.getRequestDispatcher("views/ZeroNineMainPage.jsp");
         
            view.forward(request, response);
         }else {
            // 실패!!
            
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