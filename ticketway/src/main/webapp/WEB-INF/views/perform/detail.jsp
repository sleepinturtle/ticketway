<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공연 상세</title>
		
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.1/css/all.min.css">
		<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Montserrat&amp;display=swap"rel="stylesheet">
		<link rel="stylesheet" href="${path }/resources/css/bki.css">
		<link rel="stylesheet" href="${path }/resources/css/bki2.css">
		<link rel="stylesheet" href="${path }/resources/css/bki3.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
		<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bowlby+One+SC&family=Bungee&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e4f4cc76471ea0fe9709d546ba5954b&libraries=services"></script>
	</head>
	
	<style>
	.star {
    position: relative;
    font-size: 2rem;
    color: #ddd;
  }
  
  .star input {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
  }
  
  .star span {
    width: 0;
    position: absolute; 
    left: 0;
    color: red;
    overflow: hidden;
    pointer-events: none;
  }
	</style>
<body>
		<%@ include file="/WEB-INF/views/header.jsp" %>
		
	
	
		
	<!-- 상품 기본정보 -->	
	<section class="common_section section_product_info">
		<div class="product_detail_imgbox">
			<img src="${play_info.play_thumbnail}" alt="" class="product_detail_img">
		</div>
		<div class="product_detail_info">
			<div class="product_flag">
			</div>
		
			<div class="product_heading">
				<h1 class="product_title">${play_info.play_title}</h1>
					<p class="product_sub_title"></p>
				<div class="popup_btn_wrap">
<!-- 					<button type="button" class="product_share_btn" aria-expanded="false"> -->
<!-- 						<span class="common_icon icon_share ty_sm"></span><span class="blind">공유하기</span> -->
<!-- 					</button> -->
				</div>
			</div>
			<div class="product_info">
				<h2 class="blind">상품 대표 정보</h2>
				<ul class="product_info_list type_col2">
					<li class="product_info_item">
						<span class="product_info_title">장소</span>
						<div class="product_info_desc">${play_info.tht_name}-${play_info.hall_name} </div>
					</li>
					<li class="product_info_item">
						<span class="product_info_title">관람시간</span>
						<div class="product_info_desc">${play_info.runtime}</div>
					</li>
					<li class="product_info_item">
						<span class="product_info_title">기간</span>
						<div class="product_info_desc">${play_info.open_date} - ${play_info.close_date}</div>
					</li>
					<li class="product_info_item">
						<span class="product_info_title">관람등급</span>
						<div class="product_info_desc">${play_info.rated}</div>
					</li>
				</ul>
				<ul class="product_info_list type_col2">
					<li class="product_info_item">
						<span class="product_info_title">가격</span>
						<div class="product_info_desc">
						<ul class="product_info_sublist">
							<li class="product_info_subitem">전석 <em class="text_emphasis">${play_info.seat_price}</em>원</li>
						</ul>
						</div>
					</li>
					<li class="product_info_item">
						<span class="product_info_title">시놉시스</span>
						<div class="product_info_desc">
						<ul class="product_info_sublist">
							<li class="product_info_subitem">${play_info.play_desc}</li>
						</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="product_detail_option">0</div>
	</section>
	
		<div id="map" class="container col-5" style="width:100%;height:500px;"></div>
	
							<script type="text/javascript">
					
								//step 1 : 지도 생성
								var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
								var options = { //지도를 생성할 때 필요한 기본 옵션
										center: new kakao.maps.LatLng("${tht.lt_num}", "${tht.la_num}"), //지도의 중심좌표.
									level: 3 //지도의 레벨(확대, 축소 정도)
								};
						
								var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
						
								var markerPosition  = new kakao.maps.LatLng("${tht.lt_num}", "${tht.la_num}"); 
								
								// 마커가 표시될 위치입니다 
						
								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
								    position: markerPosition
								});
						
								// 마커가 지도 위에 표시되도록 설정합니다
								marker.setMap(map);
								
								var iwContent = '<div style="padding:0px;">${tht.tht_name}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
							    iwPosition = new kakao.maps.LatLng("${tht.lt_num}", "${tht.la_num}"); //인포윈도우 표시 위치입니다
						
							// 인포윈도우를 생성합니다
							var infowindow = new kakao.maps.InfoWindow({
							    position : iwPosition, 
							    content : iwContent 
							});
							  
							// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
							infowindow.open(map, marker)
						</script>
	<hr>
	
	
	
	<!-- 공연 관련 정보 -->
	<div class="container py-5">
	    <div class="p-5 bg-white rounded shadow mb-5">
	        <ul id="myTab2" class="nav nav-tabs nav-pills with-arrow lined flex-column flex-sm-row text-center" role="tablist">
	            <li class="nav-item flex-sm-fill"><a id="home2-tab" class="nav-link text-uppercase font-weight-bold mr-sm-3 rounded-0 active" data-toggle="tab" href="#home2" role="tab">공연정보</a></li>
	            <li class="nav-item flex-sm-fill"><a id="profile2-tab" class="nav-link text-uppercase font-weight-bold mr-sm-3 rounded-0" data-toggle="tab" href="#profile2" role="tab">관람후기</a></li>
	            <li class="nav-item flex-sm-fill"><a id="contact2-tab" class="nav-link text-uppercase font-weight-bold rounded-0" data-toggle="tab" href="#contact2" role="tab">장소/지도</a></li>
	        </ul>
	        <div id="myTab2Content" class="tab-content">
	        	
				      
				  
	        	<!-- tab1 -->
	            <div id="home2" class="tab-pane fade px-4 py-5 show active text-center" role="tabpanel">
	            <p><img alt="" src="${play_info.play_spec}"></p>
	                
	            </div>
	            
	            <!-- tab2 -->
	            <div id="profile2" class="tab-pane fade px-4 py-5" role="tabpanel">
	            	<!-- 댓글입력 + 댓글 표시 -->
	            	<section class="section_product_tabcont section_product_review" id="productReview">
	            		<div class="product_content_heading">
	            			<h2 class="product_content_title">관람후기<span class="text_primary text_number"> </span></h2>
	            			<div class="product_star_rate">
