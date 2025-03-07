<%@page import="Soccer.SoccerVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>배송 정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
  	<%
  		List<SoccerVo> cartList = (List<SoccerVo>)session.getAttribute("cartList");
  		String cartId = session.getId();
  		if(cartList==null ||cartList.isEmpty()){
  			response.sendRedirect("listMain.jsp");
  			out.println("<script>");
  			out.println("alert('구매할 상품이 없습니다.');");
  			out.println("</script>");
  		}else{
  		
  			
  	%>
  		<div class="container py-4">
		<%@include file="header.jsp" %>
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">배송 정보</h1>
				<p class="col-md-8 fs-4">Shopping Info</p>
			</div>
		</div>
		
		<div class="row align-items-md-stretch">
		<form name="registerForm" class="formBlock" action="shoppingInfoController.jsp" enctype="UTF-8" method="post">
			<input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>">
		
			<div class="mb-3 row">
				<label class="col-sm-2" for="name" name="name">성명</label>
				<div class="col-sm-3">
					<input type="text" id="name" placeholder="성명" name="name" autocomplete="on" class="form-control"/>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2" for="shoppingDate" name="date">배송일</label>
				<div class="col-sm-3">
					<input type="text" id="shoppingDate" placeholder="yyyy/mm/dd 형식으로 입력" name="shoppingDate" autocomplete="on" class="form-control"/>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2" for="country" name="date">국가명</label>
				<div class="col-sm-3">
					<input type="text" id="country" placeholder="국가를 입력해주세요." name="country" autocomplete="on" class="form-control"/>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2" for="address" name="date">주소</label>
				<div class="col-sm-3">
					<input type="text" id="address" placeholder="주소를 입력해주세요." name="address" autocomplete="on" class="form-control"/>
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2" for="zipCode" name="zipCode">우편번호</label>
				<div class="col-sm-3">
					<input type="text" id="zipCode" placeholder="우편번호를 입력해주세요." name="zipCode" autocomplete="on" class="form-control"/>
				</div>
			</div>
			
			<div class="mb-3 row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="button" name="Product_registration_button" class="btn btn-outline-info" onclick="location.href='cart.jsp?cartId=<%=cartId%>'" value="이전" />
				<input type="submit" name="Product_registration_button" class="btn btn-outline-info" value="주문 등록" />
				<input type="button" name="Product_registration_button" class="btn btn-outline-info" onclick="location.href='shoppingCancle.jsp'" value="주문 취소" />
			</div>
			</div>

		</form>
		
		</div>
			
			
	
			<div class="btnBlock">
			</div>
		
		<%@include file="footer.jsp" %>
  		</div>
  		
  		
  		
  	<% 
  		}
  	%>
  </body>
</html>