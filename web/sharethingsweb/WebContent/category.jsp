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
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<link rel="stylesheet" type="text/css" href="style.css">
<title>ShareThings | 카테고리</title>
<script>
	function formChange(obj) {
		obj.submit();
	}
</script>
</head>
<body>
	<span class="title"> <a href="mainPageAfterLogin.jsp"> <img
			src=".\img\title.PNG" width="500" height="150" />
	</a>
	</span>
	<%!HttpSession s = null;%>
	<%
		s = request.getSession(false);
	if (s == null || s.getAttribute("customerNo") == null) {
		out.println("<script>alert('로그인이 필요한 화면입니다. 메인 페이지로 이동합니다.'); location.href='login.html'; </script>");
		return;
	}
	%>
	<span class="logout"> <span><h5><%=s.getAttribute("customerName")%></h5></span>
		<span>
			<form method="post" action="sessionTerminate">
				<input type="submit" value="로그아웃"
					onclick="location.href='login.html'">
			</form>
	</span>
	</span>

	<%@ include file="header.jsp"%>

	<br />
	<br />


	<br />
	<br />
	<br />
	<form method="post" action="category.jsp">
		<div style="float: left;">

			<select name="category" id="selection"
				onchange="formChange(this.form)">
				<option value="none" selected>카테고리</option>
				<option value="clothing">의류|잡화</option>
				<option value="electronics">전자제품</option>
				<option value="furniture">가구</option>
				<option value="tool">공구</option>
				<option value="others">기타</option>
			</select>
		</div>
		<br />
		<br />
		<br />

		<%!String category =null;%>
		<%!ArrayList<String> url = new ArrayList<String>();%>
		<%!ArrayList<String> productName = new ArrayList<String>();%>
		<%!ArrayList<String> price = new ArrayList<String>();%>
		<%!ArrayList<String> opponent = new ArrayList<String>();%>
		<%!ArrayList<String> productCategory = new ArrayList<String>();%>
		<%
		url.clear();
		productName.clear();
		price.clear();
		opponent.clear();
		productCategory.clear();

		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		category = request.getParameter("category");

		ResultSet rs = DBUtil.searchCategory(conn, category);
		while (rs.next()) {
			if (rs != null) {
				url.add(rs.getString("productImgURL"));
				productName.add(rs.getString("productName"));
				price.add(rs.getString("price"));
				opponent.add(rs.getString("opponentProduct"));
				productCategory.add(rs.getString("productCategory"));
			}
		}
		%>

		<div id="list_div">

			<%
				for (int i = 0; i < url.size(); i++) {
			%>
		</div>
		<div id="list_element">
			<ul>
				<li id="div_in"><img src="<%=".\\Upload\\" + url.get(i)%>"
					width="200" height="200" /></li>
				<li id="div_in">
				 제목: <%=productName.get(i) %><br/>
				  <%if(price.get(i)==null){ %>
				  교환상품: <%=opponent.get(i) %>
				  <%} else{%>
			      가격: <%=price.get(i) %>
			      <%} %><br/>
			      카테고리: <%=productCategory.get(i) %><br/>

				</li>
			</ul>


		</div>
		<%
			}
		%>
	</form>
	<%@ include file="footer.jsp"%>

</body>
</html>