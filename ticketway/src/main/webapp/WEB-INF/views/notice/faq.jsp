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
	
		<div class="row" style="justify-content : center;">
			<a class="btn btn-light btn-lg class_btn" href="${pageContext.request.contextPath}/notice/notice_main">전체</a>
			<a class="btn btn-light btn-lg class_btn">공지사항</a>
			<a class="btn btn-light btn-lg class_btn">이벤트</a>
			<a class="btn btn-light btn-lg class_btn">Q&A</a>
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