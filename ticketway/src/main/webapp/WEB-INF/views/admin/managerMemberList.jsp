<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <c:set var="path" value="${pageContext.request.contextPath}" />
<%
   int writePages = 10;
%>
<c:set var="path" value="${pageContext.request.contextPath}" />
    
    <!-- 관리자 회원관리 페이지 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!-- jQuery library -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

   <!-- Latest compiled and minified CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

   <!-- 구글 폰트 -->
   <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Bowlby+One+SC&family=Bungee&family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">

   <!-- 아이콘 -->
   <link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   <link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
   
   <!-- CSS파일 -->
   <link rel="stylesheet" type="text/css" href="${path }/resources/CSS/main/managerMemberList.css">
   <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
   <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
   
   <!-- 파비콘 설정-->
   <link rel="shortcut icon" href="${path}/resources/img/movie_favicon.ico" type="image/x-icon">

<title>TICKET WAY</title>
</head>
<body>

   <jsp:include page="managerTheme.jsp" />


	<!-- 메뉴바 밑 컨테이너 -->
<div class = "container-fluid" >
<hr>
<div class = "container">
TICKET WAY  관리자 회원 관리
</div>
<hr>
</div>



<div class = "container">
		<div class="row" id = "list">
			<div class="col-sm-12">
				<h2>회원 리스트</h2>
				<br>
			</div>
		</div>

<div class="col-sm-12">
<div class = "tableDiv">
<table id="table" class="table table-hover " style = "width: 100%">
 <thead class="thead-dark">
  <tr class="header">

     <th scope="col">번호</th>
     <th scope="col">아이디</th>
    <th scope="col">이름</th>
    <th scope="col">생년월일</th>
    <th scope="col">전화번호</th>
    <th scope="col">이메일</th>
    <th scope="col">수정 / 삭제</th>
</tr>
  </thead>
  <tbody>
      
            <c:forEach var="dto" items="${list }" varStatus="status" >  <%-- request.getAttribute("list") --%>
               <tr>
<%--                   <td>${status.index+1 }</td> --%>
                  <td>${dto.mno }</td>
                  <td>${dto.mid }</td>
                  <td>${dto.mname }</td>
                  <td>${dto.mbday }</td>
                  <td>${dto.mtel }</td>
                  <td>${dto.email }</td>와
                  <form action="updateUserData">
<%--                   <input type="hidden" name="mem_uid" value="${dto.mem_uid }"/> --%>
                  <td><button  type="submit" class="btn btn-outline-secondary btn-sm">수정</button>
                  </form>
                  &nbsp;
                  <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#staticBackdrop${status.index }">삭제</button></td>
               </tr>
            </c:forEach>
  </tbody>
  

</table>
</div>
</div>
</div>


   <!-- JS파일 -->
   <!-- Popper JS -->
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

   <!-- Latest compiled JavaScript -->
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>

   <script type="text/javascript" src="${path }/resources/JS/main/managerMemberList.js"></script>
</body>

<script>
/**
 * 
 */

    
$(document).ready(function () {
  $('#table').DataTable({
     "pagingType": "simple_numbers"
  });
  $('.dataTables_length').addClass('bs-select');
});
</script>

</html>