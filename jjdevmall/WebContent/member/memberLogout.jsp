<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate();//세션종료
	response.sendRedirect(request.getContextPath()+"/index.jsp");//인덱스페이지로이동
%>
</body>
</html>