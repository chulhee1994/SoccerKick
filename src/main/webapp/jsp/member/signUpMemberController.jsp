<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.swing.text.DateFormatter"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 컨트롤러</title>
</head>
<body>
	<%@include file="../connection/connection.jsp" %>
	<%	
		
		String id = request.getParameter("id");
		String pwd1 = request.getParameter("pwd1");
		String pwd2 = request.getParameter("pwd2");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		
		String email = request.getParameter("mail");
		String email2 =request.getParameter("mail2");
		String mail = email+"@"+email2;
		
		String address = request.getParameter("address");
		
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1+"-"+phone2+"-"+phone3;
		
		String regist_day = request.getParameter("regist_day");
		
		
		//Id 중복 확인
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM MEMBER WHERE ID=?";
		pstmt =conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		RequestDispatcher dis = request.getRequestDispatcher("signUpMember.jsp");
		
		//아이디 중복 체크
		//공백		
		if(id.equals("") || id==null){
			request.setAttribute("Check", "<script>alert('아이디가 공백입니다.');</script>");
			dis.forward(request, response);
			//ID 없음
		}else if(rs.next()){
			request.setAttribute("Check","<script>alert('아이디가 중복됩니다.');</script>");
			dis.forward(request, response);
		//비밀번호 1이나 2가 없을때
		}else if(pwd1.equals("") || pwd2.equals("")){
			request.setAttribute("Check","<script>alert('비밀번호가 입력되지 않았습니다.');</script>");
			dis.forward(request, response);
		//비밀번호 1,2 같지 않을때
		}else if(!pwd1.trim().equals(pwd2)){
			request.setAttribute("Check","<script>alert('비밀번호가 같지 않습니다.');</script>");
			dis.forward(request, response);
		//이름 비었는지 확인
		}else if(name.equals("") ||name==null){
		request.setAttribute("Check","<script>alert('이름이 공백입니다.');</script>");
		dis.forward(request, response);
		//성별은 null확인 필요 X 생일 비었는지 확인
		}else if(birth.equals("") ||birth==null){
		request.setAttribute("Check","<script>alert('생일을 입력하지 않았습니다.');</script>");
		dis.forward(request, response);
		//이메일 확인
		}else if(email.equals("") || email==null){
		request.setAttribute("Check","<script>alert('이메일이 공백입니다.');</script>");
		dis.forward(request, response);
		//주소
		}else if(address.equals("") || address==null){
		request.setAttribute("Check","<script>alert('주소가 공백입니다.');</script>");
		dis.forward(request, response);
		//핸드폰
		}else if(phone.equals("") || phone==null){
		request.setAttribute("Check","<script>alert('번호가 공백입니다.');</script>");
		dis.forward(request, response);
			
		}else{
		//DB에 저장
 		sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd1);
		pstmt.setString(3, name);
		pstmt.setString(4, gender);
		pstmt.setString(5, birth);
		pstmt.setString(6, mail);
		pstmt.setString(7, phone);
		pstmt.setString(8, address);
		pstmt.setString(9, regist_day);
		
		//회원가입 DB에 저장
		pstmt.executeUpdate();
		
		//회원정보 저장해서 포워딩해서 회원가입 결과를 알려준다.
		List<String> user = new ArrayList<String>();
		user.add("아이디 :"+id);
		user.add("비밀번호:"+pwd1);
		user.add("이름:"+name);
		user.add("성별:"+gender);
		user.add("생일:"+birth);
		user.add("이메일:"+mail);
		user.add("전화/핸드폰 번호:"+phone);
		user.add("주소:"+address);
		user.add("회원가입 날짜:"+regist_day);
		request.setAttribute("user", user);
		dis = request.getRequestDispatcher("resultMember.jsp");
		dis.forward(request, response);
	}
		%>
</body>
</html>