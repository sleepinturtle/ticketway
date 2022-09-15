<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/restmbrbrdview/list_page</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3>/restmbrbrdview/list_page</h3>
		<hr>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>	<th>제목</th>	<th>작성자</th>	<th>조회수</th>	<th>작성일</th>
				</tr>
			</thead>
			<tbody id="list_tbody">
			</tbody>
		</table>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
		<script type="text/javascript">
		$(document).ready(function() {
			$.get(
					"${pageContext.request.contextPath}/restmbrbrd/list"
					, {}
					, function(data, status) {
						//alert(data);

						$.each(data, function(index, dto) {
							$("#list_tbody").append(
								"<tr>"
								+ "<td>" + dto.board_no + "</td>"
+ "<td><a href='${pageContext.request.contextPath}/restmbrbrdview/detail_page?board_no=" + dto.board_no + "'>"
									+ dto.title + "</a></td>"
								+ "<td>" + dto.mid + "</td>"
								+ "<td>" + dto.view_cnt + "</td>"
								+ "<td>" + dto.write_date + "</td>"
								+ "</tr>"
							);//append
						});//each

					}//call back function
					, "json"
			);//get
		});//ready
		</script>
	</body>
</html>









