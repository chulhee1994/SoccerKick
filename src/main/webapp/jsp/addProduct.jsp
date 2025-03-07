<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
   <meta name="viewport">
    <title>상품 등록</title>
 	<script src="../js/validation.js"></script>
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
  <%@ include file="connection/connection.jsp" %>
<!-- DB없을떄 사용 -->
<%--   <jsp:useBean id="dao" class="Soccer.SoccerRepository" scope="session"/> --%>
<%-- 		<%
 	 	int num = dao.getInstance().getNum();
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
		%> --%>
<!-- DB없을떄 사용 -->
<!-- DB 사용 -->
<%	
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	String sql = "SELECT COUNT(*) AS NUM FROM SOCCER";
	pstmt= conn.prepareStatement(sql);
	
  	rs = pstmt.executeQuery();
	rs.next();
  	
	int number = rs.getInt("num")+1;
%>

<!-- DB 사용 -->
			<!-- 로케일 설정 -->
			<fmt:setLocale value='<%=request.getParameter("language")%>'/>
			<!-- 번들 위치 지정 -->
			<fmt:setBundle basename="Soccer.bundle.message" var="bundle"/>
			
		<div class="container py-4">
			<%@include file="header.jsp" %>
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold"><fmt:message key="productadd" bundle="${bundle}"/></h1>
				<p class="col-md-8 fs-4">Product Add</p>
			</div>
		</div>
			<!-- 다국어 설정 -->
			<span class="p-5 mt-5"  style="margin-bottom: 5%;">
						<a href="?language=ko" class="btn btn-outline-info">Korean</a>
						<a href="?language=en" class="btn btn-outline-info">English</a>
			</span>
			
			<div class="row align-items-md-stretch">
				<form name="registerForm" action="addProductController.jsp" enctype="multipart/form-data" method="post">
					<!-- 상품번호 -->
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="num" bundle="${bundle}"/></label>
						<div class="col-sm-3">
							<input type="text" name="num" id="num" class="form-control" value="<%=number%>"  readonly="readonly">						
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="name" bundle="${bundle}"/></label>
						<div class="col-sm-3">
							<input type="text" name="name" id="name" class="form-control">						
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="price" bundle="${bundle}"/></label>
						<div class="col-sm-3">
							<input type="number" name="price" id="price" class="form-control" min="0">						
						</div>
					</div>
					<!--배급사 -->
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="publisher" bundle="${bundle}"/></label>
						<div class="col-sm-3">
							<input type="text" id="publisher" name="publisher" class="form-control">
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="condition" bundle="${bundle}"/></label>
						<div class="col-sm-3">
						
						<select class="form-select" aria-label="Default select example" name="condition">
  							<option value="신품"><fmt:message key="product1" bundle="${bundle}"/></option>
  							<option value="중고"><fmt:message key="product2" bundle="${bundle}"/></option>
  						</select>
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="inventory" bundle="${bundle}"/></label>
						<div class="col-sm-3">
							<input type="number" id="inventory" name="inventory" class="form-control" min="0"  >
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="category" bundle="${bundle}"/></label>
						<div class="col-sm-3">
							<input type="text" id="category" name="category" class="form-control">
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="img" bundle="${bundle}"/></label>
						<div class="col-sm-5">
							<input type="file" id="img" name="img" class="form-control" >
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="information" bundle="${bundle}"/></label>
						<div class="col-sm-8">
							<textarea rows="3" cols="50" name="information" id="information" class="form-control" placeholder="10자 이상 입력해주세요." style="resize: none"></textarea>
						</div>
					</div>
					
					<div class="mb-row">
						<div class="col-sm-offset-2 col-sm-10">
								 <button class="btn btn-outline-info" type="button" onclick="location.href='listMain.jsp'">이전</button>
							<input type="button" class="btn btn-outline-info" value=<fmt:message key="productadd" bundle="${bundle}"/> onclick="checkProduct()">
						</div>
					</div>
				</form>
			
			</div>
	<%	
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