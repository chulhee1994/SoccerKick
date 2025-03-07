<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style type="text/css">
.nav-link{
	color :black;
}
.nav-link:hover {
	background-color: skyblue;
	color:white;
}
   #main:hover #img {
   fill : #959090cc;
  }
  #main:hover span{
  	color: red;
  }
   
</style>

</head>
		<c:set var="sessionId" value="${sessionScope.sessionId}"/>
		<header class="pb-3 mb-4 border-bottom">
		<div class="container">
		<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
		<a href="<c:url value="/jsp/welcome.jsp"/>" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none" id="main">
		<img src="${contextPath}/img/logo.svg" class="bi bi-house-fill" viewBox="0 0 16 16" width="32" height="32" id="img">
		<span class="fs-4">🅂🄾🄲🄲🄴🅁🄺🄸🄲🄺</span>
		</a>
		<ul class="nav nav-pills">
		<c:choose>
			<c:when test="${empty sessionId}">
			<li class="nav-item"><a href="<c:url value="/jsp/member/loginMember.jsp" />" class="nav-link">로그인</a></li>
			<li class="nav-item"><a href="<c:url value="/jsp/member/signUpMember.jsp"/>" class="nav-link">회원 가입</a></li>
			</c:when>
			
			<c:otherwise>
			<li class="nav-item"><a href="<c:url value="/jsp/listMain.jsp"/>" class="nav-link">상품 목록</a></li>
			<li class="nav-item"><a href="<c:url value="/jsp/addProduct.jsp"/>" class="nav-link">상품 등록</a></li>
			<li class="nav-item"><a href="<c:url value="/jsp/listMain_edit.jsp?edit=edit"/>" class="nav-link">상품 수정</a></li>
<%-- 			<li class="nav-item"><a href="<c:url value="/jsp/membersList.jsp"/>"d>회원 관리</a></li> --%>
			<li class="nav-item"><a href="<c:url value="/jsp/member/updateMember.jsp"/>" class="nav-link">정보 수정</a></li>
			<li class="nav-item"><a href="<c:url value="/jsp/member/logoutMemberController.jsp"/>" class="nav-link">로그아웃</a></li>
			</c:otherwise>
		</c:choose>
		</ul>
		</div>
		</div>
		</header>
</body>
</html>