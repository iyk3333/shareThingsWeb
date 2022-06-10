<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
</head>
<body>

   <ul id="nav">
      <li><a href="intro.jsp">소개</a>
        <ul>
          <li><a href="notice.jsp">공지사항</a></li>
        </ul>
      </li>
      <li><a href="borrowList.jsp">대여</a>
        <ul>
          <li><a href="borrowList.jsp">둘러 보기</a></li>
          <li><a href="borrowUpload.jsp">업로드</a></li>
        </ul>
      </li>
      <li><a href="exchangeList.jsp">교환</a>
        <ul>
          <li><a href="exchangeList.jsp">둘러 보기</a></li>
          <li><a href="exchangeUpload.jsp">업로드</a></li>
        </ul>
      </li>
      <li><a href="category.jsp">카테고리</a>
        <ul>
          <li><a href="category.jsp">의류|잡화</a></li>
          <li><a href="category.jsp">전자제품</a></li>
          <li><a href="category.jsp">가구</a></li>
          <li><a href="category.jsp">공구</a></li>
          <li><a href="category.jsp">기타</a></li>
        </ul>
      </li>
       <li><a href="myPage.jsp">마이페이지</a>
        <ul>
          <li><a href="myPage.jsp">내 상품</a></li>
          <li><a href="myHistory.jsp">내 거래내역</a></li>
          <li><a href="uploadRecommendation.jsp">관심업로드</a></li>
        </ul>
        </li>
   
        <div id="search" >
      <form method="post" action="doSearch">
            <input id="searchbox" type="text" name="searchword" placeholder="물품명을 검색해보세요"/>
				<input id="searchbutton" type="submit" name="search" />
		</form>
     </div>
  	
    </ul>
</body>
</html>