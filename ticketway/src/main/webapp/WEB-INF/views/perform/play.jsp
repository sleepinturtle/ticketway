<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>play</title>
			
			<link rel="stylesheet" href="${path }/resources/css/bki.css">
			
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	 <section class="conA">
      <div class=box1>
         <div class="container">
<!--             <h3 class="text-center" id = "boxName"></h3> -->
            
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

</script>
   
   <script type="text/javascript" src="${path }/resources/js/bki.js"></script>
	</body>
</html>