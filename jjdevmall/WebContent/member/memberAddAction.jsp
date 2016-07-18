<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String mId = request.getParameter("mamberId");
String mPw = request.getParameter("memberPw");
String mName = request.getParameter("memberName");
int mAge = Integer.parseInt(request.getParameter("memberAge"));
String mSex = request.getParameter("memberSex");
String mAddr = request.getParameter("memberAddr");

Connection conn =null;
PreparedStatement stmt1 = null;
PreparedStatement stmt2 = null;
ResultSet rs = null;

try{
	Class.forName("com.mysql.jdbc.Driver");
	String Url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String dbId = "root";
	String dbPw = "java0000";
	conn = DriverManager.getConnection(Url,dbId,dbPw);
	conn.setAutoCommit(false);
	
	String sql1 = "insert into member(member_id,member_pw,member_sex,member_age,member_name) values(?,?,?,?,?)";
	stmt1 = conn.prepareStatement(sql1,Statement.RETURN_GENERATED_KEYS);
	stmt1.setString(1,mId);
	stmt1.setString(2,mPw);
	stmt1.setString(3,mName);
	stmt1.setInt(4,mAge);
	stmt1.setString(5,mSex);
	
	stmt1.executeUpdate();
	
	rs = stmt1.getGeneratedKeys();
	int key = 0;
	if(rs.next()){
		key = rs.getInt(1);
	}

	System.out.println(key+"<<<<<<lastKey");
	
	String sql2 = "insert into address(member_no,member_address) values(?,?)";
	stmt2 = conn.prepareStatement(sql2);
	stmt2.setInt(1,key);
	stmt2.setString(2,mAddr);
	stmt2.executeUpdate();
	
	conn.commit();

}catch(Exception e){//예외시
		conn.rollback();//롤백
		e.printStackTrace();//롤백일시 콘솔에 뭘 출력해줌
}finally{
	// 6. 사용한 Statement 종료
	if (stmt1 != null) try { stmt1.close(); } catch(SQLException ex) {}
	if (stmt2 != null) try { stmt2.close(); } catch(SQLException ex) {}
	// 7. 커넥션 종료
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
</body>
</html>