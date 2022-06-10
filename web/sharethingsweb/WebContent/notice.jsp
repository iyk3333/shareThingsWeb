<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="model.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%!HttpSession s= null; %>
    <%
    s=request.getSession(false);
    if(s==null || s.getAttribute("customerNo")==null) {
    	out.println("<script>alert('로그인이 필요한 화면입니다. 메인 페이지로 이동합니다.'); location.href='login.html'; </script>");
        return; 
    }
    
    %>

    <span class="title">
        <a href="mainPageAfterLogin.jsp">
          <img src=".\img\title.PNG" width="600px" height="150px"/>
        </a>
    </span>

    <span class="logout">
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
<%
   try {
      ServletContext sc = getServletContext();
      Connection conn = (Connection) sc.getAttribute("DBconnection");

      ResultSet rs = DBUtil.getNotice(conn);
      
%>
<br><br><br>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr style="text-align:center;">

   <td width="73">번호</td>
   <td width="379">제목</td>
   <td width="164">작성일</td>
 
  </tr>
<%! int idx; %>
<%
   if(rs != null){
   while(rs.next()) {
      idx = rs.getInt(1);
      String title = rs.getString(2);
      String date = rs.getString(3);

%>  
<tr height="25" align="center">
   <td><%=idx %></td>
   <td><a href="noticeDetail.jsp?idx=<%=idx%>"><%=title %></td>
   </td>
   <td><%=date %></td>
   <td>&nbsp;</td>
</tr>
<% 
      }
   }
   

} catch(SQLException e) {
   out.println(e);
}
%>

 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
</table>
 
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>

</table>
<br><br><br><br><br><br>
<%@ include file="footer.jsp" %> 
</body>
</html>