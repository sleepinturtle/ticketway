<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
	<head>
		<meta charset="UTF-8">
		<title> Home </title>
		
		<!-- CSS파일 -->
   <link rel="stylesheet" href="${path }/resources/css/ksh.css">
   <link rel="stylesheet" href="${path }/resources/css/bki2.css">
   <%@ include file="/WEB-INF/views/header.jsp" %>
	</head>
	<body>
	
 <!-- ======= 슬라이드 사진 ======= -->
    <header id="header">
        <div id="headerCarousel" class="carousel slide carousel-fade" data-ride="carousel">

            <!-- Slide Indicators -->
            <ol class="carousel-indicators">
              <li data-target="#headerCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#headerCarousel" data-slide-to="1"></li>
              <li data-target="#headerCarousel" data-slide-to="2"></li>
            </ol>

            <div class="carousel-inner" role="listbox">
              <!-- Slide 1 -->
            <div class="carousel-item active">
               <div class="carousel-background">
                  <img class="w-100 d-block position-absolute h-100 fit-cover" src="${path}/resources/img/BigBanner_PC_미세스다웃파이어.jpg" alt="">
               </div>
               <div class="carousel-container">
                  <div class="carousel-content">
                     <h2>
                        <!-- <span>The Note Book </span>  -->
                     </h2>
                     <!-- 
                     <p>It is a long established fact that a reader will be
                        distracted by the readable content of a page when looking at its
                        layout. The point of using Lorem Ipsum is that it has a
                        more-or-less normal distribution of letters, as opposed to using
                        ‘Content here, content here’, making it look like readable
                        English.</p>
                        <a href="#" class="contactus-btn" data-toggle="modal"
                        data-target="#videoModal"
                        data-theVideo="https://www.youtube.com/embed/loFtozxZG0s">VIDEO</a>
                     aacaaa★
                      -->
                      <a href="${path}/perform/detail?play_no=16" class="contactus-btn">상세정보</a>


                  </div>
                           </div>
                           
                        </div>

                        <!-- Slide 2 -->
                        <div class="carousel-item">
                           <div class="carousel-background">
                              <img class="w-100 d-block position-absolute h-100 fit-cover" src="${path}/resources/img/BigBanner_PC_연극아트_인물이미지ver.jpg" alt="">
                           </div>
                           <div class="carousel-container">
                              <div class="carousel-content">
                                 <!-- 
                                 <h2>Where does it come from</h2>
                                 <p>It is a long established fact that a reader will be
                                    distracted by the readable content of a page when looking at
                                    its layout. The point of using Lorem Ipsum is that it has a
                                    more-or-less normal distribution of letters, as opposed to
                                    using ‘Content here, content here’, making it look like
                                    readable English.</p>
                                 
                                  -->
                                  <a href="${path}/perform/detail?play_no=4" class="contactus-btn">상세정보</a>
                              </div>
                           </div>
                        </div>

                        <!-- Slide 3 -->
                        <div class="carousel-item">
                           <div class="carousel-background">
                              <img class="w-100 d-block position-absolute h-100 fit-cover" src="${path}/resources/img/BigBanner_PC_푸에르자.jpg" alt="">
                           </div>
                           <div class="carousel-container">
                              <div class="carousel-content">
                              <!-- 
                                 <h2>Why do we use it</h2>
                                 <p>There are many variations of passages of Lorem Ipsum
                                    available, but the majority have suffered alteration in some
                                    form, by injected humour, or randomised words which don’t
                                    look even slightly believable. If you are going to use a
                                    passage of Lorem Ipsum, you need to be sure there isn’t
                                    anything embarrassing hidden in the middle of text.</p>
                                 <a href="#" class="contactus-btn">상세정보</a>
                              -->
                              <a href="${path}/perform/detail?play_no=27" class="contactus-btn">상세정보</a>
                              </div>
                           </div>
                        </div>
                     </div>

                     <!-- Carousel pre and next arrow -->
            <a class="carousel-control-prev" href="#headerCarousel" role="button" data-slide="prev">
          
            </a>

            <a class="carousel-control-next" href="#headerCarousel" role="button" data-slide="next">
         
            </a>
        </div>
    </header>
    <section class="common_section section_list_ranking">
		<div class="common_inner">
			<div class="section_heading">
			<h2 class="section_title">뮤지컬 예매 랭킹</h2>
				<a class="btn_hyperlink" href="${path}/perform/mlist">전체보기</a>
			</div>
			<div class="ranking_filter">
				<div class="common_tab type_capsule">
				</div>
			</div>
			<div class="product_grid" style="">
				<ul class="product_grid_list type_col5">
				 <c:forEach var="dto" items="${list1}" end="4" varStatus="status">
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
    <section class="common_section section_list_ranking">
		<div class="common_inner">
			<div class="section_heading">
			<h2 class="section_title">연극 예매 랭킹</h2>
				<a class="btn_hyperlink" href="${path}/perform/plist">전체보기</a>
			</div>
			<div class="ranking_filter">
				<div class="common_tab type_capsule">
				</div>
			</div>
			<div class="product_grid" style="">
				<ul class="product_grid_list type_col5">
				 <c:forEach var="dto" items="${list2}" end="4" varStatus="status">
				 <c:set var = "r" value="${r+1}"/>
					<li class="product_grid_item">
						<div class="product_grid_unit">
							<a class="product_link" href="${path}/perform/detail?play_no=${dto.play_no}">
								<div class="product_imgbox">
									<span class="product_ranking">
										
										<span class="product_rank">${r}<span class="blind">위</span></span>
										
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
    <section>
    	
    		            <div class="container">
	                	<table class="table table-hover">
	                		<tr>
	                			<td><h2>회사명 : (주)티켓웨이</h2></td>
	                		</tr>
	                		<tr>
	                			<td><h2>02-123-4567</h2></td>
	                		</tr>
	                		<tr>
	                			<td><h2>ticketway@gmail.com</h2></td>
	                		</tr>
	                		<tr>
	                			<td><h2>도로명 : 서울 마포구 백범로 23   3층</h2></td>
	                		</tr>
	                		<tr>
	                			<td><h2>지번 : 신수동 63-14 3층 </h2></td>
	                		</tr>
	                		<tr>
	                			<td><h2>우편번호 : 04108 </h2></td>
	                		</tr>
	                	</table>  
                    </div>
                   
    	
    </section>   
    <div class="float-start float-md-end mt-5 mt-md-0 search-area"></div>


	</body>
</html>












