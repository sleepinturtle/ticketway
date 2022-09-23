<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
   <head>
      <meta charset="UTF-8">
      <title> 쪽지방 목록 </title>
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
              
              
      <br><br><br><br><br><br><br><br><br>
      <h1 style="font-family:Georgia;"> 고 객 센 터   </h1>
    
      <div class="input-group">
         <div class="input-group-prepend">
            <h3 style="font-family:Georgia;"></h3>
         </div>
         <input type="text" class="bar_search" id="recv_mid" name="recv_mid" value="kyle" readonly="readonly">
         <div class="input-group-append">
            <button id="make_memo_room_btn" type="button" class="btn btn-secondary"> 문 의 하 러 가 기   </button>
         </div>
      </div>
      <br><br><br><br><br><br><br><br><br>
      <script type="text/javascript">
      $(document).ready(function() {
         $("#make_memo_room_btn").click(function() {

            if( $.trim( $("#recv_mid").val() ) == "" ){
               $("#title_label").text("대화 상대방 아이디를 입력 하세요.");
               return;
            }

            $.post(
                  "${pageContext.request.contextPath}/message/make_memo_room"
                  , {
                     recv_mid : $("#recv_mid").val()
                  }
                  , function(data, status) {
                     if(data >= 1){
                        alert("쪽지방이 성공적으로 만들어졌습니다.");
                        location.href="${pageContext.request.contextPath}/message/list";
                     } else if(data <= 0){
                        alert("쪽지방 만들기가 실패 하였습니다.");
                     } else {
                        alert("잠시 후 다시 시도해 주세요.");
                     }
                  }//call back function
            );//post
         });//click
      });//ready
      </script>
       <table class="table table-hover">
         <thead>
            <tr>
               <th style="font-family:Georgia;"> Room no </th>   <th style="font-family:Georgia;"> Sender </th>
               <th style="font-family:Georgia;"> Start </th> <th style="font-family:Georgia;"> Cancel </th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="dto" items="${list}">
               <tr>
                  <td>${dto.room}</td>
                  <td>${dto.send_mid}</td>
                      <td>
                     <form action="${pageContext.request.contextPath}/message/write_form" method="post">
                        <input type="hidden" name="room" value="${dto.room}">
                        <input type="hidden" name="send_mno" value="${dto.send_mno}">
                        <input type="hidden" name="recv_mno" value="${dto.recv_mno}">
                        <input type="hidden" name="send_mid" value="${dto.send_mid}">
                        <input type="hidden" name="recv_mid" value="${dto.recv_mid}">
                        <button type="submit" class="btn btn-secondary btn-sm"> 채팅방 입장 </button>
                        </form>
                        </td>
                      <td>
                           <button type="submit" class="btn_delete btn-secondary btn-sm" value="${dto.room}"> 채팅방 삭제 </button>
                      </td>
                  </tr>
            </c:forEach>
         </tbody>
      </table>
      <script type="text/javascript">
      $(document).ready(function() {
         $(".btn_delete").click(function() {
            
            $.post(
                  "${pageContext.request.contextPath}/message/delete"
                  , {
                     room : $(this).val()
                  }
                  , function(data, status) {
                     if( data >= 1 ){
                        alert("채팅방이 삭제 되었습니다.");
                        location.href="${pageContext.request.contextPath}/message/list";
                     } else if( data <= 0 ) {
                        alert("채팅방이 삭제를 실패 하였습니다.");
                     } else {
                        alert("잠시 후 다시 시도해 주세요.");
                     }
                  }//call back function
            );//get

         });//click
      });//ready
      </script>
      
      <ul class="pagination">
         <c:if test="${startPageNum > 10}">
            <li class="page-item active">
               <a class="page-link"
                  href="${pageContext.request.contextPath}/message/list?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
                  Previous
               </a>
            </li>
         </c:if>
         <c:forEach var="page_no" begin="${startPageNum}" end="${endPageNum}">
            <c:choose>
               <c:when test="${page_no == userWantPage}">
                  <li class="page-item active">
                     <a class="page-link" id="btn_paging">${page_no}</a>
                  </li>
               </c:when>
               <c:otherwise>
                  <li class="page-item active mx-auto">
                     <a class="page-link"
                        href="${pageContext.request.contextPath}/message/list?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
                        ${page_no}
                     </a>
                  </li>
               </c:otherwise>
            </c:choose>
         </c:forEach>
         <c:if test="${lastPageNum > endPageNum}">
            <li class="page-item mx-auto">
               <a class="page-link"
                  href="${pageContext.request.contextPath}/message/list?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
                  Next
               </a>
            </li>
         </c:if>
      </ul>
   <%@ include file="/WEB-INF/views/footer.jsp" %>
  
 
   </div><!-- container end -->
   </body>
</html>
