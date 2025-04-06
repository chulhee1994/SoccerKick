<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 업데이트 컨트롤러</title>
</head>
<body>
	<%@include file="connection/connection.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String fileName="";
		String path ="C:\\Temp\\img";
		String encType ="UTF-8";
		int MaxSize = 5 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request,path,MaxSize,encType,new DefaultFileRenamePolicy());
		
		int num = Integer.parseInt(multi.getParameter("num"));
		String name = multi.getParameter("name");
		int price = Integer.parseInt(multi.getParameter("price"));
		String publisher = multi.getParameter("publisher");
		String information = multi.getParameter("information");
		String condition = multi.getParameter("condition");
		String category = multi.getParameter("category");
		int inventory = Integer.parseInt(multi.getParameter("inventory"));
		String img = multi.getParameter("img");
		
		Enumeration elements =  multi.getFileNames();
		String systemName = (String)elements.nextElement();
		
		String imgName = multi.getFilesystemName(systemName);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql ="SELECT * FROM SOCCER WHERE NUM=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			if(imgName!=null){
				sql = "UPDATE SOCCER SET "+
					  "name=?,price=?,publisher=?,information=?,condition=?,category=?,"+
				      "inventory=?,img=? where num=?";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, name);
				pstmt.setInt(2, price);
				pstmt.setString(3, publisher);
				pstmt.setString(4, information);
				pstmt.setString(5, condition);
				pstmt.setString(6, category);
				pstmt.setInt(7, inventory);
				pstmt.setString(8, imgName);
				pstmt.setInt(9,num);
				pstmt.executeUpdate();
		}else{
			sql = "UPDATE SOCCER SET "+
					"name=?,price=?,publisher=?,information=?,condition=?,category=?,"+
				      "inventory=? WHERE NUM=?";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, name);
				pstmt.setInt(2, price);
				pstmt.setString(3, publisher);
				pstmt.setString(4, information);
				pstmt.setString(5, condition);
				pstmt.setString(6, category);
				pstmt.setInt(7, inventory);
				pstmt.setInt(8,num);
				pstmt.executeUpdate();
		}
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