<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
	<head>
		<meta charset="UTF-8">
		<title> Home </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<!-- CSS파일 -->
   <link rel="stylesheet" href="${path }/resources/css/ksh.css">
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
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
                  <img class="w-100 d-block position-absolute h-100 fit-cover" src="https://cdn.bootstrapstudio.io/placeholders/1400x800.png" alt="">
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
                     
                      -->
                      <a href="${path }/movieUser/openMovieList"" class="contactus-btn">상세정보</a>


                  </div>
                           </div>
                           
                        </div>

                        <!-- Slide 2 -->
                        <div class="carousel-item">
                           <div class="carousel-background">
                              <img class="w-100 d-block position-absolute h-100 fit-cover" src="https://cdn.bootstrapstudio.io/placeholders/1400x800.png" alt="">
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
                                  <a href="${path }/movieUser/openMovieList"" class="contactus-btn">상세정보</a>
                              </div>
                           </div>
                        </div>

                        <!-- Slide 3 -->
                        <div class="carousel-item">
                           <div class="carousel-background">
                              <img class="w-100 d-block position-absolute h-100 fit-cover" src="https://cdn.bootstrapstudio.io/placeholders/1400x800.png" alt="">
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
                              <a href="${path }/movieUser/openMovieList"" class="contactus-btn">상세정보</a>
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
    <div class="container py-4 py-xl-5">
        <div class="row mb-5" style="background: linear-gradient(120deg, #dda4cd, #afc3f5);">
            <div class="col-md-8 col-xl-6 text-center mx-auto">
                <h2>연극 예매 순위</h2>
                <p class="w-lg-50">본 데이터는 TicketWay 기준입니다.</p>
            </div>
        </div>
        <div class="row gy-4 row-cols-1 row-cols-md-2 row-cols-xl-3">
            <div class="col">
                <div class="card"><img class="card-img-top w-100 d-block fit-cover" style="height: 200px;" src="https://cdn.bootstrapstudio.io/placeholders/1400x800.png" />
                    <div class="card-body p-4">
                        <h4 class="card-title">제목</h4>
                        <p class="card-text">내용</p>
                        <div class="d-flex">
                            <div></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card"><img class="card-img-top w-100 d-block fit-cover" style="height: 200px;" src="https://cdn.bootstrapstudio.io/placeholders/1400x800.png" />
                    <div class="card-body p-4">
                        <h4 class="card-title">제목<br /></h4>
                        <p class="card-text">내용<br /></p>
                        <div class="d-flex">
                            <div></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card"><img class="card-img-top w-100 d-block fit-cover" style="height: 200px;" src="https://cdn.bootstrapstudio.io/placeholders/1400x800.png" />
                    <div class="card-body p-4">
                        <h4 class="card-title">제목<br /></h4>
                        <p class="card-text">내용<br /></p>
                        <div class="d-flex">
                            <div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container py-4 py-xl-5">
        <div class="row mb-5" style="background: linear-gradient(120deg, #dda4cd, #afc3f5);">
            <div class="col-md-8 col-xl-6 text-center mx-auto">
                <h2>뮤지컬 예매 순위</h2>
                <p class="w-lg-50">본 데이터는 TicketWay 기준입니다.</p>
            </div>
        </div>
        <div class="row gy-4 row-cols-1 row-cols-md-2 row-cols-xl-3">
            <div class="col">
                <div class="card"><img class="card-img-top w-100 d-block fit-cover" style="height: 200px;" src="https://cdn.bootstrapstudio.io/placeholders/1400x800.png" />
                    <div class="card-body p-4">
                        <h4 class="card-title">제목</h4>
                        <p class="card-text">내용</p>
                        <div class="d-flex">
                            <div></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card"><img class="card-img-top w-100 d-block fit-cover" style="height: 200px;" src="https://cdn.bootstrapstudio.io/placeholders/1400x800.png" />
                    <div class="card-body p-4">
                        <h4 class="card-title">제목<br /></h4>
                        <p class="card-text">내용</p>
                        <div class="d-flex">
                            <div></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card"><img class="card-img-top w-100 d-block fit-cover" style="height: 200px;" src="https://cdn.bootstrapstudio.io/placeholders/1400x800.png" />
                    <div class="card-body p-4">
                        <h4 class="card-title">제목<br /></h4>
                        <p class="card-text">내용</p>
                        <div class="d-flex">
                            <div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section class="py-4 py-xl-5">
            <div class="container">
                <div class="bg-dark border rounded border-0 border-dark overflow-hidden">
                    <div class="row g-0">
                        <div class="col-md-6" style="background: linear-gradient(120deg, #dda4cd, #afc3f5);">
                            <div class="text-white p-4 p-md-5" style="background: linear-gradient(120deg, #dda4cd, #afc3f5);">
                                <h2 class="fw-bold text-white mb-3">이벤트 페이지</h2>
                                <p class="mb-4">이벤트 관련 내용</p>
                                <div class="my-3"><a class="btn btn-primary btn-lg me-2" role="button" href="${pageContext.request.contextPath}/ticketway/event_detail">이벤트 바로가기</a></div>
                            </div>
                        </div>
                        <div class="col-md-6 order-first order-md-last" style="min-height: 250px;"><img class="w-100 h-100 fit-cover" src="https://cdn.bootstrapstudio.io/placeholders/1400x800.png" /></div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <div class="float-start float-md-end mt-5 mt-md-0 search-area"></div>


	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>












