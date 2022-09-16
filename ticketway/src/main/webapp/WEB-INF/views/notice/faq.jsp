<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>FAQ</title>
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
		    <figure class="snip1527">
		        <div class="image"><img src="${pageContext.request.contextPath}/resources/img/이벤트6.png" alt="pr-sample25" /></div>
		        <figcaption>
		            <div class="date"><span class="day">~30</span><span class="month">Oct</span></div>
		            <h3>운빨 로맨스 관람 &nbsp; &nbsp; 후기 이벤트</h3>
		            <p>
		
		                              관람 후기를 작성하시고 상품을 받아가세요.
		            </p>
		        </figcaption><a href="${pageContext.request.contextPath}/notice/detail?news_no=21"></a>
		    </figure>
		    <figure class="snip1527">
		        <div class="image"><img src="${pageContext.request.contextPath}/resources/img/이벤트9.png" alt="pr-sample25" /></div>
		        <figcaption>
		            <div class="date"><span class="day">종료</span><span class="month">Sep</span></div>
		            <h3>일의 기쁨과 슬픔&nbsp;&nbsp;&nbsp;&nbsp; 전 좌석 추석할인</h3>
		            <p>
		
		                               예매 시 추석 할인을 선택해주세요.	
		            </p>
		        </figcaption><a href="${pageContext.request.contextPath}/notice/detail?news_no=24"></a>
		    </figure>
		</div>
	
		<div class="row" style="justify-content : center;">
			<a class="btn btn-light btn-lg class_btn" href="${pageContext.request.contextPath}/notice/notice_main">전체</a>
			<a class="btn btn-light btn-lg class_btn">공지사항</a>
			<a class="btn btn-light btn-lg class_btn">이벤트</a>
			<a class="btn btn-light btn-lg class_btn" href="${pageContext.request.contextPath}/notice/qna_main">Q&A</a>
			<a class="btn btn-light btn-lg class_btn" href="${pageContext.request.contextPath}/notice/faq">FAQ</a>
		</div>
		<button class="accordion">Section 1</button>
		<div class="panel">
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
		</div>
		
		<button class="accordion">Section 2</button>
		<div class="panel">
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
		</div>
		
		<button class="accordion">Section 3</button>
		<div class="panel">
		  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
		</div>
		<script type="text/javascript">
			var acc = document.getElementsByClassName("accordion");
			var i;
	
			for (i = 0; i < acc.length; i++) {
			  acc[i].addEventListener("click", function() {
			    this.classList.toggle("active");
			    var panel = this.nextElementSibling;
			    if (panel.style.maxHeight) {
			      panel.style.maxHeight = null;
			    } else {
			      panel.style.maxHeight = panel.scrollHeight + "px";
			    } 
			  });
			}
		</script>
	</body>
</html>