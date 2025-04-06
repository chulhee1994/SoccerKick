<%@page import="jakarta.servlet.jsp.jstl.sql.Result"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@page import="Soccer.SoccerRepository"%>
<%@page import="Soccer.SoccerVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컨트롤러</title>
</head>
<body>
  <%@include file="connection/connection.jsp"%>
<!--DB없이 사용 -->

<!--DB없이 사용 -->		
		<%
			String sql = null;
			PreparedStatement pstmt = null;
			Statement stmt = null;
			String path = "C:\\Temp\\img";
			MultipartRequest multi = new MultipartRequest(request, path,100*1024*1024, "UTF-8",new DefaultFileRenamePolicy());
			
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
		
			
			sql="INSERT INTO SOCCER(NUM,NAME,PRICE,PUBLISHER,INFORMATION,CONDITION,CATEGORY,INVENTORY,IMG) VALUES(?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2,name);
			pstmt.setInt(3, price);
			pstmt.setString(4, publisher);
			pstmt.setString(5, information);
			pstmt.setString(6, condition);
			pstmt.setString(7, category);
			pstmt.setInt(8, inventory);
			pstmt.setString(9,imgName);
			
			int rows = pstmt.executeUpdate();
			
			if(rows!=0){
				out.print("<script>alert('상품이 등록되었습니다.');<script>");
				response.sendRedirect("listMain.jsp");		
			}else{
				response.sendRedirect("404error.jsp");
			}
		%>
		
</body>
</html>