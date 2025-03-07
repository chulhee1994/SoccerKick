<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.swing.text.DateFormatter"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>사커킥 메인 홈페이지</title>
</head>
<body>
	<div class="container py-4">
    <%@ include file="header.jsp" %>
	<section>
	
	<div id="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">SoccerKick HomePage</h1>
			<p class="col-md-8 fs-4">SoccerProduct Market</p>
		</div>
	<div class="row align-items5-md-stretch text-center">
	 	<div class="col-md-12">
	 		<div class="h-100 p-5">
	<%
	Date d = new Date();
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");
	String date = simpleDateFormat.format(d);
	out.println("현재 접속 시간 :  " +date + "\n");
	%>
	
        <p><a class="btn btn-outline-info" href="listMain.jsp" style="margin-top: 5%;">상품 페이지로 이동	&raquo;</a></p>
	 		</div>
	 	</div>
	</div>
	<div class="col-sm-2 justify-content-center">
	</div>
	
	</div>
	
	</section>
	<%@include file="footer.jsp" %>
	</div>
</body>
</html>
