<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<%
				
			String cartId ="";
			String shopping_date ="";
				Cookie[] cookies = request.getCookies();
				if(cookies!=null){
					for(Cookie cookie : cookies){
						String cookieName = cookie.getName();
						
						if(cookieName.equals("id"))
							cartId = URLDecoder.decode(cookie.getValue(), "UTF-8");
						if(cookieName.equals("shoppingDate"))
							shopping_date = URLDecoder.decode(cookie.getValue(), "UTF-8");
					}
				}
			%>
			
			<div class="container py-4">
			<%@include file="header.jsp" %>
			<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">주문 완료</h1>
				<p class="col-md-8 fs-4">Order Completed</p>
			</div>
		</div>
			
				
			<div class="row align-items-md-stretch">
				<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
				<p>주문 번호 : <%=cartId%></p>
				<p>배송 예정일 : <%=shopping_date%></p>
			</div>
			
			<div class="container" >
				<p><a href="listMain.jsp" class="btn btn-outline-info">&laquo;상품 목록</a>
			</div>

			<%@include file="footer.jsp" %>
			</div>
			<%
			session.invalidate();
			
			for(int i=0; i<cookies.length; i++){
					Cookie cookie = cookies[i];
						String cookieName =cookie.getName();
				if(cookieName.equals("id"))
					cookie.setMaxAge(0);
				if(cookieName.equals("name"))
					cookie.setMaxAge(0);
				if(cookieName.equals("shoppingDate"))
					cookie.setMaxAge(0);
				if(cookieName.equals("country"))
					cookie.setMaxAge(0);
				if(cookieName.equals("address"))
					cookie.setMaxAge(0);
				if(cookieName.equals("zipCode"))
					cookie.setMaxAge(0);
			}
		
		%>
</body>
</html>