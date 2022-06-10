<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body align="center">
	<br/><br/><br/><br/><br/><br/><br/><br/>
	<%! int type = 0; %>
	<%! String id = null; %>
	<%! String pw = null; %>
	<%! HttpSession s = null; %>
	<%
		s = request.getSession(false);
		if(s==null) s = request.getSession();
		
		if(s.getAttribute("type")!=null){
			type = Integer.parseInt((String)s.getAttribute("type"));
		}
		if(type==1){
			id = (String) s.getAttribute("id");
			%>
			당신의 아이디는 <%=id %>입니다. <br/>로그인 페이지로 이동하시겠습니까? <br/>
			로그인 페이지로 이동: <input type="button" value="로그인" onClick="location.href='login.html'"/><br/>
			<%
		}else if(type==2){
			%>
			당신의 회원 정보가 일치하지 않습니다.<br/> 아이디를 다시 찾아보시겠습니까? <br/>
			아이디 찾기로 이동: <input type ="button" value="아이디찾기" onClick="location.href='findId.html'"/><br/>
			<%
		}else if(type==3){
			%>
			회원정보가 존재하지 않습니다.<br/> 회원가입페이지로 이동하시겠습니까?<br/>
			회원가입 페이지로 이동: <input type="button" value="회원가입" onClick="location.href='join.html'"/><br/>
			<%
		}else if(type==4){
			pw = (String) s.getAttribute("pw");
			%>
			당신의 비밀번호는 <%=pw %>입니다. <br/>로그인 페이지로 이동하시겠습니까? <br/>
			로그인 페이지로 이동: <input type="button" value="로그인" onClick="location.href='login.html'"/><br/>
			<%
		}else if(type==5){
			%>
			당신의 회원 정보가 일치하지 않습니다. <br/>비밀번호를 다시 찾아보시겠습니까? <br/>
			비밀번호 찾기로 이동: <input type ="button" value="비밀번호찾기" onClick="location.href='findPW.html'"/><br/>
			<%
			
		}else{
			response.sendRedirect("login.html");
		}			
	%>
	<br/><br/><br/>
	
	
	
</body>
</html>