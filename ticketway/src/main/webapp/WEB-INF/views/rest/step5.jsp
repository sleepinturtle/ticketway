<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>rest step 5</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/header.jsp" %>

		<hr>
			<h3>rest step 5</h3>
		<hr>

		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">이곳에 숫자를 입력하세요</span>
			</div>
			<input type="number" class="form-control" id="num_txt">
			<div class="input-group-append">
				<button type="button" id="num_send_btn" class="btn btn-primary"> 숫 자 전 송 </button>
			</div>
		</div>

		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">위의 숫자와 이곳에 문자를 입력하세요</span>
			</div>
			<input type="text" class="form-control" id="txt1">
			<div class="input-group-append">
				<button type="button" id="txt_send_btn" class="btn btn-primary"> 숫 자 와 문 자 전 송 </button>
			</div>
		</div>

		<script type="text/javascript">
		$(document).ready(function() {

			$("#txt_send_btn").click(function() {
				location.href = "${pageContext.request.contextPath}/rest2/step6/"
								+ num_txt.value + "/" + txt1.value;
			});//click

			$("#num_send_btn").click(function() {
				location.href = "${pageContext.request.contextPath}/rest2/step5/" + num_txt.value;
			});//click

		});//ready
		</script>

		<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>













