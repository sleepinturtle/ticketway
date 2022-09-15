<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<style type="text/css">
		#app-navbar {
			  background: linear-gradient(120deg, #dda4cd, #afc3f5);
			}
		</style>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="//cdn.ckeditor.com/4.19.1/standard/ckeditor.js"></script>
			<div class="text-right">
				<c:choose>
					<c:when test="${login_info != null && login_info.mid != null}">
					${login_info.mid}
						<div class="btn-group">
							<a href="${pageContext.request.contextPath}/mypage/list">
								<button type="button" class="btn btn-link btn-sm">마이페이지</button>
							</a>
							<a href="${pageContext.request.contextPath}/">
								<button type="button" class="btn btn-link btn-sm">예매 내역</button>
							</a>
							<a href="${pageContext.request.contextPath}/message/list">
								<button type="button" class="btn btn-link btn-sm">고객센터</button>
							</a>
							<a href="${pageContext.request.contextPath}/logout">
								<button type="button" class="btn btn-link btn-sm">LOGOUT</button>
							</a>
				
						</div>
					</c:when>
					<c:otherwise>
						<div class="btn-group">
							<a href="${pageContext.request.contextPath}/login_form">
								<button type="button" class="btn btn-link btn-sm">LOGIN</button>
							</a>
							<a href="${pageContext.request.contextPath}/join/form">
								<button type="button" class="btn btn-link btn-sm">JOIN</button>
							</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<nav id="app-navbar" class="navbar navbar-expand-sm bg-dark navbar-dark">
				<!-- Brand -->
				<a class="navbar-brand" href="${pageContext.request.contextPath}/">ticketway</a>
				
				<!-- Links -->
				<ul class="navbar-nav">

					<!-- Dropdown -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
							예매
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/ticketing/list">
								현재 상영작 </a>
						</div>
					</li>

					<!-- Dropdown -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
							상품
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/">
								연극 / 뮤지컬</a>
						</div>
					</li>

					<!-- Dropdown -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
							새소식
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/notice/notice_main">
							         공지사항</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/">
								이벤트</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/">
								Q&A</a>
							
						</div>
					</li>

					

				</ul>
			</nav>
			
