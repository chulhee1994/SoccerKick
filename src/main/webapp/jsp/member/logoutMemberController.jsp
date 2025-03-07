<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		HttpSession userSession = request.getSession();
	
		//세션 다 날리기
		//session.invalidate();
		
		userSession.removeAttribute("sessionId");
		response.sendRedirect("/jsp/welcome.jsp");
	%>
</body>
</html>