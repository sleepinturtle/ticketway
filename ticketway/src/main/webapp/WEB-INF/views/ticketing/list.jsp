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
<style>
    * {
    font-size: 11px;
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
					<a value="movie" id="${dto.play_no}" style="cursor: pointer;">${dto.play_title}</a>
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
	
     </div>
      
      
      
         <br><br><br><br>
         <a class="btn btn-primary btn-center" href="${pageContext.request.contextPath}/ticketing/ticket"> 좌 석 선 택 </a>
 
    <script>

    $(document).ready(function() {
		$("a[value=movie]").click(function() {
			alert( $(this).attr("id") );
			$.get(
				"${pageContext.request.contextPath}/ticketing/hall"
				, {play_no : $(this).attr("id")}
				, function(data, status){
// 					alert(data);
					$("#tht_area").empty();
					$.each( data , function(idx, dto) {
						$('#tht_area').append("<a value='tht' id='"+dto.tht_no+"' style='cursor: pointer;'>" + dto.tht_name + "</a>");
						$('#tht_area').append("<hr>");

						date(dto.tht_no);
	
					});//each
				}//call back
				, "json"
			);//get
		});//click
	});//ready

    </script>
	<script type="text/javascript">
// 		$(document).ready(function() {
// 			$(".time_check").click(function() {
// 				alert($(this).val());
// 			});
// 		});
	</script>	
    <script>

    function date(no) {

    	$("a[id="+no+"]").on("click", function() {
			alert( 'hello' );
			$.get(
				"${pageContext.request.contextPath}/ticketing/date"
				, {tht_no : no}
				, function(data, status) {
					alert(data);
					$("#day_area").empty();
					$.each(data, function(idx, dto) {
						$('#day_area').append("<a class = 'time_check' value='"+dto.play_no+"' id='"+dto.play_date+"' style='cursor: pointer;'>" + dto.play_date+ "</a>");
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
						$('#time_area').append("<a value='tht' id='' style='cursor: pointer;'>" + dto.play_time+ "</a>");
						$('#time_area').append("<hr>");
					});//each
				}//callback
				,"json"
			);//get
		});//on
	}//test


	
	
    </script>
	
    <script>
    $(document).ready(function() {
// 		$("a[value=tht]").click(function() {
// 			alert( $(this).attr("id") );
// 			$.get(
// 				"${pageContext.request.contextPath}/ticketing/hall"
// 				, {play_no : $(this).attr("id")}
// 				, function(data, status){
// // 					alert(data);
// 					$("#tht_area").empty();
// 					$.each( data , function(idx, dto) {
// 						$('#tht_area').append("<a value='tht' id='"+dto.tht_no+"' style='cursor: pointer;'>" + dto.tht_name + "</a>");
// 						+$('#tht_area').append("<hr>");
// 					});//each
// 				}//call back
// 				, "json"
// 			);//get
// 		});//click
	});//ready
  

    
    
/*
        const date = new Date();
        // console.log(date.getFullYear());
        const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
        const reserveDate = document.querySelector(".reserve-date");

      
            const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"]
            const year = date.getFullYear();
            const month = date.getMonth();
            for (i = date.getDate(); i <= lastDay.getDate(); i++) {

                const button = document.createElement("button");
                const spanWeekOfDay = document.createElement("span");
                const spanDay = document.createElement("span");

                //class넣기
                button.classList = "movie-date-wrapper"
                spanWeekOfDay.classList = "movie-week-of-day";
                spanDay.classList = "movie-day";

                //weekOfDay[new Date(2020-03-날짜)]
                const dayOfWeek = weekOfDay[new Date(year + "-" + month + "-" + i).getDay()];

                //요일 넣기
                if (dayOfWeek === "토") {
                    spanWeekOfDay.classList.add("saturday");
                    spanDay.classList.add("saturday");
                } else if (dayOfWeek === "일") {
                    spanWeekOfDay.classList.add("sunday");
                    spanDay.classList.add("sunday");
                }
                spanWeekOfDay.innerHTML = dayOfWeek;
                button.append(spanWeekOfDay);
                //날짜 넣기
                spanDay.innerHTML = i;
                button.append(spanDay);
                //button.append(i);
                reserveDate.append(button);

                dayClickEvent(button);
            }

        


        function dayClickEvent(button) {
            button.addEventListener("click", function() {
                const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
                movieDateWrapperActive.forEach((list) => {
                    list.classList.remove("movie-date-wrapper-active");
                })
                button.classList.add("movie-date-wrapper-active");
            })
        }
*/
    </script>
</body>

</html>