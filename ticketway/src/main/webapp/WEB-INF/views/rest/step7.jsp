<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>rest step 7</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
			<h3>rest step 7</h3>
		<hr>

		<table class="table table-hover">
			<tbody>
				<tr>
					<th> 제 목 </th>
					<td> <input type="text" class="form-control" id="title"> </td>
				</tr>
				<tr>
					<th> 작 성 자 </th>
					<td> <input type="text" class="form-control" id="writer"> </td>
				</tr>
				<tr>
					<th> 비 밀 번 호 </th>
					<td> <input type="text" class="form-control" id="pwd"> </td>
				</tr>
				<tr>
					<th> 내 용 </th>
					<td> <textarea class="form-control" id="contents"></textarea> </td>
				</tr>
				<tr>
					<td colspan="2" class="text-right">
						<button type="button" id="send_btn" class="btn btn-primary"> 전 송 </button>
					</td>
				</tr>
			</tbody>
		</table>

		<script type="text/javascript">
		$(document).ready(function() {
			$("#send_btn").click(function() {

				let board = {	title : $("#title").val()
								, writer : $("#writer").val()
								, pwd : $("#pwd").val()
								, contents : $("#contents").val()
				};//javascript object 생성	//alert( JSON.stringify( board ) );

				$.ajax({
					type : "post"
					, url : "${pageContext.request.contextPath}/rest2/step7"
					, contentType : "application/json"
					, data : JSON.stringify( board )
					, success : function(data, status, xhr){alert("통신 성공");}
					, error : function(data, status, xhr){alert("에러");}
					, complete : function(data, status, xhr){alert("통신 완료");}
				});//ajax

			});//click
		});//ready
		</script>

		<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>













