<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.DBUtil"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.DBUtil"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<link rel="stylesheet" type="text/css" href="style.css">
<title>ShareThings | 교환하기</title>
</head>
<body>
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

	<br />
	<br />
	<br />
	<h2 id="subtitle">교환하기</h2>
	<input class="uploadButton" type="button" value="업로드"
		onClick="location.href='exchangeUpload.jsp'" />

	<br />
	<br />
	<br />

	<%!ArrayList<String> productImgUrl = new ArrayList<String>();%>
	<%!ArrayList<String> productName = new ArrayList<String>();%>
	<%!ArrayList<String> productCategory = new ArrayList<String>();%>
	<%!ArrayList<String> opponent = new ArrayList<String>();%>
	<%!ArrayList<String> productNo = new ArrayList<String>();%>
	<%!ArrayList<String> info = new ArrayList<String>();%>
	<%!HttpSession s = null;%>
	<%!%>
	<%
		s = request.getSession(false);
	if (s == null)
		s = request.getSession();
	productImgUrl.clear();
	productName.clear();
	productCategory.clear();
	opponent.clear();
	productNo.clear();
	ServletContext sc = getServletContext();
	Connection conn = (Connection) sc.getAttribute("DBconnection");
	ResultSet rs = DBUtil.getExchangeProductList(conn);
	if (rs != null) {
		while (rs.next()) {

			productImgUrl.add(rs.getString("productImgURL"));
			productName.add(rs.getString("productName"));
			productNo.add(rs.getString("productNo"));
			productCategory.add(rs.getString("productCategory"));
			opponent.add(rs.getString("opponentproduct"));
			info.add(rs.getString("productInformation"));
		}
	}
	s.setAttribute("productborrow", rs);
	%>

	<div id="list_div">
		<%
			for (int i = 0; i < productImgUrl.size(); i++) {
		%>
		<form method="post" action="doDetail">
			<div id="list_element">
				<ul>
					<li id="div_in"><img
						src="<%=".\\Upload\\" + productImgUrl.get(i)%>" width="200"
						height="200" /></li>

					<li id="div_in">
						제목: <%=productName.get(i)%><br /> 
						교환대상: <%=opponent.get(i)%><br />
						카테고리: <%=productCategory.get(i)%><br /> 
						<input type="hidden" name="nv" value="<%=productNo.get(i)%>" />
					</li>
				</ul>
			</div>

			<input id="notice_toList" type="submit" value="자세히" />
		</form>
		<%
			}
		%>
		<br />
	</div>

	<br />
	<br />
	<br />
		<br />
		<br />
		<%@ include file="footer.jsp"%>
</body>

</html>
