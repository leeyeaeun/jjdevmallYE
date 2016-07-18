<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체member select</title>
</head>
<!-- 멤버 이름을 클릭하면 주소가 나왓음 좋겠다.  -->
<!-- 멤버 전체리스트 나오고 member_no로 주소 select 하기  -->
<style>
table, td {border : 1px solid pink}
</style>
<body>
<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet PrintRs = null;
	String sql = "Select * from member";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String Url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
		String dbId = "root";
		String dbPw = "java0000";
		conn = DriverManager.getConnection(Url, dbId, dbPw);
		conn.setAutoCommit(false);

		stmt = conn.prepareStatement(sql);
		
		PrintRs = stmt.executeQuery();
		
		
		conn.commit();
%>
<form>
<table>
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>성별</td>
		<td>나이</td>
	</tr>
	<%
		while (PrintRs.next()) {
	%>
	<tr>
		<td><%=PrintRs.getInt("member_no")%></td>
		<td><a href="<%=request.getContextPath()%>/admin/member/addressList.jsp?sandNomber=<%=PrintRs.getInt("member_no")%>"><%=PrintRs.getString("member_id")%></a></td>
		<td><%=PrintRs.getString("member_pw")%></td>
		<td><%=PrintRs.getString("member_name")%></td>
		<td><%=PrintRs.getString("member_sex")%></td>
		<td><%=PrintRs.getInt("member_age")%></td>
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