<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>결제하기</title>
		<%@ include file="/WEB-INF/views/header.jsp" %>
	</head>
	<body>
		<div class="container">
			<div>
				<c:forEach var="list" items="${list}" varStatus="status">
					<div class="row">
						<span>${list.book_num}</span><span>${list.play_no}</span>
					</div>
					<div class="row">
						<span>${list.tht_no}</span><span>${list.hall_name}</span>
					</div>
					<div class="row">
						<span>${list.total_price}</span><span>${list.ticket_cnt}</span>
					</div>
					<div class="row">
						<span>${list.play_date}</span><span>${list.book_date}</span>
					</div>
					<div class="row">
						<span>${list.card_no}</span><span>${list.seat_code}</span>
					</div>
				</c:forEach>
			</div>
		</div>
	</body>	
</html>