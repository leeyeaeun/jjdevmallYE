<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table, td {border : 1px solid pink}
</style>
</head>
<body>
<table>
	<tr>
	<td>id</td>
	<td>pw</td>
	<td>sex</td>
	<td>name</td>
	<td>age</td>
	</tr>
<%//로그인한 본인의 회원 정보만 화면에 뜨게함.
//개인회원정보창에서 수정가능하게. 만들고싶음 : 수정화면으로 넘기면됨
request.setCharacterEncoding("UTF-8");
String memberName = request.getParameter("memberId");

Connection connection = null;
PreparedStatement statement = null;
ResultSet resultSet = null;
String sql ="select * from member where member_Id = ?"; 


try{
	Class.forName("com.mysql.jdbc.Driver");
	String Url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String dbId = "root";
	String dbPw = "java0000";
	connection = DriverManager.getConnection(Url,dbId,dbPw);
	
	statement = connection.prepareStatement(sql);
	statement.setString(1,memberName);
	
	resultSet = statement.executeQuery();
	
	if(resultSet.next()){
%>		
		<tr>
		<td><%=resultSet.getString("member_id") %></td>
		<td><%=resultSet.getString("member_pw") %></td>
		<td><%=resultSet.getString("member_sex") %></td>
		<td><%=resultSet.getString("member_name") %></td>
		<td><%=resultSet.getString("member_age") %></td>
		</tr>
<%		
	}
	
	
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
</table>

</body>
</html>