<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 예 매 </title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
    <link rel="stylesheet" href="${path }/resources/css/bki.css">
<style>
    * {
    font-size: 14px;
}

body {
    background-color: #FDFCF0;
}


/* header */

.header-nav-wrapper {
    background: url(../images/bg_header.gif) repeat-x 0 0;
    background-position: center;
    background-size: contain;
    height: 120px;
    padding-top: 4px;
}

.header-nav-container {
    position: fixed;
}

.header {
    display: flex;
    justify-content: space-between;
    padding-left: 40px;
    padding-right: 150px;
}

.header-inner {
    display: flex;
}

.header-inner>div {
    border-right: 1px solid #DDDDDD;
    margin-left: 8px;
    padding-right: 4px;
}


/* //header */


/* nav */

.nav-line {
    background-color: red;
    border-radius: 50px;
    height: 5px;
    /* background-image: linear-gradient(to right, white 33%, rgba(255, 255, 255, 0) 0%);
  background-position: bottom;
  background-size: 15px 1px;
  background-repeat: repeat-x; */
}

.nav-wrapper {
    /* background: url(../images/bg_header.gif) repeat-x 0 0; */
    /* width: 100%;*/
    height: 94px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.nav-content {
    padding-top: 15px;
}

.movieLogo-wrapper {
    text-align: center;
}

.cgvLogo {
    width: 120px;
    margin-left: 150px;
    /* margin-right: -40px; */
}

.cgvMovie {
    width: auto;
    height: 28px;
}

.nav-inner {
    display: flex;
    /* margin-left: -250px; */
    margin-left: 150px;
    margin-right: auto;
    align-items: center;
    padding-bottom: 15px;
}

.nav-inner>div>button {
    padding-top: 5px;
    font-size: 14px;
    font-weight: bold;
    margin-left: 15px;
}

.search-wrapper {
    margin-left: 70px;
    height: 20px;
}

.search-wrapper>input {
    width: 100px;
    height: 20px;
}

.searchButton {
    margin: 0 !important;
    padding: 2px !important;
    background-color: red;
    color: white;
    width: 30px;
    height: 100%;
    font-size: 10px !important;
}


/* content */

.reserve-container {
    margin-top: 20px;
    display: flex;
    justify-content: center;
    height: 800px;
    /* border: 1px solid #dddddd; */
}

.reserve-container>div {
    border: 1px solid #dddddd;
}

.reserve-title {
    border-bottom: 1px solid #dddddd;
    background-color: #444444;
    text-align: center;
    color: #dddddd;
    padding: 5px;
    font-size: 13px;
    font-weight: bold;
}

.movie-part {
    width: 284px;
}

.theater-part {
    width: 264px;
}

.day-part {
    width: 91px;
}

.time-part {
    width: 384px;
}

.sort-wrapper {
    margin: 10px 6px 6px 10px;
    /* padding: 3px; */
    display: flex;
    border-bottom: 1px solid #dddddd;
    font-size: 12px;
}

.sort-wrapper>div {
    padding: 3px;
}

.sort-wrapper>div:hover {
    border-bottom: 1px solid #111111;
}

.sort-selected {
    font-weight: bold;
    border-bottom: 1px solid #111111;
}

.sort-korean {
    margin-left: 6px;
}

.reserve-date {
    padding-top: 5px;
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 770px;
    overflow: auto;
    overflow-x: hidden;
}

.movie-date-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 5px 2px;
}

.movie-week-of-day {
    margin-left: 5px;
    font-size: 10px;
    width: 12px;
    height: 22px;
    line-height: 22px;
}

.movie-day {
    text-align: center;
    width: 34px;
    height: 22px;
    font-size: 17px;
    font-weight: bold;
}

.saturday {
    color: #31597E;
    font-weight: bold;
}

.sunday {
    color: #AF2D2D;
    font-weight: bold;
}

.movie-date-wrapper-active {
    background-color: #333333;
}

.movie-date-wrapper-active>* {
    color: white;
}
    </style>
    
    
    <style>
        .seat {
            width: 30px;
            height: 30px;
        }
        
        .clicked {
            background-color: red;
            color: white;
        }
    </style>
<%@ include file="/WEB-INF/views/header.jsp" %>
</head>

