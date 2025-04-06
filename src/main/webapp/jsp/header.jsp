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
	background-color: rgba(130,200,160,1);
	color:white;
}
/* 네비게이션 바 기본 스타일 */
.nav-pills {
    background-color: #f8f9fa;  /* 연한 회색 배경 */
    border-radius: 30px;         /* 둥근 테두리 */
    padding: 5px 15px;           /* 패딩 추가 */
}

/* 네비게이션 아이템 */
.nav-item {
    margin-right: 10px;  /* 아이템 간 간격 */
}

/* 각 항목에 대한 스타일 */
.nav-link {
    color: #495057;          /* 기본 텍스트 색상 (어두운 회색) */
    font-weight: 600;         /* 글씨 두껍게 */
    padding: 10px 20px;      /* 아이템 안쪽 여백 */
    border-radius: 20px;     /* 둥근 모서리 */
    transition: all 0.3s ease; /* 부드러운 트랜지션 효과 */
}

//* 네비게이션 바 기본 스타일 */
.nav-pills {
    background-color: #f8f9fa;  /* 연한 회색 배경 */
    border-radius: 30px;         /* 둥근 테두리 */
    padding: 5px 15px;           /* 패딩 추가 */
}

/* 네비게이션 아이템 */
.nav-item {
    margin-right: 10px;  /* 아이템 간 간격 */
}

/* 각 항목에 대한 스타일 */
.nav-link {
    color: #495057;          /* 기본 텍스트 색상 (어두운 회색) */
    font-weight: 600;         /* 글씨 두껍게 */
    padding: 10px 20px;      /* 아이템 안쪽 여백 */
    border-radius: 20px;     /* 둥근 모서리 */
    transition: all 0.3s ease; /* 부드러운 트랜지션 효과 */
}

.nav-link:hover {
    background-color: rgba(130, 200, 160, 0.7);  /* 배경색 변경 */
    color: white;                             /* 텍스트 색상 변경 */
    transform: scale(1.05);                    /* 약간 확대 */
}

/* 로그인/회원가입 링크의 경우 강조 */
.nav-item a[href*="login"], .nav-item a[href*="signUp"] {
    font-style: italic;  /* 이탤릭체 */
    color: #007bff;      /* 파란색 */
}

.nav-item a[href*="login"]:hover, .nav-item a[href*="signUp"]:hover {
    color: #ffffff;      /* 호버 시 텍스트 색상을 흰색으로 */
    background-color: #007bff;  /* 배경색을 파란색으로 변경 */
}

/* 관리자 링크 강조 */
.nav-item a[href*="addProduct"], .nav-item a[href*="listMain_edit"] {
    font-style: italic;  /* 이탤릭체 */
    color: #ff6600;      /* 주황색 */
}

.nav-item a[href*="addProduct"]:hover, .nav-item a[href*="listMain_edit"]:hover {
    color: #ffffff;      /* 호버 시 텍스트 색상을 흰색으로 */
    background-color: #ff6600;  /* 배경색을 주황색으로 변경 */
}

/* 로그아웃 링크 스타일 */
.nav-item a[href*="logout"] {
    font-weight: 700;    /* 글씨 굵게 */
    color: #e74c3c;      /* 빨간색 */
}

.nav-item a[href*="logout"]:hover {
    background-color: #e74c3c;  /* 배경을 빨간색으로 */
    color: white;              /* 텍스트를 흰색으로 */
}

</style>
<script type="text/javascript">

function updateTime() {
    var now = new Date();
    var hour = now.getHours();
    var minute = now.getMinutes();
    var second = now.getSeconds();
    var am_pm = hour < 12 ? "AM" : "PM";

    if (hour > 12) {
        hour = hour - 12;
    }


    hour = (hour < 10 ? "0" : "") + hour;
    minute = (minute < 10 ? "0" : "") + minute;
    second = (second < 10 ? "0" : "") + second;


    var currentTime = hour + ":" + minute + ":" + second + " " + am_pm;


    document.getElementById("current-time").textContent = "현재 접속 시각: " + currentTime;
}


window.onload = function() {
    updateTime(); 
    setInterval(updateTime, 1000);  
}

</script>
</head>
		<c:set var="sessionId" value="${sessionScope.sessionId}"/>
		<header class="pb-3 mb-4 border-bottom">
		<div class="container">
		<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
		<a href="<c:url value="/jsp/welcome.jsp"/>" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
		<img src="${contextPath}/img/logo.svg" class="bi bi-house-fill" viewBox="0 0 16 16" width="32" height="32">
		<span class="fs-4">🅂🄾🄲🄲🄴🅁🄺🄸🄲🄺</span>
		</a>
		<ul class="nav nav-pills">
		<c:choose>
			<c:when test="${empty sessionId}">
			<li class="nav-item"><a href="<c:url value="/jsp/member/loginMember.jsp" />" class="nav-link">로그인</a></li>
			<li class="nav-item"><a href="<c:url value="/jsp/member/signUpMember.jsp"/>" class="nav-link">회원 가입</a></li>
			</c:when>
			
			<c:when test="${sessionId == 'admin' or 'ADMIN'}">
			<li class="nav-item"><a href="<c:url value="/jsp/listMain.jsp"/>" class="nav-link">상품 목록</a></li>
			<li class="nav-item"><a href="<c:url value="/jsp/addProduct.jsp"/>" class="nav-link">상품 등록</a></li>
			<li class="nav-item"><a href="<c:url value="/jsp/listMain_edit.jsp?edit=edit"/>" class="nav-link">상품 수정</a></li>
			<li class="nav-item"><a href="<c:url value="/jsp/member/updateMember.jsp"/>" class="nav-link">마이페이지</a></li>
			<li class="nav-item"><a href="<c:url value="/jsp/member/logoutController.jsp"/>" class="nav-link">로그아웃</a></li>
			</c:when>
			
			<c:otherwise>
			<li class="nav-item"><a href="<c:url value="/jsp/listMain.jsp"/>" class="nav-link">상품 목록</a></li>
			<li class="nav-item"><a href="<c:url value="/jsp/cart.jsp"/>" class="nav-link">장바구니</a></li>
			<li class="nav-item"><a href="<c:url value="/jsp/member/updateMember.jsp"/>" class="nav-link">마이페이지</a></li>
			<li class="nav-item"><a href="<c:url value="/jsp/member/logoutController.jsp"/>" class="nav-link">로그아웃</a></li>
			</c:otherwise>
		</c:choose>
		</ul>
		</div>
		</div>
		</header>
</body>
</html>