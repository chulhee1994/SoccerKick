<%@page import="Soccer.SoccerVo"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<%@page errorPage="404error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>상품 리스트</title>
<style type="text/css">
.border-button:hover{
  border: 1px solid silver;
}
</style>
</head>
<body>
	<%@ include file="connection/connection.jsp" %>
	<div class="container py-4">
	<%@ include file="/jsp/header.jsp" %>
	
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">상품 목록</h1>
				<p class="col-md-8 fs-4">Product List</p>
			</div>
		</div>

<!-- DB없을때 사용 -->
<%-- 	<jsp:useBean id="dao" class="Soccer.SoccerRepository"  scope="session"/>
	<%
		List<SoccerVo> list = dao.getInstance().printSoccerList();
		int num = dao.getNum();
	%> --%>
<%--  <%
 	for(int i = 0; i<list.size(); i++){
 		SoccerVo vo = list.get(i);
 	String img = vo.getImg();
 %>

    <div class="col">
    <div class="card h-100">
      <img src="../img/<%=img%>" class="card-img-top" alt="..."/>
     	<div class="card-body">
        <h5 class="card-title"><%=vo.getName() %></h5>
        <p class="card-text"><%=vo.getInformation() %></p>
        <%	
				
        %>
        <p><%=vo.getPrice()%>원</p>
        <div class="wrap">
        <p><a class="btn-6" href="information.jsp?num=<%=vo.getNum()%>">상세정보 보기<span></span></a></p>
    </div>
      </div>
<!--       <div class="card-footer">
        <small class="text-body-secondary"><%=vo.getCondition() %></small>
      </div>
       -->
    </div>
  </div>
<%
 	}
%> --%>
<!-- DB없을때 사용 -->
		<div class="row align-tiems-md-stretch text-center">
 <%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="SELECT * FROM SOCCER";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			
		String img =rs.getString("img");
	%>	
    <div class="col" >
    <div class="card h-100" style="position: relative;" id="border">
      <img src="${contextPath}/img/<%=img%>" class="card-img-top" alt="..."/>
     	<div class="card-body">
        <h5 class="card-title fw-bold"><%=rs.getString("name") %></h5>
        <p class="card-text"><%=rs.getString("information")%></p>
        <p class="card-text fw-medium"><%=rs.getInt("price")%>원</p>
      </div>
        <div class="card-footer">
        <a href="information.jsp?num=<%=rs.getInt("num")%>" class="btn btn-outline-info" role="button">상세 정보 보기 &raquo;</a>
      </div>
      </div>
    </div>
  <% 
	}
		if(rs!=null){
			rs.close();
		}
		if(pstmt!=null){
			pstmt.close();
		}
		if(conn!=null){
			conn.close();
		}
  %>
  </div>
	<%@include file="/jsp/footer.jsp" %>
	</div>
	
</body>
</html>