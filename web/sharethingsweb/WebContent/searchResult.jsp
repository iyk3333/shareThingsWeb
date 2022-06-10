<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="model.DBUtil"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<title>Share Things | 검색결과</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%!HttpSession s = null;%>
	<%
		s = request.getSession(false);
	if (s == null || s.getAttribute("customerNo") == null) {
		out.println("<script>alert('로그인이 필요한 화면입니다. 메인 페이지로 이동합니다.'); location.href='login.html'; </script>");
		return; // 중요함!!
	}
	%>
	<span class="title"> <a href="mainPageAfterLogin.jsp"> <img
			src=".\img\title.PNG" width="500px" height="150px" />
	</a>
	</span>

	<span class="logout"> <span>
			<h5><%=s.getAttribute("customerName")%></h5>
	</span> <span>
			<form method="post" action="sessionTerminate">
				<input type="submit" value="로그아웃"
					onclick="location.href='login.html'">
			</form>
	</span>
	</span>

	<%@ include file="header.jsp"%>

	<%!ResultSet rs = null;%>
	<%!String searchword = null;%>
	<%!ArrayList<String> url = new ArrayList<String>();%>
	<%!ArrayList<String> productName = new ArrayList<String>();%>
	<%!ArrayList<String> productNo = new ArrayList<String>();%>
	<%
	searchword = (String) s.getAttribute("searchword");
	url = (ArrayList<String>) s.getAttribute("product");
	productName= (ArrayList<String>) s.getAttribute("productName");
	productNo = (ArrayList<String>) s.getAttribute("productNo");
	%>
	<h2>
		[<%=searchword%>] 검색결과
	</h2>
	<br>
	<div id="list_div">
			<br>
			<%
				for (int i = 0; i < url.size(); i++) {
			%>
			<form method="post" action="doDetail">
			<span>
				<img  src="<%=".\\Upload\\" + url.get(i)%>" width="200" height="200" />
				</span>
				<span>
				<div>
					이름: <%=productName.get(i) %>
				</div>
				<input type="hidden" name="nv" value="<%=productNo.get(i)%>"/>
				<input type="submit" value="자세히"/>
				</span>
				<br/><br/>
			</form>
			<%
				}
			%>
		
	</div>
	<br>
	<br>
	<br />
	<br />

	<%@ include file="footer.jsp"%>

	</form>
</body>
</html>
