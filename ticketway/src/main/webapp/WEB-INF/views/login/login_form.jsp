<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 로그인 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<div class="container" style="justify-content: center;">
		<hr>
		<h3> 로그인 </h3>
		<hr>
		<table class="table table-hover">
			<tbody>
				<tr>
					<th> 아 이 디 </th>
					<td>
						<input type="text" id="mid" name="mid" maxlength="20" class="form-control">
					</td>
				</tr>
				<tr>
					<th> 패 스 워 드 </th>
					<td>
						<input type="password" id="mpwd" name="mpwd" maxlength="20" class="form-control">
					</td>
				</tr>
			
					<td colspan="2">
						<button id="login_btn" type="button" class="btn btn-primary float-right"> 로 그 인 </button>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
	<%@ include file="/WEB-INF/views/footer.jsp" %>

	<script type="text/javascript">
	$(document).ready(function() {//테스트용 스크립트 -> 테스트 후 삭제
		$("input[type='radio']").click(function() {
			$("#mid").val( $(this).val() );
			$("#mpwd").val("1111");
		});//click
	});//ready
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		$("#login_btn").click(function() {

			$.post(
					"${pageContext.request.contextPath}/login"
					, {
						mid : $("#mid").val()
						, mpwd : $("#mpwd").val()
					}
					, function(data, status) {
						if(data == 0){
							alert("아이디와 패스워드가 올바르지 않습니다.");
						} else if(data == 1){
							location.href = "${pageContext.request.contextPath}/";
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post

		});//click
	});//ready
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		$("#mpwd").keyup(function() {

			if(event.keyCode == 13) {
				$("#login_btn").click();
			}

		});//click
	});//ready
	</script>

	</body>
</html>









