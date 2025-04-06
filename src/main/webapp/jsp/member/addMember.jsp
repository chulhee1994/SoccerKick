<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script type="text/javascript">

function idCheck(){
	//폼
	var form = document.registerForm;
	
	//폼 ID
	
	var id = form.id.value;
	alert(id);
	
	
}
</script>
</head>
<body>
	<%@include file="../connection/connection.jsp" %>
	
	<%
	//아이디 체크 결과
	String check =(String)request.getAttribute("idCheck");
	if(check !=null){
		out.println(check);
		request.removeAttribute("check");
	}
	
	//비밀번호 체크 결과
	
		
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String regist_day = simpleDateFormat.format(date);
		
		
	%>
	<fmt:setLocale value='<%=request.getParameter("language")%>'/>
			<!-- 번들 위치 지정 -->
	<fmt:setBundle basename="Soccer.bundle.message" var="bundle"/>
	<div class="container py-4">
		<%@ include file="/jsp/header.jsp" %>
			<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">회원가입</h1>
				<p class="col-md-8 fs-4">SignUp</p>
			</div>
		</div>
		
		<div class="row align-items-md-stretch">
		<form name="registerForm" action="${contextPath}/member/addMemberController.jsp" enctype="UTF-8" method="post">
		
			<div class="mb-3 row">
				<label class="col-sm-2">아이디</label>
					<div class="col-sm-3">
						<input type="text" id="id" name="id" class="form-control">
					</div>
					<div class="col-sm-3">
						<a  class="btn btn-outline-info" onclick="idCheck()">중복확인</a>
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-3">
						<input type="password" id="pwd1" name="pwd1" class="form-control">
					</div>
			</div>
		
			<div class="mb-3 row">
				<label class="col-sm-2">비밀번호 확인</label>
					<div class="col-sm-3">
						<input type="password" id="pwd2" name="pwd2" class="form-control">
					</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">이름</label>
					<div class="col-sm-3">
						<input type="text" id="name" name="name" class="form-control">
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">성별</label>
					<div class="col-sm-3">
						<label for="male">남자</label>
						<input type="radio" id="male" name="gender" value="남자" checked> 
						<label for="female">여자</label>
						<input type="radio" id="female" name="gender" value="여지">
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">생일</label>
					<div class="col-sm-3">
						<input type="date" id="birth" name="birth" class="form-control">
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">이메일</label>
					<div class="col-sm-3">
						<input type="email" id="mail" name="mail" class="form-control">
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">전화/핸드폰 번호</label>
					<div class="col-sm-3">
<!-- 						 <input type="text" id="phone1" name="phone1" class="form-control">-<input type="text" id="phone2" name="phone2" class="form-control">-<input type="text" id="phone3" name="phone3" class="form-control"> -->
						 <input type="tel" id="phone" name="phone" class="form-control">						 
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">주소</label>
					<div class="col-sm-3">
						<input type="text" id="address" name="address" class="form-control">
					</div>
			</div>
			<input type="hidden" name="regist_day" id="regist_day" value="<%=regist_day%>">
		 <button class="btn btn-lg btn-success" type="submit" >회원가입</button>
		</form>
		
		
	
	</div>	
	<%@ include file="/jsp/footer.jsp" %>
</div>
	
</body>
</html>