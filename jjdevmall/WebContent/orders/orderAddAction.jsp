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

String memberNo = (String)session.getAttribute("memberNo");
int itemNo = Integer.parseInt(request.getParameter("itemNo"));
String ordersQuantity = request.getParameter("ordersQuantity");
String ratedPrice = request.getParameter("ratedPrice");

System.out.println(memberNo+","+itemNo+","+ordersQuantity+","+ratedPrice);

Connection conn = null;
PreparedStatement stmt = null;

try{
	Class.forName("com.mysql.jdbc.Driver");
	String Url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String dbId = "root";
	String dbPw = "java0000";
	conn = DriverManager.getConnection(Url,dbId,dbPw);
	System.out.println(conn +"<<<conn");
	
	conn.setAutoCommit(false);
	
	String sql = "INSERT INTO orders (item_no, member_no, orders_quantity, orders_rate, orders_date) VALUES (?, ?, ?, ?, SYSDATE())";
	stmt = conn.prepareStatement(sql);
	stmt.setInt(1,itemNo);
	stmt.setString(2,memberNo);
	stmt.setString(3,ordersQuantity);
	stmt.setString(4,ratedPrice);

	
	System.out.println(sql);
	stmt.executeUpdate();
	
	conn.commit();
	response.sendRedirect(request.getContextPath()+"/orders/orderList.jsp");
	//원래는 전체상품리스트로 연결하는게아니고 member_no가 session에 저장된거랑 같은거만 보여줘야 함

}catch(Exception e){//예외시
	conn.rollback();//롤백
	e.printStackTrace();//롤백일시 콘솔에 뭘 출력해줌
}finally {
	// 6. 사용한 Statement 종료
	if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
	// 7. 커넥션 종료
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
</body>
</html>