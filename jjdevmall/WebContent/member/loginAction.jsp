<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection connection = null;
	PreparedStatement statement = null;
	ResultSet resultSet = null;
	
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	System.out.println(memberId+"<<<id");
	System.out.println(memberPw+"<<<pw");

	
	String sql = "select * from member where member_id = ? and member_pw = ?";
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String Url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
		String dbId = "root";
		String dbPw = "java0000";
		connection = DriverManager.getConnection(Url,dbId,dbPw);
		
		statement = connection.prepareStatement(sql);
		statement.setString(1, memberId);
		statement.setString(2, memberPw);
		resultSet = statement.executeQuery();
		
		if(resultSet.next()){
			System.out.println("회원로그인성공");
			session.setAttribute("memberName", resultSet.getString("member_name"));
			session.setAttribute("memberId", resultSet.getString("member_id"));
			session.setAttribute("memberNo", resultSet.getString("member_no"));
		}else{
			System.out.println("회원로그인실패");
		}
		
	} catch (Exception e) {
		
	} finally {
		if(statement!=null) try { statement.close(); } catch(SQLException ex) {}
		if(connection!=null) try { connection.close(); } catch(SQLException ex) {}
	}
	// 로그인 성공,실패에 상관없이 index.jsp로 이동
	response.sendRedirect(request.getContextPath()+"/index.jsp");
	
	
%>
</body>
</html>