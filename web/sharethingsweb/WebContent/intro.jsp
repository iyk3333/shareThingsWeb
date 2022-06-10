<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Share Things | 소개</title>
<link rel="stylesheet" type="text/css" href="style.css">

</head>
<body>
<form method="post" action="login.html">
	<span class="title"> <a href="mainPageAfterLogin.jsp"> <img
			src="img/title.PNG" width="500px" height="150px" />
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
	<span class="logout">
	<span>
			<h5><%=s.getAttribute("customerName")%></h5>
	</span> 
	<span>
			<form method="post" action="sessionTerminate">
				<input type="submit" value="로그아웃"
					onclick="location.href='login.html'">
			</form>
	</span>
</span>
	<%@ include file="header.jsp"%>
	<ul>
		<div id="main_ad4">
			<img src=".\img\tradeAd.jpg" width=950px height=600px align="middle">
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div id="main_ad4">
			<img src=".\img\BorrowAd.jpg" width=950px height=500px align="middle">
		</div>
		<br />
		<br />
		<br />
		<br />
		<div id="main_ad4">
			<img src=".\img\lendAd.jpg" width=950px height=500px align="middle">
		</div>

	</ul>
	<br>
	<br>
	<br>
	<br>


	<%@ include file="footer.jsp"%>
</form>
</body>
</html>