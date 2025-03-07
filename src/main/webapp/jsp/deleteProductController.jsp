<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="connection/connection.jsp" %>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM SOCCER";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			sql = "DELETE FROM SOCCER WHERE NUM=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			PrintWriter writer = response.getWriter();
			writer.println("<script> alert('해당 상품을 삭제했습니다.');</script>");
			out.println("<script> alert('해당 상품을 삭제했습니다.');</script>");
		}else{
			out.println("일치하는 상품이 없습니다.");
		}
		
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
		response.sendRedirect("listMain_edit.jsp?edit=edit");
	%>
</body>
</html>