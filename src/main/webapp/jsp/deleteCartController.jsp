<%@page import="Soccer.SoccerVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카트 전체 삭제 컨트롤러</title>
</head>
<body>
	<%
	/* 
	for(int i =0; i<cartList.size(); i++){
		cartList.remove(i);
	}
	List<SoccerVo> cartList = (List<SoccerVo>)session.getAttribute("cartList");	
	session.setAttribute("cartList", cartList);
	 */	
	String cartId = request.getParameter("cartId");
	 
	if(cartId==null || cartId.trim().equals("")){
		response.sendRedirect("listMain.jsp");
		return;
	}
	session.invalidate();
	response.sendRedirect("cart.jsp");
	%>
</body>
</html>