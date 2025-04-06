<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Connection  conn = null;
	try{
	Class.forName("oracle.jdbc.OracleDriver");
	
	String url ="jdbc:oracle:thin:@localhost:1522:xe";
	String user ="system";
	String password = "1234";
	conn= DriverManager.getConnection(url, user, password);
	
	}catch(SQLException e){
		 out.println(e.getMessage());
	}
	
	%>
	
	
</body>
</html>