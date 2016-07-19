<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>INDEX</h1>
<%
	String memberName = (String)session.getAttribute("memberName");
	String memberId = (String)session.getAttribute("memberId");	
	//int memberNo = (int)session.getAttribute("memberNo");	
	if(memberName == null) { // 로그인이 안된 상태
%>
		<form action="<%=request.getContextPath()%>/member/loginAction.jsp">
			아이디:<input type="text" name="memberId">
			비번:<input type="password" name="memberPw">
			<input type="submit" value=로그인>
		</form>
<%		
	} else { // 로그인이 된 상태
%>
		<%=memberName%>님 반갑습니다.<br/>
		<a href="<%=request.getContextPath()%>/member/memberOne.jsp?memberId=<%=memberId%>">[회원정보]</a>
		<a href="<%=request.getContextPath()%>/item/itemList.jsp">[상품]</a>
		<a href="<%=request.getContextPath()%>/member/memberLogout.jsp">">[로그아웃]</a>
<%		
	}
%>
</body>
</html>