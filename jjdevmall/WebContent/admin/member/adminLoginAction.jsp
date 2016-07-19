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
	
	String adminId = request.getParameter("adminId");
	String adminPw = request.getParameter("adminPw");
	String sql = "select * from admin where admin_id = ? and admin_pw = ?";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String Url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
		String dbId = "root";
		String dbPw = "java0000";
		connection = DriverManager.getConnection(Url,dbId,dbPw);
		
		statement = connection.prepareStatement(sql);
		statement.setString(1, adminId);
		statement.setString(2, adminPw);
		resultSet = statement.executeQuery();
		
		if(resultSet.next()) {
			System.out.println("관리자 로그인 성공");
			// 세션에 아이디값 저장
			session.setAttribute("sessioAdminId", resultSet.getString("admin_id"));
			session.setAttribute("sessioAdminlevel", resultSet.getString("admin_level"));
		} else {
			System.out.println("관리자 로그인 실패");
		}
	} catch (Exception e) {
		/* connection.rollback();
		e.printStackTrace(); */
	} finally {
		if(statement!=null) try { statement.close(); } catch(SQLException ex) {}
		if(connection!=null) try { connection.close(); } catch(SQLException ex) {}
		
	}
	// 로그인 성공,실패에 상관없이 adminIndex.jsp로 이동
	response.sendRedirect(request.getContextPath()+"/admin/adminIndex.jsp");
%>
</body>
</html>