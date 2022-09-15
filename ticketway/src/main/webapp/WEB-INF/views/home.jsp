<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> Home </title>
		
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
 <div id="carousel-1" class="carousel slide" data-bs-ride="carousel" style="height: 600px;">
        <div class="carousel-inner h-100">
            <div class="carousel-item active h-100"><img class="w-100 d-block position-absolute h-100 fit-cover" src="https://cdn.bootstrapstudio.io/placeholders/1400x800.png" alt="Slide Image" style="z-index: -1;" />
                <div class="container d-flex flex-column justify-content-center h-100">
                    <div class="row">
                        <div class="col-md-6 col-xl-4 offset-md-2">
                            <div style="max-width: 350px;">
                                <h1 class="text-uppercase fw-bold">제목</h1>
                                <p class="my-3">간단한 설명</p><a class="btn btn-primary btn-lg me-2" role="button" href="#">예매하러 가기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item h-100"><img class="w-100 d-block position-absolute h-100 fit-cover" src="https://cdn.bootstrapstudio.io/placeholders/1400x800.png" alt="Slide Image" style="z-index: -1;" />
                <div class="container d-flex flex-column justify-content-center h-100">
                    <div class="row">
                        <div class="col-md-6 col-xl-4 offset-md-2">
                            <div style="max-width: 350px;">
                                <h1 class="text-uppercase fw-bold">1<br />fringi dictum, augue purus</h1>
                                <p class="my-3">Tincidunt laoreet leo, adipiscing taciti tempor. Primis senectus sapien, risus donec ad fusce augue interdum.</p><a class="btn btn-primary btn-lg me-2" role="button" href="#">Button</a><a class="btn btn-outline-primary btn-lg" role="button" href="#">Button</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item h-100"><img class="w-100 d-block position-absolute h-100 fit-cover" src="https://cdn.bootstrapstudio.io/placeholders/1400x800.png" alt="Slide Image" style="z-index: -1;" />
                <div class="container d-flex flex-column justify-content-center h-100">
                    <div class="row">
                        <div class="col-md-6 col-xl-4 offset-md-2">
                            <div style="max-width: 350px;">
                                <h1 class="text-uppercase fw-bold">2<br />fringi dictum, augue purus</h1>
                                <p class="my-3">Tincidunt laoreet leo, adipiscing taciti tempor. Primis senectus sapien, risus donec ad fusce augue interdum.</p><a class="btn btn-primary btn-lg me-2" role="button" href="#">Button</a><a class="btn btn-outline-primary btn-lg" role="button" href="#">Button</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div><a class="carousel-control-prev" href="#carousel-1" role="button" data-bs-slide="prev"><span class="carousel-control-prev-icon"></span><span class="visually-hidden">Previous</span></a>
             <a class="carousel-control-next" href="#carousel-1" role="button" data-bs-slide="next"><span class="carousel-control-next-icon"></span><span class="visually-hidden">Next</span></a></div>
        <ol class="carousel-indicators">
            <li class="active" data-bs-target="#carousel-1" data-bs-slide-to="0"></li>
            <li data-bs-target="#carousel-1" data-bs-slide-to="1"></li>
            <li data-bs-target="#carousel-1" data-bs-slide-to="2"></li>
        </ol>
    </div>
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
                                <div class="my-3"><a class="btn btn-primary btn-lg me-2" role="button" href="${pageContext.request.contextPath}/notice/detail">이벤트 바로가기</a></div>
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