<!-- 	            			<div class="product_star24"> -->
<!-- <!-- 	            			<span class="product_star24_per" style="width: 98.8235%;"></span> -->
<!-- 	            			</div> -->
<!-- 	            			<span class="product_star_score"><span class="product_star_current">4.9</span> / 5</span> -->
	            			</div>
	            		</div>
	            		
	            	<!-- 댓글입력 + 댓글 표시 -->
	            		<div class="product_comment_write">
	            		<input type="hidden" id="play_no" name="play_no" value="${play_info.play_no}">
		            		<div class="product_comment_form ">
		            		<!-- 댓글 쓰는 란 -->
			            		<div class="comment_content">
<!-- 				            		<div class="comment_star_rate"><span class="blind">별점 5점 중</span> -->
<!-- 					            		<div class="comment_star_select "> -->
<!-- 						            		<input type="radio" name="star2" id="star2_1" class="star_radio" value="1"> -->
<!-- 						            		<label for="star2_1" class="star_label"><span class="blind">1점</span></label> -->
<!-- 						            		<input type="radio" name="star2" id="star2_2" class="star_radio" value="2"> -->
<!-- 						            		<label for="star2_2" class="star_label"><span class="blind">2점</span></label> -->
<!-- 						            		<input type="radio" name="star2" id="star2_3" class="star_radio" value="3"> -->
<!-- 						            		<label for="star2_3" class="star_label"><span class="blind">3점</span></label> -->
<!-- 						            		<input type="radio" name="star2" id="star2_4" class="star_radio" value="4"> -->
<!-- 						            		<label for="star2_4" class="star_label"><span class="blind">4점</span></label> -->
<!-- 						            		<input type="radio" name="star2" id="star2_5" class="star_radio" value="5"> -->
<!-- 						            		<label for="star2_5" class="star_label"><span class="blind">5점</span></label> -->
<!-- 					            		</div> -->
<!-- 											<span class="star"> -->
<!-- 												  ★★★★★ -->
<!-- 												  <span>★★★★★</span> -->
<!-- 												  <input type="range" oninput="drawStar(this)" value="10" step="1" min="0" max="10"> -->
<!-- 											</span> -->
<!-- 					            		<p class="comment_star_desc">별점을 선택해주세요.</p> -->
<!-- 				            		</div> -->
				            		<div class="comment_input_box">
					            		<label for="comment_01" class="blind">관람후기 작성란</label>
				            		<textarea id="cmt_cnts"  class="comment_textarea" placeholder="관람후기를 남겨보세요!" maxlength="1000" spellcheck="false"></textarea>
				            		</div>
			            		</div>
			            	<!-- 댓글 쓰는 란/ -->
			            	
			            	<!-- 댓글쓰기 footer -->
			            		<div class="comment_util">
			            			<div class="comment_util_right">
			            				<div class="comment_length">
			            					<span class="current_length">0</span>
			            					<span class="limit_length">/1000</span>
			            				</div>
			            				<div class="comment_btn_box">
			            					<button type="button" id="cmt_btn" class="common_btn btn_secondary btn_small float-right">등록</button>
			            				</div>
			            			</div>
			            		</div>
		            		</div>
	            		</div>
	            		
	            		<!-- 등록된 댓글 -->
	            		
	            		<ul class="product_comment_list">
	            		<c:forEach var="dto" items="${review_info}" varStatus="status">
	            			<li class="product_comment_item ">
