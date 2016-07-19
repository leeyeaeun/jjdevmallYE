<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<script>
$(document).ready(function(){
	$('#ordersQuantity').blur(function(){
		if($('#ordersQuantity').val()!=null){
			$('#totalPrice').text($('#ordersQuantity').val()*$('#ratedPrice').val());
			console.log($('#ordersQuantity').val()+'수량');
			console.log($('#ratedPrice').val()+'할인가');	
		}		
	});
	$('#orderBtn').click(function(){
		$('#orderForm').submit();
	});
});
</script>
</head>
<body>
<%
String memberId = (String)session.getAttribute("memberId");//세션로그인 안되있으면 로그인시키려고 확인함 int itemNo = Integer.parseInt(request.getParameter("itemNo"));
int itemNo = Integer.parseInt(request.getParameter("itemNo"));
int itemPrice = Integer.parseInt(request.getParameter("itemPrice"));
Double itemRate = Double.parseDouble(request.getParameter("itemRate"));


if(memberId==null){
	//response.sendRedirect(request.getContextPath()+"/index.jsp");
}else{
	//주문폼
	//jdbc코드 item select Query // 할인률같은거 가져옴
	//int itemRate = ?   where item_no = ?
%>
	<form id = "orderForm" action = "<%=request.getContextPath()%>/orders/orderAddAction.jsp" >
		<div>
		itemNo :
		<input type = "text" name = "itemNo" value = "<%=itemNo %>" readonly/>
		</div>
		<div>
		원래가격 :<span><%=itemPrice %></span></br/>
		할인된가격:	<input type = "text" name = "ratedPrice" id = "ratedPrice" value = "<%=itemPrice*(1-itemRate)%>">
		</div>	
		<div>
		 ordersQuantity : 
		<input type = "text" name = "ordersQuantity" id = "ordersQuantity"/>
		</div>
		<div>
		total : <span id = "totalPrice" name ="totalPrice" readonly> <!-- 할인된가격 * 수량을 jquery로 넣기 --></span>원
		</div>
		<div>
		<input type = "button" value = "주문하기"  id = "orderBtn"/>
		</div>

	</form>
<%
}
%>
</body>
</html>