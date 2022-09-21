<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
   <head>
      <title> 마이페이지  </title>
      <meta charset="utf-8"/>
 
   <style>
         * {
         margin: 0 auto;
         padding: 0;
      }
      h1 { 
      text-align : center; 
      }
      th {
         text-align: center;
          width:100px;
      }
      td {
         text-align: center;
         width:500px;
      }
      #btn_paging{
      color : white;
      background-color:silver; 
      border-color : white;
      }
      #bar_search {
      width:500px;
      height:70px;
      font-size:15px;
      }
      #btn_search {
      width:110px;
      height:38px;
      }
      #notice_searchbar{
         display: flex;
         flex-direction: row;
      }
      #notice_search {
         margin-right: 0%;
      }
      #notice_write {
         margin-right: 3%;
      }
      </style>
       <%@ include file="/WEB-INF/views/header.jsp" %>
   </head>
   <body class="left-sidebar is-preload">
   <div class="container"><!-- container start -->
      <div id="page-wrapper">
         <!-- Header -->
            <div id="header">
                  </div>
               </div>
             
      <h1 style="font-family:Georgia;"> M Y P A G E </h1>
      <br><br>
                     <div>
                       <!-- 회원 정보 start -->
                           <div class="col-8">
                              <div class="text center">
                                    
                                       <div class="text-center">   
                                       <header>
                              <h1>회원 정보</h1>
                           </header>
                           </div>
                           
                              </div>
                                 <table class="table table-hover">
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
                                 
                                         
                                          
                                          
                                       
                                 
                           </div>
                        </div>
                        <div class="row">
                        	 <a class="btn btn-info" href="${pageContext.request.contextPath}/mypage/update_form?mno=${login_info.mno}" style="justify-content: center;">
                                                                                    회원 정보 수정 
                             </a>
                        </div>
      <!-- 회원 정보 end -->
         <!-- 신용카드 정보 start -->
         <br>
         <div class="container" >
         <h1>신용카드 정보</h1>
         <a class="btn btn-primary" href="${pageContext.request.contextPath}/card_info/form?mno=${login_info.mno}">
         	신용카드 등록하기
         </a>
         <div class="clearfix">
           		<c:forEach var="card_info" items="${cardlist}" varStatus="status">  
           			<div class="card">
						<div class="card-body">
							<h5 class="card-title">${card_info.card_name}</h5>
							<p class="card-text">카드 번호 : ${card_info.card_num}</p>
							<p class="card-text">유효 기간 (MM/YY) : ${card_info.exp_date1} / ${card_info.exp_date2}</p>
						</div>
					</div>
					<button class="card_delete_btn btn btn-danger btn-sm" value="${card_info.card_no}"> X </button>
           		</c:forEach>
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
							location.href="${pageContext.request.contextPath}/card_info/form";
						} else {
							alert("신용 카드 삭제를 실패 하였습니다.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>
</html>