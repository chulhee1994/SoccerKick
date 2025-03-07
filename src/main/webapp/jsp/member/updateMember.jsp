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
	function deleteUser(){
		var id= document.getElementById("id").value;
		alert(id);
		if(confirm('회원을 삭제 하시겠습니까?')){
			location.href="deleteMemberController.jsp?;
		}else{
			return;
		}
	}
	
	
/* 	var nowTime = Date.now()
	var selectTime = new Date().getTimezoneOffset()*60000;
	var today = new Date(nowTime-selectTime).toISOString().split("T")[0];
	document.getElementById("birth").setAttribute("max", today); */
</script>
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
		<form name="registerForm" action="updateMemberController.jsp" enctype="UTF-8" method="post">
		
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
						 <input type="tel" id="phone" name="phone" value="phone" class="form-control">						 
					</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">주소</label>
					<div class="col-sm-3">
						<input type="text" id="address" name="address" value="<%=address%>" class="form-control">
					</div>
			</div>
		 <button class="btn btn-outline-info" type="button" onclick="location.href='listMain.jsp?edit=edit'">이전</button>
		 <button class="btn btn-outline-info" type="submit">정보수정</button>
		 <button class="btn btn-outline-danger" type="button" onclick="deleteUser()">회원 삭제</button>
		</form>
	</div>
	<%@include file="/jsp/footer.jsp"%>	
		</div>

</body>
</html>