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
	<%@include file="/jsp/connection/connection.jsp" %>
	
	<%
    // 상품 번호
    
    int num = Integer.parseInt(  request.getParameter("num"));
    
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM SOCCER WHERE NUM = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, num);
	
	rs = pstmt.executeQuery();
	
	rs.next();
	
	
    SoccerVo product = new SoccerVo();
	
    product.setNum(rs.getInt("num"));
    product.setName(rs.getString("name"));
    product.setPrice(rs.getInt("price"));
    product.setPublisher(rs.getString("publisher"));
    product.setInformation(rs.getString("information"));
    product.setCondition(rs.getString("condition"));
    product.setCategory(rs.getString("category"));
    product.setInventory(rs.getInt("inventory"));
    product.setImg(rs.getString("img"));
    product.setQuantity(rs.getInt("quantity"));
    
    
    
    // 해당 상품의 정보 불러오기
    /* SoccerRepository dao = SoccerRepository.getInstance();
    SoccerVo vo = dao.getSoccerVo(num);
    
    if(vo == null) {
        response.sendRedirect("404error.jsp");
        return; // 이후 코드 실행을 막고 리다이렉션
    }
    // 상품의 모든 리스트 가져오기
    List<SoccerVo> product_list = dao.printSoccerList();
    
    // 해당 상품 가져오기
    for(SoccerVo soccervo : product_list) {
        product = soccervo;
        if(product.getNum() == num) {
            break;
        }
    }

    */
    
    // 세션에 카트리스트 없으면 만들고 있으면 넘어가기
    List<SoccerVo> sessionList = (List<SoccerVo>)session.getAttribute("cartList");
    if(sessionList == null) {
        sessionList = new ArrayList<SoccerVo>();
        session.setAttribute("cartList", sessionList);
    }

    // 해당 상품의 번호에 맞는 상품이 있으면 count 올려서 해당상품에 수량 +1
    int count = 0;
    SoccerVo quantityVo = new SoccerVo();

    for(SoccerVo soccervo : sessionList) {
        quantityVo = soccervo;
        if(quantityVo.getNum() == num) {
            count++;
            int orderQuantity = quantityVo.getQuantity() + 1;
            quantityVo.setQuantity(orderQuantity);
        }
    }

    if(count == 0) {
        product.setQuantity(1);
        sessionList.add(product);
    }

    // sendRedirect는 반드시 출력 전에 호출해야 합니다.
    response.sendRedirect("information.jsp?num=" + num);
%>

	  console.log(num);
  	
  
  </body>
</html>