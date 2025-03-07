<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<div class="container py-4">
	<%@include file="connection/connection.jsp" %>
	<%@include file="header.jsp" %>
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">상품 수정</h1>
				<p class="col-md-8 fs-4">Product Updating</p>
			</div>
		</div>	
		
		<%
			int num = Integer.parseInt(request.getParameter("num"));
			PreparedStatement pstmt =null;
			ResultSet rs = null;
			
			String sql ="SELECT * FROM SOCCER WHERE NUM = ?";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
		%>
			<div class="row align-items-md-stretch">
				<div class="col md-5">
					<img src="${contextPath}/img/<%=rs.getString("img")%>" alter="img" style="width: 70%"/>
				</div>
			<div class="col-md-6">
				<form name="newProduct" action="updateProductController.jsp" method="post" enctype="multipart/form-data">
					<div class="mb-3 row">
						<label class="col-sm-2">상품번호</label>
						<div class="col-sm-5">
							<input type="text" id="num" name="num" class="form-control" value="<%=rs.getInt("num")%>" readonly="readonly">
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2">상품 이름</label>
						<div class="col-sm-5">
							<input type="text" id="name" name="name" class="form-control" value="<%=rs.getString("name")%>" >
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2">가격</label>
						<div class="col-sm-5">
							<input type="text" id="price" name="price" class="form-control" value="<%=rs.getInt("price") %>" >
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2">배급사</label>
						<div class="col-sm-5">
							<input type="text" id="publisher" name="publisher" class="form-control" value="<%=rs.getString("publisher") %>" >
						</div>
					</div>
						
					<div class="mb-3 row">
						<label class="col-sm-2">상태</label>
						<div class="col-sm-5">
						<select class="form-select" aria-label="Default select example" name="condition">
  							<option value="신품">신품</option>
  							<option value="중고">중고</option>
  						</select>
						</div>
					</div>
					
					
					<div class="mb-3 row">
						<label class="col-sm-2">재고</label>
						<div class="col-sm-5">
							<input type="number" id="inventory" name="inventory" class="form-control" value="<%=rs.getInt("inventory") %>" min="0"  >
						</div>
					</div>
					
					
					<div class="mb-3 row">
						<label class="col-sm-2">분류</label>
						<div class="col-sm-5">
							<input type="text" id="category" name="category" class="form-control" value="<%=rs.getString("category") %>" >
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-8">
							<input type="file" id="img" name="img" class="form-control" >
						</div>
					</div>
					
					
					<div class="mb-3 row">
						<label class="col-sm-2">상품 정보</label>
						<div class="col-sm-8">
							<textarea rows="3" cols="50" id="information" id="information" class="form-control"style="resize: none"><%=rs.getString("information")%></textarea>
						</div>
					</div>
					
					<div class="mb-3 row">
						<div class="col-sm-offset-2 col-sm-10">
							 <button class="btn btn-outline-info" type="button" onclick="location.href='listMain_edit.jsp?edit=edit'">이전</button>
							<input type="submit" class="btn btn-outline-info" value="수정">
						</div>
					</div>
				</form>
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
	<%@include file="footer.jsp" %>	
	</div>
</body>
</html>