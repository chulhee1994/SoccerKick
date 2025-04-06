<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 컨트롤러</title>
</head>
<body>
	<%@include file="/jsp/connection/connection.jsp"%>
	<%
	
	String id= request.getParameter("id");
	
	
	
	
	request.setCharacterEncoding("utf-8");
	String mid = request.getParameter("id");
	String mpw = request.getParameter("pwd2");
	String mname = request.getParameter("name");
	String mgender = request.getParameter("gender");
	String mbirth = request.getParameter("birth");
	String maddress = request.getParameter("address");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="SELECT * FROM member WHERE id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,mid);
	rs=pstmt.executeQuery();
	
	System.out.println(mid);
	if(rs.next()) {
		
			sql="UPDATE member SET pwd=?, name=? , birth=?,address=? WHERE id=?";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,mpw);
			pstmt.setString(2,mname);
			pstmt.setString(3,mbirth);
			pstmt.setString(4,maddress);
			pstmt.setString(5,mid);
			pstmt.executeUpdate();
	
	}
	if (pstmt!=null)
		pstmt.close();
	if (conn!=null)
		conn.close();
	
	RequestDispatcher dis = request.getRequestDispatcher("/jsp/listMain.jsp");
	dis.forward(request, response);
	
	
	
	
	%>
</body>
</html>