<!-- 		            			<div class="product_star14"> -->
<!-- 		            				<span class="product_star14_per" style="width: 100%;"></span> -->
<!-- 		            				<span class="blind">별점 5점 중 <span>5</span>점</span> -->
<!-- 		            			</div> -->
		            			<p class="product_comment_desc">${dto.cmt_cnts}</p>
		            			<div class="product_comment_info">
		            				<span class="comment_id">${dto.mid}</span>
		            				<span class="comment_date">${dto.cmt_date}</span>
<!-- 		            				<span class="comment_purchaser">예매자</span> -->
		            			</div>
	            			</li>
	            		</c:forEach>
	            		</ul>
	            		<!-- 등록된 댓글 /-->
	            	</section>
	            	<!-- 댓글입력 + 댓글 표시/ -->
	            </div>
	            <!-- tab2/ -->
	            
	            <!-- tab3 -->
	            <div id="contact2" class="tab-pane fade px-4 py-5" role="tabpanel">
	            	<h3>공연장 정보</h3>
	            	<hr>
	            	장소 : ${play_info.tht_name}-${play_info.hall_name}
	            	<br>
	            	주소 : ${play_info.tht_addr}
	            	
	            	
	            </div>
	            
	            
	            <!-- tab3/ -->
	        </div>
	        </div>
	        
	</div>
	<!-- 공연 관련 정보 /-->
	
	<!-- 공연 예매 date picker -->
<!-- 	<section class="common_section section_product_reserve"> -->
<!-- 		<h2 class="blind">상품 예매</h2> -->
<!-- 			<div class="product_detail_reserve"> -->
<!-- 	<div class="product_reserve_date"> -->
<!-- 				<h3 class="product_reserve_heading"> -->
<!-- 				<span class="product_reserve_step">STEP1</span> -->
<!-- 				<span class="product_reserve_title">날짜 선택</span> -->
<!-- 				</h3> -->
				
<!-- 	<div> -->
<!-- 		<div class="react-datepicker"> -->
<!-- 				<div class="react-datepicker__triangle"></div> -->
<!-- 				<button type="button" class="react-datepicker__navigation react-datepicker__navigation--next" aria-label="Next Month"> -->
<!-- 				<span class="react-datepicker__navigation-icon react-datepicker__navigation-icon--next">Next Month</span> -->
<!-- 				</button> -->
<!-- 			<div class="react-datepicker__month-container"> -->
<!-- 				<div class="react-datepicker__header "> -->
<!-- 					<div class="react-datepicker__current-month">2022.09</div> -->
<!-- 					<div class="react-datepicker__header__dropdown react-datepicker__header__dropdown--scroll"></div> -->
					
<!-- 					<div class="react-datepicker__day-names"> -->
<!-- 						<div class="react-datepicker__day-name">일</div> -->
<!-- 						<div class="react-datepicker__day-name">월</div> -->
<!-- 						<div class="react-datepicker__day-name">화</div> -->
<!-- 						<div class="react-datepicker__day-name">수</div> -->
<!-- 						<div class="react-datepicker__day-name">목</div> -->
<!-- 						<div class="react-datepicker__day-name">금</div> -->
<!-- 						<div class="react-datepicker__day-name">토</div> -->
<!-- 					</div> -->
	
<!-- 				</div> -->
				
