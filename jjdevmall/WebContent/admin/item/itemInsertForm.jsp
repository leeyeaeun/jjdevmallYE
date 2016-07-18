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
			if($('#insertName').val()==''){
				$('#insertNameHelper').text('상품명을 입력하세요');
			}else if($('#insertprice').val()==''){
				$('#insertPriceHelper').text('가격을 입력하세요');
				$('#insertNameHelper').text('');
			}else if($('#insertRate').val()==''){
				$('#insertPriceHelper').text('');
				$('#insertRateHelper').text('할인율을 입력하세요');
			}else if($('#insertRate').val()>=1){
				$('#insertRateHelper').text('');
				$('#insertRateHelper').text('1보다 큰수는 입력할수 없습니다.');	
			}else{
				$('#insertForm').submit();
			}
		});
	});
</script>
</head>
<body> 
<form id = "insertForm" action ="<%=request.getContextPath()%>/admin/item/itemInsertAction.jsp">
<h1> 회원가입 </h1>
	<div>
		<label>상품명 : </label>
		<input type = "text" name = "insertName" id = "insertName">
		<span id = "insertNameHelper"></span>
	</div>
	<div>	
		<label>상품가격 : </label>	
		<input type = "text" name = "insertPrice"id = "insertPrice" >
		<span id = "insertPriceHelper"></span>
	</div>
	<div>	
		<label>할인율: </label>
		<input type = "text" name = "insertRate"id = "insertRate" >
		<span id = "insertRateHelper"></span>
	</div>	
		<input type = "button" value = "insert" id= "insertBtn">

</form>	
</body>
</html>