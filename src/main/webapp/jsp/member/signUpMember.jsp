<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../505error.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<style type="text/css">
	 <!--버튼-->
  
  a[class*="btn"] {
  text-decoration: none;
}

.btn-gradient {
  text-decoration: none;
  color: white;
  padding: 10px 30px;
  display: inline-block;
  position: relative;
  border: 1px solid rgba(0,0,0,0.21);
  border-bottom: 4px solid rgba(0,0,0,0.21);
  border-radius: 4px;
  text-shadow: 0 1px 0 rgba(0,0,0,0.15);
}

.btn-gradient.large {
  padding: 15px 45px;
  font-size: 22px;
}
.btn.large, 
.btn-two.large, 
.btn-effect.large {
  padding: 20px 40px; 
  font-size: 22px;
}
.btn.small, 
.btn-two.small, 
.btn-gradient.small, 
.btn-effect.small {
  padding: 8px 18px;  
  font-size: 14px;
}
.btn.mini, 
.btn-two.mini, 
.btn-gradient.mini, 
.btn-effect.mini {
  padding: 4px 12px;  
  font-size: 12px;
}
.btn.block, 
.btn-two.block, 
.btn-gradient.block, 
.btn-effect.block {
  display: block;
  width: 60%;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
}
.btn-gradient.large {
  padding: 15px 45px; 
  font-size: 22px;
}


/* Gradient buttons */
.btn-gradient {
  text-decoration: none;
  color: white;
  padding: 10px 30px;
  display: inline-block;
  position: relative;
  border: 1px solid rgba(0,0,0,0.21);
  border-bottom: 4px solid rgba(0,0,0,0.21);
  border-radius: 4px;
  text-shadow: 0 1px 0 rgba(0,0,0,0.15);
}
/* Gradient - ugly css is ugly */
.btn-gradient.cyan {
  background: rgba(27,188,194,1);
  background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(27,188,194,1)), to(rgba(24,163,168,1)));
  background: -webkit-linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
  background: -moz-linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
  background: -o-linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
  background: linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#1bbcc2', endColorstr='#18a3a8', GradientType=0);
}

.btn-gradient.red{ 
  background: rgba(250,90,90,1);
  background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(250,90,90,1)), to(rgba(232,81,81,1)));
  background: -webkit-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  background: -moz-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  background: -o-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  background: linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fa5a5a', endColorstr='#e85151', GradientType=0 );
}
.btn-gradient.orange {
  background: rgba(255,105,30,1);
  background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(255,105,30,1)), to(rgba(230,95,28,1)));
  background: -webkit-linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
  background: -moz-linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
  background: -o-linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
  background: linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
}
.btn-gradient.blue {
  background: rgba(102,152,203,1);
  background: -moz-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
  background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(102,152,203,1)), color-stop(100%, rgba(92,138,184,1)));
  background: -webkit-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
  background: -o-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
  background: -ms-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
  background: linear-gradient(to bottom, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#6698cb', endColorstr='#5c8ab8', GradientType=0 );
}
.btn-gradient.purple { 
  background: rgba(203,153,197,1);
  background: -moz-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
  background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(203,153,197,1)), color-stop(100%, rgba(181,134,176,1)));
  background: -webkit-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
  background: -o-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
  background: -ms-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
  background: linear-gradient(to bottom, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cb99c5', endColorstr='#b586b0', GradientType=0 );
}
.btn-gradient.yellow {
  background: rgba(240,210,100,1);
  background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(240,210,100,1)), to(rgba(229,201,96,1)));
  background: -webkit-linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
  background: -moz-linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
  background: -o-linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
  background: linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f0d264', endColorstr='#e5c960', GradientType=0 );
}
.btn-gradient.green {
  background: rgba(130,200,160,1);
  background: -moz-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
  background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(130,200,160,1)), color-stop(100%, rgba(130,199,158,1)));
  background: -webkit-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
  background: -o-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
  background: -ms-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
  background: linear-gradient(to bottom, rgba(130,200,160,1) 0%, rgba(124, 185, 149, 1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#82c8a0', endColorstr='#82c79e', GradientType=0 );
}

.btn-gradient.red {
  background: rgba(250,90,90,1);
  background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(250,90,90,1)), to(rgba(232,81,81,1)));
  background: -webkit-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  background: -moz-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  background: -o-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  background: linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fa5a5a', endColorstr='#e85151', GradientType=0 );
}

.btn-gradient.red:active {
  background: #E35252;
}
<!--버튼-->
  


</style>
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
	if((String)request.getAttribute("Check")!=null)
		out.println((String)request.getAttribute("Check"));
	
	request.removeAttribute("Check");
	
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
		<form name="registerForm" action="signUpMemberController.jsp" enctype="UTF-8" method="post">
		
			<div class="mb-3 row">
				<label class="col-sm-2">아이디</label>
					<div class="col-sm-3">
						<input type="text" id="id" name="id" class="form-control">
					</div>
					<div class="col-sm-3">
					<!-- 	<button type="button" class="btn-gradient yellow mini" onclick="idCheck()">
						  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
							  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
							</svg>
							중복확인
						</button> -->
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
					<div class="col-sm-4 d-flex align-items-center">
						<input type="text" id="mail" name="mail" class="form-control mr-2" placeholder="아이디를 입력">
						<span style="margin: 5px;">@</span>
						<select class="form-select" aria-label=".form-select-sm example" id="mail2" name="mail2">
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
						</select>
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">전화/핸드폰 번호</label>
					<div class="col-sm-3 d-flex">
						 <select name="phone1" id="phone1" class="form-control flex-grow-1">
						 	<option value="010">010</option>
						 	<option value="011">011</option>
						 	<option value="016">016</option>
						 	<option value="017">017</option>
						 	<option value="019">019</option>
						 </select>
						    <span style="margin: 5px">-</span>
						 <input type="text" id="phone2" name="phone2" class="form-control flex-grow-1">
						    <span style="margin: 5px">-</span>
						 <input type="text" id="phone3" name="phone3" class="form-control flex-grow-1">
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">주소</label>
					<div class="col-sm-3">
						<input type="text" id="address" name="address" class="form-control">
					</div>
			</div>
			<input type="hidden" name="regist_day" id="regist_day" value="<%=regist_day%>">
		 <button class="btn-gradient blue mini" type="submit" >
		 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z"/>
</svg>
		 회원가입
		 </button>
		</form>
		
		
	
	</div>	
	<%@ include file="../footer.jsp" %>
</div>
	
</body>
</html>