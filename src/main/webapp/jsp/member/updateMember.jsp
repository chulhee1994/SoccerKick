<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script type="text/javascript">
	function deleteUser() {
		if(confirm('회원을 삭제 하시겠습니까?')){
			location.href="deleteMemberController.jsp";
		}else{
			return;
		}
	}
	
	// 유효성 검사 함수
	function validateForm() {
		var pwd1 = document.registerForm.pwd1.value;
		var pwd2 = document.registerForm.pwd2.value;
		var name = document.registerForm.name.value;
		var gender = document.registerForm.gender.value;
		var birth = document.registerForm.birth.value;
		var email = document.registerForm.mail.value;
		var phone = document.registerForm.phone.value;
		var address = document.registerForm.address.value;

		// 비밀번호 확인
		if (pwd1 === "" || pwd2 === "") {
			alert("비밀번호를 입력해 주세요.");
			return false;
		}
		if (pwd1 !== pwd2) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return false;
		}

		// 필수 입력값 검사
		if (name === "") {
			alert("이름을 입력해 주세요.");
			return false;
		}
		if (gender === "") {
			alert("성별을 선택해 주세요.");
			return false;
		}
		if (birth === "") {
			alert("생일을 입력해 주세요.");
			return false;
		}
		if (email === "") {
			alert("이메일을 입력해 주세요.");
			return false;
		}
		if (phone === "") {
			alert("전화번호를 입력해 주세요.");
			return false;
		}
		if (address === "") {
			alert("주소를 입력해 주세요.");
			return false;
		}
		return true; // 모든 유효성 검사를 통과하면 폼을 제출
	}
	
</script>
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
</head>
<body>
	<%@include file="../connection/connection.jsp"%>
	<%
	HttpSession httpsession = request.getSession();
	String getId = httpsession.getId();
	
	
	Map<String, String> map = (Map<String,String>)httpsession.getAttribute("user");
	
	String sessionid = map.get("id");
	String sessionpwd = map.get("pwd");
	
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT * FROM MEMBER WHERE ID=? AND PWD=?";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, sessionid);
	pstmt.setString(2,sessionpwd);
	
	rs = pstmt.executeQuery();
	//정보가 있으면 출력해주고 없으면 메인화면으로 넘어감
	
	String id="";
	String pwd ="";
	String name="";
	String gender="";
	String birth="";
	String email="";
	String phone="";
	String address="";
	if(rs.next()){
		id=rs.getString("id");
		pwd = rs.getString("pwd");
		name= rs.getString("name");
		gender=rs.getString("gender");
		birth=rs.getString("birth");
		email = rs.getString("mail");
		phone = rs.getString("phone");
		address = rs.getString("address");
	}
	
	%>
	<div class="container py-4">
	<%@ include file="/jsp/header.jsp" %>
	
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">정보 수정</h1>
				<p class="col-md-8 fs-4">User Edit</p>
			</div>
		</div>

	
		<div class="row align-items-md-stretch">
		<form name="registerForm" action="updateMemberController.jsp"  onsubmit="return validateForm()" enctype="UTF-8" method="post">
		
			<div class="mb-3 row">
				<label class="col-sm-2">아이디</label>
					<div class="col-sm-3">
						<input type="text" id="id" name="id" class="form-control" value="<%=id%>" readonly>
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-3">
						<input type="password" id="pwd1" name="pwd1" value="<%=pwd%>" class="form-control">
					</div>
			</div>
		
			<div class="mb-3 row">
				<label class="col-sm-2">비밀번호 확인</label>
					<div class="col-sm-3">
						<input type="password" id="pwd2" name="pwd2" value="<%=pwd%>" class="form-control">
					</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">이름</label>
					<div class="col-sm-3">
						<input type="text" id="name" name="name" value="<%=name %>" class="form-control">
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">성별</label>
					<div class="col-sm-3">
					<%
						if(gender.equals("남자")){
							
					%>
						<label for="male">남자</label>
						<input type="radio" id="male" name="gender" value="남자" checked checked onclick="return(false);"> 
						<label for="female">여자</label>
						<input type="radio" id="female" name="gender" value="여지"  onclick="return(false);">
					<%
						}else{
					%>
						<label for="male">남자</label>
						<input type="radio" id="male" name="gender" value="남자" checked  onclick="return(false);"> 
						<label for="female">여자</label>
						<input type="radio" id="female" name="gender" value="여지"  onclick="return(false);">
					
					<%
						}
					%>
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">생일</label>
					<div class="col-sm-3">
						<input type="date" id="birth" name="birth"  value="<%=birth %>" class="form-control">
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">이메일</label>
					<div class="col-sm-3">
						<input type="email" id="mail" name="mail" value="<%=email %>" class="form-control">
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">전화/핸드폰 번호</label>
					<div class="col-sm-3">
<!-- 						 <input type="text" id="phone1" name="phone1" class="form-control">-<input type="text" id="phone2" name="phone2" class="form-control">-<input type="text" id="phone3" name="phone3" class="form-control"> -->
						 <input type="tel" id="phone" name="phone" value="<%=phone %>" class="form-control">						 
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">주소</label>
					<div class="col-sm-3">
						<input type="text" id="address" name="address" value="<%=address%>" class="form-control">
					</div>
			</div>
		<a class="btn-gradient orange mini" href="${contextPath}/jsp/listMain.jsp?edit=edit">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-circle" viewBox="0 0 16 16">
		  <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z"/>
		</svg>
		이전
		</a>
		
	<!-- 	<a href="#"  class="btn-gradient blue mini" onclick="checkProduct()">
			 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z"/>
</svg>수정
		</a> -->
		
		 <button  type="submit" class="btn-gradient blue mini">
		  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z"/>
</svg>
		 수정
		 </button>
		 
		 <a  class="btn-gradient red mini" onclick="deleteUser()" type="button">
		  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
</svg>
	회원삭제
		 </a>
		
		</form>
		
		
	
	</div>
	<%@include file="/jsp/footer.jsp"%>	
		</div>

</body>
</html>