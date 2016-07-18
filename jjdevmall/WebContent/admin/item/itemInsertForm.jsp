<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<script>
	$(document).ready(function(){
		$('#insertBtn').click(function(){
			if($('#i_name').val()==''){
				$('#i_nameHelper').text('상품명을 입력하세요');
			}else if($('#i_price').val()==''){
				$('#i_priceHelper').text('가격을 입력하세요');
				$('#i_nameHelper').text('');
			}else if($('#i_rate').val()==''){
				$('#i_priceHelper').text('');
				$('#i_rateHelper').text('할인율을 입력하세요');
			}else if($('#i_rate').val()>=1){
				$('#i_rateHelper').text('');
				$('#i_rateHelper').text('1보다 큰수는 입력할수 없습니다.');	
			}else{
				$('#insertForm').submit();
			}
		});
	});
</script>
</head>
<body> 
<form id = "insertForm" action ="./itemInsertAction.jsp">
<h1> 회원가입 </h1>
<div>
	<label>상품명 : </label>
	<input type = "text" name = "i_name" id = "i_name">
	<span id = "i_nameHelper"></span><hr><br><br>
	<label>상품가격 : </label>	
	<input type = "text" name = "i_price"id = "i_price" >
	<span id = "i_priceHelper"></span><hr><br><br>
	<label>할인율: </label>
	<input type = "text" name = "i_rate"id = "i_rate" >
	<span id = "i_rateHelper"></span><hr><br><br>
	
	<input type = "button" value = "insert" id= "insertBtn">
</div>	
</form>	
</body>
</html>