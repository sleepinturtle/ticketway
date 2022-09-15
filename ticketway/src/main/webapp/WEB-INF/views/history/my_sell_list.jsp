<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 판매 내역 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 판매 내역 </h3>
		<hr>
		<form action="${pageContext.request.contextPath}/history/my_sell_list" method="get">
			<div class="input-group">
				<div class="input-group-prepend">
					<select class="form-control" id="searchOption" name="searchOption">
						<option value="prdt_name"
							<c:if test="${search_dto.searchOption == 'prdt_name'}">selected="selected"</c:if>
						> 상 품 이 름 </option>
						<option value="mid"
							<c:if test="${search_dto.searchOption == 'mid'}">selected="selected"</c:if>
						> 판 매 자 </option>
					</select>
				</div>
				<input type="text" class="form-control" id="searchWord" name="searchWord"
						value="${search_dto.searchWord}">
				<div class="input-group-append">
					<button type="submit" class="btn btn-primary"> 검 색 </button>
				</div>
			</div>
		</form>
		<table class="table table-hover">
			<col class="col-2">
			<col class="col-2">
			<col class="col-4">
			<col class="col-1">
			<col class="col-3">
			<thead>
				<tr>
					<th> 판매일 </th>
					<th> 상품 이미지 </th>	<th> 상품명 / 주문옵션 / 주문번호 </th>
					<th> 구매자 </th>	<th> 주문상태 </th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>
							${dto.order_date}
							<hr>
							판매금액 : <b>${dto.detail_pay_amt}</b> 원
							<hr>
							<button type="button" class="sell_detail_btn btn btn-link btn-sm" value="${dto.detail_no}">
								판매 상세 보기
							</button>
						</td>
						<td>
							<img src="${dto.thumbnail_path}" class="img-thumbnail">
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/product/detail?prdt_no=${dto.prdt_no}">
								${dto.prdt_name}
							</a>
							<hr>
							수량 : ${dto.detail_qty}
							<hr>
							주문 번호 : ${dto.detail_no}
						</td>
						<td>${dto.mid}</td>
						<td>
							${dto.order_status_name}
							<hr>
							<c:choose>
								<c:when test="${dto.order_status == 3}">
									<button class="order_status_update_btn5 btn btn-danger btn-sm" value="5" name="${dto.detail_no}"> 주 문 확 인 </button>
								</c:when>
								<c:when test="${dto.order_status == 5}">
									<input type="text" maxlength="15" placeholder="택배사 이름">
									<input type="text" maxlength="15" placeholder="운송장 번호">
									<button class="order_status_update_btn7 btn btn-danger btn-sm" value="7" name="${dto.detail_no}"> 송 장 입 력 </button>
								</c:when>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		<ul class="pagination">
			<c:if test="${startPageNum > 10}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/history/my_sell_list?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						Previous
					</a>
				</li>
			</c:if>
			<c:forEach var="page_no" begin="${startPageNum}" end="${endPageNum}">
				<c:choose>
					<c:when test="${page_no == userWantPage}">
						<li class="page-item active mx-auto">
							<a class="page-link">${page_no}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item mx-auto">
							<a class="page-link"
								href="${pageContext.request.contextPath}/history/my_sell_list?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/history/my_sell_list?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						Next
					</a>
				</li>
			</c:if>
		</ul>
		<hr>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<!-- pay detail modal start -->
	<div class="modal" id="pay_detail_modal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"> 결제상세정보 (결제일자 <span id="span_order_date"></span> | 결제번호 <span id="span_order_no"></span>) </h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th> 주문번호 </th>	<th> 상품명 </th>	<th> 수량 </th>	<th> 단가 </th>
								<th> 구매금액 </th>	<th> 할인율 </th>	<th> 할인금액 </th>	<th> 결제금액 </th>
								<th> 판매자 </th>	<th> 주문상태 </th>
							</tr>
						</thead>
						<tbody id="tbody_pay_detail_modal">
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-6">
						<table class="table table-hover table-borderless">
							<tbody>
								<tr>
									<td>
										<div class="card">
											<div class="card-body">
												<h5 class="card-title">배송지정보</h5>
												<p class="card-text">받 는 분 : <span id="span_recipient_name"></span></p>
												<p class="card-text">연 락 처 : <span id="span_tel"></span></p>
												<p class="card-text"> 주 소  : <span id="span_addr"></span></p>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-6">
						<table class="table table-hover table-borderless mr-5">
							<tbody>
								<tr>
									<th> 총 상 품 수 </th>
									<td class="text-right"> <span id="span_sum_product_class_qty"></span> 개 </td>
								</tr>
								<tr>
									<th> 총 구 매 금 액 </th>
									<td class="text-right"> <span id="span_sum_buy_amt"></span> 원 </td>
								</tr>
								<tr>
									<th> 총 할 인 금 액 </th>
									<td class="text-right text-danger"> -<span id="span_sum_discount_amt"></span> 원 </td>
								</tr>
								<tr>
									<th> 신 용 카 드 </th>
									<td class="text-right"> <span id="span_credit_card"></span> </td>
								</tr>
								<tr>
									<th> <h3>총 결 제 금 액</h3> </th>
									<td class="text-right"> <h3><span id="span_sum_total_buy_amt"></span> 원</h3> </td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-warning btn-sm" data-dismiss="modal"> 닫 기 </button>
				</div>

			</div>
		</div>
	</div>
	<!-- pay detail modal end -->

	<script type="text/javascript">
	$(document).ready(function() {

		$(".order_status_update_btn5").click(function() {

			$.post(
					"${pageContext.request.contextPath}/history/update_order_status"
					, {
						detail_no : $(this).attr("name")
						, order_status : $(this).val()
					}
					, function(data, status) {
						if(data >= 1){
							window.location.reload();
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back functiion
			);//post

		});//click

	});//ready
	</script>

	<script type="text/javascript">
	$(document).ready(function() {

		$(".order_status_update_btn7").click(function() {

			if( $.trim( $(this).prev().prev().val() ) == '' ){
				alert("택배사를 입력해 주세요.");
				return;
			}

			if( $.trim( $(this).prev().val() ) == '' ){
				alert("운송장 번호를 입력해 주세요.");
				return;
			}

			$.post(
					"${pageContext.request.contextPath}/history/update_order_status"
					, {
						detail_no : $(this).attr("name")
						, order_status : $(this).val()
						, invoice_company : $.trim( $(this).prev().prev().val() )
						, invoice_number : $.trim( $(this).prev().val() )
					}
					, function(data, status) {
						if(data >= 1){
							window.location.reload();
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back functiion
			);//post

		});//click

	});//ready
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		$(".sell_detail_btn").click(function() {

			$.get(
					"${pageContext.request.contextPath}/history/sell_detail"
					, {
						detail_no : $(this).val()
					}
					, function(data, status) {
						if(data.length >= 1){
							$("#tbody_pay_detail_modal").empty();
							$.each(JSON.parse(data), function(idx, dto) {
								$("#tbody_pay_detail_modal").append(
										"<tr>"
										+ "<td>" + dto.detail_no + "</td>"
										+ "<td>" + dto.prdt_name + "</td>"
										+ "<td>" + dto.detail_qty + "</td>"
										+ "<td>" + dto.detail_price + "</td>"
										+ "<td>" + dto.detail_amt + "</td>"
										+ "<td>" + dto.detail_discount + "</td>"
										+ "<td class='text-danger'>-" + dto.detail_discount_amt + "</td>"
										+ "<td>" + dto.detail_pay_amt + "</td>"
										+ "<td>" + dto.seller_mid + "</td>"
										+ "<td>" + dto.order_status_name + "</td>"
										+ "</tr>"
								);//append
								$("#span_order_no").text(dto.order_no);
								$("#span_order_date").text(dto.order_date);
								$("#span_recipient_name").text(dto.recipient_name);
								$("#span_tel").text(dto.tel);
								$("#span_addr").text("(" + dto.post_code + ")" + dto.addr1 + " " + dto.addr2);
								$("#span_sum_product_class_qty").text(dto.order_product_cnt);
								$("#span_sum_buy_amt").text(dto.order_amt);
								$("#span_sum_discount_amt").text(dto.discount_amt);
								$("#span_sum_total_buy_amt").text(dto.pay_amt);
								$("#span_credit_card").text(dto.card_name + " " + dto.card_number);
							});//each
							$("#pay_detail_modal").modal("show");
						} else {
							alert("결제 정보 조회를 실패 하였습니다.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>

	</body>
</html>
