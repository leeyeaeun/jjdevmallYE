<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String sessionMemberId = (String)session.getAttribute("sessioAdminId");
	String sessionMemberlevel = (String)session.getAttribute("sessioAdminlevel");
	if(sessionMemberId == null) { // 로그인이 안된 상태
%>
		<form action="<%=request.getContextPath()%>/admin/member/adminLoginAction.jsp">		
			아이디:<input type="text" name="adminId">
			비번:<input type="password" name="adminPw">
			<input type="submit" value=로그인>	
		</form>
<%		
	} else { // 로그인이 된 상태
%>
		<ol>
			<%= sessionMemberId %>님 <%= sessionMemberlevel %>권한으로 로그인 상태입니다.
			<li><a href="<%=request.getContextPath()%>/admin/member/adminLogout.jsp">로그아웃</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/item/itemList.jsp">상품관리</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/member/">주문관리는 아직 안만들어서 누르지마셈</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/member/memberListAll01.jsp">회원관리</a></li>
		</ol>
<%		
	}
%>
</body>
</html>