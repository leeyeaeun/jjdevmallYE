<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<script>
var html = '<div><input type = "text" class = "addrAdd" name = "addrAdd"></div>'
	$(document).ready(function(){
		$('#memberAdd').click(function(){
			var flag = false;
			$('.addrAdd').each(function(index,item){
				if($(this).val()==''){
				flag = true;
				}
			});
			if(flag){
				$('#addrListHelper').text('추가주소를 입력하세요!');
			}else{
				$('#addrList').append(html);
			}
		});	
		
		$('#insertBtn').click(function(){
			if($('#memberId').val()==''){
				$('#memberIdHelper').text('아이디를 입력하세요');
			}else if($('#memberPw').val()==''){
				$('#memberPwHelper').text('비밀번호를 입력하세요');
				$('#memberIdHelper').text('');
			}else if($('#memberPw').val()!=$('#memberPw2').val()){
				$('#memberPwHelper').text('');
				$('#memberpwHelper').text('비밀번호를 동일하게 입력하세요');	
			}else if($('#memberName').val()==''){
				$('#memberNameHelper').text('이름을 입력하세요');
				$('#memberPwHelper').text('');
			}else if($('#memberAge').val()==''||isNaN($('#memberAge').val())){
				$('#memberAgeHelper').text('나이를 숫자로 입력하세요');
				$('#membernameHelper').text('');
			}else if($('.memberSex:checked').length==0){
				$('#memberSexHelper').text('성별을 입력하세요');
				$('#memberAgeHelper').text('');
			}else if($('#memberAddr').val()==''){
				$('#memberAddrHelper').text('주소를 입력하세요');
				$('#memberSexHelper').text('');
			}else{
				$('#insertForm').submit();
			}
		});
	});
</script>
</head>
<body> 
<form id = "insertForm" action ="<%=request.getContextPath()%>/member/memberAddAction.jsp"> <!-- 절대주소가 좋음 -->
<h1> 회원가입 </h1>
	<div>
		<label for= "memberId">아이디 : </label>
		<input type = "text" name = "memberId" id = "memberId">  <!-- 이와같이 줄여서 변수를 선언하는것은 좋지않음 memberId와 같이 쓰는것이 좋음-->
		<span id = "memberIdHelper"></span>
	</div>
	<div>
		<label>비밀번호 : </label>	
		<input type = "password" name = "memberPw"id = "memberPw" ><br/>
		<label>비밀번호 확인 : </label>
		<input type = "password" name = "memberPw2"id = "memberPw2" >
		<span id = "memberPwHelper"></span>
	</div>
	<div>
		<label>이름 : </label>
		<input type = "text" name = "memberName"id = "memberName" >
		<span id = "memberNameHelper"></span>
	</div>
	<div>
		<label>나이 : </label>
		<input type = "text" name = "memberAge" id = "memberAge">
		<span id = "memberAgeHelper"></span>
	</div>
	<div>
		<label>성별 : </label>
		<input type = "radio" name = "memberSex" class = "memberSex" value = "남">남
		<input type = "radio" name = "memberSex" class = "memberSex" value = "여">여
		<span id = "memberSexHelper"></span>
	</div>
	<div>	
	<label>주소 : </label>
	<input type = "text"  class = "addrAdd" name = "addrAdd">
	<span id = "memberAddrHelper"></span>
		<div>
			<input type = "button" id = "memberAdd" value = "주소추가"/>
			<input type = "button" id = "memberDel" value = "주소삭제"/>
		</div>
		<div id ="addrList" >
		
		</div>
		<span id = "addrListHelper"></span>	
	</div>
	<input type = "button" value = "insert" id= "insertBtn">
	
	
</form>	
</body>
</html>