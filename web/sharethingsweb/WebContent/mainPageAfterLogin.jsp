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
<title>Share Things | Main Page</title>
</head>
<body>
	
	<span class="title"> <a href="mainPageAfterLogin.jsp"> <img
			src=".\img\title.PNG" width="500px" height="150px" />
	</a>
	</span>

	<span class="logout"> <span> 
	<%!ArrayList<String> name = new ArrayList<String>();%>
	<%!ArrayList<String> url = new ArrayList<String>();%> 
	<%!HttpSession s = null;%>
	<%!ArrayList<String> productNo = new ArrayList<String>();%>
	<%!ArrayList<String> productNo2 = new ArrayList<String>();%>
	<%!String[] recentUrl = new String[6];%> 
	<%!String[] recentProductNo = new String[6];%> 
	<%!String[] recentOpponent = new String[6];%>
	<%!String[] recentName = new String[6];%>  
	<%!String[] recentPrice = new String[6];%> 

<%
 	name.clear();
	url.clear();
	productNo.clear();
	productNo2.clear();
 s = request.getSession(false);
 s = request.getSession(false);
 if (s == null || s.getAttribute("customerNo") == null) {
 	out.println("<script>alert('로그인이 필요한 화면입니다. 메인 페이지로 이동합니다.'); location.href='login.html'; </script>");
 	return;
 }

 int custid = 0;
 if (s.getAttribute("customerNo") != null)
 	custid = Integer.parseInt(s.getAttribute("customerNo").toString());

 ServletContext sc = getServletContext();
 Connection conn = (Connection) sc.getAttribute("DBconnection");

 productNo2 = DBUtil.findRecommendation(conn, custid);

 for(int i=0;i<productNo2.size();i++){
	 ResultSet rs = DBUtil.findProduct(conn, Integer.parseInt(String.valueOf(productNo2.get(i))));
	 //s.setAttribute("alarm", Integer.parseInt((String)productNo));
	 if (rs != null) {
	 	while(rs.next()){
	 		name.add(rs.getString("productName"));
	 		url.add(rs.getString("productImgUrl"));
			productNo.add(rs.getString("productNo"));
	 	}
	 }
 }

 ResultSet product = DBUtil.findRecentProduct(conn);
 int i = 0;
 if (product != null) {
 	while (product.next()) {
 		recentUrl[i] = product.getString("productImgURL");
 		recentProductNo[i] = product.getString("productNo");
 		recentOpponent[i] = product.getString("opponentProduct");
 		recentPrice[i] = product.getString("price");
 		recentName[i] = product.getString("productName");
 		i++;
 	}
 } 
%>
	</span> <span>
			<h5><%=s.getAttribute("customerName")%></h5>
	</span> <span>
			<form method="post" action="sessionTerminate">
				<input type="submit" value="로그아웃"
					onclick="location.href='login.html'">
			</form>
	</span>
	</span>

	<%@ include file="header.jsp"%>
	<br/><br/><br/><br/>
	<h2 align="center">추천 상품</h2>
	<br/><br/><br/>
	<div style="white-space:nowrap; margin: 40px; overflow-x:auto;  width:100%; height:260px;">
		<%
			for (int j = 0; j < name.size(); j++) {
		%>
		<form method="post" action="doDetail">
		<div style="display:inline;float:left; margin:10px;">
		<img id="list_element_r" name="img" src="<%=".\\Upload\\" + url.get(j)%>" width="200" height="200"/> 
			<div>
			제목: <%=name.get(j)%><br />
			</div>
			<input type="hidden" name="nv" value="<%=productNo.get(j)%>"/>
			<input type="submit" value="자세히"/>
		</div>
		</form>
		<%
			}
		%>
	</div>
	<p id="main_ad1">물건 공유 사이트 Share Things</p>
	<div id="main_ad2">
		<p>
			한 두번 쓸 물건이라면 <br> 사지 말고 대여해보세요<br>
		</p>

		<input type="button" value="대여하기" onclick="location.href='borrowList.jsp'"> <br></br>
	</div>
	<div id="main_ad3">
		<p>
			안 쓰는 물건이 있다면 <br> 다른 물건과 교환해보세요<br>
		</p>
		<input type="button" value="교환하기" onclick="location.href='exchangeList.jsp'"> <br></br>

	</div>
	<div id="main_ad4">
		<img src=".\img\tradeAd.jpg" width="300" height="300" /><img
			src=".\img\BorrowAd.jpg" width="300" height="300" /><img
			src=".\img\lendAd.jpg" width="300" height="300" />
	</div>

	<h2 align="center">최근 게시물</h2>
	<br>


	<div id="list_div">
		<%
			for (int k = 0; k < 6; k++) {
		%>
		<form method="post" action="doDetail">
			<div id="list_element">
			<ul>
			<li id="div_in"><img src="<%=".\\Upload\\" + recentUrl[k]%>" width="200" height="200" /></li>
			<li id="div_in">
			제목: <%=recentName[k] %><br/>
			<%
			if(recentOpponent[k]!=null){
			%>교환대상: <%=recentOpponent[k] %><br/>
			<%
			}else{
			%>
			가격: <%=recentPrice[k] %><br/>
			<%
			}
			%>

			</li>
			<input type="hidden" name="nv" value="<%=recentProductNo[k] %>"/>
			
			</ul>
			
			</div>
			<input type="submit" value="자세히"/>
		</form>
		<%
			}
		%>

	</div>
	<br>

	<br />
	<br />
	<%@ include file="footer.jsp"%>

</body>
</html>
