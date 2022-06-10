<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="model.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Share Things | 마이페이지 </title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<!-- 상단  -->
	 <span class="title">
        <a href="mainPageAfterLogin.jsp">
          <img src="img/title.PNG" width="500px" height="150px"/>
        </a>
    </span>

    <span class="logout">
    <span>
    	<%! ArrayList<String> productImgUrl = new ArrayList<String>();%>
 	<%! ArrayList<String> productName = new ArrayList<String>(); %>
 	<%! ArrayList<String> productCategory = new ArrayList<String>(); %>
 	<%! ArrayList<String> price = new ArrayList<String>(); %>
 	<%! ArrayList<String> productNo = new ArrayList<String>(); %>
 	<%! ArrayList<String> opponent = new ArrayList<String>(); %>
    	<%!HttpSession s=null; %>
    	<%
    	s=request.getSession(false);
        if(s==null || s.getAttribute("customerNo")==null) {
        	out.println("<script>alert('로그인이 필요한 화면입니다. 메인 페이지로 이동합니다.'); location.href='login.html'; </script>");
            return;  // 중요함!!
        }
        int custid = Integer.parseInt((String) s.getAttribute("customerNo"));
        productImgUrl.clear();
        productName.clear();
        productCategory.clear();
        price.clear();
        productNo.clear();
        opponent.clear();
        ServletContext sc = getServletContext();
    	Connection conn = (Connection) sc.getAttribute("DBconnection");

    	ResultSet rs = DBUtil.allProduct(conn,custid);
    	if(rs!=null){
       		while(rs.next()){
       			opponent.add(rs.getString("opponentProduct"));
       			productImgUrl.add(rs.getString("productImgURL"));
       			productName.add(rs.getString("productName"));
       			productNo.add(rs.getString("productNo"));
       			productCategory.add(rs.getString("productCategory"));
       			price.add(rs.getString("price"));
       		}
       	}
    	%>
    	
    </span>
    <span>
      <h5><%=s.getAttribute("customerName")%></h5>
    </span>
    <span>
       <form method="post" action="sessionTerminate">
      		<input type="submit" value="로그아웃" onclick="location.href='login.html'">
    	</form>     
    </span>
  </span>
   
      <%@ include file="header.jsp" %>   
		<h2 align = "center"> 내 상품 </h2> <br>
    <%
  		for(int i=0;i<productImgUrl.size();i++){
  	%>
  	
    	<div id="list_element">
    <ul>
    	<li id="div_in"><img src="<%=".\\Upload\\"+productImgUrl.get(i) %>" width="200" height="200"/></li>
    	
    	<li id="div_in">
    
	  제목: <%=productName.get(i) %><br/>
       <%if(price.get(i)==null){ %>
	  교환상품: <%=opponent.get(i) %>
	  <%} else{%>
      가격: <%=price.get(i) %>
      <%} %><br/>
      카테고리: <%=productCategory.get(i) %><br/>
	  <input type="hidden" name="nv" value="<%=i %>"/>
    	</li>
    </ul>
    </div> 
   
	<%
  		}
  	 %>
    <br/><br/>
  

  <%@ include file="footer.jsp" %>   

</body>
</html>