<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		  <meta charset="utf-8"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
		<table class="table">
			<tbody>
				<c:forEach var="dto" items="${cardlist}" varStatus="status">
					<tr>
						<td id="td_credit_card${status.index}" class="border-top-0">
							<div class="card">
								<div class="card-body">
									<h5 class="card-title">${dto.card_name}</h5>
									<p class="card-text">카드 번호 : ${dto.card_num}</p>
									<p class="card-text">유효 기간 (MM/YY) : ${dto.exp_date1} / ${dto.exp_date2}</p>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</body>
</html>
