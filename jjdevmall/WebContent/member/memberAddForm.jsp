<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<script>
	$(document).ready(function(){
		$('#insertBtn').click(function(){
			if($('#m_id').val()==''){
				$('#m_idHelper').text('아이디를 입력하세요');
			}else if($('#m_pw').val()==''){
				$('#m_pwHelper').text('비밀번호를 입력하세요');
				$('#m_idHelper').text('');
			}else if($('#m_pw').val()!=$('#m_pw2').val()){
				$('#m_pwHelper').text('');
				$('#m_pwHelper').text('비밀번호를 동일하게 입력하세요');	
			}else if($('#m_name').val()==''){
				$('#m_nameHelper').text('이름을 입력하세요');
				$('#m_pwHelper').text('');
			}else if($('#m_age').val()==''||isNaN($('#m_age').val())){
				$('#m_ageHelper').text('나이를 숫자로 입력하세요');
				$('#m_nameHelper').text('');
			}else if($('.m_sex:checked').length==0){
				$('#m_sexHelper').text('성별을 입력하세요');
				$('#m_ageHelper').text('');
			}else if($('#m_addr').val()==''){
				$('#m_addrHelper').text('주소를 입력하세요');
				$('#m_sexHelper').text('');
			}else{
				$('#insertForm').submit();
			}
		});
	});
</script>
</head>
<body> 
<form id = "insertForm" action ="./memberAddAction.jsp">
<h1> 회원가입 </h1>
<div>
	<label>아이디 : </label>
	<input type = "text" name = "m_id" id = "m_id">
	<span id = "m_idHelper"></span><hr><br><br>
	<label>비밀번호 : </label>	
	<input type = "text" name = "m_pw"id = "m_pw" ><br/>
	<label>비밀번호 확인 : </label>
	<input type = "text" name = "m_pw2"id = "m_pw2" >
	<span id = "m_pwHelper"></span><hr><br><br>
	<label>이름 : </label>
	<input type = "text" name = "m_name"id = "m_name" >
	<span id = "m_nameHelper"></span><hr><br><br>
	<label>나이 : </label>
	<input type = "text" name = "m_age" id = "m_age">
	<span id = "m_ageHelper"></span><hr><br><br>
	<label>성별 : </label>
	<input type = "radio" name = "m_sex" class = "m_sex" value = "남">남
	<input type = "radio" name = "m_sex" class = "m_sex" value = "여">여
	<span id = "m_sexHelper"></span><hr><br><br>
	<label>주소 : </label>
	<input type = "text" name = "m_addr" id = "m_addr">
	<span id = "m_addrHelper"></span><hr><br><br>
	<input type = "button" value = "insert" id= "insertBtn">
</div>	
</form>	
</body>
</html>