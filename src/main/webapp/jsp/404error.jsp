<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>404 errorPage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
	<div class="container py-4">
	<%@ include file="header.jsp" %>
	
	<div class="p-5 mb-4 bg-body-teitiary rounded-3">
		<div class="alert alert-danger">
		
		<h1 class="alert alert-danger">요청하신 페이지를 찾을수 없습니다.</h1>
		</div>
	</div>
	
	<div class="row-align-items-md-stretch">
        <p><a class="btn-6" href="listMain.jsp">메인 페이지로 이동</a></p>
		<div class="col-md-12">
			<div class="h-100 p-5">
				<p><%=request.getRequestURL()%></p>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
	</div>  
  </body>
</html>