<body>
    
    <div class="reserve-container">
        <div class="movie-part overflow-auto">
            <div class="reserve-title">공연</div>
            <div class="sort-wrapper">
                <div class="sort-rate sort-selected">예매율순</div>
                <div class="sort-korean">가나다순</div>
            </div>
            <c:forEach var="dto" items="${list}" varStatus="status">
	            <div class="movie-list">
<%-- 					<a value="movie" id="${dto.play_no}" style="cursor: pointer;">${dto.play_title}</a> --%>
					<label for="perform_${dto.play_no}">
					<a value="movie" id="${dto.play_no}" style="cursor: pointer;">${dto.play_title}</a>
					<input type="checkbox" id="perform_${dto.play_no}">
					</label>
					<br>
					<hr>
				</div>
            </c:forEach>
        </div>
        
       
        <div class="theater-part">
            <div class="reserve-title">극장</div>
           	<div class="movie-list" id="tht_area" >
<%-- 	            <a value="tht" id="${tht.tht_no}" style="cursor: pointer;">${tht.tht_name}</a> --%>
<!-- 	            <br> -->
<!-- 				<hr> -->
           	</div>
        </div>
        
        
        <div class="day-part">
            <div class="reserve-title">날짜</div>
            <div class="movie-list" id="day_area">
            
            </div>
        </div>
        
        <div class="time-part">
            <div class="reserve-title">시간</div>
          
         	<div class="movie-list" id="time_area">
            	
            </div>
        </div>
	
      
      
      
         <br><br><br><br>
