<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <button onclick="deleteItem();">상품삭제</button>
   <script>
      function deleteItem(){                         
         if(confirm("정말 삭제하시겠습니까?") == true){    
              alert("상품 삭제 완료!");
              location.href = "<%=request.getContextPath()%>/views/ZeroNineMainPage.jsp";
          }                                      
          else{                                  
              return;                           
          }
      }
   </script>
</body>
</html>