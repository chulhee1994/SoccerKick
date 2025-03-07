<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Soccer.SoccerVo"%>
<%@page import="Soccer.SoccerRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

  </head>
  <body>
	
	<%
	//상품 번호
	int num = Integer.parseInt(request.getParameter("num"));
	out.println(num);
	//상품번호를 받아서 카트리스트에 추가한다.
	
	//해당 상품의 정보 불러오기
	SoccerRepository dao = SoccerRepository.getInstance();
	SoccerVo vo = dao.getSoccerVo(num);
	
 	if(vo==null){
		response.sendRedirect("404error.jsp");
	}
 	
 	//상품의 모든 리스트 가져오기
 	List<SoccerVo> product_list = dao.printSoccerList();
 	
 	//해당 상품 가져오기
 	SoccerVo product = new SoccerVo();
 	for(SoccerVo soccervo : product_list){
		product = soccervo;
		if(product.getNum() ==num){
			break;
		}
 	}
 	//세션에 카트리스트 없으면 만들고 있으면 넘어가기
 	List<SoccerVo> sessionList = (List<SoccerVo>)session.getAttribute("cartList");
 	if(sessionList==null){
 		sessionList = new ArrayList<SoccerVo>();
 		session.setAttribute("cartList", sessionList);
 	}
 	
 	//해당 상품의 번호에 맞는 상품이 있으면 count올려서 해당상품에 수량 +1
 	int count =0;
 	SoccerVo quantityVo = new SoccerVo();
 	
 	for(SoccerVo soccervo : sessionList){
 		quantityVo = soccervo;
 		if(quantityVo.getNum()==num){
			count++;
			int orderQuantity = quantityVo.getQuantity()+1;
			quantityVo.setQuantity(orderQuantity);
 		}
 	}
 	
 	if(count ==0){
 		product.setQuantity(1);
 		sessionList.add(product);
 	}
 		response.sendRedirect("information.jsp?num="+num);
 	
	%>
	  
  	
  
  </body>
</html>