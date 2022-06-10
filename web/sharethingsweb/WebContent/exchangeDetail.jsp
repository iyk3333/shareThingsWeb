<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.DBUtil"%>
<!DOCTYPE html>
<html>
<head>
<title>ShareThings | 교환하기</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
   <%! HttpSession s = null; %>
   <%
    s=request.getSession(false);
    if(s==null || s.getAttribute("customerNo")==null) {
       out.println("<script>alert('로그인이 필요한 화면입니다. 메인 페이지로 이동합니다.'); location.href='login.html'; </script>");
        return;  // 중요함!!
    }
  
    %>

   <span class="title"> <a href="mainPageAfterLogin.jsp"> <img
         src=".\img\title.PNG" width="500px" height="150px" />
   </a>
   </span>

   <span class="logout"> <span>
         <h5><%=s.getAttribute("customerName")%></h5>
   </span>
      <form method="post" action="sessionTerminate">
         <span> <input type="submit" value="로그아웃"
            onclick="location.href='login.html'">

         </span>
      </form>
   </span>

   <%@ include file="header.jsp"%>
   </span>
   <div id="totalBackground">
      <br />
      <br />
      <h2 id="subtitle">교환하기</h2>
      <div id="centerdiv">
         <div style="float: left;">
            <form>
               <select name="category" id="selection">
                  <option value="clothing" selected>의류|잡화</option>
                  <option value="electronics">전자제품</option>
                  <option value="furniture">가구</option>
                  <option value="tool">공구</option>
                  <option value="others">기타</option>
               </select>
            </form>
         </div>

         <%! String productImgUrl = null; %>
         <%! String productInformation = null; %>
         <%! String productName = null; %>
         <%! String productCategory = null; %>
         <%!int productNo=0; %>
         <%! int productLike=0; %>
         <%! String opponent = null; %>
         <%! String lendingPeriod = null; %>
         <%! String phonenumber= null; %>
         <%! String deal = null; %>
         <%   
   s = request.getSession();
    int num = Integer.parseInt(s.getAttribute("num").toString());
    ServletContext sc = getServletContext();
      Connection conn = (Connection) sc.getAttribute("DBconnection");;
      
      ResultSet rs = DBUtil.findProduct(conn, num);
      if(rs!=null){
         while(rs.next()&&(rs.getInt("productNo")==num)){
         productImgUrl = rs.getString("productImgURL");
         productName = rs.getString("productName");
         productCategory = rs.getString("productCategory");
         opponent = rs.getString("opponentproduct");
         productNo = rs.getInt("productNo");
         productLike = rs.getInt("productLike");
         lendingPeriod = rs.getString("lendingPeriod");
         productInformation = rs.getString("productInformation");
         if(productInformation==null) productInformation="없음";
         boolean b = rs.getBoolean("deal");
         if(b==false) deal = "거래중";
         else deal = "거래완료";
         }
      }
      
      
   
      
      ResultSet phone = DBUtil.findPhone(conn,productNo);
      if(phone!=null){
         while(phone.next()){
            phonenumber = phone.getString("phone");
         }
      }
    %>
         <div>
            <h1 name="title"><%=productName %></h1>
         </div>
         <form method="post" action="doDeal">
            <div id="deal">
               <input type="hidden" name="productNo" value="<%=productNo %>" /> <input
                  id="deal_btn" type="submit" name="liking" value="<%=deal %>" />
            </div>
         </form>
         <span> <img src="<%=".\\Upload\\"+productImgUrl %>"
            width="600" height="700" /><br />
         <br />
         <br /> 교환대상: <%=opponent %><br />
         <br /> 카테고리: <%=productCategory %> <br />
         <br /> 연락처: <%=phonenumber %><br />
         <br/>  교환기간: <%=lendingPeriod %> <br />
         <br /> 설명: <%=productInformation %><br/>
         </span>
         <form method="post" action="doIncreaseLike">
            <div id="liking">
               <input type="hidden" name="likenum" value="<%=productNo %>" /> <input
                  id="liking_btn" type="submit" name="liking"
                  value="좋아요<%=productLike%>" onClick="increaseLike()" />
            </div>
         </form>
         <div id="deal">
            <input id="notice_toList" type="submit" name="liking"
               onClick="location.href='exchangeList.jsp'" value="목록으로"
               onClick="increaseLike()" />
         </div>
         <br />
         <br />
         <%@ include file="footer.jsp" %> 
      </div>

   </div>
</body>
</html>