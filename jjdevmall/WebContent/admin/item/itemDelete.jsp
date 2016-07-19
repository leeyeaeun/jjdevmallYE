<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>   
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

request.setCharacterEncoding("UTF-8");

String deleteNo = request.getParameter("deleteNo");

System.out.println(deleteNo+"<<<<deleteNo");

Connection connection = null;
PreparedStatement statement = null;

try{
	Class.forName("com.mysql.jdbc.Driver");
	String Url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String dbId = "root";
	String dbPw = "java0000";
	connection = DriverManager.getConnection(Url,dbId,dbPw);
	
	
	connection.setAutoCommit(false);
	
	String sql = "delete from item where item_no = ?";
	statement = connection.prepareStatement(sql);
	statement.setString(1,deleteNo);

	statement.executeUpdate();
	
	connection.commit();
	response.sendRedirect(request.getContextPath()+"/admin/item/itemList.jsp");

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
</body>
</html>