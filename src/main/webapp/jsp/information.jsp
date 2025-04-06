<%@page import="Soccer.SoccerVo"%>
<%@page import="Soccer.SoccerRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />   
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport">
    <title>상품정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<!-- <script  src="../js/cart.js"></script> -->

<script type="text/javascript">
/**
 * 상품 상세목록에서 장바구니로 상품을 보낼때 사용
 */

	//상품 카트목록으로 보내버리는 함수
	function addCart(){
		
		if(confirm("상품을 장바구니 목록에 추가하시겠습니까?")){
			//추가하기 장바구니 목록으로 보내버리기
			document.cart_form.submit();
		}else{
			document.cart_form.reset();
		}
			
		
	}

</script>
  <style type="text/css">
  /* 상품 설명을 위한 스타일 */
.col-md-6 p {
    margin-bottom: 15px;
    font-size: 1.1rem;
    color: #333;
}

/* 상품 주문, 목록, 장바구니 버튼들을 한 줄로 정렬하고 간격을 추가 */
.d-flex {
    display: flex;
    justify-content: start;
    gap: 10px; /* 버튼 사이의 간격 */
}

/* 버튼 크기 조정 */
.d-flex .btn {
    font-size: 0.1rem; /* 버튼 텍스트 크기 */
}

/* 버튼 hover 효과 추가 */
.d-flex .btn:hover {
    background-color: #17a2b8;
    color: #fff;
    border-color: #17a2b8;
}
  
  <!--버튼-->
  
  a[class*="btn"] {
  text-decoration: none;
}

.btn-gradient {
  text-decoration: none;
  color: white;
  padding: 10px 30px;
  display: inline-block;
  position: relative;
  border: 1px solid rgba(0,0,0,0.21);
  border-bottom: 4px solid rgba(0,0,0,0.21);
  border-radius: 4px;
  text-shadow: 0 1px 0 rgba(0,0,0,0.15);
}

.btn-gradient.large {
  padding: 15px 45px;
  font-size: 22px;
}
.btn.large, 
.btn-two.large, 
.btn-effect.large {
  padding: 20px 40px; 
  font-size: 22px;
}
.btn.small, 
.btn-two.small, 
.btn-gradient.small, 
.btn-effect.small {
  padding: 8px 18px;  
  font-size: 14px;
}
.btn.mini, 
.btn-two.mini, 
.btn-gradient.mini, 
.btn-effect.mini {
  padding: 4px 12px;  
  font-size: 12px;
}
.btn.block, 
.btn-two.block, 
.btn-gradient.block, 
.btn-effect.block {
  display: block;
  width: 60%;
  margin-left: auto;
  margin-right: auto;
  text-align: center;
}
.btn-gradient.large {
  padding: 15px 45px; 
  font-size: 22px;
}


