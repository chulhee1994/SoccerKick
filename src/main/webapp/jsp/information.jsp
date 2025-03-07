<%@page import="Soccer.SoccerVo"%>
<%@page import="Soccer.SoccerRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />   
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport">
    <title>상품정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script  src="../js/cart.js"></script>
 	<!-- DB없이 사용 -->	
<%--   	<jsp:useBean id="dao" class="Soccer.SoccerRepository" scope="session" />
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		SoccerRepository repository = dao.getInstance();
		SoccerVo vo = repository.getSoccerVo(num);
		String img =vo.getImg();
		%> --%>
 	<!-- DB없이 사용 -->	
  </head>
  <body>
  	<%@include file="connection/connection.jsp" %>
	<div class="container py-4">
	<%@include file="header.jsp"%>
	
	
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">상품 정보</h1>
				<p class="col-md-8 fs-4">Product Information</p>
			</div>
		</div>
		<%
			int productNum = Integer.parseInt(request.getParameter("num"));
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM SOCCER WHERE NUM=?";
			
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, productNum);
			rs = pstmt.executeQuery();
			int num;
			String name;
			int price;
			String publisher;
			String information;
			String condition;
			String category;
			int inventory;
			String img;
			
			if(rs.next()){
				num = rs.getInt("num");
				name = rs.getString("name");
				price = rs.getInt("price");
				publisher = rs.getString("publisher");
				information = rs.getString("information");
				condition = rs.getString("condition");
				category = rs.getString("category");
				inventory = rs.getInt("inventory");
				img = rs.getString("img");
		%>
		<div class="row align-items-md-stretch">
			<div class="col-md-5">
				<img src="${contextPath}/img/<%=img%>" style="width: 70%">
			</div>
		
			<div class="col-md-6">
				<h3><b><%=name%></b></h3>
				<p><%=information%></p>
				<p><b>상품 번호 : </b><span class="badge text-bg-danger"><%=num%></span></p>
				<p><b>가격 :</b><%=price%>원</p>
				<p><b>배급사:</b><%=publisher %></p>
				<p><b>상태 :</b><%=condition%></p>
				<p><b>분류 :</b><%=category%></p>
				<p><b>재고 :</b><%=inventory%></p>
				<p>
				<form name="cart_form" action="addCartController.jsp?num=<%=num%>" method="post">
					<a href="#" class="btn btn-outline-info" onclick="addCart()">상품 주문 &raquo</a>
				</form>
				</p>
				<a href="listMain.jsp" class="btn btn-outline-info">상품 목록 &raquo</a>
				<a href="cart.jsp" class="btn btn-outline-info">장바구니 이동&raquo</a>
			</div>
		
		</div>
		<%
			}
		%>	
		<%@include file="footer.jsp" %>	
		</div>
  </body>
</html>