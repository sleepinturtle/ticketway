<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>연극</title>
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.1/css/all.min.css">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Montserrat&amp;display=swap"rel="stylesheet">
  <link rel="stylesheet" href="${path }/resources/css/bki.css">
  <link rel="stylesheet" href="${path }/resources/css/bki2.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bowlby+One+SC&family=Bungee&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
   

	<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
</head>
	
	<%@ include file="/WEB-INF/views/header.jsp" %>

	<style>
		
	.swiper {
	  width: 1800px;
	  height: 600px;
	}
	
/*  	.container{  */

/*  	  max-width : 1700px;	  */
/*  	}  */
	</style>
	
	
	<body>
	
	
	<br>
	
	<section class="common_section section_list_title">
		<div class="page_heading">
		<h1 class="page_title">공연</h1>
			<div class="common_tab type_underline">
				<div class="common_tab_area">
					<ul class="common_tab_list" role="tablist">
						<li class="common_tab_item" role="none">
							<button type="button" class="common_tab_btn" role="tab" aria-selected="true">연극</button></li>
<!-- 						<li class="common_tab_item" role="none"> -->
<!-- 							<button type="button" class="common_tab_btn" role="tab" aria-selected="false">연극</button></li> -->
					</ul>
				</div>
			</div>
		</div>
	<hr>
	</section>
	<!-- Slider main container -->
	<div class="swiper">
	  <!-- Additional required wrapper -->
	  <div class="swiper-wrapper">
	    <!-- Slides -->
	    <div class="swiper-slide">
	    	<img alt="slide1" src="${path}/resources/img/BigBanner_PC_연극아트_인물이미지ver.jpg">
		</div>
	    
	    
	  </div>
	  <!-- If we need pagination -->
	  <div class="swiper-pagination"></div>
	
	  <!-- If we need navigation buttons -->
	  <div class="swiper-button-prev"></div>
	  <div class="swiper-button-next"></div>
	
	  <!-- If we need scrollbar -->
	  <div class="swiper-scrollbar"></div>
	</div>
	
	<!-- 공연 랭킹 -->
	<section class="common_section section_list_ranking">
		<div class="common_inner">
			<div class="section_heading">
			<h2 class="section_title">랭킹</h2>
				<a class="btn_hyperlink" href="#box1">전체보기</a>
			</div>
			<div class="ranking_filter">
				<div class="common_tab type_capsule">
				</div>
			</div>
			<div class="product_grid" style="">
				<ul class="product_grid_list type_col5">
				 <c:forEach var="dto" items="${list}" end="4" varStatus="status">
				 <c:set var = "i" value="${i+1}"/>
					<li class="product_grid_item">
						<div class="product_grid_unit">
							<a class="product_link" href="${path}/perform/detail?play_no=${dto.play_no}">
								<div class="product_imgbox">
									<span class="product_ranking">
										
										<span class="product_rank">${i}<span class="blind">위</span></span>
										
									</span>
									<img class="product_img" alt="상품 이미지" src="${dto.play_thumbnail}">
								</div>
								<div class="product_info">
									<span class="product_title">${dto.play_title}</span>
									<div class="product_sideinfo"><span class="product_period">${dto.open_date}~${dto.close_date}</span></div>
								</div>
							</a>
						</div>
					</li>
				</c:forEach>
				</ul>
			</div>
		</div>
	</section>
	
	
	
	<!-- 공연 전체 보기 -->
	 <section class="conA">
      <div class=box1 id="box1">
         <div class="container">
            <h3 class="text-left" id = "boxName">티켓오픈</h3>
            <hr>
            <div class="row mt-30">
             <c:forEach var="dto" items="${list}" varStatus="status">
               <div class="col-md-4 col-sm-6">
                  <div class="boxMovie">
                     <img src="${dto.play_thumbnail}" alt="" height="50" width="70" class="img-fluid rounded shadow-sm">
                    <a href="${path}/perform/detail?play_no=${dto.play_no}">
                     <div class="box-content">
                        <h3 class="title">${dto.play_title }</h3>
                     </div>
                 	</a>
                  </div>
                  <br>
               </div>
              </c:forEach>
               
            </div>
         </div>
      </div>
   </section>
   
   	<script>
	$(document).ready(function(){
		// Add minus icon for collapse element which is open by default
		$(".collapse.show").each(function(){
			$(this).prev(".card-header").addClass("highlight");
		});
		
		// Highlight open collapsed element 
		$(".card-header .btn").click(function(){
			$(".card-header").not($(this).parents()).removeClass("highlight");
			$(this).parents(".card-header").toggleClass("highlight");
		});
	});
	
	$(window).scroll(function() {
	    $(".slideanim").each(function(){
	      var pos = $(this).offset().top;
	
	      var winTop = $(window).scrollTop();
	        if (pos < winTop + 600) {
	          $(this).addClass("slide");
	        }
	    });
	  });
	
	
	const swiper = new Swiper('.swiper', {
		  // Optional parameters
		  direction: 'vertical',
		  loop: true,

		  // If we need pagination
		  pagination: {
		    el: '.swiper-pagination',
		  },

		  // Navigation arrows
		  navigation: {
		    nextEl: '.swiper-button-next',
		    prevEl: '.swiper-button-prev',
		  },

		  // And if we need scrollbar
		  scrollbar: {
		    el: '.swiper-scrollbar',
		  },
		});

	</script>
   
   	<script type="text/javascript" src="${path }/resources/js/bki.js"></script>
	</body>
</html>