<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>이벤트 상세정보</title>
		<%@ include file="/WEB-INF/views/header.jsp" %>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/yth.css" type="text/css">
	<body>
		
		<div class="container" style="position: relative;">
		<a href="${pageContext.request.contextPath}/notice/update_form?news_no=${detail_dto.news_no}" class="float-right" id="up_btn"><button id="u-btn" class="btn btn-info">수정하기</button></a>
			   <table class="table table-hover">
			   		<tbody>
			   			<tr>
			   				<td>
			   					<div>
			   						${detail_dto.class_no}
			   					</div>
			   				</td>
			   					
			   			</tr>
			   			<tr>
			   				<td>
				   				<div>
				   					${detail_dto.news_date}
			   					</div>
			   				</td>
			   			</tr>
			   			
			   			<tr><td>${detail_dto.title}</td></tr>
			   			
			   			<tr>
			   				<td>${detail_dto.cnts}</td>
			   			</tr>
			   		</tbody>
			   </table>
			   
			   
			   <a href="${pageContext.request.contextPath}/notice/notice_main"><button class="btn btn-warning">목록으로 가기</button></a>
			  <button id="d_btn" class="btn btn-danger float-right">삭제하기</button>
			   <hr>	 
		</div>
	</body>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#d_btn").hide();
		$("#up_btn").hide();
		
		if(${login_info.mgr_yn == 1}){
			$("#d_btn").show();
			$("#up_btn").show();
		}
		if(${login_info == null}){
			$("#up_btn").hide();
			$("#d_btn").hide();
		}
		if(${login_info.mno == detail_dto.mno}){
			$("#up_btn").show();
			$("#d_btn").show();
		}
		if(${login_info.mno != detail_dto.mno}){
			$("#up_btn").hide();
			$("#d_btn").hide();
		}
		
		
		
		$("#d_btn").click(function() {
			
			$.get(
					"${pageContext.request.contextPath}/notice/delete"
					, {
						news_no : ${detail_dto.news_no}
					}
					, function(data, status) {
						if( data >= 1 ){
							alert("게시글이 삭제 되었습니다.");
							location.href="${pageContext.request.contextPath}/notice/notice_main";
						} else if( data <= 0 ) {
							alert("게시글 삭제를 실패 하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get
		});//click
	});
	
	</script>
</html>