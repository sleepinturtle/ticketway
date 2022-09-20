<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <c:set var="path" value="${pageContext.request.contextPath}" />
<%
	int writePages = 10;
%>
    <!-- 관리자 메인 페이지 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<!-- 아이콘 -->
	<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
	
   <!-- 구글 폰트 -->
   <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bowlby+One+SC&family=Bungee&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">	
	
	<!-- CSS파일-->

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/CSS/movie/managementMovie.css">

   <!-- 파비콘 설정-->
   <link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">
	
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
	

<title>TICKETWAY</title>
</head>
<body>

<!-- 

	-->
	<jsp:include page="../admin/managerTheme.jsp" />
	
	
	<!-- 메뉴바 밑 컨테이너 -->
<div class = "container-fluid" >
<hr>
<div class = "container">
관리자 공연 관리
</div>
<hr>
</div>

	<div class="container">
		<div class="row" id = "list">
			<div class="col-sm-12">
				<h2>공연 리스트</h2>
				<br>
			</div>
		</div>
		<div class="row" >
			<div class="col-sm-12">
			<div align="right">
			<button type="button" class="btn btn-secondary"  id = "movieBtn" onclick="location.href='${pageContext.request.contextPath }/movieAdmin/writeMovie'">공연 등록</button>
			</div>
			<br>
				<table class="table table-hover" id = "listTable" style = "width: 1111px">
					<thead class="thead-dark">
						<tr>
							<th scope="col">공연번호</th>
							<th scope="col">공연제목</th>
							<th scope="col">장르</th>
							<th scope="col">공연등급</th>
							<th scope="col">러닝타임</th>
							<th>  수정 / 삭제</th>
						</tr>
					</thead>
					<tbody>
		

				<c:forEach var="dto" items="${list }">  <%-- request.getAttribute("list") --%>
					<tr>
						<td>${dto.play_no }</td>
						<td>${dto.play_title }</td>
<%-- 						<td>${dto.thta_director }</td> --%>
<%-- 						<td>${dto.thta_actors }</td> --%>
						<td>${dto.genre }</td>
<%-- 						<td>${dto.thta_openDate }</td> --%>
						<td>${dto.rated }</td>
						<td>${dto.runtime }</td>
						<td><button class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath }/theaterAdmin/updateMovie?mov_num=${dto.play_no }'">수정</button>
						<button class="btn btn-outline-secondary btn-sm" onclick="location.href='${pageContext.request.contextPath }/theaterAdmin/deleteMovieOk?mov_num=${dto.play_no }'">삭제</button></td>				
					</tr>
				</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</div>



	<jsp:include page="../footer.jsp" />

	<!-- JS파일 -->
	<!-- Popper JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>

</body>

<script>
/**
 * 
 */

$(document).ready(function () {
  $('#listTable').DataTable({
     "pagingType": "simple_numbers"
  });
  $('.dataTables_length').addClass('bs-select');
});
</script>

</html>