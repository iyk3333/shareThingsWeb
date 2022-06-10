<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8">
<link rel="stylesheet" type="text/css" href="style.css">
<title>LendShow Page</title>
</head>
<body>
<form method="post" >
    <span class="title">
        <a href="afterLogin.jsp">
          <img src=".\title.PNG" width="600px" height="150px"/>
        </a>
    </span>

    <span class="logout">
    <span>
      <h5><% session.getAttribute("uid"); %></h5>
    </span>
    <span>
      <input type="submit" value="로그아웃">
    </span>
  </span>

    <ul id="nav">
      <li><a href="#">소개</a>
        <ul>
          <li><a href="notice.html">공지사항</a></li>
        </ul>
      </li>
      <li><a href="borrowList.html">대여</a>
        <ul>
          <li><a href="borrowList.html">둘러 보기</a></li>
          <li><a href="borrowUpload.html">업로드</a></li>
        </ul>
      </li>
      <li><a href="exchangeList.html">교환</a>
        <ul>
          <li><a href="exchangeList.html">둘러 보기</a></li>
          <li><a href="exchangeUpload.html">업로드</a></li>
        </ul>
      </li>
      <li><a href="category.html">카테고리</a>
        <ul>
          <li><a href="category.html">의류|잡화</a></li>
          <li><a href="category.html">전자제품</a></li>
          <li><a href="category.html">가구</a></li>
          <li><a href="category.html">공구</a></li>
          <li><a href="category.html">기타</a></li>
        </ul>
      </li>
      <div id="search">
            <input id="searchbox" type="text" name="mid" />
            <input id="searchbutton"type="submit" value="search"/>

     </div>
    </ul>
<br/><br/><br/>
<div style="float: left;">
   <form>
      <select name="category" id="selection" onchange="selectCategory()">
         <option value="clothing" selected>의류|잡화</option>
         <option value="electronics">전자제품</option>
         <option value="furniture">가구</option>
         <option value="tool">공구</option>
         <option value="others">기타</option>
      </select>
   </form>
</div>
<br/><br/><br/>


  <div id="list_div">
    <p id="list_element">
      
      
      <img src="C:\Users\catty\Pictures\Saved Pictures/산.png" width="200" height="200"/></br>
      제목:  <br/>
      가격: <br/>
      지역: <br/>
    </p>
    <p id="list_element">
      <img src="C:\Users\catty\Pictures\Saved Pictures/산.png" width="200" height="200"/></br>
      제목:  <br/>
      가격: <br/>
      지역: <br/>
    </p>
    <p id="list_element">
      <img src="C:\Users\catty\Pictures\Saved Pictures/산.png" width="200" height="200"/></br>
      제목:  <br/>
      가격: <br/>
      지역: <br/>
    </p>
    <p id="list_element">
      <img src="C:\Users\catty\Pictures\Saved Pictures/산.png" width="200" height="200"/></br>
      제목:  <br/>
      가격: <br/>
      지역: <br/>
    </p>
  </div>
  <br>
  <div id="list_div">
    <p id="list_element">
      <img src="C:\Users\catty\Pictures\Saved Pictures/산.png" width="200" height="200"/></br>
      제목:  <br/>
      가격: <br/>
      지역: <br/>
    </p>
    <p id="list_element">
      <img src="C:\Users\catty\Pictures\Saved Pictures/산.png" width="200" height="200"/></br>
      제목:  <br/>
      가격: <br/>
      지역: <br/>
    </p>
    <p id="list_element">
      <a href=#>
      <img src="C:\Users\catty\Pictures\Saved Pictures/산.png" width="200" height="200"/></br>
      제목:  <br/>
      </a>
      가격: <br/>
      지역: <br/>

    </p>
    <p id="list_element">
      <img src="C:\Users\catty\Pictures\Saved Pictures/산.png" width="200" height="200"/></br>
      제목:  <br/>
      가격: <br/>
      지역: <br/>
    </p>
  </div>

  <br/><br/><br/>

  <div id="mypagethebogi">
    <span><a href="#"><<</a></span>
    <span><a href="#">1</a></span>
    <span><a href="#">2</a></span>
    <span><a href="#">3</a></span>
    <span><a href="#">4</a></span>
    <span><a href="#">5</a></span>
    <span><a href="#">>></a></span>
  </div>

  <br/><br/>
  <div id="main_ad6">
     <div id="main_ad6_title">
        <h2>Share Things<h2>
     </div>
     <div id="main_ad6_subtitle">
        <a href="notice.html"> 공지사항 </a> <br />
        <a href="terms.html"> 이용약관 </a> <br />
        <a href="customerService.html"> 고객문의 </a> <br />
        <a href="AdService.html"> 광고문의 </a> <br />
     </div>
  </div>
</form>
</body>
<script>
   function selectCategory(){   
      var target = document.getElementById("category");
       var text = target.options[target.selectedIndex].text;
       
      Connection conn = (Connection) sc.getAttribute("DBconnection");
      
      ResultSet rs = DBUtil.searchCategory(conn, text);
      
      if(rs != null) {
         try {
            if(rs.next()) {
               
            }
            else { 
                  
            }

         }
         catch (SQLException e) {
               e.printStackTrace();
         }
      }
   }
         
</script>
</html>