<%--          <a class="btn btn-primary btn-center" href="${pageContext.request.contextPath}/ticketing/ticket"> 좌 석 선 택 </a> --%>
 
		 	<button type="button" class="btn btn-primary float-right clearfix" data-toggle="modal" data-target="#exampleModal">
		  	좌석 선택
			</button>
				<button type="button" class="btn btn-primary float-right clearfix" data-toggle="modal" data-target="#examplecardModal">
		  	카드 선택
			</button>
     </div>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title  " id="exampleModalLabel">좌석 선택</h5>
		        <button type="button" class="close " data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body text-center">
		        <div>
			    <div class="seat-wrapper"></div>
			    
			    </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary " id="select_y">선택 완료</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="examplecardModal" tabindex="-1" role="dialog" aria-labelledby="examplecardModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title  " id="examplecardModalLabel">좌석 선택</h5>
		        <button type="button" class="close " data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body text-center">
		       		<div style="background-color: lightgray;">
	         <table class="table table-hover table-borderless">
					<tbody>
						<c:forEach var="dto" items="${cardlist}" varStatus="status">
							<tr>
								<td id="td_credit_card">
									<div class="card">
										<div class="card-body">
											<h5 class="card-title">${dto.card_name}</h5>
											<p class="card-text">카드 번호 : ${dto.card_num}</p>
											<p class="card-text">유효 기간 (MM/YY) : ${dto.exp_date1} / ${dto.exp_date2}</p>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
         	</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary " id="select_c">선택 완료</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	
	<!-- 좌석 선택 스크립트 -->	
	<script>
    let test = [];
    let selectedSeats = new Array();
    let selectedSeatsMap = [];
    const seatWrapper = document.querySelector(".seat-wrapper");
    let clicked = "";
    let div = "";

    for (let i = 0; i < 10; i++) {
        div = document.createElement("div");
        seatWrapper.append(div);
        for (let j = 0; j < 10; j++) {
            const input = document.createElement('input');
            input.type = "button";
            input.name = "seats"
            input.classList = "seat";
            //3중포문을 사용하지 않기위해 
            mapping(input, i, j);
            div.append(input);
            input.addEventListener('click', function(e) {
                console.log(e.target.value);
                //중복방지 함수
                selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

                //click class가 존재할때(제거해주는 toggle)
                if (input.classList.contains("clicked")) {
                    input.classList.remove("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    });
                    //click class가 존재하지 않을때 (추가해주는 toggle)
                } else {
                    input.classList.add("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    })
                }
                console.log(selectedSeats);
            })
        }
    }

    function mapping(input, i, j) {
        if (i === 0) {
            input.value = "A" + j;
        } else if (i === 1) {
            input.value = "B" + j;
        } else if (i === 2) {
            input.value = "C" + j;
        } else if (i === 3) {
            input.value = "D" + j;
        } else if (i === 4) {
            input.value = "E" + j;
        } else if (i === 5) {
            input.value = "F" + j;
        } else if (i === 6) {
            input.value = "G" + j;
	    } else if (i === 7) {
	        input.value = "H" + j;
		} else if (i === 8) {
		    input.value = "I" + j;
		} else if (i === 9) {
		    input.value = "J" + j;
		} else if (i === 10) {
		    input.value = "H" + j;
		}
    }
	</script>
		 
 
    <script>

    $(document).ready(function() {
		$("a[value=movie]").click(function() {
// 			alert( $(this).attr("id") );
			$.get(
				"${pageContext.request.contextPath}/ticketing/hall"
				, {play_no : $(this).attr("id")}
				, function(data, status){
// 					alert(data);
					$("#tht_area").empty();
					$.each( data , function(idx, dto) {
// 						$('#tht_area').append("<a value='tht' id='"+dto.tht_no+"' style='cursor: pointer;'>" + dto.tht_name + "</a>");
// 						$('#tht_area').append("<hr>");
						
						$('#tht_area').append("<input type='checkbox' id='tht_"+dto.tht_no+"'>");
						$('#tht_area').append("<label for='tht_"+dto.tht_no+"'><a value='' id='"+dto.tht_no+"' style='cursor: pointer;'>" + dto.tht_name + "</a></label>");
						$('#tht_area').append("<hr>");
						
						date(dto.tht_no);
	
					});//each
				}//call back
				, "json"
			);//get
		});//click
	});//ready

    </script>
	
    <script>

    
    function date(no) {

    	$("a[id="+no+"]").on("click", function() {
// 			alert( 'hello' );
			$.get(
				"${pageContext.request.contextPath}/ticketing/date"
				, {tht_no : no}
				, function(data, status) {
// 					alert(data);
					$("#day_area").empty();
					$.each(data, function(idx, dto) {
// 						$('#day_area').append("<a class = 'time_check' value='"+dto.play_no+"' id='"+dto.play_date+"' style='cursor: pointer;'>" + dto.play_date+ "</a>");
// 						$('#day_area').append("<hr>");
						$('#day_area').append("<input type='checkbox' id='"+dto.play_date+"'>");
						$('#day_area').append("<label for='"+dto.play_date+"'><a value='dto.play_no' id='"+dto.play_date+"' style='cursor: pointer;'>" + dto.play_date+"</a></label>");
						$('#day_area').append("<hr>");
						time(dto.play_no, dto.play_date);
					});//each
				}//callback
				,"json"
			);//get
		});//on
	}//tes
	
	

    function time(no, date) {

    	$("a[id="+date+"]").on("click", function() {
//    		alert(no +" : "+ date);
			$.get(
				"${pageContext.request.contextPath}/ticketing/time"
				, {
					play_no : no
					, play_date : date
				}
				, function(data, status) {
					$("#time_area").empty();
					$.each(data, function(idx, dto) {
// 						$('#time_area').append("<a value='tht' id='' style='cursor: pointer;'>" + dto.play_time+ "</a>");
// 						$('#time_area').append("<hr>");
						
						$('#time_area').append("<input type='checkbox' id='"+dto.play_time+"'>");
						$('#time_area').append("<label for='"+dto.play_time+"'><a value='tht' id='' style='cursor: pointer;'>" + dto.play_time+ "</a></label>");
						$('#time_area').append("<hr>");
						
					});//each
				}//callback
				,"json"
			);//get
		});//on
	}//test


	
	
    </script>
	
    
    <script type="text/javascript">
	$(document).ready(function() {
		$("#select_y").click(function() {
			alert(123);
			$.get(
					"${pageContext.request.contextPath}/ticketing/ticket"
					, {
						
					}
					, function(data, status) {
						if(data >= 1){
							alert("예매 완료");
							location.href="${pageContext.request.contextPath}/";
						} else if(data <= 0){
							alert("잠시 후 다시 시도해 주세요");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post
			
			
		});
		
		
		$("#select_c").click(function() {
			alert(123);
			$.get(
					"${pageContext.request.contextPath}/ticketing/ticket"
					, {
						
					}
					, function(data, status) {
						if(data >= 1){
							alert("예매 완료");
							location.href="${pageContext.request.contextPath}/";
						} else if(data <= 0){
							alert("잠시 후 다시 시도해 주세요");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post
			
			
		});
	});

    
    

    </script>
</body>

</html>