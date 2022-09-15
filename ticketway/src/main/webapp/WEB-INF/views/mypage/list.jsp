<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
   <head>
      <title> 마이페이지  </title>
      <meta charset="utf-8"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
   </head>
   <body class="left-sidebar is-preload">
   <div class="container"><!-- container start -->
      <div id="page-wrapper">
         <!-- Header -->
            <div id="header">
                  </div>
               </div>
              <%@ include file="/WEB-INF/views/header.jsp" %>
      <h1 style="font-family:Georgia;"> M Y P A G E </h1>
      <br><br>
                     <div>
                       <!-- 회원 정보 start -->
                           <div class="col-8">
                              <div class="text center">
                                    
                                       <div class="text-center">   
                                       <header>
                              <h1><a href="#">회원 정보</a></h1>
                           </header>
                           </div>
                           
                              </div>
                                 <table class="table table-hover">
                                       <tbody>
                                                   <tr>
                                                      <td><h5 style="color:gray;"> 회원 번호  :  ${login_info.mno} </h5></td>   
                                                      <td> <h5 style="color:gray;">회원 아이디  : ${login_info.mid}</h5></td>   
                                                   </tr>
                                                   <tr>
                                                      <td><h5 style="color:gray;"> 비 밀 번 호  :  ${login_info.mpwd}</h5></td>   
                                                      <td><h5 style="color:gray;"> 전 화 번 호  : ${login_info.mtel} </h5></td>   
                                                   </tr>
                                                   <tr>
                                                      <td><h5 style="color:gray;"> email : ${login_info.email}</h5></td>    
                                                      <td> <h5 style="color:gray;"> 주소  : ${login_info.maddr}</h5></td>      
                                                   </tr>
                                       </tbody>
                                       
                                 </table>
                                 
                                          <a href="${pageContext.request.contextPath}/mypage/update_form?mno=${login_info.mno}">
                                          <button class="btn btn-dark float-right btn-lg"> 회원 정보 수정  </button>
                                          </a>
                                          
                                          
                                       
                                 
                           </div>
                        </div>
      <!-- 회원 정보 end -->
         <!-- 신용카드 정보 start -->
         <br>
         <h1><a href="#">신용카드 정보</a></h1>
         <div class=" col-5" >
            <iframe src="${pageContext.request.contextPath}/mypage/list_credit_card" title="test"
            width="100%" height="210" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0></iframe>
            <div class="text-right mb-2">
               <a href="${pageContext.request.contextPath}/card_info/form">
                  <button type="button" class="btn btn-dark">
                     신용카드 정보 변경 바로가기
                  </button>
               </a>
            </div>
         </div>
         <br><br>
         <!-- 신용카드 정보 end -->
        
      <br><br>
      
      <br><br><br><br>
   <%@ include file="/WEB-INF/views/footer.jsp" %>
   <br><br><br><br>

         </div><!-- container end -->
   </body>
</html>