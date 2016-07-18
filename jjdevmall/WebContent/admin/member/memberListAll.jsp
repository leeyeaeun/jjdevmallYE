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
<body>
<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	PreparedStatement stmt1 = null;
	PreparedStatement stmt2 = null;
	ResultSet PrintRs = null;
	ResultSet keyRs = null;

	String sql1 = "Select * from member";
	String sql2 = "select * from address where member_no = ?";
	
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String Url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
		String dbId = "root";
		String dbPw = "java0000";
		conn = DriverManager.getConnection(Url, dbId, dbPw);
		conn.setAutoCommit(false);

		stmt1 = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);

		PrintRs = stmt1.executeQuery();

		keyRs = stmt1.getGeneratedKeys();
		int key = 0;
		if (keyRs.next()) {
			key = keyRs.getInt(1);
		}

		System.out.println(key + "<<<<<<lastKey");

		stmt2 = conn.prepareStatement(sql2);
		stmt2.setInt(1, key);
		stmt2.executeUpdate();

		conn.commit();
%>
<table>
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>성별</td>
		<td>나이</td>
	</tr>
	<%
		while (PrintRs.next()) {
	%>
	<tr>
		<td><%=PrintRs.getString("member_NAME")%></td>
		<td><%=PrintRs.getString("member_ID")%></td>
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
			if (stmt1 != null)
				try {
					stmt1.close();
				} catch (SQLException ex) {
				}
			if (stmt2 != null)
				try {
					stmt2.close();
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
</body>
</html>