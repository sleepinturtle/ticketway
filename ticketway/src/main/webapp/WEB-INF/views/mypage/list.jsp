<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
   <head>
      <title> 마이페이지  </title>
      <meta charset="utf-8"/>
 	  <%@ include file="/WEB-INF/views/header.jsp" %>
   </head>
   <body class="left-sidebar is-preload">
    <h1 style="font-family:Georgia;"> M Y P A G E </h1>
   <div class="container"><!-- container start -->
      <div id="page-wrapper">
         <!-- Header -->
            <div id="header">
                  </div>
               </div>
             
     
      				   <h1>회원 정보</h1>
                       <table class="table table-hover" style="text-align: center;">
                             <tbody>
                                         <tr>
                                            <td> <h5 style="color:gray;">회원 아이디  : ${login_info.mid}</h5></td>   
                                         </tr>
                                         <tr>
                                            <td><h5 style="color:gray;"> 전 화 번 호  : ${login_info.mtel} </h5></td>   
                                         </tr>
                                         <tr>
                                            <td><h5 style="color:gray;"> email : ${login_info.email}</h5></td>    
                                         </tr>
                                         <tr>
                                            <td> <h5 style="color:gray;"> 주소  : ${login_info.maddr}</h5></td>      
                             			 </tr>
                             </tbody>
                             
                       </table>
                                 
                                         
                        
                        <div class="row" style="justify-content: center;">
                        	 <a class="btn btn-info" href="${pageContext.request.contextPath}/mypage/update_form?mno=${login_info.mno}" style="justify-content: center;">
                                                                                    회원 정보 수정 
                             </a>
                        </div>
                                          
                                          
                                       
                                 
      <!-- 회원 정보 end -->
         <!-- 신용카드 정보 start -->
         <br>
         <div class="container" >
         <h1>신용카드 정보</h1>
         <a class="btn btn-primary mb-5" href="${pageContext.request.contextPath}/card_info/form">
         	신용카드 등록하기
         </a>
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
								<td class="text-right">
									<button class="card_delete_btn btn btn-danger btn-sm" value="${dto.card_no}"> X </button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
         	</div>
         </div>
         <br><br>
         <!-- 신용카드 정보 end -->
        
      
         </div><!-- container end -->
   </body>
   <script type="text/javascript">
	$(document).ready(function() {
		$(".card_delete_btn").click(function() {

			$.get(
					"${pageContext.request.contextPath}/card_info/delete"
					, {
						card_no : $(this).val()
					}
					, function(data, status) {
						if(data >= 1){
							alert("신용 카드를 삭제 하였습니다.");
							location.href="${pageContext.request.contextPath}/mypage/list";
						} else {
							alert("신용 카드 삭제를 실패 하였습니다.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>
</html>