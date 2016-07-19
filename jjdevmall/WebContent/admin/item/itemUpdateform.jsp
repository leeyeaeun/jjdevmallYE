<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String itemNo = request.getParameter("itemNo");
String itemName = request.getParameter("itemName");
String itemPrice = request.getParameter("itemPrice");
String itemRate = request.getParameter("itemRate");
System.out.println(itemNo + itemName+ itemPrice+ itemRate);

Connection connection = null;
PreparedStatement statement = null;

try{
	Class.forName("com.mysql.jdbc.Driver");
	String Url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String dbId = "root";
	String dbPw = "java0000";
	connection = DriverManager.getConnection(Url,dbId,dbPw);

	connection.setAutoCommit(false);
	
	String sql = "update item set item_name=?,item_price =?,item_rate=? where item_no = ?";
	statement = connection.prepareStatement(sql);
	statement.setString(1,itemName);
	statement.setString(2,itemPrice);
	statement.setString(3,itemRate);
	statement.setString(4,itemNo);

	statement.executeUpdate();
	
	connection.commit();
	
	//response.sendRedirect(request.getContextPath()+"/admin/item/itemList.jsp");

}catch(Exception e){//예외시
	connection.rollback();//롤백
	e.printStackTrace();//롤백일시 콘솔에 뭘 출력해줌
}finally {
	// 6. 사용한 Statement 종료
	if (statement != null) try { statement.close(); } catch(SQLException ex) {}
	// 7. 커넥션 종료
	if (connection != null) try { connection.close(); } catch(SQLException ex) {}
}
%>

<form action="<%= request.getContextPath() %>/admin/item/itemUpdateAction.jsp" method="post">
<table border="1">
<tr>
	<td>아이디</td>
	<td>
<input type="hidden" name="m_id" size="20" value="<%= itemNo %>">	
		<%= itemNo %>
		
<%-- 
<input type="text" name="m_id" size="20" value="<%= itemNo %>" readonly> 
--%>
	
	</td>
<tr> 
<tr>
	<td>상품명</td>
	<td><input type="text" name=itemName size="20" value="<%= itemName %>"></td>
<tr>
<tr>
	<td>상품가격</td>
	<td><input type="text" name="m_level" size="20" value="<%= itemPrice %>"></td>
<tr>
<tr>
	<td>할인률</td>
	<td><input type="text" name="m_name" size="20" value="<%= itemRate %>"></td>
</tr>
<tr>
	<td colspan="4"><input type="submit" value="회원수정버튼"></td>
</tr>
</table>
</form>
</body>
</html>