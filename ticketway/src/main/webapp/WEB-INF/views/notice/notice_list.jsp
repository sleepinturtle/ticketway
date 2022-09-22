<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항</title>
		<%@ include file="/WEB-INF/views/header.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/yth.css" type="text/css">
	</head>
	<body>
		<div class="row" style="justify-content: center;">
		    <figure class="snip1527">
		        <div class="image"><img src="${pageContext.request.contextPath}/resources/img/이벤트1.png" alt="pr-sample23" /></div>
		        <figcaption>
		            <div class="date"><span class="day">~16</span><span class="month">Sep</span></div>
		            <h3>푸에르자부르타 <br>웨이라 인 서울</h3>
		            <p>
		
		               	 기대평을 작성하신 분들 중 3분을 추첨하여 공연 초대권을 드립니다.
		            </p>
		        </figcaption><a href="${pageContext.request.contextPath}/notice/detail?news_no=16"></a>
		    </figure>
		    <figure class="snip1527">
		        <div class="image"><img src="${pageContext.request.contextPath}/resources/img/이벤트3.png" alt="pr-sample24" /></div>
		        <figcaption>
		            <div class="date"><span class="day">~13</span><span class="month">Sep</span></div>
		            <h3>아트<br></h3>
		            <p>
		
		               	 연극 아트에 대한 기대평을 남겨주세요. 추첨을 통해 초대권을 드립니다.
		            </p>
		        </figcaption><a href="${pageContext.request.contextPath}/notice/detail?news_no=26"></a>
		    </figure>
		    <figure class="snip1527">
		        <div class="image"><img src="${pageContext.request.contextPath}/resources/img/이벤트10.jpg" alt="pr-sample25" /></div>
		        <figcaption>
		            <div class="date"><span class="day">~30</span><span class="month">Sep</span></div>
		            <h3>대구형 문화소비 할인쿠폰 </h3>
		            <p>
		
		                               대구 문화소비 할인 쿠폰을 받으세요.	
		            </p>
		        </figcaption><a href="${pageContext.request.contextPath}/notice/detail?news_no=28"></a>
		    </figure>
		    <figure class="snip1527">
		        <div class="image"><img src="${pageContext.request.contextPath}/resources/img/이벤트4.png" alt="pr-sample25" /></div>
		        <figcaption>
		            <div class="date"><span class="day">~30</span><span class="month">Sep</span></div>
		            <h3>옥탑방 고양이 후기  이벤트<br></h3>
		            <p>
		
		                               관람 후기를 작성하시고 상품을 받아가세요.	
		            </p>
		        </figcaption><a href="${pageContext.request.contextPath}/notice/detail?news_no=19"></a>
		    </figure>
		    <figure class="snip1527">
		        <div class="image"><img src="${pageContext.request.contextPath}/resources/img/이벤트5.png" alt="pr-sample25" /></div>
		        <figcaption>
		            <div class="date"><span class="day">~30</span><span class="month">Sep</span></div>
		            <h3>이 구역의 이기적인 X&nbsp;<br> 관람 후기 이벤트</h3>
		            <p>
		
		                	관람 후기를 작성하시고 상품을 받아가세요.
		            </p>
		        </figcaption><a href="${pageContext.request.contextPath}/notice/detail?news_no=20"></a>
		    </figure>
		    
		    
		</div>
		
		<div class="row" style="justify-content : center;">
			<a class="btn btn-light btn-lg class_btn" href="${pageContext.request.contextPath}/notice/notice_main" id="all">전체</a>
			<a class="btn btn-light btn-lg class_btn" id="notice_list" href="${pageContext.request.contextPath}/notice/notice_list">공지사항</a>
			<a class="btn btn-light btn-lg class_btn" id="event_list" href="${pageContext.request.contextPath}/notice/event_list">이벤트</a>
			<a class="btn btn-light btn-lg class_btn" href="${pageContext.request.contextPath}/notice/qna_main">Q&A</a>
			<a class="btn btn-light btn-lg class_btn" href="${pageContext.request.contextPath}/notice/faq">FAQ</a>
		</div>
		
		<div class="container mt-3">
		<div class="clearfix mb-3" id="write_area">
			<a href="${pageContext.request.contextPath}/notice/write_form">
				<button class="btn btn-primary float-right"> 글 쓰러 가기 </button>
			</a>
		</div>
		<div id="wholelist">
		<table class="table table-hover">
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
		<ul id="notice_page" class="pagination" style="justify-content : center;">
			<c:if test="${startPageNum > 10}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/notice/notice_list?userWantPage=${startPageNum-1}">
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
								href="${pageContext.request.contextPath}/notice/notice_list?userWantPage=${page_no}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/notice/notice_list?userWantPage=${page_no+1}">
						Next
					</a>
				</li>
			</c:if>
		</ul>
		
		</div>
		
		</div>
	</body>
	<script type="text/javascript">
	
	
		$(document).ready(function() {
			if(${login_info.mgr_yn == 0}){
				$("#write_area").hide();
			}
			if(${login_info.mno == null}){
				$("#write_area").hide();
			}
			
			
			
		});
	</script>
</html>