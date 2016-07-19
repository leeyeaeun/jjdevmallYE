<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%// 중복 아이디가 있으면 경고창이 뜨게 만들고 싶음 . 근데 이렇게 중복아이디 검사하면 불편함.
request.setCharacterEncoding("utf-8");

String mId = request.getParameter("memberId");
String mPw = request.getParameter("memberPw");
String mName = request.getParameter("memberName");
int mAge = Integer.parseInt(request.getParameter("memberAge"));
String mSex = request.getParameter("memberSex");

String[] mAddr2 = request.getParameterValues("addrAdd");
System.out.println("aa" + mAddr2.length);
	for(int i = 0; i<mAddr2.length ; i++){
		System.out.println("bb" + mAddr2[i]);
	}		
Connection conn =null;
PreparedStatement stmt1 = null;
PreparedStatement stmt2 = null;
PreparedStatement overlapStmt = null;
ResultSet rs = null;
ResultSet overlapRs = null;

try{
	Class.forName("com.mysql.jdbc.Driver");
	String Url = "jdbc:mysql://127.0.0.1:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String dbId = "root";
	String dbPw = "java0000";
	conn = DriverManager.getConnection(Url,dbId,dbPw);
	conn.setAutoCommit(false);
	
	 
	String overlapSql ="select member_id from member where member_id = ?";
	overlapStmt = conn.prepareStatement(overlapSql);
	overlapStmt.setString(1, mId);
	overlapRs = overlapStmt.executeQuery();
	
	System.out.println(overlapRs+"<<<<<<<overlapRs");
	if(overlapRs.next()) {//만약 select결과가 하나라도 있으면 중복된거니까 
		out.print("중복된 아이디 입니다.");
%>
		<script type="text/javascript">
			alert("중복된 아이디 입니다.");
			location.href = "<%= request.getContextPath() %>/admin/member/memberListAll01.jsp";
		</script>
<%	
	
	}else{
		System.out.print("사용가능. insertQuery를 여기에 넣는거지");
		String sql1 = "insert into member(member_id,member_pw,member_sex,member_name,member_age) values(?,?,?,?,?)";
		stmt1 = conn.prepareStatement(sql1,Statement.RETURN_GENERATED_KEYS);
		stmt1.setString(1,mId);
		stmt1.setString(2,mPw);
		stmt1.setString(4,mName);
		stmt1.setInt(5,mAge);
		stmt1.setString(3,mSex);
		
		stmt1.executeUpdate();
		
		rs = stmt1.getGeneratedKeys();
		int key = 0;
		if(rs.next()){
			key = rs.getInt(1);
		}

		System.out.println(key+"<<<<<<lastKey");
		
		if(mAddr2 != null){
			String sql2= "insert into address(member_no,member_address) values(?,?)";
		
			for(int i = 0; i<mAddr2.length; i++){//mAddr2가 복수일경우 모두 입력하기위해 반복문으로 배열의 길이만큼 실행
				stmt2= conn.prepareStatement(sql2);
				stmt2.setInt(1,key);
				stmt2.setString(2,mAddr2[i]);
				stmt2.executeUpdate();
			}
		}	
		conn.commit();
		response.sendRedirect(request.getContextPath()+"/admin/member/memberListAll01.jsp");
	}
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