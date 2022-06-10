<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />

<link rel="stylesheet" type="text/css" href="style.css">

<title>ShareThings | 대여상품 업로드</title>
<script>
	$(document).on('click', '#btnSave', function(e) {
		e.preventDefault();
		$("#form").submit();
	});
	$(document)
			.on(
					'click',
					'#btnList',
					function(e) {
						e.preventDefault();
						location.href = "${pageContext.request.contextPath}/board/getBoardList";

					});
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
		return; // 중요함!!
	}
	%>
	<span class="logout"> <span><h5><%=s.getAttribute("customerName")%></h5></span>
		<form method="post" action="sessionTerminate">
			<input type="submit" value="로그아웃"
				onclick="location.href='login.html'">
		</form>
	</span>

	<%@ include file="header.jsp"%>

	<br />
	<br />
	<div id="totalBackground">
		<h2 id="subtitle">대여하기</h2>
		<form id="board_total_size" method="post" action="doBorrowUpload"
			enctype="multipart/form-data">
			<div id="centerdiv">
				<div style="float: left;">
					<select name="category" id="selection">
						<option value="clothing" selected>의류|잡화</option>
						<option value="electronics">전자제품</option>
						<option value="furniture">가구</option>
						<option value="tool">공구</option>
						<option value="others">기타</option>
					</select>
				</div>
				<br />
				<br />
				<br />
				<div>

					<h2>대여하기 업로드</h2>

					<input type="file" value="파일 선택" name="file" />

					<div>
						<label id="board_input_div">이름</label> <input type="text"
							name="name" id="board_input" placeholder="상품명을 입력해주세요" />
					</div>
					<div>
						<label id="board_input_div">가격</label> <input type="text"
							name="price" id="board_input" placeholder="예) 10000원" />
					</div>
					<div>
						<label id="board_input_div">대여기간</label> <input type="text"
							name="lendingPeriod" id="board_input" placeholder="예) 14일" />
					</div>
					<div>
						<label id="board_input_div" >설명</label>
						<textarea cols="50" rows="10" name="explanation" placeholder="상품을 간단히 설명해주세요"></textarea>
					</div>
					<div>
						<input id="board_btn" type="submit" name="save" value="저장" /> <input
							id="board_btn" type="button" name="gotolist" value="목록" />
					</div>

				</div>

			</div>
		</form>
	</div>
	<br />
	<br />
	<%@ include file="footer.jsp"%>

</body>
</html>
