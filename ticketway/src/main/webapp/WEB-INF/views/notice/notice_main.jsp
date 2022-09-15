<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>새소식</title>
		<%@ include file="/WEB-INF/views/header.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/yth.css" type="text/css">
	</head>
	<body>
		<div class="row">
		    <figure class="snip1527">
		        <div class="image"><img src="${pageContext.request.contextPath}/resources/img/이벤트1.png" alt="pr-sample23" /></div>
		        <figcaption>
		            <div class="date"><span class="day">28</span><span class="month">Oct</span></div>
		            <h3>푸에르자부르타 <br>웨이라 인 서울</h3>
		            <p>
		
		               	 기대평을 작성하신 분들 중 3분을 추첨하여 공연 초대권을 드립니다.
		            </p>
		        </figcaption><a href="${pageContext.request.contextPath}/notice/detail?news_no=16"></a>
		    </figure>
		    <figure class="snip1527">
		        <div class="image"><img src="${pageContext.request.contextPath}/resources/img/이벤트3.png" alt="pr-sample24" /></div>
		        <figcaption>
		            <div class="date"><span class="day">17</span><span class="month">Nov</span></div>
		            <h3>아트</h3>
		            <p>
		
		               	 연극 아트에 대한 기대평을 남겨주세요. 추첨을 통해 초대권을 드립니다.
		            </p>
		        </figcaption><a href="${pageContext.request.contextPath}/notice/detail?news_no=26"></a>
		    </figure>
		    <figure class="snip1527">
		        <div class="image"><img src="${pageContext.request.contextPath}/resources/img/이벤트10.jpg" alt="pr-sample25" /></div>
		        <figcaption>
		            <div class="date"><span class="day">01</span><span class="month">Dec</span></div>
		            <h3>대구형 문화소비 할인쿠폰 <br> 이벤트</h3>
		            <p>
		
		                               대구 문화소비 할인 쿠폰을 받으세요.	
		            </p>
		        </figcaption><a href="${pageContext.request.contextPath}/notice/detail?news_no=28"></a>
		    </figure>
		</div>
		
		<div class="row" style="justify-content : center;">
			<a class="btn btn-light btn-lg class_btn" href="${pageContext.request.contextPath}/notice/notice_main">전체</a>
			<a class="btn btn-light btn-lg class_btn">공지사항</a>
			<a class="btn btn-light btn-lg class_btn">이벤트</a>
			<a class="btn btn-light btn-lg class_btn">Q&A</a>
			<a class="btn btn-light btn-lg class_btn" href="${pageContext.request.contextPath}/notice/faq">FAQ</a>
		</div>
		
		<div class="container mt-3">
		<div class="clearfix mb-3">
			<a href="${pageContext.request.contextPath}/notice/write_form">
				<button class="btn btn-primary float-right"> 글 쓰러 가기 </button>
			</a>
		</div>
		<table id="list" class="table table-hover">
			<thead>
				<tr>
					<th> 글번호 </th> <th>분류</th> 	<th> 제목 </th>	<th> 작성자 </th>	<th> 조회수 </th>	<th> 작성일 </th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.news_no}</td>
						<td>${dto.class_no}</td>
						<td>
							<a href="${pageContext.request.contextPath}/notice/detail?news_no=${dto.news_no}">
								${dto.title}
							</a>
						</td>
						<td>${dto.mid}</td>
						<td>${dto.view_cnt}</td>
						<td>${dto.news_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		<ul class="pagination" style="justify-content : center;">
			<c:if test="${startPageNum > 10}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/notice/notice_main?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						Previous
					</a>
				</li>
			</c:if>
			<c:forEach var="page_no" begin="${startPageNum}" end="${endPageNum}">
				<c:choose>
					<c:when test="${page_no == userWantPage}">
						<li class="page-item active">
							<a class="page-link">${page_no}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link"
								href="${pageContext.request.contextPath}/notice/notice_main?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/notice/notice_main?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						Next
					</a>
				</li>
			</c:if>
		</ul>
		</div>
	</body>
	
</html>