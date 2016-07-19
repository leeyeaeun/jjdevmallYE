<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>orderList</title>
</head>
<style>
table, td {border : 1px solid pink}
</style>
<body>
<% 
	request.setCharacterEncoding("utf-8");

	Connection connction = null;
	PreparedStatement statement = null;
	ResultSet resultSet = null;
	
	String sql = "select * from orders";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String Url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
		String dbId = "root";
		String dbPw = "java0000";
		connction = DriverManager.getConnection(Url, dbId, dbPw);
		connction.setAutoCommit(false);

		statement = connction.prepareStatement(sql);
		
		resultSet = statement.executeQuery();
				
		connction.commit();
%>
<h1>주문리스트</h1>
<form>
<table>
	<tr>
		<td>주문번호</td>
		<td>상품번호</td>
		<td>주문자번호</td>
		<td>수량</td>
		<td>가격</td>
		<td>주문일</td>
		<td>주문상세</td>
		
		
	</tr>
	<%
		while (resultSet.next()) {
	%>
	<tr>
		<td><%=resultSet.getInt("orders_no")%></td>
		<td><%=resultSet.getString("item_no")%></td>
		<td><%=resultSet.getInt("member_no")%></td>
		<td><%=resultSet.getDouble("orders_quantity")%></td>
		<td><%=resultSet.getDouble("orders_rate")%></td>
		<td><%=resultSet.getString("orders_date")%></td>
		<td><%=resultSet.getString("orders_state")%></td>
	</tr>
	<%
		}
	} catch (Exception e) {//예외시
		connction.rollback();//롤백
		e.printStackTrace();//롤백일시 콘솔에 뭘 출력해줌
	} finally {
		// 6. 사용한 Statement 종료
		if (statement != null)try {statement.close();} catch (SQLException ex) {}
		// 7. 커넥션 종료
		if (connction != null)try {connction.close();} catch (SQLException ex) {}
	}
%>
</table>
</form>
</body>
</html>