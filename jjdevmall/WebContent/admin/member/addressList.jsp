<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table, td {border : 1px solid pink}
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
int memberNo = Integer.parseInt(request.getParameter("sandNomber"));
System.out.print(memberNo+"<<<<memberNo");

Connection conn = null;
PreparedStatement stmt = null;
ResultSet PrintRs = null;
String sql = "SELECT * FROM member LEFT JOIN address on member.member_no = address.member_no  where member.member_no = ?";

try {
	Class.forName("com.mysql.jdbc.Driver");
	String Url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String dbId = "root";
	String dbPw = "java0000";
	conn = DriverManager.getConnection(Url, dbId, dbPw);
	conn.setAutoCommit(false);
	
	stmt = conn.prepareStatement(sql);
	stmt.setInt(1,memberNo);
	PrintRs = stmt.executeQuery();
	
	conn.commit();
%>
<h1>회원주소</h1>
<form>
<table>
	<tr>
		<td>주소</td>	
	</tr>
	<tr>
<%
		while (PrintRs.next()) {
			String addr = PrintRs.getString("member_address"); 

				%>
				<td><%= addr %></td>
				</tr>
				<%						
			}
		
} catch (Exception e) {//예외시
	conn.rollback();//롤백
	e.printStackTrace();//롤백일시 콘솔에 뭘 출력해줌
} finally {
	// 6. 사용한 Statement 종료
	if (stmt != null)
		try {
			stmt.close();
		} catch (SQLException ex) {
		}
	// 7. 커넥션 종료
	if (conn != null)
		try {
			conn.close();
		} catch (SQLException ex) {
		}
}
%>
</table>
</form>

</body>
</html>