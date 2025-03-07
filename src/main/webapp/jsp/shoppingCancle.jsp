<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 취소</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
		
	<%
		String cartId = request.getParameter("cartId");
		out.print(cartId);
	%>
	<div class="container py-4">
		<%@include file="header.jsp" %>
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">주문 취소</h1>
				<p class="col-md-8 fs-4">Order Cancellation</p>
			</div>
		</div>
		
		<div class="row align-items-md-stretch">
			<h2 class="alert alert-danger">주문이 취소 되었습니다.</h2>			
			<p><a href="listMain.jsp" class="btn btn-outline-info">&laquo; 상품 목록</a></p>
		</div>
		
		
		<%@include file="footer.jsp" %>
	</div>
		
</body>
</html>