<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<script>
$(document).ready(function(){
	$('#loginBtn').click(function(){
		if($('#adminId').val()==''){
			$('#adminIdHelper').text('아이디를 입력하세요');
			$('#adminId').focus();
		}else if($('#adminPw').val()==''){
			$('#adminPwHelper').text('비밀번호를 입력하세요');
			$('#adminIdHelper').text('');
			$('#adminPw').focus();
		}else{
			$('#adminLoginForm').submit();
		}
	})	
});
</script>
</head>
<body>
<%
	String sessionMemberId = (String)session.getAttribute("sessioAdminId");
	String sessionMemberlevel = (String)session.getAttribute("sessioAdminlevel");
	if(sessionMemberId == null) { // 로그인이 안된 상태
%>
		<form id = "adminLoginForm" action="<%=request.getContextPath()%>/admin/member/adminLoginAction.jsp">		
			<div>
			아이디:
			<input type="text" id ="adminId" name="adminId" >
			<span id = "adminIdHelper"></span>
			</div>
			<div>
			비번:
			<input type="password" id = "adminPw" name="adminPw">
			<span id = "adminPwHelper"></span>
			</div>
			<input type="button" value=로그인 id= "loginBtn">	
		</form>
<%		
	} else { // 로그인이 된 상태
%>
		<ol>
			<%= sessionMemberId %>님 <%= sessionMemberlevel %>권한으로 로그인 상태입니다.
			<li><a href="<%=request.getContextPath()%>/admin/member/adminLogout.jsp">로그아웃</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/item/itemList.jsp">상품관리</a></li>
			<li><a href="<%=request.getContextPath()%>/orders/orderList.jsp">주문관리</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/member/memberListAll01.jsp">회원관리</a></li>
		</ol>
<%		
	}
%>
</body>
</html>