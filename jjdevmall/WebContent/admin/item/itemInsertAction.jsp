<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
}finally{
	if(stmt!=null){
		
	}
}
%>

</body>
</html>