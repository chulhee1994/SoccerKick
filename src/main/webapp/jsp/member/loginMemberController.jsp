<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인 컨트롤러</title>
</head>
<body>
	<%@include file="/jsp/connection/connection.jsp" %>
	<%
	
	String id = request.getParameter("id");
	String pwd =request.getParameter("pwd");
	
	PreparedStatement pstmt =null;
	ResultSet rs = null;
	
	RequestDispatcher dis = request.getRequestDispatcher("/jsp/member/loginMember.jsp");
	if(id.equals("")){
		request.setAttribute("check", "<script>alert('아이디가 공백입니다.');</script>");
		dis.forward(request, response);
	}else if(pwd.equals("")){
		request.setAttribute("check", "<script>alert('비밀번호가 공백입니다.');</script>");
		dis.forward(request, response);
	}else{
		
	String sql = "SELECT * FROM MEMBER WHERE ID=? AND PWD=?";
	
	pstmt= conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pwd);
	
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		HttpSession idSession = request.getSession();
		String StrSession = idSession.toString();
		session.setAttribute("sessionId", id);
/* 		session.setAttribute("sessionId", StrSession); */
		
		//회원 아이디 비밀번호 맵에담아 세션에 저장
		Map<String, String> userMap = new HashMap<String,String>();
		userMap.put("id", id);
		userMap.put("pwd", pwd);
		session.setAttribute("user", userMap);
		dis = request.getRequestDispatcher("/jsp/welcome.jsp");
		dis.forward(request, response);
	}else{
		request.setAttribute("check", "<script>alert('회원정보가 없습니다.');</script>");
		dis.forward(request, response);
	}
}
	
	
	%>
</body>
</html>