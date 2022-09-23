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
				<c:forEach var="list" items="${list}" varStatus="status">
					<table class="table table-hover table-striped">
						<tbody>
							<tr>
								<th>예약 번호</th>
								<td>
									<span id="bno">${list.book_num}</span>
								</td>
								<th>공연 번호</th>
								<td>
									${list.play_no}
								</td>
							</tr>
							<tr>
								<th>극장 번호</th>
								<td>
									${list.tht_no}
								</td>
								<th>극장 이름</th>
								<td>
									${list.hall_name}
								</td>
							</tr>
							<tr>
								<th>공연 일자</th>
								<td>
									${list.play_date}
								</td>
								<th>예약 일자</th>
								<td>
									${list.book_date}
								</td>
							</tr>
							<tr>
								<th>카드 번호</th>
								<td>
									<span id="card_num">${list.card_num}</span>
								</td>
								<th>좌석 정보</th>
								<td>
							 		${list.seat_code}
							 	</td>
							</tr>
							<tr>
								<th>티켓 수</th>
								<td>
									${list.ticket_cnt}
								</td>
								<th>결제 금액</th>
								<td>
									<span id="price">${list.total_price}</span>
								</td>
							</tr>
							
						</tbody>
					</table>
					<c:choose>
						<c:when test="${list.status == '1'}">
							<div class="float-right"><span>결제 상태 : </span><span id="status">결제 완료</span></div>
							<a id="pay_cancel" class="btn btn-warning">환불하기</a>
						</c:when>
						<c:otherwise>
							<a id="payment" class="btn btn-primary float-right">결제하기</a>
							<a id="cancel" class="btn btn-warning">예매 취소하기</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
		</div>
	</body>	
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#pay_cancel").click(function() {
				$.get(
					"${pageContext.request.contextPath}/purchase/pay_cancel"
					, {
						book_num : $("#bno").text() 
					}
					, function(data, status) {
						if(data >= 1){
							alert("결제 취소되었습니다.");
							location.href="${pageContext.request.contextPath}/";
						}else {
							alert("잠시 후 다시 시도해주세요.");
						}
					}
				)
			});//click
			
			
			
			$("#cancel").click(function() {
				$.get(
					"${pageContext.request.contextPath}/purchase/cancel"
					, {
						book_num : $("#bno").text() 
					}
					, function(data, status) {
						if(data >= 1){
							alert("예매 취소되었습니다.");
							location.href="${pageContext.request.contextPath}/";
						}else {
							alert("잠시 후 다시 시도해주세요.");
						}
					}
				)
			});//click
			
			$("#payment").click(function() {
				$.post(
					"${pageContext.request.contextPath}/purchase/payment"
					, {
						book_num : $("#bno").text()
						, card_num : $("#card_num").text()
						, total_price : $("#price").text()
					}
					, function(data, status) {
						if(data >= 1){
							alert("결제가 완료되었습니다.");
							location.href="${pageContext.request.contextPath}/purchase/page";
						}else {
							alert("잠시 후 다시 시도해주세요.");
						}
					}
				
				)
			});
		});//ready
	</script>
</html>