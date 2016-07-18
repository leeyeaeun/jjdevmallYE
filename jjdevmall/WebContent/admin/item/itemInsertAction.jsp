<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html> <!-- 5.0양식으로 템플릿이 왜 어디갔지  -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String iName = request.getParameter("i_name");
String iPrice = request.getParameter("i_price");
String iRate = request.getParameter("i_rate");
Connection conn = null;
PreparedStatement stmt = null;

try{
	Class.forName("com.mysql.jdbc.Driver");
	String Url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=euckr";
	String dbId = "root";
	String dbPw = "java0000";
	conn = DriverManager.getConnection(Url,dbId,dbPw);
	conn.setAutoCommit(false);
	
	String sql = "insert into item(item_name,item_price,item_rate) values(?,?,?)";
	stmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
	stmt.setString(1,iName);
	stmt.setString(2,iPrice);
	stmt.setString(3,iRate);
	
	stmt.executeUpdate();
	
	conn.commit();

}catch(Exception e){//예외시
	conn.rollback();//롤백
	e.printStackTrace();//롤백일시 콘솔에 뭘 출력해줌
} finally {
	// 6. 사용한 Statement 종료
	if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
	
	// 7. 커넥션 종료
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}


}
%>

</body>
</html>