<%@page import="java.util.ArrayList"%>
<%@page import="Soccer.SoccerRepository"%>
<%@page import="java.util.List"%>
<%@page import="Soccer.SoccerVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록 삭제 컨트롤러</title>
</head>
<body>
	<%	
	
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	if(num==0 || String.valueOf(num).equals(null)){
		response.sendRedirect("listMain.jsp");
	}
	SoccerRepository dao = SoccerRepository.getInstance();
	
	SoccerVo vo = dao.getSoccerVo(num);
	
	if(vo==null){
		response.sendError(404);
	}
	
	List<SoccerVo> cartList =(List<SoccerVo>)session.getAttribute("cartList");
	SoccerVo productVo = new SoccerVo();
	
	for(int i=0; i<cartList.size(); i++){
		productVo = cartList.get(i);
		if(productVo.getNum()==num){
			cartList.remove(productVo);
		}
	}
		response.sendRedirect("cart.jsp");
	%>
</body>
</html>