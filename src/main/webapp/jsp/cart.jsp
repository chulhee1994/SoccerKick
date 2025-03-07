<%@page import="java.util.ArrayList"%>
<%@page import="Soccer.SoccerVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport">
    <title>장바구니 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
  <%
  	String cartId = session.getId();
  %>
	
	<%@include file="connection/connection.jsp" %>
	<div class="container py-4">
	<%@include file="header.jsp"%>
	
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">장바구니</h1>
				<p class="col-md-8 fs-4">Cart</p>
			</div>
		</div>
		
		<div class="row align-items-md-stretch">
			<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><button type="button" class="btn btn-outline-info" onclick="location.href='deleteCartController.jsp?cartId=<%=cartId%>'">전체 삭제</button></td>
					<td align="right"><button type="button" class="btn btn-outline-info" onclick="location.href='shoppingInfo.jsp?cartId=<%=cartId%>'">구매하기</button></td>
				</tr>
			</table>
			</div>
				
	<table width="100%" class="table table-hover">
    <tr>
      <th class="text-center">상품 이름</th>
      <th class="text-center">가격</th>
      <th class="text-center">배급사</th>
      <th class="text-center">수량</th>
      <th class="text-center">총액</th>
      <th class="text-center">비고</th>
    </tr>
	<%
	List<SoccerVo> cartList=(List<SoccerVo>)session.getAttribute("cartList");
	int total = 0;
	
	if(cartList==null){
		cartList = new ArrayList<SoccerVo>();
	}
	
	for(int i =0; i<cartList.size(); i++){
		SoccerVo vo = cartList.get(i);
		int productPrice = vo.getPrice() *vo.getQuantity();
		total +=productPrice;
	%>
    <tr>
      <td class="text-center"><%=vo.getName()%></td>
      <td class="text-center"><%=vo.getPrice()%>원</td>
      <td class="text-center"><%=vo.getPublisher()%></td>
      <td class="text-center"><%=vo.getQuantity()%></td>
      <td class="text-center"><%=productPrice%></td>
      <td class="text-center"> <a href="removeCartController.jsp?num=<%=vo.getNum()%>" class="btn btn-outline-info btn-sm">삭제</a></td>
    </tr>
	<% 
	}
	%>
	<tr>
	<th colspan="4" class="text-center">총액</th>
	<th colspan="2" class="text-center"><%=total%>원</th>
	</tr>
</table>
<a href="listMain.jsp" class="btn btn-outline-info">&laquo; 쇼핑계속하기</a>

	</div>
	<%@include file="footer.jsp" %>	
</div>
  </body>
</html>