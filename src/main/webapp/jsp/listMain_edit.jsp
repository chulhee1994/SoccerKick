<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>상품 리스트 수정</title>
<script type="text/javascript">

	function deleteConfirm(num) {
		if(confirm("해당 상품을 삭제하시겠습니까?")==true)
			location.href="deleteProductController.jsp?num="+num;
		else
			return;
	}
</script>
</head>
<body>
	<%@ include file="connection/connection.jsp" %>
	<%
		String edit = request.getParameter("edit");
		if(edit.equals("edit")){
	%>	
		<div class="container py-4">
		<%@ include file="header.jsp" %>
				<div class="p-5 mb-4 bg-body-tertiary rounded-3">
					<div class="container-fluid py-5">
						<h1 class="display-5 fw-bold">상품 수정</h1>
						<p class="col-md-8 fs-4">Product Editing</p>
			</div>
		</div>
		<div class="row align-tiems-md-stretch text-center">
		<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="SELECT * FROM SOCCER";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			
		String img =rs.getString("img");
	%>	
    <div class="col">
    <a href=""></a>
    <div class="card h-100 embed-responsive embed-responsive-5by4">
      <img src="${contextPath}/img/<%=img%>" class="card-img-top embed-responsive-item" alt="..."/>
     	<div class="card-body">
        <h5 class="card-title"><%=rs.getString("name") %></h5>
        <p class="card-text"><%=rs.getString("information")%></p>
        <p><%=rs.getInt("price")%>원</p>
      </div>
      <div class="card-footer hover">
  		<a href="updateProduct.jsp?num=<%=rs.getInt("num")%>" class="btn btn-outline-info" role="button">수정 &raquo;</a>
  		<a href="#" class="btn btn-outline-info" role="button" onclick="deleteConfirm('<%=rs.getInt("num")%>')">삭제 &raquo;</a>
      </div>
      </div>
    </div>
  <% 
	}
		
		if(rs!=null){
			rs.close();
		}
		if(pstmt!=null){
			pstmt.close();
		}
		if(conn!=null){
			conn.close();
		}
  %>
		</div>
		
	
		
		
		
		<%@include file="footer.jsp" %>		
		</div>
	<% 			
		}else{
		response.sendRedirect("listMain.jsp");			
		}
	%>
</body>
</html>