<!-- 				<div class="react-datepicker__month" aria-label="month  2022-09" role="listbox"> -->
<!-- 					<div class="react-datepicker__week"> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--028 react-datepicker__day--disabled react-datepicker__day--weekend react-datepicker__day--outside-month" tabindex="-1" aria-label="Not available 2022년 8월 28일 일요일" role="option" aria-disabled="true" aria-selected="false">28</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--029 react-datepicker__day--disabled react-datepicker__day--outside-month" tabindex="-1" aria-label="Not available 2022년 8월 29일 월요일" role="option" aria-disabled="true" aria-selected="false">29</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--030 react-datepicker__day--disabled react-datepicker__day--outside-month" tabindex="-1" aria-label="Not available 2022년 8월 30일 화요일" role="option" aria-disabled="true" aria-selected="false">30</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--031 react-datepicker__day--disabled react-datepicker__day--outside-month" tabindex="-1" aria-label="Not available 2022년 8월 31일 수요일" role="option" aria-disabled="true" aria-selected="false">31</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--001 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2022년 9월 1일 목요일" role="option" aria-disabled="true" aria-selected="false">1</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--002 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2022년 9월 2일 금요일" role="option" aria-disabled="true" aria-selected="false">2</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--003 react-datepicker__day--disabled react-datepicker__day--weekend" tabindex="-1" aria-label="Not available 2022년 9월 3일 토요일" role="option" aria-disabled="true" aria-selected="false">3</div> -->
<!-- 					</div> -->
<!-- 					<div class="react-datepicker__week"> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--004 react-datepicker__day--disabled react-datepicker__day--weekend" tabindex="-1" aria-label="Not available 2022년 9월 4일 일요일" role="option" aria-disabled="true" aria-selected="false">4</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--005 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2022년 9월 5일 월요일" role="option" aria-disabled="true" aria-selected="false">5</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--006 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2022년 9월 6일 화요일" role="option" aria-disabled="true" aria-selected="false">6</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--007 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2022년 9월 7일 수요일" role="option" aria-disabled="true" aria-selected="false">7</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--008 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2022년 9월 8일 목요일" role="option" aria-disabled="true" aria-selected="false">8</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--009 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2022년 9월 9일 금요일" role="option" aria-disabled="true" aria-selected="false">9</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--010 react-datepicker__day--disabled react-datepicker__day--weekend" tabindex="-1" aria-label="Not available 2022년 9월 10일 토요일" role="option" aria-disabled="true" aria-selected="false">10</div> -->
<!-- 					</div> -->
<!-- 					<div class="react-datepicker__week"> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--011 react-datepicker__day--disabled react-datepicker__day--weekend" tabindex="-1" aria-label="Not available 2022년 9월 11일 일요일" role="option" aria-disabled="true" aria-selected="false">11</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--012 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2022년 9월 12일 월요일" role="option" aria-disabled="true" aria-selected="false">12</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--013 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2022년 9월 13일 화요일" role="option" aria-disabled="true" aria-selected="false">13</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--014 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2022년 9월 14일 수요일" role="option" aria-disabled="true" aria-selected="false">14</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--015 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2022년 9월 15일 목요일" role="option" aria-disabled="true" aria-selected="false">15</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--016 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2022년 9월 16일 금요일" role="option" aria-disabled="true" aria-selected="false">16</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--017 react-datepicker__day--disabled react-datepicker__day--weekend" tabindex="-1" aria-label="Not available 2022년 9월 17일 토요일" role="option" aria-disabled="true" aria-selected="false">17</div> -->
<!-- 					</div> -->
<!-- 					<div class="react-datepicker__week"> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--018 react-datepicker__day--disabled react-datepicker__day--weekend" tabindex="-1" aria-label="Not available 2022년 9월 18일 일요일" role="option" aria-disabled="true" aria-selected="false">18</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--019 react-datepicker__day--disabled react-datepicker__day--today" tabindex="-1" aria-label="Not available 2022년 9월 19일 월요일" role="option" aria-disabled="true" aria-current="date" aria-selected="false">19</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--020 react-datepicker__day--selected" tabindex="0" aria-label="Choose 2022년 9월 20일 화요일" role="option" aria-disabled="false" aria-selected="true">20</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--021" tabindex="-1" aria-label="Choose 2022년 9월 21일 수요일" role="option" aria-disabled="false" aria-selected="false">21</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--022" tabindex="-1" aria-label="Choose 2022년 9월 22일 목요일" role="option" aria-disabled="false" aria-selected="false">22</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--023" tabindex="-1" aria-label="Choose 2022년 9월 23일 금요일" role="option" aria-disabled="false" aria-selected="false">23</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--024 react-datepicker__day--weekend" tabindex="-1" aria-label="Choose 2022년 9월 24일 토요일" role="option" aria-disabled="false" aria-selected="false">24</div> -->
<!-- 					</div> -->
<!-- 					<div class="react-datepicker__week"> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--025 react-datepicker__day--weekend" tabindex="-1" aria-label="Choose 2022년 9월 25일 일요일" role="option" aria-disabled="false" aria-selected="false">25</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--026 react-datepicker__day--disabled" tabindex="-1" aria-label="Not available 2022년 9월 26일 월요일" role="option" aria-disabled="true" aria-selected="false">26</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--027" tabindex="-1" aria-label="Choose 2022년 9월 27일 화요일" role="option" aria-disabled="false" aria-selected="false">27</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--028" tabindex="-1" aria-label="Choose 2022년 9월 28일 수요일" role="option" aria-disabled="false" aria-selected="false">28</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--029" tabindex="-1" aria-label="Choose 2022년 9월 29일 목요일" role="option" aria-disabled="false" aria-selected="false">29</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--030" tabindex="-1" aria-label="Choose 2022년 9월 30일 금요일" role="option" aria-disabled="false" aria-selected="false">30</div> -->
<!-- 						<div class="react-datepicker__day react-datepicker__day--001 react-datepicker__day--weekend react-datepicker__day--outside-month" tabindex="-1" aria-label="Choose 2022년 10월 1일 토요일" role="option" aria-disabled="false" aria-selected="false">1</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	</div> -->
	
