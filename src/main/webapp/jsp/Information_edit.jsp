<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 편집</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<%@include file="connection/connection.jsp" %>
	<div class="container py-4">
	<%@include file="header.jsp"%>
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">상품 편집</h1>
				<p class="col-md-8 fs-4">Product Editing</p>
			</div>
		</div>
		
		<div class="row align-tiems-md-stretch text-center">
		

	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int productNum = Integer.parseInt(request.getParameter("num"));
		String sql = "SELECT * FROM SOCCER WHERE NUM =?";
		
		pstmt = conn.prepareStatement(sql);
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
		while(rs.next()){
		
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
	
		<div class="col-md-4">
			<div class="h-100 p-2 round-3">
<%-- 				<img src="C:\\Temp\\img\\<%=img%>" style="width: 250; height: 350"/> --%>
				<img src="../img/<%=img%>" style="width: 250; height: 350"/>
				<p><h5><b><%=name%></b></h5>
				<p><%=publisher%> | <%=price%>원
				<p><a href="updateProduct.jsp?num=<%=num%>" class="btn btn-success" role="button">수정 &raquo;</a>
			</div>
		</div>
	<%
		}
		
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	%>
	</div>
	<%@include file="footer.jsp" %>
	</div>
</body>
</html>