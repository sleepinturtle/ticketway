<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 신 용 카 드 추 가 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
		.write_label {
			font-size : 0.7em;
			color : red;
		}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 신 용 카 드 추 가 </h3>
		<hr>
		<div class="row">
			<div class="col-6">
				<table class="table table-hover table-borderless">
					<col class="col-11">
					<tbody>
						<c:forEach var="dto" items="${list}" varStatus="status">
							<tr>
								<td id="td_credit_card${status.index}">
									<div class="card">
										<div class="card-body">
											<h5 class="card-title">${dto.card_name}</h5>
											<p class="card-text">카드 번호 : ${dto.card_num}</p>
											<p class="card-text">유효 기간 (MM/YY) : ${dto.exp_date1} / ${dto.exp_date2}</p>
										</div>
									</div>
								</td>
								<td class="text-right">
									<button class="card_delete_btn btn btn-danger btn-sm" value="${dto.card_no}"> X </button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-6">
				<table class="table table-hover">
					<tbody>
						<tr>
							<th> 카 드 이 름 </th>
							<td>
								<input type="text" class="form-control" id="card_name" name="card_name" maxlength="20">
								<label for="card_name" id="card_name_label" class="write_label"></label>
							</td>
						</tr>
						<tr>
							<th> 카 드 번 호 </th>
							<td>
								<p class="input-group">
									<input type="text" class="form-control" id="card_number1" name="card_number1" maxlength="4">
									<input type="text" class="form-control" id="card_number2" name="card_number2" maxlength="4">
									<input type="text" class="form-control" id="card_number3" name="card_number3" maxlength="4">
									<input type="text" class="form-control" id="card_number4" name="card_number4" maxlength="4">
								</p>
								<label for="card_number1" id="card_number1_label" class="write_label"></label>
							</td>
						</tr>
						<tr>
							<th> 유 효 기 간 </th>
							<td>
								<p class="input-group">
									<select id="exp_date1" name="exp_date1" class="form-control">
										<option value="0"> 선 택 </option>
										<c:forEach var="mm" begin="1" end="12">
											<option
												<c:choose>
													<c:when test="${mm < 10}">value="0${mm}"</c:when>
													<c:otherwise>value="${mm}"</c:otherwise>
												</c:choose>
											>
												<c:choose>
													<c:when test="${mm < 10}">0${mm}</c:when>
													<c:otherwise>${mm}</c:otherwise>
												</c:choose>
											</option>
										</c:forEach>
									</select>
									<select id="exp_date2" name="exp_date2" class="form-control">
										<option value="0"> 선 택 </option>
										<c:forEach var="yyyy" begin="${yearString}" end="${yearString + 10}">
											<option value="${yyyy}">${yyyy}</option>
										</c:forEach>
									</select>
								</p>
								<label for="exp_date1" id="expiry_date_month_label" class="write_label"></label>
							</td>
						</tr>
						<tr>
							<th> C V C </th>
							<td>
								<input type="text" class="form-control" id="cvc_code" name="cvc_code" maxlength="3" placeholder="신용 카드 뒷면 숫자 세자리">
								<label for="cvc_code" id="cvc_code_label" class="write_label"></label>
							</td>
						</tr>
						<tr>
							<th> 비 밀 번 호 </th>
							<td>
								<input type="text" class="form-control" id="card_pwd" name="card_pwd" maxlength="2" placeholder="신용 카드 비밀번호 앞 두자리">
								<label for="card_pwd" id="card_pwd_label" class="write_label"></label>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center">
								<button id="write_btn" type="button" class="btn btn-primary btn-block"> 저장 </button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<hr>
	<%@ include file="/WEB-INF/views/footer.jsp" %>

	<script type="text/javascript">
	$(document).ready(function() {
		$(".card_delete_btn").click(function() {

			$.get(
					"${pageContext.request.contextPath}/card_info/delete"
					, {
						card_no : $(this).val()
					}
					, function(data, status) {
						if(data >= 1){
							alert("신용 카드를 삭제 하였습니다.");
							location.href="${pageContext.request.contextPath}/card_info/form";
						} else {
							alert("신용 카드 삭제를 실패 하였습니다.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>

	<script type="text/javascript">
	let onlyNum = /^[0-9]+$/;

	$(document).ready(function() {
		$("#write_btn").click(function() {

			if( $.trim( $("#card_name").val() ) == "" ){
				$("#card_name_label").text("신용 카드 이름을 입력 하세요.");
				return;
			} else { $("#card_name_label").text(""); }

			if( $("#card_number1").val().match(onlyNum) == null
					|| $("#card_number2").val().match(onlyNum) == null
					|| $("#card_number3").val().match(onlyNum) == null
					|| $("#card_number4").val().match(onlyNum) == null ){//허용되지 않은 글자는 null.
				$("#card_number1_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#card_number1_label").text(""); }

			if( $("#exp_date1").val() == 0
					|| $("#exp_date2").val() == 0 ){//허용되지 않은 글자는 null.
				$("#exp_dat1_label").text("필수 입력 입니다.");
				return;
			} else { $("#exp_date1_label").text(""); }

			if( $("#cvc_code").val().match(onlyNum) == null ){//허용되지 않은 글자는 null.
				$("#cvc_code_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#cvc_code_label").text(""); }

			if( $("#card_pwd").val() == 0 ){//허용되지 않은 글자는 null.
				$("#card_pwd_label").text("필수 입력 사항이며, 숫자만 허용 됩니다.");
				return;
			} else { $("#card_pwd_label").text(""); }

			$.post(
					"${pageContext.request.contextPath}/card_info/insert"
					, {
						card_name : $("#card_name").val()
						, card_num : $("#card_number1").val()
										+ "-" + $("#card_number2").val()
										+ "-" + $("#card_number3").val()
										+ "-" + $("#card_number4").val()
						, exp_date1 : $("#exp_date1").val()
						, exp_date2 : $("#exp_date2").val()
						, cvc_code : $("#cvc_code").val()
						, card_pwd : $("#card_pwd").val()
					}
					, function(data, status) {
						if(data >= 1){
							alert("신용 카드를 성공적으로 등록 하였습니다.");
							location.href="${pageContext.request.contextPath}/card_info/form";
						} else if(data <= 0){
							alert("신용 카드 등록을 실패 하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post

		});//click
	});//ready
	</script>

	</body>
</html>