<!-- 	<div class="product_reserve_time"> -->
<!-- 		<h3 class="product_reserve_heading"> -->
<!-- 			<span class="product_reserve_step">STEP2</span> -->
<!-- 			<span class="product_reserve_title">회차 선택</span> -->
<!-- 		</h3> -->
<!-- 		<ul class="product_time_list" role="listbox"> -->
<!-- 		<li class="product_time_item" role="none"> -->
<!-- 		<button type="button" class="product_time_btn" role="option" aria-selected="true"> -->
<!-- 		<span class="product_time">20시 00분</span> -->
<!-- 		<span class="product_time_cast"><span class="product_time_title">출연진</span><span class="product_time_actor">이경미, 홍우진</span></span> -->
<!-- 		</button></li></ul></div><div class="product_reserve_seat"> -->
<!-- 		<h3 class="product_reserve_heading"> -->
<!-- 		<span class="product_reserve_title">예매가능좌석</span> -->
<!-- 		</h3><ul class="product_seat_list"> -->
<!-- 		<li class="product_seat_item"> -->
<!-- 		<span class="product_seat_title">전체</span> -->
<!-- 		<span class="product_seat_remain"> -->
<!-- 		<span class="product_seat_number">43</span> -->
<!-- 		<span class="product_seat_text">석</span> -->
<!-- 		</span></li><li class="product_seat_item"><span class="product_seat_title">전석</span><span class="product_seat_remain"><span class="product_seat_number">43</span><span class="product_seat_text">석</span></span></li></ul></div></div><div class="product_reserve_util"><div class="product_reserve_banner"><a href="/event/paycoPromo" target="_blank" class="product_reservebn_link"> -->
<!-- 		</a> -->
<!-- 		</div> -->
<!-- 		<div class="product_reserve_btnarea"> -->
<!-- 		<a href="#" class="common_btn btn_primary btn_xlarge">예매하기</a> -->
<!-- 		</div> -->
<!-- 		</div> -->
<!-- 		</section> -->
	
</body>

<script type="text/javascript">

		
	$(document).ready(function() {
		
			  
		
		
		 $("#map").hide();
		
		$("#cmt_btn").click(function() {
// 				alert( $("#play_no").val() );
	//			alert( $("#reply_class").val() );
// 				alert( $("#cmt_cnts").val() );
	//			return;
		
			$.post(
					"${pageContext.request.contextPath}/perform/cmt_insert"
					, {
						play_no : $("#play_no").val()
						,cmt_cnts : $("#cmt_cnts").val()
					}
					, function(data, status) {
						alert(1);
						if(data >= 1){
							alert("댓글이 등록되었습니다.");
							window.location.reload();
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back functiion
			);//post
		});//click
		
		$("#contact2-tab").click(function() {
			$("#map").show();
		});//click
		
		$("#profile2-tab").click(function() {
			$("#map").hide();
		});//click
		
		$("#home2-tab").click(function() {
			$("#map").hide();
		});//click
		
	});//ready
</script>
</html>