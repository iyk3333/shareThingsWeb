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
  <title>Notice</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<span class="title">
        <a href="mainPageAfterLogin.jsp">
          <img src="img/title.PNG" width="500px" height="150px"/>
        </a>
    </span>
<%! String title; %>
  <%! String date; %>
  <%! String detail; %>
  <%!HttpSession s = null; %>
  <% 
  s=request.getSession(false);
  if(s==null || s.getAttribute("customerNo")==null) {
  	out.println("<script>alert('로그인이 필요한 화면입니다. 메인 페이지로 이동합니다.'); location.href='login.html'; </script>");
      return; 
  }
  
      int num = Integer.parseInt(request.getParameter("idx"));
      
      ServletContext sc = getServletContext();
      Connection conn = (Connection) sc.getAttribute("DBconnection");
        
      ResultSet rs = DBUtil.findNotice(conn, num);
      if (rs != null) {
        if (rs.next()) {
           title = rs.getString("title");
           date = rs.getString("uploadTime");
           detail = rs.getString("explanation");
        }
       }
  %>
    <span class="logout">
    <span>
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

<div id="totalBackground">
  <br/><br/>
    <h2 id="subtitle">공지사항</h2>
  <div id="centerdiv">
  
  
  <div>
    <h1 name="title"><%=title %></h1><h5><%=date %></h5>
  </div>
 
  <span>
    내용: <%=detail %><br/><br/>
  </span>
 
  <div id="notice">
    <input id="notice_toList" type="button" onclick="location.href='notice.jsp'" value="목록으로"> </button>
  </div>
  <br/><br/>
 
  </div>

</div>
 <%@ include file="footer.jsp" %>   
</body>
</html>