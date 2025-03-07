<%@page import="java.util.ArrayList"%>
<%@page import="Soccer.SoccerVo"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<%
		Cookie[] cookies =  request.getCookies();
		
		String cartId =session.getId();
		out.println(cartId);
		
		String shopping_cartId ="";
		String shopping_name="";
		String shopping_date="";
		String shopping_country="";
		String shopping_zipcode="";
		String shopping_address="";
		if(cookies!=null){
		for(int i =0; i<cookies.length; i++){
			Cookie cookie = cookies[i];
			String cookieName = cookie.getName();
			
			if(cookieName.equals("id"))
				shopping_cartId = URLDecoder.decode((cookie.getValue()), "UTF-8");
			
			if(cookieName.equals("name"))
				shopping_name = URLDecoder.decode((cookie.getValue()), "UTF-8");
			
			if(cookieName.equals("shoppingDate"))
				shopping_date = URLDecoder.decode((cookie.getValue()), "UTF-8");
			
			if(cookieName.equals("country"))
				shopping_country = URLDecoder.decode((cookie.getValue()), "UTF-8");
			
			if(cookieName.equals("address"))
				shopping_address = URLDecoder.decode((cookie.getValue()), "UTF-8");
			
			if(cookieName.equals("zipCode"))
				shopping_zipcode = URLDecoder.decode((cookie.getValue()), "UTF-8");
		}
	}
		
	%>
	<div class="container py-4">
		<%@include file="header.jsp" %>
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">주문 정보</h1>
				<p class="col-md-8 fs-4">Order Info</p>
			</div>
		</div>
		
		<div class="row align-items-md-stretch alert alert-info">
			<div class="text-center">
				<h1>영수증</h1>			
			</div>
			
			<div class="row justify-content-between">
				<div class="col-4" align="left">
					<strong>배송 주소</strong>
					<p>성명 : <%out.println(shopping_name);%></p>
					<p>우편번호 : <%out.println(shopping_zipcode);%></p>
					<p>주소 : <%out.println(shopping_address);%></p>			
				</div>
				
				<div class="col-4" align="right">
					<p>배송일 : <%out.println(shopping_date);%></p>			
				</div>
			</div>	
			
			<div class="py-5">
				<table class="table table-hover">
					<tr>
						<th class="text-center">상품</th>
						<th class="text-center">수량</th>
						<th class="text-center">가격</th>
						<th class="text-center">합계</th>
					</tr>
					<%
					int sum=0;
					List<SoccerVo> cartList = (List<SoccerVo>)session.getAttribute("cartList");
					
					if(cartList == null){
						cartList = new ArrayList<SoccerVo>();
					}
					
					for(int i =0; i<cartList.size(); i++){
						SoccerVo vo = cartList.get(i);
						
						int total = vo.getQuantity() * vo.getPrice();
						sum += total;
						
					%>
					<tr>
						<td class="text-center"><em><%=vo.getName() %></em></td>
						<td class="text-center"><%=vo.getQuantity() %></td>
						<td class="text-center"><%=vo.getPrice() %></td>
						<td class="text-center"><%=total %></td>
					</tr>
					
					<%	
					}
					%>
					<tr>
					<td class="text-center" colspan="2">총액</td>
					<td class="text-center" colspan="2"><%=sum%></td>
					</tr>
				</table>
				<a href="shoppingInfo.jsp" class="btn btn-outline-info">이전</a>
				<a href="orderComplete.jsp" class="btn btn-outline-info">주문 완료</a>
				<a href="shoppingCancle.jsp" class="btn btn-outline-info">취소</a>
			</div>
				
		</div>
		<%@include file="footer.jsp" %>
	</div>
</body>
</html>