/* Gradient buttons */
.btn-gradient {
  text-decoration: none;
  color: white;
  padding: 10px 30px;
  display: inline-block;
  position: relative;
  border: 1px solid rgba(0,0,0,0.21);
  border-bottom: 4px solid rgba(0,0,0,0.21);
  border-radius: 4px;
  text-shadow: 0 1px 0 rgba(0,0,0,0.15);
}
/* Gradient - ugly css is ugly */
.btn-gradient.cyan {
  background: rgba(27,188,194,1);
  background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(27,188,194,1)), to(rgba(24,163,168,1)));
  background: -webkit-linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
  background: -moz-linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
  background: -o-linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
  background: linear-gradient(rgba(27,188,194,1) 0%, rgba(24,163,168,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#1bbcc2', endColorstr='#18a3a8', GradientType=0);
}

.btn-gradient.red{ 
  background: rgba(250,90,90,1);
  background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(250,90,90,1)), to(rgba(232,81,81,1)));
  background: -webkit-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  background: -moz-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  background: -o-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  background: linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fa5a5a', endColorstr='#e85151', GradientType=0 );
}
.btn-gradient.orange {
  background: rgba(255,105,30,1);
  background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(255,105,30,1)), to(rgba(230,95,28,1)));
  background: -webkit-linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
  background: -moz-linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
  background: -o-linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
  background: linear-gradient(rgba(255,105,30,1) 0%, rgba(230,95,28,1) 100%);
}
.btn-gradient.blue {
  background: rgba(102,152,203,1);
  background: -moz-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
  background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(102,152,203,1)), color-stop(100%, rgba(92,138,184,1)));
  background: -webkit-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
  background: -o-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
  background: -ms-linear-gradient(top, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
  background: linear-gradient(to bottom, rgba(102,152,203,1) 0%, rgba(92,138,184,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#6698cb', endColorstr='#5c8ab8', GradientType=0 );
}
.btn-gradient.purple { 
  background: rgba(203,153,197,1);
  background: -moz-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
  background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(203,153,197,1)), color-stop(100%, rgba(181,134,176,1)));
  background: -webkit-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
  background: -o-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
  background: -ms-linear-gradient(top, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
  background: linear-gradient(to bottom, rgba(203,153,197,1) 0%, rgba(181,134,176,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cb99c5', endColorstr='#b586b0', GradientType=0 );
}
.btn-gradient.yellow {
  background: rgba(240,210,100,1);
  background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(240,210,100,1)), to(rgba(229,201,96,1)));
  background: -webkit-linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
  background: -moz-linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
  background: -o-linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
  background: linear-gradient(rgba(240,210,100,1) 0%, rgba(229,201,96,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f0d264', endColorstr='#e5c960', GradientType=0 );
}
.btn-gradient.green {
  background: rgba(130,200,160,1);
  background: -moz-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
  background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(130,200,160,1)), color-stop(100%, rgba(130,199,158,1)));
  background: -webkit-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
  background: -o-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
  background: -ms-linear-gradient(top, rgba(130,200,160,1) 0%, rgba(130,199,158,1) 100%);
  background: linear-gradient(to bottom, rgba(130,200,160,1) 0%, rgba(124, 185, 149, 1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#82c8a0', endColorstr='#82c79e', GradientType=0 );
}

.btn-gradient.red {
  background: rgba(250,90,90,1);
  background: -webkit-gradient(linear, 0 0, 0 100%, from(rgba(250,90,90,1)), to(rgba(232,81,81,1)));
  background: -webkit-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  background: -moz-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  background: -o-linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  background: linear-gradient(rgba(250,90,90,1) 0%, rgba(232,81,81,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fa5a5a', endColorstr='#e85151', GradientType=0 );
}

.btn-gradient.red:active {
  background: #E35252;
}
<!--버튼-->
 
 <!--상품 번호 -->
 /* 상품 번호 배지 스타일 */
.product-badge {
    background-color: #ff5722; /* 배경색 (원하는 색으로 변경 가능) */
    color: #ffffff; /* 텍스트 색상 */
    font-size: 1.3rem; /* 폰트 크기 */
    padding: 8px 16px; /* 패딩을 넓혀서 배지를 강조 */
    border-radius: 12px; /* 배경의 모서리 둥글게 */
    font-weight: bold; /* 글씨 굵게 */
    text-align: center; /* 텍스트 가운데 정렬 */
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
    text-transform: uppercase; /* 대문자로 변환 */
    letter-spacing: 1px; /* 글자 간격 조정 */
}

/* 배경색과 텍스트 색상을 강조하여 숫자가 더 돋보이게 */
.product-badge {
    background-color: #28a745; /* 예시: 초록색 배경 */
    color: #fff; /* 흰색 텍스트 */
}

 <!--상품 번호 -->
  </style>	
  </head>
  <body>
  	<%@include file="connection/connection.jsp" %>
	<div class="container py-4">
	<%@include file="header.jsp"%>
	
	
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">상품 정보</h1>
				<p class="col-md-8 fs-4">Product Information</p>
			</div>
		</div>
		<%
			int productNum = Integer.parseInt(request.getParameter("num"));
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM SOCCER WHERE NUM=?";
			
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, productNum);
			rs = pstmt.executeQuery();
			int num;
			String name;
			int price;
			String publisher;
			String information;
			String condition;
			String category;
			int inventory;
			String img;
			
			if(rs.next()){
				num = rs.getInt("num");
				name = rs.getString("name");
				price = rs.getInt("price");
				publisher = rs.getString("publisher");
				information = rs.getString("information");
				condition = rs.getString("condition");
				category = rs.getString("category");
				inventory = rs.getInt("inventory");
				img = rs.getString("img");
		%>
		<div class="row align-items-md-stretch">
			<div class="col-md-5">
				<img src="${contextPath}/img/<%=img%>" style="width: 70%">
			</div>
		
			<div class="col-md-6">
    <h3><b><%=name%></b></h3>
    <p><%=information%></p>
<p><b>상품 번호 : </b><span class="badge product-badge"><%=num%></span></p>


    <p><b>가격 :</b>				
    <fmt:formatNumber value="<%=price%>" pattern="#,###"/>원
    </p>
    <p><b>배급사:</b><%=publisher %></p>
    <p><b>상태 :</b><%=condition%></p>
    <p><b>분류 :</b><%=category%></p>
    <p><b>재고 :</b><%=inventory%></p>

    <div class="d-flex justify-content-start gap-3">
    

<c:if test="${sessionScope.sessionId !='admin' or 'ADMIN'}">

    
        <form name="cart_form" action="${contextPath}/jsp/addCartController.jsp?num=<%=num%>" method="post">
         <a href="#" class="btn-gradient blue mini" onclick="addCart()">
     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8m15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0M4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5z"/>
</svg>
상품 담기</a>

        </form>
</c:if>
            <a href="listMain.jsp" class="btn-gradient purple mini">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"/>
</svg>
상품 목록</a>
<c:if test="${sessionScope.sessionId !='admin' or 'ADMIN'}">
            <a href="cart.jsp" class="btn-gradient yellow mini">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
  <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
</svg>
            장바구니
            </a>
</c:if>

    </div>
</div>

		
		</div>
		<%
			}
		%>	
		<%@include file="footer.jsp" %>	
		</div>
  </body>
</html>