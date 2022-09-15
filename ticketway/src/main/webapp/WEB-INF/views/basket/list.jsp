<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 장바구니 목록 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 장바구니 목록 </h3>
		<hr>
		<table class="table table-hover">
			<col class="col-1">
			<thead>
				<tr>
					<th> 선택 </th>	<th> 썸네일 </th>	<th> 상품명 </th>
					<th> 단가 </th>	<th> 구매 수량 </th>	<th> 구매 금액 </th>
					<th> 할인 금액 </th>	<th> 실 구매 금액 </th>	<th> 삭제 </th>
				</tr>
			</thead>
			<tbody>
				<c:set var="sum_product_class_qty" value="0" />
				<c:set var="sum_buy_amt" value="0" />
				<c:set var="sum_discount_amt" value="0" />
				<c:forEach var="dto" items="${list}" varStatus="status">
					<c:set var="sum_product_class_qty" value="${sum_product_class_qty + 1}" />
					<c:set var="sum_buy_amt" value="${sum_buy_amt + (dto.price * dto.buy_qty)}" />
					<c:set var="sum_discount_amt" value="${sum_discount_amt + ( (dto.price - dto.sale_price) * dto.buy_qty )}" />
					<tr>
						<td>
							<input type="checkbox" class="order_check_box form-control" checked="checked" id="${dto.price}" name="${dto.sale_price}" value="${dto.buy_qty}">
							<input type="hidden" id="basket_no${status.index}" name="basket_no${status.index}" value="${dto.basket_no}">
						</td>
						<td width="10%">
							<img src="${dto.thumbnail_path}" class="img-thumbnail">
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/product/detail?prdt_no=${dto.prdt_no}">
								${dto.prdt_name}
							</a>
						</td>
						<td> ${dto.price} 원 </td>
						<td>
							<select id="buy_qty" name="buy_qty">
								<c:forEach var="tmp_qty" begin="1" end="10">
									<option value="${tmp_qty}"
										<c:if test="${dto.buy_qty == tmp_qty}"> selected="selected"</c:if>
									> ${tmp_qty} </option>
								</c:forEach>
							</select>
							<button type="button" class="btn btn-danger btn-sm qty_chg_btn" value="${dto.basket_no}">수량 변경</button>
						</td>
						<td> ${dto.price * dto.buy_qty} 원 </td>
						<td class="text-danger"> -${ (dto.price - dto.sale_price) * dto.buy_qty} 원 </td>
						<td> ${dto.price * dto.buy_qty - ( (dto.price - dto.sale_price) * dto.buy_qty )} 원 </td>
						<td>
							<button class="basket_delete_btn btn btn-danger btn-sm" value="${dto.basket_no}"> X </button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		<table class="table">
			<tr>
				<td rowspan="5"> <h1>전 체 합 계</h1> </td>
				<th> 총 상 품 수 </th>
				<td class="text-right"> <span id="span_sum_product_class_qty"> ${sum_product_class_qty}</span> 개 </td>
			</tr>
			<tr>
				<th> 총 구 매 금 액 </th>
				<td class="text-right"> <span id="span_sum_buy_amt"> ${sum_buy_amt}</span> 원 </td>
			</tr>
			<tr>
				<th> 총 할 인 금 액 </th>
				<td class="text-right text-danger"> <span id="span_sum_discount_amt"> -${sum_discount_amt} </span> 원 </td>
			</tr>
			<tr>
				<th> <h1>총 주 문 금 액</h1> </th>
				<td class="text-right"> <h1><span id="span_sum_total_buy_amt"> ${sum_buy_amt - sum_discount_amt}</span> 원</h1> </td>
			</tr>
		</table>
		<hr>
		<div class="text-center">
			<button id="order_btn" class="btn btn-danger btn-large"> 주 문 하 기 </button>
		</div>
		<hr>
	<%@ include file="/WEB-INF/views/footer.jsp" %>

	<script type="text/javascript">
	$(document).ready(function() {
		$(".qty_chg_btn").click(function() {

			//alert( $(this).val() + " : " + $(this).prev().val() );

			$.get(
					"${pageContext.request.contextPath}/basket/update_buy_qty"
					, {
						basket_no : $(this).val()
						, buy_qty : $(this).prev().val()
					}
					, function(data, status) {
						if(data >= 1){
							alert("구매 수량을 수정 하였습니다.");
							location.href="${pageContext.request.contextPath}/basket/list";
						} else {
							alert("구매 수량 수정을 실패 하였습니다.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>

	<script type="text/javascript">
	let arr_basket_no = new Array();
	$(document).ready(function() {
		$("#order_btn").click(function() {

			let checks = $("input[type=checkbox]");
			for(let i = 0; i < checks.length; i++){

				if( checks[i].checked == true ) {
					arr_basket_no.push($("#basket_no" + i).val());
				}//if
				
			}//for

			if(arr_basket_no.length <= 0){
				alert("선택된 상품이 없습니다.");
				return;
			}

			location.href="${pageContext.request.contextPath}/order/order_list?arr_basket_no="+arr_basket_no;

		});//click
	});//ready
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		$(".basket_delete_btn").click(function() {

			$.get(
					"${pageContext.request.contextPath}/basket/delete"
					, {
						basket_no : $(this).val()
					}
					, function(data, status) {
						if(data >= 1){
							alert("장바구니를 삭제 하였습니다.");
							location.href="${pageContext.request.contextPath}/basket/list";
						} else {
							alert("장바구니 삭제를 실패 하였습니다.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		$(".order_check_box").click(function() {
			//alert($(this).val() + " : " + $(this).attr("name") + " : " + $(this).attr("id"));

			if( $(this).prop("checked") == true ) {
				$("#span_sum_product_class_qty").text(
					parseInt($("#span_sum_product_class_qty").text()) + 1
				);
				$("#span_sum_buy_amt").text(
						parseInt($("#span_sum_buy_amt").text()) + ( $(this).attr("id")  * $(this).val() )
				);
				$("#span_sum_discount_amt").text(
						parseInt($("#span_sum_discount_amt").text())
						+ ( ( $(this).attr("id") - $(this).attr("name") ) * $(this).val() )
				);
				$("#span_sum_total_buy_amt").text(
						parseInt($("#span_sum_total_buy_amt").text())
						+ ( $(this).attr("name") * $(this).val() )
				);
			} else if( $(this).prop("checked") == false ) {
				$("#span_sum_product_class_qty").text(
						$("#span_sum_product_class_qty").text() - 1
				);
				$("#span_sum_buy_amt").text(
						$("#span_sum_buy_amt").text() - ( $(this).attr("id")  * $(this).val() )
				);
				$("#span_sum_discount_amt").text(
						parseInt( $("#span_sum_discount_amt").text() )
						+ ( ( $(this).attr("id") - $(this).attr("name") ) * $(this).val() )
				);
				$("#span_sum_total_buy_amt").text(
						$("#span_sum_total_buy_amt").text()
						- ( $(this).attr("name") * $(this).val() )
				);
			}//if

		});//click
	});//ready
	</script>

	</body>
</html>
