<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 결과</title>
</head>
<body>
	<%
		
		Cookie idCookie = new Cookie("id",URLEncoder.encode(request.getParameter("cartId"),"UTF-8"));
		Cookie nameCookie = new Cookie("name",URLEncoder.encode(request.getParameter("name"),"UTF-8"));
		Cookie dataCookie = new Cookie("shoppingDate",URLEncoder.encode(request.getParameter("shoppingDate"),"UTF-8"));
		Cookie counrtyCookie = new Cookie("country",URLEncoder.encode(request.getParameter("country"),"UTF-8"));
		Cookie zipCodeCookie = new Cookie("zipCode",URLEncoder.encode(request.getParameter("zipCode"),"UTF-8"));
		Cookie addressName = new Cookie("address",URLEncoder.encode(request.getParameter("address"),"UTF-8"));
		
		idCookie.setMaxAge(24 * 60 * 60);
		nameCookie.setMaxAge(24 * 60 * 60);
		dataCookie.setMaxAge(24 * 60 * 60);
		counrtyCookie.setMaxAge(24 * 60 * 60);
		zipCodeCookie.setMaxAge(24 * 60 * 60);
		addressName.setMaxAge(25 * 60 * 60);
		
		response.addCookie(idCookie);
		response.addCookie(nameCookie);
		response.addCookie(dataCookie);
		response.addCookie(counrtyCookie);
		response.addCookie(zipCodeCookie);
		response.addCookie(addressName);
		
		response.sendRedirect("order.jsp");
	
	%>
</body>
</html>