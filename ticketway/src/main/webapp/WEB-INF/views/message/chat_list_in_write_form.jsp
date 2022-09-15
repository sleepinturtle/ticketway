<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
	<body>
		<table class="table table-borderless">
			<tbody>
				<c:forEach var="msg_dto" items="${chat_list}" varStatus="status">
					<tr>
						<td>
							<div class="card" style="width: 18rem;">
								<div class="card-body">
									<h5 class="card-title">${msg_dto.send_mid} : ${msg_dto.content}</h5>
									<p class="card-text">${msg_dto.send_time}</p>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</body>
</html>
