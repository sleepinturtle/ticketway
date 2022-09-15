<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/restmbrbrdview/detail_page</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3>/restmbrbrdview/detail_page</h3>
		<hr>

		<table class="table table-hover">
			<tbody>
				<tr>
					<th>번호</th>	<td id="bno"></td>
				</tr>
				<tr>
					<th>제목</th>	<td id="btitle"></td>
				</tr>
				<tr>
					<th>작성자</th>	<td id="bmid"></td>
				</tr>
				<tr>
					<th>조회수</th>	<td id="bcnt"></td>
				</tr>
				<tr>
					<th>작성일</th>	<td id="bdate"></td>
				</tr>
				<tr>
					<th>내용</th>	<td id="bcnts"></td>
				</tr>
			</tbody>
		</table>
		<div id="delete_div" class="text-right">
			<button class="btn btn-danger" id="delete_btn"> 게 시 글 삭 제 </button>
		</div>
		<%@ include file="/WEB-INF/views/footer.jsp" %>

		<script type="text/javascript">
		$(document).ready(function() {
			$("#delete_btn").click(function() {

				$.ajax({
					type : "DELETE"
					, url : "${pageContext.request.contextPath}/restmbrbrd/${board_no}"
					, processData : false
					, contentType : false
					, cache : false
					, success : function(result, status, xhr) {
						if(result > 0) {
							alert("삭제 성공");
							location.href = "${pageContext.request.contextPath}/restmbrbrdview/list_page";
						}//if
					}//success
				});//ajax

			});//click
		});//ready
		</script>

		<script type="text/javascript">
		$("#delete_div").hide();
		
		$(document).ready(function() {
			$.get(
					"${pageContext.request.contextPath}/restmbrbrd/${board_no}"
					, {}
					, function( data, status ) {
						$("#bno").text( data.board_no );
						$("#btitle").text( data.title );
						$("#bmid").text( data.mid );
						$("#bcnt").text( data.view_cnt );
						$("#bdate").text( data.write_date );
						$("#bcnts").text( data.contents );

						if("${login_info.mno}" == data.mno){
							$("#delete_div").show();
						}
					}//call back function
					, "json"
			);//get
		});//ready
		</script>

	</body>
</html>













