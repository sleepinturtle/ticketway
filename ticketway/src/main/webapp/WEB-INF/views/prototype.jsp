<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>CSS Cards</title>
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.1/css/all.min.css">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Montserrat&amp;display=swap"rel="stylesheet">
  <link rel="stylesheet" href="${path }/resources/css/bki.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>

	<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
</head>

	<style>
		
	.swiper {
	  width: 1500px;
	  height: 600px;
	}
	</style>

<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<!-- Slider main container -->
	<div class="swiper">
	  <!-- Additional required wrapper -->
	  <div class="swiper-wrapper">
	    <!-- Slides -->
	    <div class="swiper-slide">Slide 1</div>
	    <div class="swiper-slide">Slide 2</div>
	    <div class="swiper-slide">Slide 3</div>
	    ...
	  </div>
	  <!-- If we need pagination -->
	  <div class="swiper-pagination"></div>
	
	  <!-- If we need navigation buttons -->
	  <div class="swiper-button-prev"></div>
	  <div class="swiper-button-next"></div>
	
	  <!-- If we need scrollbar -->
	  <div class="swiper-scrollbar"></div>
	</div>


	
	 <section class="conA">
      <div class=box1>
         <div class="container">
            <h3 class="text-left" id = "boxName">티켓 오픈</h3>
            
            <br>
            <div class="row mt-30">
             <c:forEach var="dto" items="${list}" varStatus="status">
               <div class="col-md-4 col-sm-6">
                  <div class="boxMovie">
                     <img src="${dto.play_thumbnail}" alt="" height="50" width="70" class="img-fluid rounded shadow-sm">
                     <div class="box-content">
                        <h3 class="title">${dto.play_title }</h3>
                        <ul class="icon">
                           <li><a href="${path }/movieUser/openMovieList"><i class="fa fa-search"></i></a></li>
                           <li><a href="#"><i class="fa fa-link"></i></a></li>
                        </ul>
                     </div>
                  </div>
                  <br>
               </div>
              </c:forEach>
               
            </div>
         </div>
      </div>
   </section>

<script type="text/javascript" src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.3.3/gsap.min.js"></script>
<script type="text/javascript" src="${path }/resources/test/script.js"></script>
<script type="text/javascript">

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
</body>
</html>