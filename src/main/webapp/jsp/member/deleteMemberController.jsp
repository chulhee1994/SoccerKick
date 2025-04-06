<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제 컨트롤러</title>
</head>
<body>
	<%@include file="/jsp/connection/connection.jsp" %>
	<%
	Map<String,String> userMap = (Map<String,String>)session.getAttribute("user");
	
	//세션에서 받아온 아이디랑 비밀번호 찾기
	String sessionId = userMap.get("id");
	String sessionPwd = userMap.get("pwd");
	
	PreparedStatement pstmt = null;
	ResultSet rs=null;
	
	//회원이 있는지 확인
	String sql = "SELECT * FROM MEMBER WHERE ID=? AND PWD=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, sessionId);
	pstmt.setString(2, sessionPwd);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		
	sql = "DELETE FROM MEMBER WHERE ID=? AND PWD=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, sessionId);
	pstmt.setString(2, sessionPwd);
	int rows = pstmt.executeUpdate();
		
	if(rows !=0){
		session.invalidate();
		out.println("<script>alert('회원을 삭제했습니다.');</script>");
		response.sendRedirect("../welcome.jsp");		
		}else{
	out.println("<script>alert('회원을 삭제하지 못했습니다.');</script>");
		}
	
	}else{
	out.println("<script>alert('삭제할 수 없는 회원입니다.');</script>");
	}
	
	
	%>
</body>
</html>