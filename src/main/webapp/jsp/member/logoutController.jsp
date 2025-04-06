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
		HttpSession userSession = request.getSession();
		userSession.removeAttribute("sessionId");
		RequestDispatcher dis = request.getRequestDispatcher("/jsp/welcome.jsp");
		dis.forward(request, response);
	%>
</body>
</html>