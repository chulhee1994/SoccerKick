<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료 창</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>	
		<%@include file="/jsp/connection/connection.jsp"%>
	<div class="container py-4">
		<%@include file="/jsp/header.jsp" %>
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">회원 가입 완료</h1>
				<p class="col-md-8 fs-4">SignUp Complete</p>
			</div>
		</div>
		
		<div class="row align-items-md-stretch alert alert-info">
			<div class="text-center">
				<h1>회원 정보</h1>			
			</div>

			<div class="row justify-content-between">
				<div class="col-12" align="center">
	<%
		ArrayList<String> userList= (ArrayList<String>)request.getAttribute("user");
					for(String str : userList){
	%>
					<p><%=str%></p>
	<%
					}
	%>
				</div>
			</div>	
			
				
		</div>
		<%@include file="/jsp/footer.jsp" %>
	</div>
		

</body>
</html>